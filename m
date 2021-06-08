Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDCF39F5DD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:59:15 +0200 (CEST)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaO2-0003OJ-4t
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaM9-00011a-Pu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:57:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaM6-0002so-N9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:57:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so1659396wmq.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vuhgo5BLEb0juLtVS9ee7HJfB5tdDGRe9WWy4ShGUiI=;
 b=iHhywyPMaNJHf7et00s0AUESqtR07GprKMCsIJsvbc4VRwgyZ4yS/3Ns46D6G4z4j0
 dQ2eQAw55U+Ej3/DUOI7O0i9S3JSIfZCelCRnh99VNHVpH7BuUkt+sYWz4nM1Prt/JD/
 oTMrX/+pdikmr+7VF/sJeyxP9klwWKpWBp04FuYBaE8wpmYaCcSrU/pBBl+MeM0yAvmq
 AUnYByA6WPvE0khxnedM6bC7vqfCLrROGM+ZQXMo6sANJ3YEuSIHBn2K/oi6T3XJYGrD
 DR/7hr2bHmTw35ExBxGt9cKkZ60/TpJKwFE/zrsANNPfaENnHaSdDzjolUWKYZZo8NAB
 dASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vuhgo5BLEb0juLtVS9ee7HJfB5tdDGRe9WWy4ShGUiI=;
 b=f0UqS7FDd4ikPrpbq/6MOQQHCaqGwP04VNCkC4RY83wxq1ejIQlS01B22bV4kHNBrh
 zLuo1DD5tX8D2+SNBhXguUlWqBwBafy7SPGreGC4B0FomMDfswI2C/2BlxLNVeB6DVlR
 MQBKNZ3Tn2vjQyelLzF+Yy2AeNsrYlzzt8EWEOH0dSZLWeU0U7+Avsr1CAoszN+l2YG/
 tgz/SYTBvGu99mLlrX43hs3LvUhcG4fMhiKyNW/kpM1F71mvMkTIEiWP/x5wi7fbcBgO
 tDE8HrOnTuy2wYZsTF4OBdZ8oSGIBH/VHkcC42bHrJa+mdpWmNVstOv50vVyTinmu69S
 JIEg==
X-Gm-Message-State: AOAM530kKSMh7mBbNfV153itdS/R4jvXjt+m+OwC8i+VzzTg2R0c5Xbg
 uiWVssFKdfadXyvQB7hAh39fCg==
X-Google-Smtp-Source: ABdhPJzyeSY01P5dHBFjIMyreCHDf1y6OugmKRMqjqPT52IxYM6EM/7TYX7h8dSxY1Ws+/EjT20XAg==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr3857016wmi.65.1623153432658; 
 Tue, 08 Jun 2021 04:57:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm22292002wrg.75.2021.06.08.04.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:57:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E86031FF7E;
 Tue,  8 Jun 2021 12:57:10 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 12/28] accel/tcg: Merge tcg_exec_init into
 tcg_init_machine
Date: Tue, 08 Jun 2021 12:55:10 +0100
In-reply-to: <20210502231844.1977630-13-richard.henderson@linaro.org>
Message-ID: <87r1hclgbt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> There is only one caller, and shortly we will need access
> to the MachineState, which tcg_init_machine already has.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h      |  2 ++
>  include/sysemu/tcg.h      |  2 --
>  accel/tcg/tcg-all.c       | 14 +++++++++++++-
>  accel/tcg/translate-all.c | 21 ++-------------------
>  4 files changed, 17 insertions(+), 22 deletions(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index e9c145e0fb..881bc1ede0 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -16,5 +16,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu, target_ulo=
ng pc,
>                                int cflags);
>=20=20
>  void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
> +void page_init(void);
> +void tb_htable_init(void);
>=20=20
>  #endif /* ACCEL_TCG_INTERNAL_H */
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a..53352450ff 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -8,8 +8,6 @@
>  #ifndef SYSEMU_TCG_H
>  #define SYSEMU_TCG_H
>=20=20
> -void tcg_exec_init(unsigned long tb_size, int splitwx);
> -
>  #ifdef CONFIG_TCG
>  extern bool tcg_allowed;
>  #define tcg_enabled() (tcg_allowed)
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index 30d81ff7f5..0e83acbfe5 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -32,6 +32,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/accel.h"
>  #include "qapi/qapi-builtin-visit.h"
> +#include "internal.h"
>=20=20
>  struct TCGState {
>      AccelState parent_obj;
> @@ -109,8 +110,19 @@ static int tcg_init_machine(MachineState *ms)
>  {
>      TCGState *s =3D TCG_STATE(current_accel());
>=20=20
> -    tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
> +    tcg_allowed =3D true;
>      mttcg_enabled =3D s->mttcg_enabled;
> +
> +    page_init();
> +    tb_htable_init();
> +    tcg_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
> +

nit: you could clean up to use unit.h definitions, i.e. tb->size * MiB

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

