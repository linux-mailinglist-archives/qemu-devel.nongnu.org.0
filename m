Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA565AABF
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 17:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC1Wx-0004pX-Tl; Sun, 01 Jan 2023 11:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pC1Wu-0004p9-Ag
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 11:49:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pC1Ws-0005sy-Iz
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 11:49:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so16436701wmb.2
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 08:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4wAMamzw1T7dXA7nl9TBvbxKRDZH4oD3RLK+AmMPw0=;
 b=z46kUZcFe4U8rLT1n4bdvAyBeawLs5lX+DmYK2wJLlbgK73YE31mMsOJB9XghGvHgN
 o3nzG0WU1nxWpf+PatYBIgdARjb6sPtNQe6GRwbWXyInFuWKiEWfREMlIHksDVqovSiB
 LYSFRL7sgFh4QAP2nOMUekvZ3oImMoFqPqHIoeQjGA7s+2nWYILAYtP+wG9OOPpyaw2w
 5DO4LRpcv98AI4KrYJiVhxBYtWvjBN80wxqqnywdMrri8eE3OhqrZaOstiyhXoWEGPP2
 gmn5fPaHmE3xPha9sPHveHWs0zP3PC8PX69J1PFDUx7eBQX3lxb+fyZkYnvldxm2yhzm
 BKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V4wAMamzw1T7dXA7nl9TBvbxKRDZH4oD3RLK+AmMPw0=;
 b=SAcrXHc2VAsP4DP0PMOHsjxQj/irhDKobZ9XjJgPLuD701yLhB13yhLI/lfP1KUfbk
 mpI4Y9LuNytHNOj8af2A3WBPpJGNSfWWyL4Atiu8ik3WasQfICQUjI0Sr3C5/royUjmG
 vBSj9OsAGimYnMCJ2SC8xtxSOxHfbzKf1HP2+JYD8ewJR0uUmYw04qm0oeH4g1/IOdvq
 aNUyu5urN5l1DWs905dDSx4HcDQtzgGrbif3TtMBA6uzFi+twQKzs9/qtP8iJ/7y4Wg8
 zEGb4VPN4/8JzHV2uXzOaS65GtgM21W6lwUMYnFB685A7LR8bGw2sKZmpoP1Q5Le9nEk
 pE7A==
X-Gm-Message-State: AFqh2ko28WHLLttOntu+VSAno7Crb5rBs9eIn2mXA4Q2ulkniAzeGocD
 p1toiv11JZmqgN5W1MMXiWitsQ==
X-Google-Smtp-Source: AMrXdXs3VPbH9+mfSHRpIeXJDgy+OOd4mjXMNRz9KXOBSx9W9+dYNOlIal3WXKXejKEi56H98Kn9nQ==
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id
 p17-20020a05600c419100b003d1fccace24mr26429393wmh.32.1672591784231; 
 Sun, 01 Jan 2023 08:49:44 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003d358beab9dsm39298907wms.47.2023.01.01.08.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 08:49:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6EEB81FFB7;
 Sun,  1 Jan 2023 16:49:43 +0000 (GMT)
References: <75da8346.1fd34.1856e0d08ef.Coremail.fanwj@mail.ustc.edu.cn>
User-agent: mu4e 1.9.10; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: fanwj@mail.ustc.edu.cn
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: fix bug about incorrect base addresss of
 idt and  gdt on i386 and x86_64
Date: Sun, 01 Jan 2023 16:46:50 +0000
In-reply-to: <75da8346.1fd34.1856e0d08ef.Coremail.fanwj@mail.ustc.edu.cn>
Message-ID: <87v8lqqjx4.fsf@linaro.org>
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


fanwj@mail.ustc.edu.cn writes:

> From 4601a624f40b2c89e7df2dec1adffb4f4308ba2d Mon Sep 17 00:00:00 2001
> From: fanwenjie <fanwj@mail.ustc.edu.cn>
> Date: Sun, 1 Jan 2023 23:13:34 +0800
> Subject: [PATCH] linux-user: fix bug about incorrect base addresss of idt=
 and
>  gdt on i386 and x86_64
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1405
> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
> ---
>  linux-user/main.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index a17fed045b..5d673c95b3 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -171,6 +171,12 @@ void fork_end(int child)
>=20=20
>  __thread CPUState *thread_cpu;
>=20=20
> +#if defined(TARGET_I386) || defined(TARGET_X86_64)
> +#include <stdalign.h>
> +__thread alignas(TARGET_PAGE_SIZE) static uint64_t gdt_base[TARGET_GDT_E=
NTRIES];
> +__thread alignas(TARGET_PAGE_SIZE) static uint64_t idt_base[TARGET_PAGE_=
SIZE / sizeof(uint64_t)];
> +#endif
> +
>  bool qemu_cpu_is_self(CPUState *cpu)
>  {
>      return thread_cpu =3D=3D cpu;
> @@ -235,6 +241,13 @@ CPUArchState *cpu_copy(CPUArchState *env)
>      new_cpu->tcg_cflags =3D cpu->tcg_cflags;
>      memcpy(new_env, env, sizeof(CPUArchState));
>=20=20
> +#if defined(TARGET_I386) || defined(TARGET_X86_64)
> +    memcpy(idt_base, (void*)new_env->idt.base, sizeof(uint64_t) * (new_e=
nv->idt.limit + 1));
> +    memcpy(gdt_base, (void*)new_env->gdt.base, sizeof(uint64_t) * TARGET=
_GDT_ENTRIES);
> +    new_env->idt.base =3D (target_ulong)idt_base;
> +    new_env->gdt.base =3D (target_ulong)gdt_base;
> +#endif
> +

This is the wrong place to copy target specific bits of code. I think
this belongs with cpu_clone_regs_child and the gdt/idt structures in
linux-user/i386/cpu_loop.c I think.

>      /* Clone all break/watchpoints.
>         Note: Once we support ptrace with hw-debug register access, make =
sure
>         BP_CPU break/watchpoints are handled correctly on clone. */


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

