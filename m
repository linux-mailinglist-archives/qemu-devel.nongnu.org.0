Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55136FCA2B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:25:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPCT-00007D-8b; Tue, 09 May 2023 11:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwPCQ-0008WG-Em
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwPCN-0000kS-Qy
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683645858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdeB5ATc9Nu7Mp398+o+L4Ukszy670dmmLE3kbD+Bjk=;
 b=gJOJXmbkdLqeQmrez325D2MUl6trYIT7MuNFpE8T4U6/QsULCFd/CUzneZOLinhxP0D68y
 01H/dYMqQAekqhMHCrsfPCZzzVPnk8Yv3rMQkZ6rCfj1Gw1v6kFw0nFFhIz5OLdy2Ugwsv
 Pg1B2pq/spPKsgkSwdpSX3dppyZ0+mI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-VO9TW0jKN-q6fPGgT-47TA-1; Tue, 09 May 2023 11:24:17 -0400
X-MC-Unique: VO9TW0jKN-q6fPGgT-47TA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-506b0a2d5c4so6913002a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683645856; x=1686237856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdeB5ATc9Nu7Mp398+o+L4Ukszy670dmmLE3kbD+Bjk=;
 b=BV/TYUNEmLD12BG961cRLitYauHivwjhB405E7M1WIPyxiI5+FIejENah7lw6rHWwN
 f7U6Lizg/juQfG7VQNCOxaZpLuNOyHs3PyUCUTYg2uPHeO3czqjET4ALgbl3v5Ymy8ef
 g/Ur/zX7JB1Pb1UxI7w2YCdFx5dUgjMEZZC5TLN/i8rC7ASKs6xeHptFtO7XWnc9rhtf
 4LRASx/j21w75dJ+P7ivVUMzy4p31wKWKQrzhO5o94e4sWmp2Dc1LJhTqPyOaoZZrcf6
 CJ/DhbxNZSIUDDbYoM8vtzgVjCm1mspUftbtjFOkueKR9CZqTvN+z45m9ykdKO8MzXxV
 3edA==
X-Gm-Message-State: AC+VfDwFjZHkMeSNVDO2x+RFRoGlD5Fvd5YFXqkBA9qFp2JyWHgr2AQQ
 L5qcY9T5ih8/4Cy+n/YPAmusNg23qwHauy9+4LrQvHA5Oh0C6uG49e7uzqZOSfRPqAAPefW+X6a
 z7oUQZxICzHDYbUk=
X-Received: by 2002:aa7:d4d4:0:b0:506:976e:5242 with SMTP id
 t20-20020aa7d4d4000000b00506976e5242mr12092427edr.25.1683645856435; 
 Tue, 09 May 2023 08:24:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ayNY8HifZcStnO/SqtfAxyVozsyd5edrqRStMpSOvl9kBKToLh7zQQAMqzSs8Yaby+QQ0sg==
X-Received: by 2002:aa7:d4d4:0:b0:506:976e:5242 with SMTP id
 t20-20020aa7d4d4000000b00506976e5242mr12092408edr.25.1683645856154; 
 Tue, 09 May 2023 08:24:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 n10-20020aa7db4a000000b005027d31615dsm862767edt.62.2023.05.09.08.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:24:15 -0700 (PDT)
Message-ID: <40863bd4-1aad-2428-7976-f31e6b7b893f@redhat.com>
Date: Tue, 9 May 2023 17:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is
 enabled
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-3-farosas@suse.de>
 <d51de29f-a23f-be79-049a-f15df2be7ac6@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d51de29f-a23f-be79-049a-f15df2be7ac6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/9/23 16:49, Philippe Mathieu-Daudé wrote:
> On 8/5/23 20:16, Fabiano Rosas wrote:
>> We cannot allow this config to be disabled at the moment as not all of
>> the relevant code is protected by it.
>>
>> Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
>> KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
>> is now possible that nothing selects ARM_V7M (e.g. when doing a
>> --without-default-devices build).
>>
>> Return the CONFIG_ARM_V7M entry to a state where it is always selected
>> whenever TCG is available.
>>
>> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a 
>> KVM-only build")
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> index 3fffdcb61b..5947366f6e 100644
>> --- a/target/arm/Kconfig
>> +++ b/target/arm/Kconfig
>> @@ -1,6 +1,7 @@
>>   config ARM
>>       bool
>>       select ARM_COMPATIBLE_SEMIHOSTING if TCG
>> +    select ARM_V7M if TCG
> 
> Probably worth a comment mentioning this is temporarily
> required until <some magic happens>, so we won't forgot
> to remove it.

Yeah, this one should in principle be defined by the boards, but 
m_helper.c is included unconditionally instead of having some kind of 
stub for A-only boards.

Related to this is the (right now unconditional, later on only "if TCG") 
"select ARM_GICV3_TCG" that needs to be added under ARM_GIC.

Paolo


