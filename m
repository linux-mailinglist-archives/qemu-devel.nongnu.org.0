Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2856C6F31
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:35:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfOp9-0007tZ-U1; Thu, 23 Mar 2023 13:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfOp7-0007sd-Tv
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:34:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfOp6-0003gZ-0w
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:34:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so2677904pjt.2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679592838;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DoOBGBUxhoP7443HeZHhbsYxlHpAyri1FdzgqDGvN8=;
 b=CrAX8EIbvxvEQyz83c982wIQZGOx0rAliuwPmqm6YNAK7YPPRHdtRcB53aH/NW/RaJ
 QimM+UpJhb+uja/YLnYCtY4Sq9b1fz1W/VxV2iZJMwoJdR6vrMIqMVeRycCQXGiyToio
 IKNQCw776yKOvFU5gkf9hY+1nF9w7NNBR/V7SX2u7Ly/27Tt00+ZiIPOwvm6C/3dPeey
 yBBeoBg0cmDwL/lVoM+h/vHbO35KphgrqzRSeqFWPBnZjBvzIQGsH44WOv4Lz8h+U/KX
 1Y4Tq7ZSLZwgqjeR+j7IUR/eVHfh3AwRnQgFK62WJKbU99uKbWc9akQ/dCRnRz/OVj+O
 AVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679592838;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DoOBGBUxhoP7443HeZHhbsYxlHpAyri1FdzgqDGvN8=;
 b=HJdbZqDas0fOftCqurZfSLd/oCvZA63OVVyYb0Ok3+e3j7FoxR/qFKH4laovZRaoB4
 UWwz8iQSr8b8FLtQudNcwLmj4tMVof8NIk8vLX3NPZ14cXvBwWVnB3mN18kgpPgYW868
 d8bfXbqjrjdA+1V5y0PodLXevuHdjDbnS77ouooTouu3gFhojXHtmajoz9ka3gw++/Lb
 H2HZw/YkNywTOb1M2d1G3PmpX04+iEwDhrjb9llqli/JIT6mSEcqGCdnPCWriJeSZYNr
 ijLf+fBXMh5LDTnwQ91JBaGUtjgZLfbGJVMWuVuD2y9c8DEU8PK7COGoNOgwLU+Qwe8n
 lAZg==
X-Gm-Message-State: AO0yUKWqU41uEYTr1ne6Myme+MnKNcTgm28HS6++IRD5arHVLwNv9ny7
 8/ewYfCWQqe5g159ePUfhOA6zRm0yunp1w5B2dg=
X-Google-Smtp-Source: AK7set/x4zQKJWSrHztQDrX6Epw0DeM2PHtu4nD1kqL3GtWDeGdKx1ThLvMyidyBe3rv5+QlSzjd8g==
X-Received: by 2002:a17:90b:3a83:b0:23b:569d:fe41 with SMTP id
 om3-20020a17090b3a8300b0023b569dfe41mr8326352pjb.7.1679592838365; 
 Thu, 23 Mar 2023 10:33:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 hv19-20020a17090ae41300b0023b4d33bedbsm1570202pjb.21.2023.03.23.10.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 10:33:57 -0700 (PDT)
Message-ID: <4f8e0e2e-60fd-a38d-5026-524d5bdf17dd@linaro.org>
Date: Thu, 23 Mar 2023 10:33:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/8] target/arm: Add ID_AA64ISAR2_EL1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>,
 Aaron Lindsay <Aaron@os.amperecomputing.com>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-2-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
In-Reply-To: <20230322202541.1404058-2-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/22/23 13:25, Aaron Lindsay wrote:
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -507,6 +507,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>           { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
>           { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> +        { HV_SYS_REG_ID_AA64ISAR2_EL1, &host_isar.id_aa64isar2 },

Ah, I may have given you a bum steer here.
In MacOSX 12.6, there is no HV_SYS_REG_ID_AA64ISAR2_EL1 enumerator.

Irritatingly, it is an enum not a define we can test via the preprocessor.
In addition, the form of the enum,

     HV_SYS_REG_ID_AA64ISAR0_EL1 = 0xc030,
     HV_SYS_REG_ID_AA64ISAR1_EL1 = 0xc031,
     HV_SYS_REG_ID_AA64MMFR0_EL1 = 0xc038,
     HV_SYS_REG_ID_AA64MMFR1_EL1 = 0xc039,

suggests an encoding of the system register number, so we would eventually be able to use 
0xc032.  But I wouldn't want to try that without the interface being properly exposed.  I 
don't know if some later version of MacOS already does so.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


