Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245092D3FEA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:34:31 +0100 (CET)
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwnm-00010f-Kn
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwm6-0000Ys-28
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:32:46 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwm2-0005Td-V4
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:32:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id g185so1102690wmf.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GlrmZWy5axuG5hkD4J5q/S/bRE1qRvPTUIfuEVtfV0E=;
 b=TZkb+cXFRUeQRBGkm5Clykvg3uzc9yoj4zqTzytpq5Vnh9XcNjuPkmejUProaG5xnI
 5C7xeX3+TJXx8zxhUoJ+eh/ShLF5h8qY+dLIsi1MQwp7mQUnD9jaB3n99bSVdlz5tOPb
 RP2xVRGOWWhpJJmjnl8Etl4I03ii8/6kN5/LgT549tcuMc5wSP7Eq/5RB4cKKHRR08E8
 onq7ZuxEfRMuYwMp8kV2qjZnQoWv8Hh0jdeoQDyTaQ1GbHwjggvwDwss6X8KFLGFZitK
 xKjTCQBvV8zCmoxSoXW47ZXF05HUZiRicewwedXrLcwkBd6OfRZkfz1WlzwmzVgbuzld
 vbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GlrmZWy5axuG5hkD4J5q/S/bRE1qRvPTUIfuEVtfV0E=;
 b=krT3ALhu6Y9NhuS09Ixs3E4n3C2KWN/GTv7SdpWXXEJ8HxZRnnkcpflZOILErdEjQB
 hcKqU9vxXvIWU8KxiJsX0LHarOIJfzG5aa6oFvwz8YaRdUoAJUF1LRmVaIaowKtmbDP8
 XnqpniXCm2+0oY06mGmTT1PkvlbgIfzd7L7GfCzHFr2AhTFNe5zYNikvEE0BNDUqWoJr
 JYWbLzdFSzYcniICb5X/R+xpqDVBLsSAlImi42rAv0vq/CVq9zriSdGW919Xw/9dYr6k
 tiCuvBouqssSaseMTmVwIQVjYfljYl7FHR0+OSES3H8EAH/ZGSQdzrZ5ULt/H53D13B4
 eJ2g==
X-Gm-Message-State: AOAM531FLxOVq9nU5hyDq5GJlPOhdb1ZHL27rb4NN/q5ZahPg09jBl3U
 1cX6UTydPNjidKFB8RfMmPpXfA==
X-Google-Smtp-Source: ABdhPJz97Te6tEpFHs4n97j8KGEAdlocv1QxBSEC2QRaGLGipw4sknO8pZ/qznY2Tztye8h58JIJpg==
X-Received: by 2002:a1c:5447:: with SMTP id p7mr2021279wmi.116.1607509961256; 
 Wed, 09 Dec 2020 02:32:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h204sm2497023wme.17.2020.12.09.02.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:32:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 618CB1FF7E;
 Wed,  9 Dec 2020 10:32:39 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-11-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 10/32] i386: move TCG cpu class initialization out of
 helper.c
