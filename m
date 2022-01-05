Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687FE484E80
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:54:47 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n50C6-000391-5i
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n501j-0000P5-0d
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n501c-0003y4-V2
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641365031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Ab4KUL/0PWGmWt9uy6MPn5hUStJ3Xp1zRLHUKrBz7U=;
 b=JtBF36SQPBnZIQTcDlfiv6q17Z1kNugAT57x+sMdGCSRzTqKzN5Mu8dS+KMWjFbZgCezMe
 ApaMUiXNzR7SaY0azkyYYZy5Lw13rIiEacacGhBpGrKkA+tXiDSo//XvBiyJK6llNe3DPV
 4J3LhQbwiI5eKb4NCQ3B57BLafbIV9M=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-GIOmd_dZPxC7_-F0jPbw3Q-1; Wed, 05 Jan 2022 01:43:50 -0500
X-MC-Unique: GIOmd_dZPxC7_-F0jPbw3Q-1
Received: by mail-pl1-f199.google.com with SMTP id
 u3-20020a170902e80300b00149095fd618so4868138plg.11
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 22:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Ab4KUL/0PWGmWt9uy6MPn5hUStJ3Xp1zRLHUKrBz7U=;
 b=fZvNUywRknvGy2d6zH9lRFIPYsHgxkfooK8VLo0qcC08atB7pAAsOqpBtpu7QMKS2I
 8dCkLJu013FELEO3SXstaNhA5ktYuiyzJb04DPas9g9/L0j1iDv+kWdrFRw8i04mEBZj
 9zOwB9JSOWT+03noNGGzzSFT3l/Q8C1VX+dDJ8qiZkZnmPaoTcqHWp5zLRcdTUJGk8LB
 x0AzbfSqaqSQNGM2Hi3aSetCZKdIq8ENoPvfXi30ZQx5X+ssKHmuvJs6Go4Wwppr/YFF
 e4R/6Lp29sBFFqUKegXMWiAQ1ZiNuMed18njR+Qt0XdPsovJM9D/BUzTKJVKe35RaEb7
 M5BQ==
X-Gm-Message-State: AOAM530ndJFdOXQBDT3OurTw1VGNsanfszC280TZh4f1bM3ia1dIrMXl
 pj/nA3nJB+KCMm7hmYDCyt8+tZ4oHgvebr3f2poT10swF5RA+46jsn6ujkAETH982ilDwPy5eUO
 /UQidUP2zpHDcD6M=
X-Received: by 2002:a17:903:11cd:b0:149:bf70:2031 with SMTP id
 q13-20020a17090311cd00b00149bf702031mr10796553plh.40.1641365029564; 
 Tue, 04 Jan 2022 22:43:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGiqWrAI8x1PG6uztoTWjHylxlqPIUvgwsh3TSlAfNp5fkMXRXpqD6bbRbDvUX/6sAFO3n7g==
X-Received: by 2002:a17:903:11cd:b0:149:bf70:2031 with SMTP id
 q13-20020a17090311cd00b00149bf702031mr10796532plh.40.1641365029264; 
 Tue, 04 Jan 2022 22:43:49 -0800 (PST)
Received: from [10.72.13.252] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b5sm1744351pfm.155.2022.01.04.22.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 22:43:48 -0800 (PST)
Message-ID: <34f1a0af-ec02-d816-ac80-b8d90429b258@redhat.com>
Date: Wed, 5 Jan 2022 14:43:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <9595dde01f434f1a9a683f3ca3477ff9@huawei.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <9595dde01f434f1a9a683f3ca3477ff9@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/5 下午2:40, Longpeng (Mike, Cloud Infrastructure Service Product 
Dept.) 写道:
>
>> -----Original Message-----
>> From: Jason Wang [mailto:jasowang@redhat.com]
>> Sent: Wednesday, January 5, 2022 12:36 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>; mst <mst@redhat.com>; Stefano
>> Garzarella <sgarzare@redhat.com>; Cornelia Huck <cohuck@redhat.com>; pbonzini
>> <pbonzini@redhat.com>; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>; qemu-devel
>> <qemu-devel@nongnu.org>
>> Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
>>
>> On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>> From: Longpeng <longpeng2@huawei.com>
>>>
>>> To support generic vdpa deivce, we need add the following ioctls:
>>> - GET_VECTORS_NUM: the count of vectors that supported
>> Does this mean MSI vectors? If yes, it looks like a layer violation:
>> vhost is transport independent.  And it reveals device implementation
>> details which block (cross vendor) migration.
>>
> Can we set the VirtIOPCIProxy.nvectors to "the count of virtqueues + 1 (config)" ?


That should work.

Thanks


>
>> Thanks
>>
>>> - GET_CONFIG_SIZE: the size of the virtio config space
>>> - GET_VQS_NUM: the count of virtqueues that exported
>>>
>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>> ---
>>>   linux-headers/linux/vhost.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
>>> index c998860d7b..c5edd75d15 100644
>>> --- a/linux-headers/linux/vhost.h
>>> +++ b/linux-headers/linux/vhost.h
>>> @@ -150,4 +150,14 @@
>>>   /* Get the valid iova range */
>>>   #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
>>>                                               struct vhost_vdpa_iova_range)
>>> +
>>> +/* Get the number of vectors */
>>> +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
>>> +
>>> +/* Get the virtio config size */
>>> +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
>>> +
>>> +/* Get the number of virtqueues */
>>> +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
>>> +
>>>   #endif
>>> --
>>> 2.23.0
>>>


