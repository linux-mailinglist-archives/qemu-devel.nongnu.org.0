Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F63DF1CF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:51:55 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwht-0005d8-Og
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwh1-0004u3-GN
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:50:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwgz-0002eh-Om
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:50:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p5so25850311wro.7
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CJIJLU/zjOzJ/qXejskdqZL5g6zRQGnp7lEVLUDl21o=;
 b=BKLMtuhxAcsOQB7WXkKD1t/IWp3h8fC1SsCKF7dci0+x8tH43ql4yUp/BHHimiGRTI
 XMCghtm84u6ZGimsBLl05MQ4yp9Z35tGgOR1d9/VolWbYXi+wKzLHm5o7CiIgK56bqKK
 7f4+VLB6Wgi8+d8C/L17acIiZWxdobZjCpTsRBhGKML0bvILnq466xssbeMzwFQ3NjzM
 JHUgDQ2dhY1/bcVAQaic6DvQqEgkj11Hhwafpaev8UHdNhiqtVpT1FNN6RY8aTbzTjrn
 5xXxXSFGJ2ruhNhk2pi3KrblBaCsqF2D81p7E8kIvfFgxQodQ6chSe8Z+a/6oOBIlVhl
 qJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CJIJLU/zjOzJ/qXejskdqZL5g6zRQGnp7lEVLUDl21o=;
 b=pJn3cyoM+sAEzjM0u2zxkEycs0F7Lc6gDknyfTUbfJ/HAyf8jcE3Vbsp3qnfa7WWxn
 KVhlDkQtRPNe30SrvNMynAQhSlGyVyRrO4mtAOXPPHYeJPwh90Otp2CBE70anHoLHF/W
 USriCP+vgVQTmXU8XC3tMqSuS++dYDT6j/2Et2oo6dHv1CmOPiyHb9gtyiOZYOey8phG
 vgxbeetwLmZUTHQ7ODeN6a4aI+i2iq67Ph41z0hkjgTwa5m0fEAHRNMHwtpWpfG7cXfF
 nF8isp5CVREvLJ0Ea5qgqQlw3amSjU+XaUjNW6n0g1bkZdoXXQO9GvbPbCvLX47Jhje5
 SQKg==
X-Gm-Message-State: AOAM531BRor/KXP7b7Qypli6y5AdYeoRf5lzhEs17GNrNAe0tU2ZV/a1
 pcZ/H37PwBV79hnhcvex/gGqVg==
X-Google-Smtp-Source: ABdhPJyePds33Ph+H4YxBmbaUORxXCicGffbBM9rh8gda47N4gkYA8OO5Gijj8k7nYzlO1jPPs9M6A==
X-Received: by 2002:adf:f383:: with SMTP id m3mr23213356wro.81.1628005855589; 
 Tue, 03 Aug 2021 08:50:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p22sm13449383wma.10.2021.08.03.08.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:50:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A0021FF96;
 Tue,  3 Aug 2021 16:50:54 +0100 (BST)
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-2-richard.henderson@linaro.org>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/55] hw/core: Make do_unaligned_access noreturn
Date: Tue, 03 Aug 2021 16:47:58 +0100
In-reply-to: <20210803041443.55452-2-richard.henderson@linaro.org>
Message-ID: <87r1fafrxd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> While we may have had some thought of allowing system-mode
> to return from this hook, we have no guests that require this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h  | 3 ++-
>  target/alpha/cpu.h             | 4 ++--
>  target/arm/internals.h         | 3 ++-
>  target/microblaze/cpu.h        | 2 +-
>  target/mips/tcg/tcg-internal.h | 4 ++--
>  target/nios2/cpu.h             | 4 ++--
>  target/ppc/internal.h          | 4 ++--
>  target/riscv/cpu.h             | 2 +-
>  target/s390x/s390x-internal.h  | 4 ++--
>  target/sh4/cpu.h               | 4 ++--
>  target/xtensa/cpu.h            | 4 ++--
>  target/hppa/cpu.c              | 7 ++++---
>  12 files changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index eab27d0c03..ee0795def4 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -72,10 +72,11 @@ struct TCGCPUOps {
>                                    MemTxResult response, uintptr_t retadd=
r);
>      /**
>       * @do_unaligned_access: Callback for unaligned access handling
> +     * The callback must exit via raising an exception.
>       */
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                  MMUAccessType access_type,
> -                                int mmu_idx, uintptr_t retaddr);
> +                                int mmu_idx, uintptr_t retaddr) QEMU_NOR=
ETURN;
>=20=20
>      /**
>       * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by=
 ARM
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 82df108967..6eb3fcc63e 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -283,8 +283,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, v=
addr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type,
> -                                   int mmu_idx, uintptr_t retaddr);
> +                                   MMUAccessType access_type, int mmu_id=
x,
> +                                   uintptr_t retaddr) QEMU_NORETURN;

These trailing QEMU_NORETURN's seem to be fairly uncommon in the
existing code. Indeed I'd glanced at this code and was about to suggest
one was added. IMHO is scans better when your reading the return type
for a function and you can always do:

  void QEMU_NORETURN
  foo_function(bar args);

if you are worried about over indentation. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

