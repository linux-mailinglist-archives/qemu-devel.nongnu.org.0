Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2C48AF8C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:29:25 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7I9M-0006eh-8h
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Hrh-0002qy-Rn
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:11:10 -0500
Received: from [2a00:1450:4864:20::32c] (port=47079
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Hrd-0001Zh-TO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:11:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso1887043wmd.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFMhHhfWiBZy4qJwt2VavywlR7RjlIm8hHw7X8pLnHo=;
 b=AQGQqBU4VfVAcUyfQPVOrms8cfIeLEDqjIVXsB9MpiC8ZxVA0cLhU7m1oO50t5T2YA
 xZtRsUc8Fd5cNPWtE8IFdpWLqfYxfYxGSm8ff1SsRby01VfDqNracOkj5wG1SSYbHKhU
 v+TaKI/wq5BycQYhBk0ue0VjT23y4B46UEDNJs0dx/Px75R1TKmkauhiRAXTrg9VJD7V
 z1+byvNbYtr6199mtH/ME8JgOh3zXpYq4tDAJk9oqe3Zbyuda7OQ2ez+zDVTacbb1RaV
 HNx7B7p2X0rg372zXOjckhq+vhPKp3ToEfYHn2Sem0RFCyEXnCgVhSCZlh83Ez9eVAw1
 6CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFMhHhfWiBZy4qJwt2VavywlR7RjlIm8hHw7X8pLnHo=;
 b=akkbbz/ZiabNj0MU7sSxfVmVlHz8wkSht7F5wgAmHSqzjVWZG9Lh5HWSl3OKeH3Nhf
 A30kKmgq4rHUJZl7ps9cEVSDSscQv9wUBvLAeTuR4W1wEE6kjZxseAWFkyPcFiIR40EA
 s9P+0ZC6iieY1G9IqUXK58gVhLgIYgtCfFTOzM4Y4fppNCddrE21zZ7AYiYeZVIMP0bp
 ruIPWQqObse8rhqwwVthKbvXssBlnYw0AHV/CtJjbOCzw4IhCCNBI+5QQu522Y5bgDb2
 YV8JyROpqzJRdmVSk0Vld/KQ26gm7RaBKJvZyUw3qMkDFfbOLVY02TMBXTL2TeCwLgD2
 5uIw==
X-Gm-Message-State: AOAM531pAuRxb8cSvNPzClK9rtWIf+6Hdv3I3InS896KyvZGyr+D/PTX
 erwbkSrEwPYtWRroLVdzCd3YVGKPg+UIN0XImZltNg==
X-Google-Smtp-Source: ABdhPJxPGpa5fJDieO4b+cWDmvtN30OAItGNHfw7OdZuplgvJii8f1HH803kNyW2AMPpdu7J6gxqvt+3FssC4uezVwU=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr2673926wms.32.1641910263590; 
 Tue, 11 Jan 2022 06:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20220108150952.1483911-1-ardb@kernel.org>
In-Reply-To: <20220108150952.1483911-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 14:10:52 +0000
Message-ID: <CAFEAcA9DCzNJ8q7wLqSW-4pCzGM4gSvo2FLVhkG94cdriYj4zQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 15:10, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> When running under KVM, we may decide to run the CPU in 32-bit mode, by
> setting the 'aarch64=off' CPU option. In this case, we need to switch to
> the 32-bit version of the GDB stub too, so that GDB has the correct view
> of the CPU state. Without this, GDB debugging does not work at all, and
> errors out upon connecting to the target with a mysterious 'g' packet
> length error.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Bennee <alex.bennee@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v2: refactor existing CPUClass::gdb_... member assignments for the
>     32-bit code so we can reuse it for the 64-bit code
>
>  target/arm/cpu.c   | 16 +++++++++++-----
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu64.c |  3 +++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a211804fd3df..ae8e78fc1472 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2049,6 +2049,15 @@ static const struct TCGCPUOps arm_tcg_ops = {
>  };
>  #endif /* CONFIG_TCG */
>
> +void arm_cpu_class_gdb_init(CPUClass *cc)
> +{
> +    cc->gdb_read_register = arm_cpu_gdb_read_register;
> +    cc->gdb_write_register = arm_cpu_gdb_write_register;
> +    cc->gdb_num_core_regs = 26;
> +    cc->gdb_core_xml_file = "arm-core.xml";
> +    cc->gdb_arch_name = arm_gdb_arch_name;
> +}

Most of these fields are not used by the gdbstub until
runtime, but cc->gdb_num_core_regs is used earlier.
In particular, in cpu_common_initfn() we copy that value
into cpu->gdb_num_regs and cpu->gdb_num_g_regs (this happens
at the CPU object's instance_init time, ie before the
aarch64_cpu_set_aarch64 function is called), and these are the
values that are then used when registering dynamic sysreg
XML, coprocessor registers, etc.

> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -906,6 +906,7 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
>  static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    CPUClass *cc = CPU_GET_CLASS(obj);

This is called to change the property for a specific CPU
object -- you can't change the values of the *class* here.
(Consider a system with 2 CPUs, one of which has aarch64=yes
and one of which has aarch64=no.)

>      /* At this time, this property is only allowed if KVM is enabled.  This
>       * restriction allows us to avoid fixing up functionality that assumes a
> @@ -919,6 +920,8 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>              return;
>          }
>          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +
> +        arm_cpu_class_gdb_init(cc)

This fails to compile because of the missing semicolon...

>      } else {
>          set_feature(&cpu->env, ARM_FEATURE_AARCH64);

If the user (admittedly slightly perversely) toggles the
aarch64 flag from on to off to on again, we should reset the
gdb function pointers to the aarch64 versions again.

>      }

thanks
-- PMM

