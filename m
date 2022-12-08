Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A50646C92
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:19:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Dze-0007Y3-7e; Thu, 08 Dec 2022 05:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3DzW-0007UH-RA
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:18:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3DzV-0004pe-DD
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670494736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=464/+wo6O3vY5d7m9lDoJI4Sst16eVek4Ppbhfa3y14=;
 b=LhB48oer33Ta5/9fHaJeLVZlWhJweoh0mF/SxnsRQAvrngd+64EghaxrpVSSSWAxeanu3/
 LJbX8aQpVSYUt6JhWGg8+OI3sNhFivTjyPaZILvzIUUBRrPLD7KhrIAaAM7gWRP+lpv0fb
 jYmSMFG58mSzuJMUooQj6sYcqBfSFzY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-m_4Fpa4PPiib5CW3A4uLMg-1; Thu, 08 Dec 2022 05:18:55 -0500
X-MC-Unique: m_4Fpa4PPiib5CW3A4uLMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so160587wra.17
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=464/+wo6O3vY5d7m9lDoJI4Sst16eVek4Ppbhfa3y14=;
 b=Yr0FScp6/6RynWzQpfHpqbuxa8Au/kbkk8btp+IxJ4F3D2QoZq/ZHdcMn9njBUroQO
 iGJFSmY8xx436viBzV7OQf1/jM2smOKP8VAcGKooie9CNIB/vEX+JRS9xM83B5gb8bt8
 nGVEfMNSpP4LAy7eL+L2mphXkBwv2Ax5B5Zs5Rru7R1BHantMobIQuCdmiI/zKy/iI70
 HRklwot3vFlnl0ZAFlsLPhhIGDRxqtJ1ZpF69TIGE9KTuZ0VIpGQdGe261pd0KEiadjR
 i2Ex897JvlfmC9yGINd8fOo/+s15VBHMWhifWmn1fVJLJsN1t231+WaA2JVtNPpaMAga
 lCLg==
X-Gm-Message-State: ANoB5pl5cWTKAEKbi0CcNAkEnBNKS2W/aVJqDfmR7frzsLA0jr8eJShe
 OxO7wSClIlY7kIF79OhYGVgLeXnZIo14WKFC87w7qWMvLt8v3I+ePjjAOZAH3Ip9TVr+M8gkKyb
 Sh3NwMjCgJfVbvvA=
X-Received: by 2002:a5d:690a:0:b0:242:156f:9ce3 with SMTP id
 t10-20020a5d690a000000b00242156f9ce3mr1130995wru.3.1670494734177; 
 Thu, 08 Dec 2022 02:18:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7j03wMkPvN0LunSGlFN+PbbWsqlUWT6OVem8qeo1NkAnz/6R4/FC1qHK2QnY457cpbp6cHXw==
X-Received: by 2002:a5d:690a:0:b0:242:156f:9ce3 with SMTP id
 t10-20020a5d690a000000b00242156f9ce3mr1130988wru.3.1670494733909; 
 Thu, 08 Dec 2022 02:18:53 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-43.web.vodafone.de.
 [109.43.177.43]) by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b002422b462975sm20870906wrv.34.2022.12.08.02.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:18:53 -0800 (PST)
Message-ID: <18a60ab7-a327-bf6e-3249-ae14f9a561b7@redhat.com>
Date: Thu, 8 Dec 2022 11:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] gitlab-ci: Check building ppc64 without TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-ppc@nongnu.org
References: <20221208101527.36873-1-thuth@redhat.com>
 <1f01f666-58b7-f4b8-ec69-9a9d0de2bad9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1f01f666-58b7-f4b8-ec69-9a9d0de2bad9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/12/2022 11.17, Philippe Mathieu-Daudé wrote:
> On 8/12/22 11:15, Thomas Huth wrote:
>> Building QEMU for ppc64 hosts with --disable-tcg used to break a couple
>> of times in the past, see e.g. commit a01b64cee7 ("target/ppc: Put do_rfi
>> under a TCG-only block") or commit 049b4ad669 ("target/ppc: Fix build
>> warnings when building with 'disable-tcg'"), so we should test this in
>> our CI to avoid such regressions.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Not sure whether we really should add new shared runner jobs ... but
>>   I currently also don't see a better option for this: We don't have
>>   any custom ppc64 runners in our CI, so the only other way to test this
>>   is travis - but the Travis extension for gitlab recently broke, so
>>   the results there are currently rather neglected, I think...
>>
>>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index c4cd96433d..8dbbb8f881 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -112,6 +112,14 @@ cross-ppc64el-user:
>>     variables:
>>       IMAGE: debian-ppc64el-cross
>> +cross-ppc64el-kvm-only:
>> +  extends: .cross_accel_build_job
>> +  needs:
>> +    job: ppc64el-debian-cross-container
>> +  variables:
>> +    IMAGE: debian-ppc64el-cross
>> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-devices
> 
> Maybe also --disable-tools --disable-docs?

These are already added by the template.

> Regardless:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

  Thomas



