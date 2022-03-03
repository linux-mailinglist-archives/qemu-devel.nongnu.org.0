Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DDE4CB7FF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 08:38:30 +0100 (CET)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPg2f-0007BZ-DZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 02:38:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPg0O-0006Gb-PA
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPg0N-000102-6Z
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646292966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5oNE39EfKlPFujGAkQ8A0HvOKfIDxEkgU1zYUSJ1xg=;
 b=c0Vz5T+kugH/Q3QKtyx3bGhkrRfuFSh6fZBlMZIZrP8g0Qf00bXwck2N5UrhenuWQJAaM1
 OVVQnYRthwljl6GgEpxKRWh/CAAu6UI0nnx5PchaUCXzvwGT8K8N/Ns2m6sW4qVe6I4O/q
 YyGsbHCV9BDEaFjtJPTIkV3Q/T6GXnM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-mD9rvfZMOOy6kLfky_gMYg-1; Thu, 03 Mar 2022 02:36:03 -0500
X-MC-Unique: mD9rvfZMOOy6kLfky_gMYg-1
Received: by mail-pf1-f197.google.com with SMTP id
 62-20020a621541000000b004f110fdb1aeso2734309pfv.13
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 23:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U5oNE39EfKlPFujGAkQ8A0HvOKfIDxEkgU1zYUSJ1xg=;
 b=i/4dne3iFlSq/e1t/FJmoG18eMU8AU8BudJLD3U6GKdvqa0/PNJ7SH6HpCpDb0VnGY
 QydVmqHBflwdvLTrUfRtinbOa37nMBEZkg8wU+2YufGBC5vgswtzW2kz2mkSkkHYUWk6
 nu62OtK3Hy7Mbrbmev9vFWhpE85w9OxUCCaDfusr18s5m6JjSDSJBMrMFv7JpH290Fwq
 JE2ejjyUlZ61dem0cIsw9+kB/7LumRrR7nCeNoXfgLrP7/YrWpisj25jugyP3t3LcWR8
 JKh3H35Bz7AToqpuz3uaXUf6DZCd4jEJQRESHGz9MGhgKYm2ye+5pvLH/4tw3Plk3z7w
 JqQg==
X-Gm-Message-State: AOAM532MlfLthvctXUiojXUbdGu+I50ejBH+Y2zVmMwQ6kSCuOL0khce
 rsls1GuIAzqjSS/9WP7jCreuuUAvru3mvGP1uxZHMQqjvoKe27lc0u6sHYhFq8VfZYtTkwfuZpZ
 intJDFR/+s1WtQ7o=
X-Received: by 2002:a17:903:40c7:b0:151:a640:d69e with SMTP id
 t7-20020a17090340c700b00151a640d69emr2804747pld.121.1646292962248; 
 Wed, 02 Mar 2022 23:36:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFjEnQJ6P4o/8Rn33oncXs2PW0aV7Jmi2wGK7zy+OCtFCg6f++gPo/bmlcMYc19x/nUzTsZA==
X-Received: by 2002:a17:903:40c7:b0:151:a640:d69e with SMTP id
 t7-20020a17090340c700b00151a640d69emr2804719pld.121.1646292962003; 
 Wed, 02 Mar 2022 23:36:02 -0800 (PST)
Received: from [10.72.13.250] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm1421300pfu.74.2022.03.02.23.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:36:01 -0800 (PST)
Message-ID: <cd0f4492-71fc-33d9-ca09-e61df5d2eadf@redhat.com>
Date: Thu, 3 Mar 2022 15:35:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 07/14] vhost: Shadow virtqueue buffers forwarding
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-8-eperezma@redhat.com>
 <56fa64c3-416a-c748-4495-744b2f804aeb@redhat.com>
 <CAJaqyWe=hGmAvU_Fr34fecbF_7kUYqcm-EOdHJOo47TtddPwLw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWe=hGmAvU_Fr34fecbF_7kUYqcm-EOdHJOo47TtddPwLw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/3 上午2:23, Eugenio Perez Martin 写道:
>>> +
>>> +static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>>> +                                VirtQueueElement *elem,
>>> +                                unsigned *head)
>>> +{
>>> +    unsigned avail_idx;
>>> +    vring_avail_t *avail = svq->vring.avail;
>>> +
>>> +    *head = svq->free_head;
>>> +
>>> +    /* We need some descriptors here */
>>> +    if (unlikely(!elem->out_num && !elem->in_num)) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +            "Guest provided element with no descriptors");
>>> +        return false;
>>> +    }
>>> +
>>> +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
>>> +                            elem->in_num > 0, false);
>>> +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
>> I wonder instead of passing in/out separately and using the hint like
>> more_descs, is it better to simply pass the elem to
>> vhost_vrign_write_descs() then we know which one is the last that
>> doesn't depend on more_descs.
>>
> I'm not sure I follow this.
>
> The purpose of vhost_vring_write_descs is to abstract the writing of a
> batch of descriptors, its chaining, etc. It accepts the write
> parameter just for the write flag. If we make elem as a parameter, we
> would need to duplicate that for loop for read and for write
> descriptors, isn't it?
>
> To duplicate the for loop is the way it is done in the kernel, but I
> actually think the kernel could benefit from abstracting both in the
> same function too. Please let me know if you think otherwise or I've
> missed your point.


Ok, so it's just a suggestion and we can do optimization on top for sure.

Thanks


>


