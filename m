Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1564BA75F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:43:30 +0100 (CET)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkoU-0005rU-39
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKkjl-0007PZ-9J
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:38:37 -0500
Received: from [2a00:1450:4864:20::532] (port=43725
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKkjj-0005nz-BC
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:38:36 -0500
Received: by mail-ed1-x532.google.com with SMTP id m3so5002924eda.10
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2r3aVrqUNDcB0M3ZH7tt62V4P0+yvEbcEaRNaF4NT9s=;
 b=tN3dV/BNzfq81OhTM1kolk1eQbnhhDQpnfCr7baJEl25c4gF/jvYyuH4YTMTkj0BkS
 zeKtL7JBTFxtTY4wTHAyn10NDXornr7UqtW1wK17NyKptzfQtwG4XW1mV/qyB9kD0BUt
 D7ayufcEwutKJjTLS1hNurQ/gtBa2iEPI8yTQHF0FWB1xveAaBtn3Ae4sbvEV/YvUI1g
 00L5LmS8PURXy4PWc7pV6yEwpzUyw0X9ZF/gLr9TiudCr0AfEqkUWlt8kyyAODDsWxKj
 orGboDETxCOPAQTMc9jYVWkcpzGipjM4YgmS12TgzFk5wKdh0YSmkR+EbcLEEQIWH7t0
 9muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2r3aVrqUNDcB0M3ZH7tt62V4P0+yvEbcEaRNaF4NT9s=;
 b=3WrOoYDAkrM+u0kJTZxplXwy/LECBKLc4UKJkAjcCdHnH7n/+05021/FkEhkvfS7RZ
 EurJgPrgoBRUkAL6JcNypH56TB/i+M/2eWLdpsaXv6Jvr1Gg/ADX4/a76gg9Scf5ln9V
 GN5k8qa0V2Gxi9wzf5QWujEoNASMCSAjKa3s/WR9NVU5PgqSCse8j4Q89DuSTiY6NoF7
 kmrbLNYmyvvOXGUZ8s6/Y+whq0gYbsmW+qSAUIVRTOvKnwMAM13rhTeKtKO5jtOsiGFG
 V49NMAinMcuy30tbTYjpCVqneYDlsIRCvPfMEW/noHf6n2GH/5wTRJ3gHAIA3vsyDevx
 24Dg==
X-Gm-Message-State: AOAM533DPkr3Hk9HcwPWznLTcSylimHUWpgMxo27GNoXp3I/43IyiHV4
 2A2Ajm3VMlnZjJAUg+cgi3aKeA==
X-Google-Smtp-Source: ABdhPJx83e6oiLRMGVzFT2JPkOkPTI3Gh35SWrteSey127EOeX1W6DtVhrwp1VwT1SLeBRu2N7id9g==
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id
 cz14-20020a0564021cae00b00410d3ae3c8amr3697535edb.215.1645119512764; 
 Thu, 17 Feb 2022 09:38:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b19sm53399edd.91.2022.02.17.09.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:38:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA7C420329;
 Thu, 17 Feb 2022 17:38:30 +0000 (GMT)
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Date: Thu, 17 Feb 2022 17:37:53 +0000
In-reply-to: <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
Message-ID: <87v8xd9yw9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Feb 2022 at 04:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Changes for v2:
>>   * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>>   * Set TCR_EL1 more completely for user-only.
>>   * Continue to bound tsz within aa64_va_parameters;
>>     provide an out-of-bound indicator for raising AddressSize fault.
>>   * Split IPS patch.
>>   * Fix debug registers for LVA.
>>   * Fix long-format fsc for LPA2.
>>   * Fix TLBI page shift.
>>   * Validate TLBI granule vs TCR granule.
>>
>> Not done:
>>   * Validate translation levels which accept blocks.
>>
>> There is still no upstream kernel support for FEAT_LPA2,
>> so that is essentially untested.
>
> This series seems to break 'make check-acceptance':
>
>  (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes=
ts/results/j...
> (900.74 s)
>  (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes=
ts/results/j...
> (900.71 s)
>
> UEFI runs in the guest and seems to launch the kernel, but there's
> no output from the kernel itself in the logfile. Last thing it
> prints is:
>
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services and installing virtual address map...
> SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
> (0x0000000000000008)
>
> This ought to be followed by the usual kernel boot log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> etc but it isn't. Probably the kernel is crashing in early bootup
> before it gets round to printing anything.

As this test runs under -cpu max it is likely exercising the new
features (and failing).

--=20
Alex Benn=C3=A9e

