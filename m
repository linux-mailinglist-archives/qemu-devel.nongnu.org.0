Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A40524F6E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 16:06:54 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np9Sv-0005W8-SF
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 10:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np9Qf-0003ql-Fn
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np9Qd-0005YD-6f
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652364269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDjixTptcDn6puoQREf6VSFUvyowppohHbyLjtNeftQ=;
 b=O6WVtZZCaymHfDyHtld3P90MJtT+0FJVkPq69Q/y7qsn64vnH1DjstOXETGI+ryvFOTLPq
 UG1pGr3//1Frl1759u53OpQ/VhpqE4CGgYWwSrWQNIKiNqnHjHF7Y0gNQVRmj1tsj1fK0u
 t4xpc18kG/egGJ/rmxqoygVgDf8Rwfo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-XbEFa7GyOQOADnVpUgOtIQ-1; Thu, 12 May 2022 10:04:28 -0400
X-MC-Unique: XbEFa7GyOQOADnVpUgOtIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so1671982wmb.3
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 07:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pDjixTptcDn6puoQREf6VSFUvyowppohHbyLjtNeftQ=;
 b=0V9MOlS4alUm8rjM031kxPqiliWRJYCW+vbMmKMLeRFnkBsQdUq0rbMTdYeyNdXDYG
 KAJZAl9fDZU1VzVRMAIiuXVFromOMk9Ol0F3X0Zq80tU+pZbVJwh2qnQkt8oKsprWCCu
 waECnZCdFvPPrQPpwCLZ7ejBtteEX4EyVvvnyUXzSGsMrp4pPnC+NYA362TIhYguaj34
 Y/rasYZ3T4wc/smsrCT4RXT4Ymq9c1h1YL5c1cAApDf9mRkNpq4gu2X0cWMf1XS9oNgW
 3W2qClqWb4Wd6DIlE3SbpGGWJr46+c3qLxYIm3o3fzjs29CVpsbFgohwE5w4myghdpVy
 o06g==
X-Gm-Message-State: AOAM531WuTecKfU/smp28d2pZsri2z6zOr3/wCrh066MMwZ3T+TYzrI5
 P/ZqEE2lILgykylv3tXit/aLW+YNlGqEOZEi5eOP1htgisZgo7P3LTfCfVQB5qB1XQEeiWb71N/
 wpJCkOZuh93Gia20=
X-Received: by 2002:adf:e60a:0:b0:20a:c402:6810 with SMTP id
 p10-20020adfe60a000000b0020ac4026810mr28755167wrm.45.1652364266989; 
 Thu, 12 May 2022 07:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX7W+YkQQDAnF2rdrgiafuI1ltSjz7xZwWx7uCHV0wpaMKhBYle1CiluhJSUtBZqCT4hcocw==
X-Received: by 2002:adf:e60a:0:b0:20a:c402:6810 with SMTP id
 p10-20020adfe60a000000b0020ac4026810mr28755130wrm.45.1652364266428; 
 Thu, 12 May 2022 07:04:26 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c215100b003943558a976sm2965307wml.29.2022.05.12.07.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:04:25 -0700 (PDT)
Message-ID: <1fa226fd-02e5-1711-656e-dc807af2b388@redhat.com>
Date: Thu, 12 May 2022 16:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 2/2] vfio: tolerate migration protocol v1 uapi renames
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20220512102942.1134141-1-thuth@redhat.com>
 <20220512102942.1134141-3-thuth@redhat.com>
 <b248ca40-c322-69d0-799f-d0a95bf0c31b@nvidia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b248ca40-c322-69d0-799f-d0a95bf0c31b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 12/05/2022 15.53, Avihai Horon wrote:
> 
> On 5/12/2022 1:29 PM, Thomas Huth wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> From: Matthew Rosato <mjrosato@linux.ibm.com>
>>
>> The v1 uapi is deprecated and will be replaced by v2 at some point;
>> this patch just tolerates the renaming of uapi fields to reflect
>> v1 / deprecated status.
>>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> Message-Id: <20220404181726.60291-3-mjrosato@linux.ibm.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/vfio/common.c    |  2 +-
>>   hw/vfio/migration.c | 19 +++++++++++--------
>>   2 files changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 159f910421..8e73d3714a 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -381,7 +381,7 @@ static bool 
>> vfio_devices_all_running_and_saving(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
>> +            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
>>                   (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> 
> Only now I noticed this, but all existing VFIO_DEVICE_STATE_* enums should 
> be changed to their corresponding VFIO_DEVICE_STATE_V1_*.
> E.g., here VFIO_DEVICE_STATE_RUNNING should be changed as well to 
> VFIO_DEVICE_STATE_V1_RUNNING.
> 
> I already have a patch that does this. I will send it today as part of the 
> VFIO migration v2 series I am planning to send, so you can just take it.

Ugh, thanks for noticing!

Alex, could you please take care of this in the next days? Seems like the 
next linux-header updates is really not that trivial anymore due to that 
ugly vfio macro renaming :-( And I'd prefer if somebody could tackle this 
who is really more confident in this area.

  Thomas


