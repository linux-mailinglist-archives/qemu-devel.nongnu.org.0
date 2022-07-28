Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295758387F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:13:18 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwlo-000614-PX
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwfU-0001cO-Fu
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwfR-0008Lb-J6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658988400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlST7TBINi/Admo1VfcJYfhu2t7kJ/PKIxA+Dlsr0Zk=;
 b=fUUQxQ9m2yTgqznREmExe1cKmkcYPhe6Cte6qc+AZDNufkRN2Tx9LhlrQ0vmLi8xuL3O6S
 yg03L59QNlNKEUFL3UcHXZ1GE2hu3uu86OhKi5GV86qWcBhaL6cKqZaS8WfrpRZHZI7s3s
 2nH+AHj2pro5C0b5D4d7H3s2YTtc3s0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-Rz0JqIwhO5izHC6o4oSJRQ-1; Thu, 28 Jul 2022 02:06:38 -0400
X-MC-Unique: Rz0JqIwhO5izHC6o4oSJRQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 l7-20020a170902f68700b0016d95380e6fso680186plg.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MlST7TBINi/Admo1VfcJYfhu2t7kJ/PKIxA+Dlsr0Zk=;
 b=z2Lq57hLsOu/G6CtnM+Oi4SU6Y4BRUFApMnNDjVr6/i6+uvaSyvX76vhLKre0rzr5z
 D5mqaFoLoHIPT4ARTwu+WKEMXTUuc7yI1Sq/aqsDnKXoYPcz1IAQqBHCvYYNzN57645g
 3zZCq6JxHjfMC7Va0Loz8YjmN3fecJ3Y5MXqORxpM9KM09NQ0AJARwlZOQ4e1zroQQxV
 cuCElGO65SI12yUcKyckFPsTsghbHSG1EWxw6g0q3NVdXLNx+tngXWHSShuBNDYL7+xD
 OGIp/xWtEG/WzAgWx809hdnbgOiE9T+OJmbI/8jRw7WSetFXzZTAte96oOLAPpFZ5Q18
 gTmg==
X-Gm-Message-State: AJIora8SKrEgbQAb0DUz6F/Jd180tZ55Zg2YN8MDutvD38JZA4WtHY3I
 +QC8YAQ8pWwcGBaaaPuIUI2+b4kkgjjrCOMxpVelFEPJdzkCgLArN/BB2/o8+wul1X9Kk80/VdD
 9kAoZFwpkgv9WH5s=
X-Received: by 2002:a17:90b:4f4e:b0:1ef:ab40:b345 with SMTP id
 pj14-20020a17090b4f4e00b001efab40b345mr8703580pjb.226.1658988396802; 
 Wed, 27 Jul 2022 23:06:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umd0kJgAqR/EoggPKsWoq+3Q0Y/zRthGjxajkZiJXzQwikscuLQsRjKeDVuz4XCrQ1ZrajeQ==
X-Received: by 2002:a17:90b:4f4e:b0:1ef:ab40:b345 with SMTP id
 pj14-20020a17090b4f4e00b001efab40b345mr8703562pjb.226.1658988396570; 
 Wed, 27 Jul 2022 23:06:36 -0700 (PDT)
Received: from [10.72.12.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ce8100b0016191b843e2sm153781plg.235.2022.07.27.23.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:06:35 -0700 (PDT)
Message-ID: <b68aa6b3-5425-263a-6364-0d656f15d91c@redhat.com>
Date: Thu, 28 Jul 2022 14:06:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/21] include/hw: document vhost_dev feature life-cycle
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-3-alex.bennee@linaro.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726192150.2435175-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/27 03:21, Alex Bennée 写道:
> Try and explicitly document the various state of feature bits as
> related to the vhost_dev structure. Importantly the backend_features
> can advertise things like VHOST_USER_F_PROTOCOL_FEATURES which is
> never exposed to the driver and is only present in the vhost-user
> feature negotiation.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Acked-by: Jason Wang <jasowang@redhat.com>

Maybe it's better to document backend_cap as well which is only used for 
vhost-kernel/vdpa.

And in the future we should try to unify them.

Thanks


> ---
>   include/hw/virtio/vhost.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a346f23d13..586c5457e2 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -86,8 +86,11 @@ struct vhost_dev {
>       /* if non-zero, minimum required value for max_queues */
>       int num_queues;
>       uint64_t features;
> +    /** @acked_features: final set of negotiated features */
>       uint64_t acked_features;
> +    /** @backend_features: backend specific feature bits */
>       uint64_t backend_features;
> +    /** @protocol_features: final negotiated protocol features */
>       uint64_t protocol_features;
>       uint64_t max_queues;
>       uint64_t backend_cap;


