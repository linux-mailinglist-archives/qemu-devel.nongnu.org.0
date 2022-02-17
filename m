Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F54BA3FA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:06:55 +0100 (CET)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiMw-0006Qs-6b
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKhYQ-0004JI-L8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:14:42 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=39925
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKhYO-00072t-Tc
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:14:42 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id p19so13307807ybc.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 06:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tl48z0epbBl7QP/CjWHzxMWZfj2iC8QYDyAt9TKidpg=;
 b=RcrM8KY5XeIZVeQnG5cZJvdAXSZFu1AZn99kSF/KlwaH7zSOobU6XS5JfYB08TvtIw
 eqhr6ovGvItgfAbums2Ofxp5tyqPgFdjw3NG+81DCkuOH+px/g/2ZZAfOwB6r9Hw2rpq
 zxsiSFgCLP4+0s+Z4J7mRaC9f3gAmF68ynHgKezkEUXyPROL7akX51a3/M78W0TiAmdW
 prH0vzRiAYIDcwMZ+xQNftZ2BpGKaTCx9MtUOIlNIbEjVet5+m05knbzSs7NduoMsa9b
 QcAeb4/5ZltyV/2mWb00Rwqpe0PP5163vDNzFHYTJNAXZlA5HUm01Vys2jPAwA5fPry2
 8dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tl48z0epbBl7QP/CjWHzxMWZfj2iC8QYDyAt9TKidpg=;
 b=LboRRGV4f+IHul5vhCm3gLH9fFp1DmIQCXWOro8MpjMPdFdzjqB77iEQ/FFX5QTliX
 nSGdduj19GlHdhlQss5Pmgi6ctnHoMOdc+gd1JTovJxYzCAIUBXZfiXXB5BJEFgZ8eAv
 DKtHs9RE7ywa6e4nh8CKcaxHCasdaTJj2faHg2hO6y+DwAFWeuIrU+XhRPMK8TViKDKj
 LKKKiAO0ko46Y/6A/Yp4bMNjE/k/Z+bX1/kjxMGzE3kldcE2iRoUGKA/t+rprKuUdBRS
 1zDJuthPF1Bs8siQ+zjKe5YH+Wv1WiWpgmGl24QP436KXJAxEoAZv4BlBp6HpI+KW2UP
 40Ig==
X-Gm-Message-State: AOAM532ra5g09kvr/uklPz0ZhwM2qgLClwSLMCXy9rYzdY/Sr3KSmnN3
 149dCiW/wMvrS0gxTt9ktXVeUUhgFXcgOpo/VzGxzg+9ll45vw==
X-Google-Smtp-Source: ABdhPJz0f2AtC2TnxNopoga8n91/h3VoYrukh0eMLSB3OfGH+ey8OAYSuN9s9xlIU7xLYXxqCVDcE3KCjDna1djHDUU=
X-Received: by 2002:a81:bb51:0:b0:2d6:997b:131c with SMTP id
 a17-20020a81bb51000000b002d6997b131cmr2193081ywl.64.1645106876042; Thu, 17
 Feb 2022 06:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 14:07:44 +0000
Message-ID: <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>   * Set TCR_EL1 more completely for user-only.
>   * Continue to bound tsz within aa64_va_parameters;
>     provide an out-of-bound indicator for raising AddressSize fault.
>   * Split IPS patch.
>   * Fix debug registers for LVA.
>   * Fix long-format fsc for LPA2.
>   * Fix TLBI page shift.
>   * Validate TLBI granule vs TCR granule.
>
> Not done:
>   * Validate translation levels which accept blocks.
>
> There is still no upstream kernel support for FEAT_LPA2,
> so that is essentially untested.

This series seems to break 'make check-acceptance':

 (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
(900.74 s)
 (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
(900.71 s)

UEFI runs in the guest and seems to launch the kernel, but there's
no output from the kernel itself in the logfile. Last thing it
prints is:

EFI stub: Booting Linux Kernel...
EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services and installing virtual address map...
SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
(0x0000000000000008)

This ought to be followed by the usual kernel boot log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
etc but it isn't. Probably the kernel is crashing in early bootup
before it gets round to printing anything.

thanks
-- PMM

