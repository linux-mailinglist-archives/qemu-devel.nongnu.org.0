Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116D2DBF10
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:56:34 +0100 (CET)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUTw-00057P-LB
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpUSr-0004a2-UW
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:55:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpUSq-0007tw-AE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:55:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id t16so22729145wra.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 02:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q6tJxJvk5A7h0pQGeGrow1/29+Yel8mvO8oSdG6hhNw=;
 b=QSEi6Y1GVGnXfUIxafMtZeZ4fqdChHpacHu2TTwv8DhhXZQvGdqncjVB+OSFf0LnYE
 +5XGma0cKTMHl/2E+ypd8tjy2zrenSSbg4mPte3IYg1B1EGcr8SDg+BxD/9qcCzN9XLL
 Zy42X4XwxLn7nkMCSZzeml8kou0ys2tICSJg5p8wGbdUzTA/pO3gGz8qq1F1sSctMOoi
 ytz2uDozWa61dfJ+0RM4z5neKbJZUH62oA5ovC4QjmfjEE2wSAkuVq2EOuZ6ewGjdh0m
 +LnudVPhJ67OnV9b5AoaeLDO5XCP8jEzK60ce9i85emze7pmaYjt7UikDmhsfHQoCUCS
 nmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6tJxJvk5A7h0pQGeGrow1/29+Yel8mvO8oSdG6hhNw=;
 b=ndSb0CHR6IN2QKdr5S+ZQV1ykrNgceI3dvTgAxU3P+wknYS329E0jJt6kMacI3RzZL
 CGiRwvG4l1P0go7fu5HuDBee+uNCIzkaCmvMignGINwgCMnX78ww/o/zJC1XgzP+H4rA
 YXwjVGONOv9MYD4SkQ3MNQqKXa8U9cvUG4G0/OVQtm6jH5Tf9JhjTX8VWvsVNmJ55mId
 02tZFuNj9/uHtKW4QcNIGSZbttW6+lAN+DuTuFhV4FjN3d/xSzs7E3mQF3lqyLl3zQEK
 gUEbL+Q3bJeuGqO0vOW+GtixLqZ3/5bu0C02wbp9JMXqww5x3d9DNQ8l3Pid7Ei2+Ocm
 qqCg==
X-Gm-Message-State: AOAM5331Pfv4c6rtmzcLu4uzXHPhGliM+m5Cth7HkHyHuvcRcyVgodlo
 h9U2Pl1cDBpyFZOKgiuiTFk=
X-Google-Smtp-Source: ABdhPJxoMPnOCncEvtoBbbFdv3KzwRLhGLnbQMa/J34kg1/IUfC3Bjl+OX4GzUX3DuOFGisWwL+IGw==
X-Received: by 2002:adf:8342:: with SMTP id 60mr38242089wrd.140.1608116122727; 
 Wed, 16 Dec 2020 02:55:22 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m2sm2138273wml.34.2020.12.16.02.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 02:55:21 -0800 (PST)
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
 <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
Message-ID: <47f9920e-38de-448c-b471-ba3e3a1f5c3b@amsat.org>
Date: Wed, 16 Dec 2020 11:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 12:48 AM, Philippe Mathieu-Daudé wrote:
> On 12/16/20 12:27 AM, Richard Henderson wrote:
>> On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
>>> +bool isa_rel6_available(const CPUMIPSState *env)
>>> +{
>>> +    if (TARGET_LONG_BITS == 64) {
>>> +        return cpu_supports_isa(env, ISA_MIPS64R6);
>>> +    }
>>> +    return cpu_supports_isa(env, ISA_MIPS32R6);
>>> +}
>>
>> So... does qemu-system-mips64 support 32-bit cpus?
> 
> Well... TBH I never tested it :S It looks the TCG code
> is compiled with 64-bit TL registers, the machine address
> space is 64-bit regardless the CPU, and I see various
> #ifdef MIPS64 code that look dubious with 32-bit CPU.

I don't think 32-bit CPUs on 64-bit build currently work
well, see:

382     env->CP0_Status = (MIPS_HFLAG_UM << CP0St_KSU);
383 # ifdef TARGET_MIPS64
384     /* Enable 64-bit register mode.  */
385     env->CP0_Status |= (1 << CP0St_PX);
386 # endif
387 # ifdef TARGET_ABI_MIPSN64
388     /* Enable 64-bit address mode.  */
389     env->CP0_Status |= (1 << CP0St_UX);
390 # endif
391     /*
392      * Enable access to the CPUNum, SYNCI_Step, CC, and CCRes RDHWR
393      * hardware registers.
394      */
395     env->CP0_HWREna |= 0x0000000F;
396     if (env->CP0_Config1 & (1 << CP0C1_FP)) {
397         env->CP0_Status |= (1 << CP0St_CU1);
398     }
399     if (env->CP0_Config3 & (1 << CP0C3_DSPP)) {
400         env->CP0_Status |= (1 << CP0St_MX);
401     }
402 # if defined(TARGET_MIPS64)
403     /* For MIPS64, init FR bit to 1 if FPU unit is there and bit is
writable. */
404     if ((env->CP0_Config1 & (1 << CP0C1_FP)) &&
405         (env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
406         env->CP0_Status |= (1 << CP0St_FR);
407     }
408 # endif

Or:

1018 void helper_mtc0_pwsize(CPUMIPSState *env, target_ulong arg1)
1019 {
1020 #if defined(TARGET_MIPS64)
1021     env->CP0_PWSize = arg1 & 0x3F7FFFFFFFULL;
1022 #else
1023     env->CP0_PWSize = arg1 & 0x3FFFFFFF;
1024 #endif
1025 }

1038 void helper_mtc0_pwctl(CPUMIPSState *env, target_ulong arg1)
1039 {
1040 #if defined(TARGET_MIPS64)
1041     /* PWEn = 0. Hardware page table walking is not implemented. */
1042     env->CP0_PWCtl = (env->CP0_PWCtl & 0x000000C0) | (arg1 &
0x5C00003F);
1043 #else
1044     env->CP0_PWCtl = (arg1 & 0x800000FF);
1045 #endif
1046 }

