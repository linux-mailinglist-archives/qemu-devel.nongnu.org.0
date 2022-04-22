Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A250BC26
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:53:24 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvb1-0006Qe-HV
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvZ1-0005E2-On
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:51:19 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvZ0-0007F3-0Y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:51:19 -0400
Received: by mail-ej1-x632.google.com with SMTP id s18so17301742ejr.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ipe1Qf6g4vQZ4rkQXe+vE2E2RqbaLUwzP+SlqtSGskE=;
 b=n37YB8jiVsqVG6E/+bFgaN3yZ7VTD8nWtoAKXEgQh2B4U3xPTBhiiAcmilcuEcRZE7
 DTpKGimr8zQfPMzCgyjTeECU1jvNsCWQi3R6wJcTFBOIcHIUaIknEfdiP5BUwaek62Im
 qL4QdYxNVpMrjMq2LL+9KFpgOh8uPE42q2wFqmp5DXbztfgIDpmuT1Tpq8mJGnU4z4JB
 wZJNzC4vLyEKKvA8KlQBKxPkOlEW/T6g5TVrpU8lPyvI0ZzThWHy2N5rr+X3lEpxZ4b3
 rZJwkNv7HgTxmZIX8igNIJ7AgpkJ9qhjYzifnbYGms3+sglp1htrAn6Ud6gJe1MeVl26
 3Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ipe1Qf6g4vQZ4rkQXe+vE2E2RqbaLUwzP+SlqtSGskE=;
 b=QsYzOPyZJy5z9FI0e7EHlnAqs2GbT+B6TWDK5UaEnyG9S8iCUXevMArRek2f02gLNV
 OxiiX0hrVSWOIdumd82OGoQCjL7DPVdLTRVmeXOnaw89LjtM2pQGjBFK3YkSG5gfUp9c
 ZAIympc4T7//mudfgpAQ48lc/+OCPpTT1L5TqUu7YWPCHT9dgkR6eQbz2UZ4N2Su+r4I
 V88RSgqUdCwlfDL9UY3SnLk03s6JjiAyP7XXXZf0dsAdnn9DJcyYs2abrxEFjCC+UY+S
 +5lfcCOq19RYZ6QNpKWf080hByXRTL497rxWMBGCmDCvcNCLn/5oNXyLUS7g21VZFafW
 PDkA==
X-Gm-Message-State: AOAM531/qFGSmUew9B4yTSsjRDRJ0jNoSmhpQielnXNtXppxtnrrbZ10
 Yh8Y4KG42cQzzGNnA4sLSgx8bw==
X-Google-Smtp-Source: ABdhPJzEVkTkHWLtVZaA4b7XE0e8Pifrl3f49t8E4F1KY3wOCqAmbDag0RLblGsvRIvp73rMgAJ3Rw==
X-Received: by 2002:a17:907:7293:b0:6f3:6c2b:c518 with SMTP id
 dt19-20020a170907729300b006f36c2bc518mr238880ejc.297.1650642676318; 
 Fri, 22 Apr 2022 08:51:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05640200cc00b00421058b175esm1029351edu.53.2022.04.22.08.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:51:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A008C1FFB7;
 Fri, 22 Apr 2022 16:51:14 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-31-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 30/60] target/arm: Name CPState type
Date: Fri, 22 Apr 2022 16:51:08 +0100
In-reply-to: <20220417174426.711829-31-richard.henderson@linaro.org>
Message-ID: <87bkwtt8ul.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Give this enum a name and use in ARMCPRegInfo,
> add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpregs.h | 6 +++---
>  target/arm/helper.c | 6 ++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
> index 2c991ab5df..fe338730ab 100644
> --- a/target/arm/cpregs.h
> +++ b/target/arm/cpregs.h
> @@ -116,11 +116,11 @@ enum {
>   * Note that we rely on the values of these enums as we iterate through
>   * the various states in some places.
>   */
> -enum {
> +typedef enum {
>      ARM_CP_STATE_AA32 =3D 0,
>      ARM_CP_STATE_AA64 =3D 1,
>      ARM_CP_STATE_BOTH =3D 2,
> -};
> +} CPState;
>=20=20
>  /*
>   * ARM CP register secure state flags.  These flags identify security st=
ate
> @@ -262,7 +262,7 @@ struct ARMCPRegInfo {
>      uint8_t opc1;
>      uint8_t opc2;
>      /* Execution state in which this register is visible: ARM_CP_STATE_*=
 */
> -    int state;
> +    CPState state;
>      /* Register type: ARM_CP_* bits/values */
>      int type;
>      /* Access rights: PL*_[RW] */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 33ba77890b..8b89039667 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8503,7 +8503,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Er=
ror **errp)
>  }
>=20=20
>  static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
> -                                   void *opaque, int state, int secstate,
> +                                   void *opaque, CPState state, int secs=
tate,
>                                     int crm, int opc1, int opc2,
>                                     const char *name)
>  {
> @@ -8663,13 +8663,15 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cp=
u,
>       * bits; the ARM_CP_64BIT* flag applies only to the AArch32 view of
>       * the register, if any.
>       */
> -    int crm, opc1, opc2, state;
> +    int crm, opc1, opc2;
>      int crmmin =3D (r->crm =3D=3D CP_ANY) ? 0 : r->crm;
>      int crmmax =3D (r->crm =3D=3D CP_ANY) ? 15 : r->crm;
>      int opc1min =3D (r->opc1 =3D=3D CP_ANY) ? 0 : r->opc1;
>      int opc1max =3D (r->opc1 =3D=3D CP_ANY) ? 7 : r->opc1;
>      int opc2min =3D (r->opc2 =3D=3D CP_ANY) ? 0 : r->opc2;
>      int opc2max =3D (r->opc2 =3D=3D CP_ANY) ? 7 : r->opc2;
> +    CPState state;
> +
>      /* 64 bit registers have only CRm and Opc1 fields */
>      assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
>      /* op0 only exists in the AArch64 encodings */


--=20
Alex Benn=C3=A9e

