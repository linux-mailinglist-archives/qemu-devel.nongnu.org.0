Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446EE45DE6D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:13:11 +0100 (CET)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHN0-0007td-C4
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mqHL7-0005ri-C3
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mqHL3-0000rR-HF
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637856669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42WqwopQk1BaCzuDER1x6IVxDkGjzgr5LNELN+FdTy8=;
 b=O3Jk40YytqsuV/hIlVmEUxqDXCaF2LZejEKwohug+lOJTp2fsKOZihOXF3K08YmCHWJLeK
 Bi2PoHpDBEdWrtR7gZLG3W2FJtVmlIRS0JN6gX3wv777/7irhdG8uHv6LH3EdV8JMeF3ZP
 eM3IQ+F8kDMy+TZoNq0Kkgz5Ah1mwsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-pvsFOai-P1ifbrv7H93Y2g-1; Thu, 25 Nov 2021 11:11:07 -0500
X-MC-Unique: pvsFOai-P1ifbrv7H93Y2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so3744214wms.6
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 08:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=42WqwopQk1BaCzuDER1x6IVxDkGjzgr5LNELN+FdTy8=;
 b=gyqDsgX5++S9BcWlli4zLQYfROGq+S8zNyEVaVhykR9gu8yApz+XuO8kGOK386iqg4
 UvXOasLPfy+1WayUJ2Koq0TkrlvG++MGNVUfFzsssgjn1z8tD5JW+SXf87r8NgpBKnqz
 cnUXyGnTeSFCvjbJ0tGe3kD6+UPOZ7X6gZNKl+tbPMqvbRstqteUNtSOj+1Obps2wdha
 4skl9EquVMLYuLiKi/0xX+UYcK1cOeksjgOveQ+Ay7HoiTMOqWOnwni2H64oJGhTLLpN
 /B2FwGnwcmZL6ftLORMczz5BlAKvp5pCROZNTqqElV6bXSq/VICLPKhAl+d45woPy6Ge
 3Q1g==
X-Gm-Message-State: AOAM530TeXaa1dka9nUeATNVlWiMDtcNqrBidYFz6K7DXcCQh3An4ltq
 8QYgjLT93A/Ikb2wI1D5vZnJyOnF5jebDXaw1+2MftY2EJmKzK4wu3upkba3AL/YFY1nHipR/XO
 9sqkkcmFqpbqsGs4=
X-Received: by 2002:a7b:c119:: with SMTP id w25mr8553776wmi.70.1637856666614; 
 Thu, 25 Nov 2021 08:11:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZy6wUjUDiNk8j4281WTDV1hlhxUZavvNbbVPDeBUnkxC9JMpX1sHExsqStcUAkloajU0p/w==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr8553742wmi.70.1637856666390; 
 Thu, 25 Nov 2021 08:11:06 -0800 (PST)
Received: from [192.168.3.132] (p5b0c679e.dip0.t-ipconnect.de. [91.12.103.158])
 by smtp.gmail.com with ESMTPSA id k13sm3101849wri.6.2021.11.25.08.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 08:11:05 -0800 (PST)
Message-ID: <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
Date: Thu, 25 Nov 2021 17:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
 <20211125110724-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211125110724-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mpe@ellerman.id.au, Jason Wang <jasowang@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.11.21 17:09, Michael S. Tsirkin wrote:
> On Thu, Nov 25, 2021 at 09:28:59AM +0100, David Hildenbrand wrote:
>> On 25.11.21 03:20, Jason Wang wrote:
>>> We only process the first in sg which may lead to the bitmap of the
>>> pages belongs to following sgs were not cleared. This may result more
>>> pages to be migrated. Fixing this by process all in sgs for
>>> free_page_vq.
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>  hw/virtio/virtio-balloon.c | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>>> index c6962fcbfe..17de2558cb 100644
>>> --- a/hw/virtio/virtio-balloon.c
>>> +++ b/hw/virtio/virtio-balloon.c
>>> @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>>>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>>>      VirtQueue *vq = dev->free_page_vq;
>>>      bool ret = true;
>>> +    int i;
>>>  
>>>      while (dev->block_iothread) {
>>>          qemu_cond_wait(&dev->free_page_cond, &dev->free_page_lock);
>>> @@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>>>      }
>>>  
>>>      if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
>>> -        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
>>> -                                  elem->in_sg[0].iov_len);
>>> +        for (i = 0; i < elem->in_num; i++) {
>>> +            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
>>> +                                      elem->in_sg[i].iov_len);
>>> +        }
>>>      }
>>>  
>>>  out:
>>>
>>
>> Yes, but:
>>
>> 1. Linux never used more than one
>> 2. QEMU never consumed more than one
>>
>> The spec states:
>>
>> "(b) The driver maps a series of pages and adds them to the free_page_vq
>> as individual scatter-gather input buffer entries."
>>
>> However, the spec was written by someone else (Alex) as the code was
>> (Wei). The code was there first.
>>
>> I don't particularly care what to adjust (code or spec). However, to me
>> it feels more like the spec is slightly wrong and it was intended like
>> the code is by the original code author.
>>
>> But then again, I don't particularly care :)
> 
> Original QEMU side code had several bugs so, that's another one.
> Given nothing too bad happens if guest submits too many S/Gs,
> and given the spec also has a general chapter suggesting devices
> are flexible in accepting a single buffer split to multiple S/Gs,
> I'm inclined to accept the patch.

Yeah, as I said, I don't particularly care. It's certainly an "easy change".

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


