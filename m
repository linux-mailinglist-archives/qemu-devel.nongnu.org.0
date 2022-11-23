Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFE636118
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqNs-0006VD-SZ; Wed, 23 Nov 2022 09:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxqNm-0006U4-Pn
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:05:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxqNk-0001Ya-TJ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:05:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1370729wmo.1
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 06:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4XFjg7hPI4EDh3tUnDKgxdWTR6Yu1qfDF/Gc8jiLyo=;
 b=G7Z1Yij7wVZ5qlkecg1K8SbU2jXjeQvUzcZ2wsgHCW4Rkr+2UD4o0E00nXYxbSNWlE
 mrGIo44YAP4RnncAbMBi4HWh1fmz0OpWtwADWNRKfd/iGfu8cXmdHK/DxewDj/rPet2L
 FIouBrAGTRaDS0Vv5KDTrakTWlsnCu/lw0RAYznEcwGAf/n10EAlk+yXcvS73LIe+e1G
 Gk4SUKgFUcL2624hMAxoSKfxKcFjz9pTuYYvLK93XxjC1OCqZyw5CJgSisZLpQ9IX4cA
 Qf828tkib8GS8KrNkko/24JxK3qg9aspek5qc2Ypb0yvD506UFOHAqnveeWTysEgwPBQ
 xGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/4XFjg7hPI4EDh3tUnDKgxdWTR6Yu1qfDF/Gc8jiLyo=;
 b=uuxtlrtD4yZ9PDwCQ6S7LLBBFT1B5Fa5vZaoxZwlJqWaOrBbR1iJyB1YHStiLm9O6n
 i6CsIX3U3f/Do5WsO/Byiia7GnMfgO5Y2QqL4RwKOtg5dMGnIK2bxDjrsTn0rkphB8uf
 rDXwHTxjTxOjQyOjZI3OuqDNqofIVOItCHqoiqlRYPNTnQqOnWNuxPHGGQlQzFZFe62P
 qrTGkWqziMuZd7uo3a8AO7ykGOo9ef75gljycEOwtd3qQL2xbDEEKKS4rmk9D62I/r8u
 3POHHf0UMEe4+9LCDdHByHLUZMGlfjqot+rzbkAnDAcR5OOMkbm2UtJ3sfVDZ+051KS6
 zmnw==
X-Gm-Message-State: ANoB5pmdUCqr+UpCi+ON8496SUVZHMhi4m4SJzeyf1uPo6YutzJUVanP
 cWTvzkWL0Kom7qKzw/Takfo4Iw==
X-Google-Smtp-Source: AA0mqf7T91Iwj0Ec7Cs5NgvZDG1d2wjOGaWK0lFpnIo2v9zNPh2gU6temCyBUDNbm8IhLnnldvLwcA==
X-Received: by 2002:a05:600c:4f54:b0:3d0:2d56:eb55 with SMTP id
 m20-20020a05600c4f5400b003d02d56eb55mr5386161wmq.176.1669212342452; 
 Wed, 23 Nov 2022 06:05:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b00236576c8eddsm16664253wru.12.2022.11.23.06.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 06:05:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9DE431FFB7;
 Wed, 23 Nov 2022 14:05:40 +0000 (GMT)
References: <20221123121712.72817-1-mads@ynddal.dk>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: kvm@vger.kernel.org, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
Date: Wed, 23 Nov 2022 14:05:00 +0000
In-reply-to: <20221123121712.72817-1-mads@ynddal.dk>
Message-ID: <87k03lbwaz.fsf@linaro.org>
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


Mads Ynddal <mads@ynddal.dk> writes:

> From: Mads Ynddal <m.ynddal@samsung.com>
>
> Continuing the refactor of a48e7d9e52 (gdbstub: move guest debug support
> check to ops) by removing hardcoded kvm_enabled() from generic cpu.c
> code, and replace it with a property of AccelOpsClass.
>
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>

Nice. Looks good to me but I'll have a proper look when I go through my
gdbstub/next queue. I don't think this is critical for 7.2.

> ---
>  accel/kvm/kvm-accel-ops.c  |  1 +
>  cpu.c                      | 10 +++++++---
>  include/sysemu/accel-ops.h |  1 +
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
> index fbf4fe3497..6ebf9a644f 100644
> --- a/accel/kvm/kvm-accel-ops.c
> +++ b/accel/kvm/kvm-accel-ops.c
> @@ -99,6 +99,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, v=
oid *data)
>      ops->synchronize_pre_loadvm =3D kvm_cpu_synchronize_pre_loadvm;
>=20=20
>  #ifdef KVM_CAP_SET_GUEST_DEBUG
> +    ops->update_guest_debug =3D kvm_update_guest_debug;
>      ops->supports_guest_debug =3D kvm_supports_guest_debug;
>      ops->insert_breakpoint =3D kvm_insert_breakpoint;
>      ops->remove_breakpoint =3D kvm_remove_breakpoint;
> diff --git a/cpu.c b/cpu.c
> index 2a09b05205..ef433a79e3 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -31,8 +31,8 @@
>  #include "hw/core/sysemu-cpu-ops.h"
>  #include "exec/address-spaces.h"
>  #endif
> +#include "sysemu/cpus.h"
>  #include "sysemu/tcg.h"
> -#include "sysemu/kvm.h"
>  #include "sysemu/replay.h"
>  #include "exec/cpu-common.h"
>  #include "exec/exec-all.h"
> @@ -378,10 +378,14 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int m=
ask)
>  void cpu_single_step(CPUState *cpu, int enabled)
>  {
>      if (cpu->singlestep_enabled !=3D enabled) {
> +        const AccelOpsClass *ops =3D cpus_get_accel();
> +
>          cpu->singlestep_enabled =3D enabled;
> -        if (kvm_enabled()) {
> -            kvm_update_guest_debug(cpu, 0);
> +
> +        if (ops->update_guest_debug) {
> +            ops->update_guest_debug(cpu, 0);
>          }
> +
>          trace_breakpoint_singlestep(cpu->cpu_index, enabled);
>      }
>  }
> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
> index 8cc7996def..0a47a2f00c 100644
> --- a/include/sysemu/accel-ops.h
> +++ b/include/sysemu/accel-ops.h
> @@ -48,6 +48,7 @@ struct AccelOpsClass {
>=20=20
>      /* gdbstub hooks */
>      bool (*supports_guest_debug)(void);
> +    int (*update_guest_debug)(CPUState *cpu, unsigned long flags);
>      int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
>      int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
>      void (*remove_all_breakpoints)(CPUState *cpu);


--=20
Alex Benn=C3=A9e

