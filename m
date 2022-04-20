Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF0508B51
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:57:50 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBm9-0005SV-Pv
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBS5-0007Kp-Mm
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBS4-0007rJ-43
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650465423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTrSzaK1w9NgWvQQiAJ4bDdl8ecoxWCV2KyQlC8Wt6E=;
 b=cAmVZD/DSA87DDfp814Bhk78J9X1VJT1erav12Ee89KUpkUVVesnqFDharGAkJfGUEC9nv
 8I5qn97iByvB5aZ5LfMyhF1SDR+9yHLU64SsL42tLhywgDbgx10GxUsFkRxSBeSp73uddO
 V8NMzdyav9HcdrsIN2/mzFbiylg0nxU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-pZmEI96WM3ePV2h87kOkNQ-1; Wed, 20 Apr 2022 10:37:02 -0400
X-MC-Unique: pZmEI96WM3ePV2h87kOkNQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso1005469wme.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WTrSzaK1w9NgWvQQiAJ4bDdl8ecoxWCV2KyQlC8Wt6E=;
 b=j1AOnjQr+jbMuTWVTqheyYrzLiB8LmzjrOGEUHDLDiz/J1/CG/oI4mWD3UKLTQFfqV
 9pEfGEaeKsk24RbS+WpdMYgVClaCkr+X9vsmYQRY6klkautbWd4nxFbIfVDG8+TlqDuK
 IGe7netPhX2FGgbLApfQ4ZXy8/nkU+/FKkcbI0EW8K84WilWnEjRKMobjm6Fc9OeRNkm
 bF0++sQXDRQdi9WzHSFrn/61jQ0IbrAQA3q78eBezrBZ0MvVlX+8vOl4+HZQJ3fpQtjY
 QB+IxMUeYmjFrCAAzVOsVj4IohKDBkN9LGEOmJlQutrrDLAdOpqvE+hjcOFo2FAS71gS
 40rg==
X-Gm-Message-State: AOAM530bqFuipGZ7K2upIf85TypaKoife+4MpoBx96JvCvUskqSuLa8D
 4WRsartN423q7YO6zREdrY371FglFz4UEEFChjhFU/Yo3Z+Ly7YkKjZGZy3upwaqMj4k27HA9AT
 1fuuVhVFMdPMVPsU=
X-Received: by 2002:a05:6000:1287:b0:209:16c7:16af with SMTP id
 f7-20020a056000128700b0020916c716afmr16040083wrx.702.1650465420460; 
 Wed, 20 Apr 2022 07:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB3mHj7sN+OyNpfyfYq2+3BTSyvU+TX2mzqG2qQuRtpPukCIaqnAqIS1pXyXf2dW2kDH/5fw==
X-Received: by 2002:a05:6000:1287:b0:209:16c7:16af with SMTP id
 f7-20020a056000128700b0020916c716afmr16040068wrx.702.1650465420238; 
 Wed, 20 Apr 2022 07:37:00 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm8920wmb.15.2022.04.20.07.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:36:59 -0700 (PDT)
Message-ID: <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
Date: Wed, 20 Apr 2022 16:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@redhat.com
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YmAUaMp7kTRaRCGY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 16.10, Daniel P. Berrangé wrote:
> On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> According to our configure checks, this is the list of supported
>> compilers.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>   docs/about/build-platforms.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
>> index c29a4b8fe649..1980c5d2476f 100644
>> --- a/docs/about/build-platforms.rst
>> +++ b/docs/about/build-platforms.rst
>> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
>>   The version of the Windows API that's currently targeted is Vista / Server
>>   2008.
>>   
>> +Supported compilers
>> +-------------------
>> +
>> +To compile, QEMU requires either:
>> +
>> +- GCC >= 7.4.0
>> +- Clang >= 6.0
>> +- XCode Clang >= 10.0
> 
> Do we need to spell out the versions explicitly ? These versions are
> all derived from what's available in the repos of the supported build
> platforms, similar to any other build deps we have. I don't think we
> want to start a precedent of duplicating versions in this doc for
> build deps we have, and there's nothing particularly special about
> compilers in this respect.

I agree with Daniel - when I saw this patch, the first thought that I had 
was: "This will be getting out of sync quickly" ...
so I'd also recommend to rather not add this here.

  Thomas


