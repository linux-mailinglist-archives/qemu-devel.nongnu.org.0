Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B766FD8EA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:11:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweuY-0007YO-Vx; Wed, 10 May 2023 04:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pweuX-0007YG-RV
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pweuW-0005eR-72
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683706255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKdB2c33dpM/Fh+1g8U4PcyESYkFhO+3Y/Bz1BAEO+8=;
 b=br2izOFvnEnWpm54nS3r6XD67cceMqfsxJdkzlAL5Xtrnnmu5aMcLeIyi7KCeEUTC7pZMo
 8IHbXDR0K0asyajrmbHwe/2+39VZn1UnLsr4GuMsVQjfJPsWBg2g2MCGLdmNXyIJ3iW0jT
 ARvMIVZQmzdb47YaHhfP7bYAjAVb8Ns=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-86zEsddfNF-CdY8UDhioPQ-1; Wed, 10 May 2023 04:10:53 -0400
X-MC-Unique: 86zEsddfNF-CdY8UDhioPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f420742d40so15123545e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683706252; x=1686298252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vKdB2c33dpM/Fh+1g8U4PcyESYkFhO+3Y/Bz1BAEO+8=;
 b=KTxSOzULVGWUPWI/LAeJoG966YeKt0Ofe/6+H2Ia/COJqT7q552AxUvTpum7de03oM
 XvG3h5Rbqyyyns5qpUB/0taQ0kOWUewbR3akMChDuJ29+jwGe1ZG5NbFKCDY6jstLDSP
 vqiyxFurGIa2TO05q+FZYDQeY8p0jqhz42JnqVy/TV4ALB54Kszgp36b/xLYfPgjWsFZ
 OgHYZdXLitHpUb0qtpg/8CXv91dcHuSf8YE8TPibV7adueVH2ov8pUsjET6JtCydDaGq
 K7Vn2jz/19Po6szIVQyXzecp9utP1Sz2ef0tIWUs7/ji23EWEWxwSJOmoVQJCvvvY+Kw
 +zWA==
X-Gm-Message-State: AC+VfDyPJOWGUfLJe0pzxaptyIJyJM7xEj3Q2hAeMe86XfYQ9Z9YfPD3
 2I3EcPPEqVcYsbozGvP+2fKgHrMAb7+uyk2BhnW83kWdtonehuscYQwL+CZpycr185LqXn84+bv
 jkTFK9iw35hAlHFw=
X-Received: by 2002:a05:600c:22ca:b0:3f4:2158:289b with SMTP id
 10-20020a05600c22ca00b003f42158289bmr8802281wmg.18.1683706252290; 
 Wed, 10 May 2023 01:10:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Uck0PTiJ+SnnDslqtdKcNkpF0yWLi5p5lOD227aUGhaKsm8jJKVLR3YFxvg9h0rs6DnOBCg==
X-Received: by 2002:a05:600c:22ca:b0:3f4:2158:289b with SMTP id
 10-20020a05600c22ca00b003f42158289bmr8802265wmg.18.1683706251943; 
 Wed, 10 May 2023 01:10:51 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc301000000b003eddc6aa5fasm22163640wmj.39.2023.05.10.01.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 01:10:51 -0700 (PDT)
Message-ID: <3d4e0154-99bf-da36-0d71-efe99d24ab72@redhat.com>
Date: Wed, 10 May 2023 10:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] disas: Move disas.c into the target-independent
 source set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, philmd@linaro.org
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-6-richard.henderson@linaro.org>
 <b62ab9a2-fad5-313f-518c-29626b0d57c3@redhat.com>
 <48f35197-1890-cfce-3535-9a8522f50523@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <48f35197-1890-cfce-3535-9a8522f50523@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/05/2023 09.46, Richard Henderson wrote:
> On 5/10/23 07:53, Thomas Huth wrote:
>> On 09/05/2023 18.33, Richard Henderson wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> By using target_words_bigendian() instead of an ifdef,
>>> we can build this code once.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> [rth: Type change done in a separate patch]
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>> ...
>>> diff --git a/disas/meson.build b/disas/meson.build
>>> index f40230c58f..2ae44691fa 100644
>>> --- a/disas/meson.build
>>> +++ b/disas/meson.build
>>> @@ -13,4 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: 
>>> files('xtensa.c'))
>>>   common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
>>>   softmmu_ss.add(files('disas-mon.c'))
>>> -specific_ss.add(files('disas.c'), capstone)
>>> +common_ss.add(files('disas.c'), capstone)
>>
>> I guess you could drop the "capstone" here now since it is already added 
>> to common_ss now three lines earlier.
> 
> I have a memory that it's required to get the include path for <capstone.h> 
> for "disas/capstone.h", for use by the target's cpu_set_disas_info.  
> Otherwise only common_ss files have access to the include path.

I only meant to remove it from the new "common_ss.add(files('disas.c')" line 
since it is already there in the "common_ss.add(when: capstone, if_true: 
[files('capstone.c'), capstone])" line ... I think you have to keep the 
"specific_ss.add(capstone)" line.

  Thomas



