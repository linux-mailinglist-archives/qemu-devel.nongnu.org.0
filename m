Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D06A1CDF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:17:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXx4-0008Ll-7w; Fri, 24 Feb 2023 08:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVXwx-0008Jx-NX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:17:24 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVXwu-0002bU-8O
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:17:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id c12so13886724wrw.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LW16dxp3rlRaYijm9VAdaRKC9L72VFXeFbAPkSzuSV8=;
 b=Zs+E+lmYf9louzdUmMgoF5oy+xLcxXSCarT1833X5Lr2eXK7CBq9WiMSZtNjZh2Cui
 xjfjkordjlcW1eZxRuv04oNA3XBTWbfUmvrlBfo6k+wAIG7BxWRMCIFx34hjxu04F2ao
 9yQN0xOCC6hqNZ433hCFdtajK+YGDDIQa7RMrlH0ioJiwpKgVo8x63CUvtFP6yXuGjfF
 mFM/L8DuEq+tF1Ev6xRgTJwQuNjO+wwESmm5Jpo9Zss2U3rjkvGe90kDLyCKVwuw1k1j
 jEAhvW3PuV/TcISXv/8jo4Wuysjew8z2iGlDJfjb/qBqoPi2ebUEswRYH1MU7Jh1VJB4
 WiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LW16dxp3rlRaYijm9VAdaRKC9L72VFXeFbAPkSzuSV8=;
 b=KPQb/m7YlaXaCMX7Ndq3gXqUSEnPTEftSb1jWepv9aD2C0G7gGChwljUcz42JL61N0
 BAafUe9VUahxKBGf7I+HhpKjw6CPzESM4flvtxEMgY1qYYKtQJ2Ci1GICjwB6ebwZNlk
 R0d/M5g4Tm8CA0zEuVYwFzkr5TIoEL+rM8oBv15A0fPtZryiYjGfeqXAxWZuFNsaVRmH
 h/vipZvGtSM7t8kAwN7ZJ01fqUQBA7OMc/Ye1WkLlrATZSs74jlPuktuMEWx7LsS303N
 IxEZylMGXPO73ZK/0sLWrp5nM8HRf9xoqtsM8QG9mYMjGRXpakpiXDMBZb3RTHwDphLI
 1DGA==
X-Gm-Message-State: AO0yUKU19yczXTI9Ph34v1OGLSv506LsUPi8NJKd0kc3FsJDtnQakTur
 g6n7en55bLaZ4ORBL6Pe/B494A==
X-Google-Smtp-Source: AK7set+3yoV6/XhY4jdWLGeTCzpc7VNrQT3i+BkpNzpfXceB7HyyoZn10bx4m6a5a/Y0jJIxIH9ybA==
X-Received: by 2002:adf:cd82:0:b0:2c7:cc8:84a6 with SMTP id
 q2-20020adfcd82000000b002c70cc884a6mr7356751wrj.31.1677244638106; 
 Fri, 24 Feb 2023 05:17:18 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6405000000b002c5534db60bsm12425253wru.71.2023.02.24.05.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:17:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AD0D1FFB7;
 Fri, 24 Feb 2023 13:17:17 +0000 (GMT)
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Fri, 24 Feb 2023 13:14:46 +0000
In-reply-to: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
Message-ID: <87y1onnqxu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/22/23 01:01, Alex Benn=C3=A9e wrote:
>> This is a mandatory feature for Armv8.1 architectures but we don't
>> state the feature clearly in our emulation list. While checking verify
>> our cortex-a76 model matches up with the current TRM by breaking out
>> the long form isar into a more modern readable FIELD_DP code.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst |  1 +
>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>   target/arm/cpu_tcg.c          |  2 +-
>>   3 files changed, 28 insertions(+), 4 deletions(-)
>> diff --git a/docs/system/arm/emulation.rst
>> b/docs/system/arm/emulation.rst
>> index 2062d71261..2c4fde5eef 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>   - FEAT_BTI (Branch Target Identification)
>> +- FEAT_CRC32 (CRC32 instruction)
>>   - FEAT_CSV2 (Cache speculation variant 2)
>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 4066950da1..12e1a532ab 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>   static void aarch64_a76_initfn(Object *obj)
>>   {
>>       ARMCPU *cpu =3D ARM_CPU(obj);
>> +    uint64_t t;
>> +    uint32_t u;
>>         cpu->dtb_compatible =3D "arm,cortex-a76";
>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>       cpu->ctr =3D 0x8444C004;
>>       cpu->dcz_blocksize =3D 4;
>>       cpu->isar.id_aa64dfr0  =3D 0x0000000010305408ull;
>> -    cpu->isar.id_aa64isar0 =3D 0x0000100010211120ull;
>> +
>> +    /* per r4p1 of the Cryptographic Extension TRM */
>> +    t =3D cpu->isar.id_aa64isar0;
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>> +    t =3D FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
>> +    cpu->isar.id_aa64isar0 =3D t;
>
> Ok, so, this might be helpful for grepping, but it's not helpful for
> reading the documentation, which on page B2-137 uses hex.

Well in the latest TRM is B2.62 which breaks it out to the individual
bit assignments. I didn't find that first time around which is why I was
reading the Cryptograhic Extension TRM which is similarly broken out.

If this is the way the documentation is going we should follow it.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