Date: Wed, 09 Dec 2020 10:23:58 +0000
In-reply-to: <20201208194839.31305-11-cfontana@suse.de>
Message-ID: <87360ffewo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/cpu.c             |  33 ++++------
>  target/i386/cpu.h             |  97 ++---------------------------
>  target/i386/helper-tcg.h      | 112 ++++++++++++++++++++++++++++++++++
>  target/i386/helper.c          |  23 -------
>  target/i386/meson.build       |   1 +
>  target/i386/tcg-cpu.c         |  71 +++++++++++++++++++++
>  target/i386/tcg-cpu.h         |  15 +++++
>  target/i386/tcg/bpt_helper.c  |   1 +
>  target/i386/tcg/cc_helper.c   |   1 +
>  target/i386/tcg/excp_helper.c |   1 +
>  target/i386/tcg/fpu_helper.c  |  33 +++++-----
>  target/i386/tcg/int_helper.c  |   1 +
>  target/i386/tcg/mem_helper.c  |   1 +
>  target/i386/tcg/misc_helper.c |   1 +
>  target/i386/tcg/mpx_helper.c  |   1 +
>  target/i386/tcg/seg_helper.c  |   1 +
>  target/i386/tcg/smm_helper.c  |   2 +
>  target/i386/tcg/svm_helper.c  |   1 +
>  target/i386/tcg/translate.c   |   1 +
>  19 files changed, 244 insertions(+), 153 deletions(-)
>  create mode 100644 target/i386/helper-tcg.h
>  create mode 100644 target/i386/tcg-cpu.c
>  create mode 100644 target/i386/tcg-cpu.h
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b9bd249c8f..3462d0143f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -24,6 +24,8 @@
>  #include "qemu/qemu-print.h"
>=20=20
>  #include "cpu.h"
> +#include "tcg-cpu.h"
> +#include "helper-tcg.h"
>  #include "exec/exec-all.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
> @@ -1495,7 +1497,8 @@ static inline uint64_t x86_cpu_xsave_components(X86=
CPU *cpu)
>             cpu->env.features[FEAT_XSAVE_COMP_LO];
>  }
>=20=20
> -const char *get_register_name_32(unsigned int reg)
> +/* Return name of 32-bit register, from a R_* constant */
> +static const char *get_register_name_32(unsigned int reg)
>  {
>      if (reg >=3D CPU_NB_REGS32) {
>          return NULL;
> @@ -7012,13 +7015,6 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr val=
ue)
>      cpu->env.eip =3D value;
>  }
>=20=20
> -static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *=
tb)
> -{
> -    X86CPU *cpu =3D X86_CPU(cs);
> -
> -    cpu->env.eip =3D tb->pc - tb->cs_base;
> -}
> -
>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
> @@ -7252,17 +7248,18 @@ static void x86_cpu_common_class_init(ObjectClass=
 *oc, void *data)
>      cc->class_by_name =3D x86_cpu_class_by_name;
>      cc->parse_features =3D x86_cpu_parse_featurestr;
>      cc->has_work =3D x86_cpu_has_work;
> +
>  #ifdef CONFIG_TCG
> -    cc->do_interrupt =3D x86_cpu_do_interrupt;
> -    cc->cpu_exec_interrupt =3D x86_cpu_exec_interrupt;
> -#endif
> +    tcg_cpu_common_class_init(cc);

Are we likely to have clashing names here as other arches get converted?
tcg_x86_cpu_common_class_init or x86_cpu_common_class_init?

<snip>
> diff --git a/target/i386/tcg-cpu.c b/target/i386/tcg-cpu.c
> new file mode 100644
> index 0000000000..628dd29fe7
> --- /dev/null
> +++ b/target/i386/tcg-cpu.c
> @@ -0,0 +1,71 @@
<snip>
> +
> +void tcg_cpu_common_class_init(CPUClass *cc)
> +{
> +    cc->do_interrupt =3D x86_cpu_do_interrupt;
> +    cc->cpu_exec_interrupt =3D x86_cpu_exec_interrupt;
> +    cc->synchronize_from_tb =3D x86_cpu_synchronize_from_tb;
> +    cc->cpu_exec_enter =3D x86_cpu_exec_enter;
> +    cc->cpu_exec_exit =3D x86_cpu_exec_exit;
> +    cc->tcg_initialize =3D tcg_x86_init;
> +    cc->tlb_fill =3D x86_cpu_tlb_fill;
> +#ifndef CONFIG_USER_ONLY
> +    cc->debug_excp_handler =3D breakpoint_handler;
> +#endif
> +}

Oh I see this moves down to target/i386/tcg/ eventually. Maybe we should
just create the new file in place so it's easier to follow the changes
as we convert to a proper abstracted class?

--=20
Alex Benn=C3=A9e

