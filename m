Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC91557818
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 12:47:30 +0200 (CEST)
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4KMz-0002Ty-Tk
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 06:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4JZD-0002uK-JS
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4JZ9-0000tl-42
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655978158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abhzRxhpJyZ7fIGTLbK24sH2WUSgR4kstb7WygcNl9c=;
 b=Q5KZDv3asJc8eRvje3jzLQjih4Imn/wchRrETJJGL49SLevysBqRiKbdctF3h7ej3in3t1
 XLd4YI8FQHIZTA2xR9adT2mTEGWs5vWAW+rU2iyTGj2tT75ffmiECR3fFjv1T5t6zv7OeE
 IzkKJjkR3VWwcCPPujiupWD6sHZwjJM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-0sl2fs9NM6mNpQWkuG_5HA-1; Thu, 23 Jun 2022 05:55:56 -0400
X-MC-Unique: 0sl2fs9NM6mNpQWkuG_5HA-1
Received: by mail-wr1-f72.google.com with SMTP id
 a1-20020adfbc41000000b0021b90d6d69aso2762212wrh.1
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 02:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=abhzRxhpJyZ7fIGTLbK24sH2WUSgR4kstb7WygcNl9c=;
 b=rARof+Dn4wWe8zmRbW5xHlO9M7EGC3zqMwZX3ycMP+WJEdbLsLBBevY2t9LXa1eHXj
 pGJP85nphlSpbMAhuWvTI9dp8qipceYiNjDOU/GsqXr1farouF1rL8JQBzChJ0SYALCB
 7iYumTm2HIVFPOA0bTGUI3e1e84KtbYYO5eXNUmG60Li42lDbJlW6EPzAC0hdGP5B2LU
 wpgGVZzvwasgPKTtBwHeDXOljWEPIpql9/+BH68VwPLXFy+Sjm7by/UvQfOX2ffq+kvk
 ixLYshqKu1s5MtoDLYWVZnYSQ70kYzuCUrM97gsUMh7ueQysDnr4OiO/c9dQ/1eY+mjx
 9sDg==
X-Gm-Message-State: AJIora+rEWaoWvshenbdDXe8sThu69fXWJhzjH9yToTHL4S1HtohR3FK
 L9xRDQoyXiJcrm39zhUWACYCD6iNHimvUGviqf24YX8IsCzLauuR//1OiP/olD2uiOi96VcQCtj
 5z7D5N2D7QdlYBK4=
X-Received: by 2002:a5d:5c03:0:b0:21b:90e6:42bc with SMTP id
 cc3-20020a5d5c03000000b0021b90e642bcmr7676371wrb.36.1655978155263; 
 Thu, 23 Jun 2022 02:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBj2x+cKu2MaAlbnaVC1xamAXECvDFPcDgcPx5kICqrYrGCMNj/pE+yA5EiinztUzl6W83Zw==
X-Received: by 2002:a5d:5c03:0:b0:21b:90e6:42bc with SMTP id
 cc3-20020a5d5c03000000b0021b90e642bcmr7676347wrb.36.1655978154962; 
 Thu, 23 Jun 2022 02:55:54 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-18.web.vodafone.de.
 [109.43.177.18]) by smtp.gmail.com with ESMTPSA id
 t2-20020a7bc3c2000000b0039c5b9e9142sm2494445wmj.17.2022.06.23.02.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 02:55:54 -0700 (PDT)
Message-ID: <749f88c5-379c-6284-f3c7-c8074191c8a9@redhat.com>
Date: Thu, 23 Jun 2022 11:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
References: <20220623071131.412457-1-thuth@redhat.com>
 <20220623071131.412457-3-thuth@redhat.com> <87bkuj93b6.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] pc-bios/s390-ccw/virtio: Read device config after
 feature negotiation
In-Reply-To: <87bkuj93b6.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 23/06/2022 10.44, Cornelia Huck wrote:
> On Thu, Jun 23 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
>> Feature negotiation should be done first, since some fields in the
>> config area can depend on the negotiated features and thus should
>> rather be read afterwards.
> 
> I suppose we don't negotiate any features that might affect the size of
> the config space? Anyway, restricting ourselves to the minimum length
> should be fine.

Actually, even the virtio spec 0.9.5 already talks about 
VIRTIO_BLK_F_BLK_SIZE and VIRTIO_BLK_F_GEOMETRY being necessary to get the 
corresponding values in the config space ... so we're currently depending on 
the good will of QEMU to also provide the values without these feature bits. 
I'm already thinking about providing a patch to properly request these 
feature bits in the s390-ccw bios ... but the whole code there is so ugly 
that I need some time to think about the right steps to clean it up first.

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   pc-bios/s390-ccw/virtio.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
>> index 4e85a2eb82..0e92e994df 100644
>> --- a/pc-bios/s390-ccw/virtio.c
>> +++ b/pc-bios/s390-ccw/virtio.c
>> @@ -262,10 +262,6 @@ void virtio_setup_ccw(VDev *vdev)
>>       rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
>>       IPL_assert(rc == 0, "Could not write DRIVER status to host");
>>   
>> -    IPL_assert(
>> -        run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false) == 0,
>> -       "Could not get block device configuration");
>> -
>>       /* Feature negotiation */
>>       for (i = 0; i < ARRAY_SIZE(vdev->guest_features); i++) {
>>           feats.features = 0;
>> @@ -278,6 +274,9 @@ void virtio_setup_ccw(VDev *vdev)
>>           IPL_assert(rc == 0, "Could not set features bits");
>>       }
>>   
>> +    rc = run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false);
>> +    IPL_assert(rc == 0, "Could not get block device configuration");
> 
> Since you move this anyway: s/block device/boot device/ ?

Good idea, thanks, I'll clean that up!

>> +
>>       for (i = 0; i < vdev->nr_vqs; i++) {
>>           VqInfo info = {
>>               .queue = (unsigned long long) ring_area + (i * VIRTIO_RING_SIZE),
> 
> Related to feature negotiation: It seems that the bios currently
> supports legacy virtio only, doesn't it?

Right.

> It's probably fine for now, but
> there might be a way in the future to disable legacy virtio for all
> devices in QEMU, so we'll probably want to add virtio-1 support some
> day.

Yes, that's certainly one thing we have to look into at one point in time ...

  Thomas



