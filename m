Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC33DB739
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 12:38:50 +0200 (CEST)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Puk-0008PS-0R
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 06:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m9PtA-0006P2-M2
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:37:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m9Pt9-0003kS-79
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:37:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so8854560wmg.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=epmtCCoo/rcGjD2WiR9ULFKxd65qQWoNE4dLqPCT7VI=;
 b=YcCrQwQx5H0cnfKRBn4d9kX+lTLwxLeu7DVb2xcQj6FpmchhMHmMFT9yokOwMLya9M
 A806ReCSMkHvl+osFrpC/n4MyVjlX/6tKyvHWsqqYc82fGmo0jnkhpBoQEPHer3iUdBf
 0Ita9YgoPsOvBJ4ZhZ3QIegtrUJf0DbRYD+NY/wA2x5auMfbT6Zv/cpyGxQyvs5qtwy6
 MOsizA85OExPbYFYPDqAIKjxXWLrqpwp10miv7Nu0xtyE/3LRVEFVyA/GpzIY68PNbNs
 oByoXnQRyZ2e7tj4EMgTBxuYgo0UDDKCzIYeNtMPC0owBg+fIRyTEqGthWs2tnP7OH9B
 s2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=epmtCCoo/rcGjD2WiR9ULFKxd65qQWoNE4dLqPCT7VI=;
 b=V3YcD1cBFP3TjIsm43I4EH7r1pJv2ZGUT+FsENqIxCYOWTeFhCx2U4O2hWoeBNRGoO
 hGwTVLvvY7yMnooay1UXGQw2bybLOirYLBIRKCr77DV57Sydlje/49f/qMVTR0Ttc2X1
 +0Y1qmuwY73B0HoOAcoHI2M/fSRWZj6wgfTzLuzFuN0Qyon2HpVkaMv928hBBxUJdsJm
 5iMFvMpv5oi21KQlwiIve4vA/kDU9XbuEaJ/PZf+WCJvTg9ZPKHLsJWL0gRQLc8vMsCp
 pcXGsQuyszt8NdXFqvoMTY3dZyQvAmngxo106ez6Gxpn45wW392HJtPpqkcu+8aQhiT4
 wogQ==
X-Gm-Message-State: AOAM5335do+H3/Nrdg/b60vkpbzv+cDK0zOmO5E9wyqj5hj8CXNsu+TA
 NZXFjL0VTBd5cZdKns+J7B9I1g==
X-Google-Smtp-Source: ABdhPJzDUJXD+vAo/5YPdljepXlJpayAd3nWKGCWXoHRwemMepdNTA6GwuvpOR8GwOZSp/v3z5Ii0w==
X-Received: by 2002:a05:600c:35d6:: with SMTP id
 r22mr2266143wmq.41.1627641428006; 
 Fri, 30 Jul 2021 03:37:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 140sm1256633wmb.43.2021.07.30.03.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:37:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A00C81FF96;
 Fri, 30 Jul 2021 11:37:05 +0100 (BST)
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
User-agent: mu4e 1.6.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Date: Fri, 30 Jul 2021 11:36:15 +0100
In-reply-to: <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
Message-ID: <87r1fggka6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shuuichirou Ishii <ishii.shuuichir@fujitsu.com> writes:

> The ARM_FEATURE_A64FX property was added,
> but there is no function that uses this property yet,
> so it will be removed until a function that uses it is added.
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu.h   | 1 -
>  target/arm/cpu64.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1b0c7b91ec..9f0a5f84d5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2145,7 +2145,6 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> -    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor HPC extensions
> support */

This is confusing because I can't see this feature flag in the mainline
branch. Have you inadvertently based this series from an internal branch?=20

>  };
>=20=20
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index a15f9c0c55..dd72300e88 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -856,7 +856,6 @@ static void aarch64_a64fx_initfn(Object *obj)
>      ARMCPU *cpu =3D ARM_CPU(obj);
>=20=20
>      cpu->dtb_compatible =3D "arm,a64fx";
> -    set_feature(&cpu->env, ARM_FEATURE_A64FX);
>      set_feature(&cpu->env, ARM_FEATURE_V8);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);


--=20
Alex Benn=C3=A9e

