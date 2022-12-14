Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA264CCF1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 16:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ScO-0007GP-Hu; Wed, 14 Dec 2022 09:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5ScK-0007EJ-Bf
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:20:17 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5ScH-0005sv-DU
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:20:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id h10so19456436wrx.3
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 06:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1P70EdD+qBRmVwgXdO5YigM5hOFFdXEeoos/dpjT0Q=;
 b=MJAeytxdObkVdms2wupotqC9KaYOWnzwIjqiL5ZVYJiUZ7xHp/a96oHh47hLZXgoHP
 YDzpSu23VwKKT/i8SNdsUrmrCg12qewG7NJnOPKLB6XaJJRTVD7mi0aV3un33mwVvjFN
 dpgTAsRtAg2UQksrTLObVgrmtbBcylEmFhGl2QvmiC0D8igPc8tWDVKxhOF88jqtzNFN
 wvNeiUyVlEiybgNt+mIxjaBqyjxD01dndki/pJfb8o+WyRJ9641dBlwx8vUHszUhQisW
 6Lb/UccO1v/qZZMn6ZRxZ9Y3FvnZCiYCaXh/yduu5Bj7ZxfZ0DqTtZgyAaLjgVQhXKaH
 U9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u1P70EdD+qBRmVwgXdO5YigM5hOFFdXEeoos/dpjT0Q=;
 b=qOu5j/JKkLOV2YokUJUAxqWQgHBzQKVD0SpJO2EPVLxcHIAI9VOCdlFOBN1n7FRPy4
 Fdn9aFhoyUHokCZg+rReby9r9DJbPVGbUMTbMq7tR3d1wJ7C+8qGGLVcYRulFQrfVU4Z
 WSNXL2C8O5jXaDEA9HotEqYXcD/aXQtD0mz1EgOkHrYZnrpyB11nLr1CwFvOQud6SQDh
 dh6zLidu4mn5iv/J1OcHsL6FEOD7vRdVdEnRF4zfXlMEAsHKVlrW3N2VnyfSFJceQzlH
 fsEmr0pC+efMIeRkfTD+COnRWg1JTkGI5hDu9k6D397vlNGCmWDw5XeTlcjQSl04anYV
 2h+Q==
X-Gm-Message-State: ANoB5pk5A/38ujr1uacoiF3Fh29a6507qFAqNlT51K2CHzWGsuUWHciX
 kwozIhIFG9QeLNjFPkePcdIzxw==
X-Google-Smtp-Source: AA0mqf55diIFDr3LDTdokwnLeeU3Z/OEdqKNnnolAVjaTrRRhIrqqyq3QoUrlb5NPKAiW2b0x8yliw==
X-Received: by 2002:a05:6000:910:b0:236:61bb:c79b with SMTP id
 bz16-20020a056000091000b0023661bbc79bmr17549749wrb.3.1671027611562; 
 Wed, 14 Dec 2022 06:20:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6290000000b00241cbb7f15csm2910958wru.106.2022.12.14.06.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:20:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F6431FFB7;
 Wed, 14 Dec 2022 14:20:10 +0000 (GMT)
References: <20221123121712.72817-1-mads@ynddal.dk>
 <af92080f-e708-f593-7ff5-81b7b264d587@linaro.org>
 <C8BC6E24-F98D-428D-80F8-98BDA40C7B15@ynddal.dk>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, "open list:Overall KVM CPUs"
 <kvm@vger.kernel.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
Date: Wed, 14 Dec 2022 14:16:47 +0000
In-reply-to: <C8BC6E24-F98D-428D-80F8-98BDA40C7B15@ynddal.dk>
Message-ID: <87h6xyjcdh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

>> Isn't this '0' flag here accelerator-specific? ...
>
>> ... if so the prototype should be:
>>=20
>>       int (*update_guest_debug)(CPUState *cpu);
>>=20
>> and the '0' value set within kvm-accel-ops.c handler implementation.
>>=20
>
> You're right, we can avoid the additional variable. We'll then have to wr=
ap
> `kvm_update_guest_debug`. Would the following be ok?
>
> diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
> index 6ebf9a644f..5e0fb42408 100644
> --- a/accel/kvm/kvm-accel-ops.c
> +++ b/accel/kvm/kvm-accel-ops.c
> @@ -86,6 +86,10 @@ static bool kvm_cpus_are_resettable(void)
>      return !kvm_enabled() || kvm_cpu_check_are_resettable();
>  }
>=20=20
> +static int kvm_update_guest_debug_ops(CPUState *cpu) {
> +    return kvm_update_guest_debug(cpu, 0);
> +}
> +
>  static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
>  {
>      AccelOpsClass *ops =3D ACCEL_OPS_CLASS(oc);
> @@ -99,7 +103,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, =
void *data)
>      ops->synchronize_pre_loadvm =3D kvm_cpu_synchronize_pre_loadvm;
>=20=20
>  #ifdef KVM_CAP_SET_GUEST_DEBUG
> -    ops->update_guest_debug =3D kvm_update_guest_debug;
> +    ops->update_guest_debug =3D kvm_update_guest_debug_ops;
>      ops->supports_guest_debug =3D kvm_supports_guest_debug;
>      ops->insert_breakpoint =3D kvm_insert_breakpoint;
>      ops->remove_breakpoint =3D kvm_remove_breakpoint;
> diff --git a/cpu.c b/cpu.c
> index ef433a79e3..b2ade96caa 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -383,7 +383,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
>          cpu->singlestep_enabled =3D enabled;
>=20=20
>          if (ops->update_guest_debug) {
> -            ops->update_guest_debug(cpu, 0);
> +            ops->update_guest_debug(cpu);
>          }
>=20=20
>          trace_breakpoint_singlestep(cpu->cpu_index, enabled);
> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
> index 0a47a2f00c..cd6a4ef7a5 100644
> --- a/include/sysemu/accel-ops.h
> +++ b/include/sysemu/accel-ops.h
> @@ -48,7 +48,7 @@ struct AccelOpsClass {
>=20=20
>      /* gdbstub hooks */
>      bool (*supports_guest_debug)(void);
> -    int (*update_guest_debug)(CPUState *cpu, unsigned long flags);
> +    int (*update_guest_debug)(CPUState *cpu);
>      int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
>      int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
>      void (*remove_all_breakpoints)(CPUState *cpu);
>
>
> If you have a better name for `kvm_update_guest_debug_ops`, I'm open for
> suggestions.

It will do. You could just call it update_guest_debug as it is an
internal static function although I guess that makes grepping a bit of a
pain.

> On a side note. When compiling for an arch that isn't the same as the sys=
tem
> (i.e. aarch64 on x86_64), I'm getting a linker-error for cpu.c that
> `cpus_get_accel` isn't defined. Do I need to move `cpus_get_accel` or som=
ehow
> #ifdef its use?

Is something being accidentally linked with linux-user and softmmu?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

