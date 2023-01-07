Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF78660DB0
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 11:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE6FV-000466-VA; Sat, 07 Jan 2023 05:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pE6FU-00045g-8G
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 05:16:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pE6FS-0007Px-DI
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 05:16:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so4849338wml.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 02:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bcd3Xb8lpu7DGfJlgpR/Gazf7evgxjiMDSPgnboibAg=;
 b=I0asS2LB31p+7XLPyMpnG4YpNxHJfAgvolaS8H5NbnLCUowlpzKaSfBfZ9VorGEkdE
 XZyYb+YxN0CF3ULIjL9+Mnw4AF/SfcUnEtNAxJNUv5jZYhrV7Q2bvuKvIm6YAzNGnczD
 zD1gVfilWOTVCNgFl2NjDTD6LwVGFs2CVs7W6lLyxjhITDjvliZWjfw1lKD83sOrDWHX
 72MW4N0+Wwhq7OBlEKMZHJGsuBwOIimNIWnrbop5xVc1IpT641s2BfAEeU7eeU17aFRf
 390a7bSyOTLgNYGg+wqeWL84LrAkj5MVz2DszXZdyNRWGj0L45d8BTAfx2W/s16i5Wer
 lh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bcd3Xb8lpu7DGfJlgpR/Gazf7evgxjiMDSPgnboibAg=;
 b=TjWtIPglCRpcpL5JpGuyEIMI4MvxcuS7xKMcBmmw0GMvlgIUFh6Cm24BqVqpFZNQD7
 CZ03l12fQ2C7w2mzyGPg/8yNq/6bpo3evuFBQX4BvwNrwzz7SwmsnjmLnRCb4OQ7uSyV
 ZaTZ4h3osuviN1OcNubcXnjOZQEIp1UKFb/y5kW2bPjrHJARDl0zVJan5XWFvxFeDc4d
 LaAO4a5iAn8TZrBPH0ccIkXqM3ecAKpUNt5OMLLKQC1jtGZCY6SK+ypXNwZ+JRMc+E/m
 0BaDJW0HdESVcirmPIuPmNKsGS2R/Z4okgRQwF8GUhe1Jz0KVb5gvZC+Iw2QG+tGQ9r2
 QjPQ==
X-Gm-Message-State: AFqh2kotqiPuZ9GNT6Q9gL8gHis+OvINqJ25Sdz+ZU2d4ACBvL6h1eub
 j0LNOuEyeUAi0kPTNnUAY7WQPw==
X-Google-Smtp-Source: AMrXdXsbaH4RI5CGzsqUQvaVEAj8fYDw6uP22CFo0kS03V1YVskhmeBgI28dKJw5JLQ8pVWP+bOkWw==
X-Received: by 2002:a05:600c:4e53:b0:3c6:e60f:3f4a with SMTP id
 e19-20020a05600c4e5300b003c6e60f3f4amr40183537wmq.1.1673086580485; 
 Sat, 07 Jan 2023 02:16:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003cfd4e6400csm5087688wmo.19.2023.01.07.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 02:16:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A01E1FFB7;
 Sat,  7 Jan 2023 10:16:19 +0000 (GMT)
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: TaiseiIto <taisei1212@outlook.jp>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v2] [PING] target/i386/gdbstub: Fix a bug about order of
 FPU stack in 'g' packets.
Date: Sat, 07 Jan 2023 10:15:26 +0000
In-reply-to: <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Message-ID: <87zgau1wgc.fsf@linaro.org>
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


TaiseiIto <taisei1212@outlook.jp> writes:

> This is a ping to the patch below.
>
> https://patchew.org/QEMU/TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR01=
01MB4285.apcprd01.prod.exchangelabs.com/
>
> Before this commit, when GDB attached an OS working on QEMU, order of FPU
> stack registers printed by GDB command 'info float' was wrong. There was a
> bug causing the problem in 'g' packets sent by QEMU to GDB. The packets h=
ave
> values of registers of machine emulated by QEMU containing FPU stack
> registers. There are 2 ways to specify a x87 FPU stack register. The first
> is specifying by absolute indexed register names (R0, ..., R7). The second
> is specifying by stack top relative indexed register names (ST0, ..., ST7=
).
> Values of the FPU stack registers should be located in 'g' packet and be
> ordered by the relative index. But QEMU had located these registers order=
ed
> by the absolute index. After this commit, when QEMU reads registers to ma=
ke
> a 'g' packet, QEMU specifies FPU stack registers by the relative index.
> Then, the registers are ordered correctly in the packet. As a result, GDB,
> the packet receiver, can print FPU stack registers in the correct order.
>
> Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
> ---
>  target/i386/gdbstub.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index c3a2cf6f28..786971284a 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -121,7 +121,9 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *mem_buf, int n)
>              return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
>          }
>      } else if (n >=3D IDX_FP_REGS && n < IDX_FP_REGS + 8) {
> -        floatx80 *fp =3D (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
> +        int st_index =3D n - IDX_FP_REGS;
> +        int r_index =3D (st_index + env->fpstt) % 8;
> +        floatx80 *fp =3D &env->fpregs[r_index].d;
>          int len =3D gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
>          len +=3D gdb_get_reg16(mem_buf, cpu_to_le16(fp->high));
>          return len;

I'm sorry I though Paolo had already grabbed this, or is this a second
fix to the FP handling?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

