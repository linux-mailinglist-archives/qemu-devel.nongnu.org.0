Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D5372931
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:51:15 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldse2-00041h-BW
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ldscI-0002iz-DG; Tue, 04 May 2021 06:49:26 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ldscF-0004Ec-OV; Tue, 04 May 2021 06:49:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id k19so4050764pfu.5;
 Tue, 04 May 2021 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gToYGNxSi1n24OAhTY1wzpyEPjXuBwRQe8DnpN+si1E=;
 b=pKnpPcFX/a1oZjT59s/btWYnVTkXmm7ZkZPL4XtRAkeh60lebq1ZmxPnM+NZXqfZlY
 8q8BMOrh7NJw6VoiOl6efUBdjaNBuakXGOyhDwm9RaMOFq6my2KUBPifgVRNpr4PgShh
 y+KbQvQ08Bk6U7vTJcD3IRNx3GSPvNscuJei9mWbXw3HtJkUsiDFv2Xn94cmmPy8Lknk
 kAbKPHI6QcEzDeCbd6vzcgkFV7G8fuwR9M0bUnSrdYk/punKfmVN5zMFy6ejhFT9owVx
 cJT6FpS88cho6Pgxh7gbLAT9N2qqxcr5eH3hDeEeLtF5Z0iB3b8HUF4s7D3tCGMUZkJX
 LajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gToYGNxSi1n24OAhTY1wzpyEPjXuBwRQe8DnpN+si1E=;
 b=noef9SnIWAO/yOj5OTHa94AIcn/HOLKYgloovATFzv02x+OMHk398s0plIvlO3lJWS
 2FHUIJmGrdRjw0yIDCEdr2GBcfphHAsu+LA0D16KAJKWtnwi7oaTbVETarIAJbx/pBzY
 Nu1ODhVztDtmDCZisZT/Pw4XosxzL0dCbxDriqCKlhzB28ffkj03fIMkJKdf31mW1t5w
 OEvmCn43VhUlf6IknTqJ/pDEJkBf2IkW1ZzNMCiLJSg+eG497lGe4dROcu1zDRHKTK4h
 VUGE7SBISxJ2x69kJ8Ubpl1lw2UEJt8Mp1ie16VwRpEnSTRrtD5n5e+n8m6LEenzYFUy
 VpNA==
X-Gm-Message-State: AOAM530OMAozwUlvSOXbbmCZ0a+6Gy/CQR/zlVKB3Q6ygKZcScOIpOU0
 pN7L5CnCtwkygU60nx8HMLM=
X-Google-Smtp-Source: ABdhPJxvnBRLLsQC04xS9Ggwuy8oHm6tpFfZcCMRQzNcjjkxOwJ1tASwwvs0aRZs1iyt82a7YiobUA==
X-Received: by 2002:a63:7c42:: with SMTP id l2mr22541373pgn.98.1620125361819; 
 Tue, 04 May 2021 03:49:21 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id j12sm11625308pff.49.2021.05.04.03.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:49:21 -0700 (PDT)
Date: Tue, 04 May 2021 20:49:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Do not check for LPCR[HAIL] on power10_v1.0
 CPUs
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20210504095900.505668-1-clg@kaod.org>
In-Reply-To: <20210504095900.505668-1-clg@kaod.org>
MIME-Version: 1.0
Message-Id: <1620125242.e97yybasbv.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of May 4, 2021 7:59 pm:
> The LPCR[HAIL] bit only applies to POWER10 DD2 CPUs. On POWER10 DD1,
> the ail value should be extracted using the LPCR_AIL mask like on P9.
>=20
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks for this, my oversight for not realising the P10 CPU is DD1=20
(which doesn't have HAIL).

I wonder if it could just use the POWER9 excp_model?

> ---
>  target/ppc/excp_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index c0605f84d70f..ba18444f5d1e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -198,6 +198,7 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu=
, int excp_model, int excp,
>                                        target_ulong *vector)
>  {
>  #if defined(TARGET_PPC64)
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      bool mmu_all_on =3D ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
>      bool hv_escalation =3D !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
> @@ -240,7 +241,7 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu=
, int excp_model, int excp,
>              return;
>          }
> =20
> -        if (*new_msr & MSR_HVB) {
> +        if (*new_msr & MSR_HVB && pcc->lpcr_mask & LPCR_HAIL) {
>              if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
>                  /* HV interrupts depend on LPCR[HAIL] */
>                  return;
> --=20
> 2.26.3
>=20
>=20

