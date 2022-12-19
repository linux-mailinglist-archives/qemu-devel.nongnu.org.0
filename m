Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC7650EF7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IJ3-0007b4-TJ; Mon, 19 Dec 2022 10:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7IIz-0007ah-Gt
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:43:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7IIo-0007VX-QT
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:43:52 -0500
Received: by mail-wm1-x333.google.com with SMTP id ja17so6701270wmb.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+ABBS9sFcTVrGiEWWNsIlvSWX5VN2B795O5JmtRyds=;
 b=W7tmQr5t5diFsT6/q8de/Zc39yU2CMxEZ/WXvjNZTfo2xUeJAlwpmfVB4KIJ2wBs3e
 N7puLDg13p7wdCpzJfUwHPKhFjetcv0h/W/tn6bSQTWqfDMFOjlPxC18tqzf3yVpGFs3
 eMGU+A7n2oBmNBPMJIWgp9HJFZEVLyfacT/vYgddQEobmGlBv/8rTe2Q4jIzuXy8Ynyy
 4kZvcNJDG8OUObTMlvZ/nkuVtjHzJnlK64UH8FWg037HhBPkCm0aoAk2MNHT44pq9WWg
 Pn9kBMc+ak48Uw8iAxGPOJUG7Cneeo8k4p0jBHe3uNuCrZb66FsE0qko/axI5GnN7qaz
 Q3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T+ABBS9sFcTVrGiEWWNsIlvSWX5VN2B795O5JmtRyds=;
 b=N9v8ifXMcK8aJ3PpmcA8F077UlsXKjUVYOcaDJfxmyHSe/GwT3J1aqRuNDN/p6xEQn
 FTLs9Ms9t/T3elSXbIxrZblp7zY6AIBn7PQ/jyLSO7R2CqjIcLFuqEzcZDbJGSiltYgw
 urFliIC6i92+bs9GYaLTZXs+ziZyxrKdov0a/RxEfY61nNcue6CX2B8R/8uKBn2eaMQ4
 Nt3hAi5EKN5ON2KUiTJBQF+JZxKcgCFoDBV81ObtSJ2rzxo2/G38GDGiIHV/gR21Wgio
 eYxG4LHnA8T2q7golqxxv8CN+0D2q9ZQJTaSaYbgJ7dtAaRF4a0Q/rOjRoZU+V5kcFP0
 wMEg==
X-Gm-Message-State: ANoB5plv3zzzFdb2CpLauCBXsw6n1wYReiT2zVRjJ9cU4R+SVpt/Qj/Y
 X0AKMRGnLenFDz7QVSe/PjrceA==
X-Google-Smtp-Source: AA0mqf73msoFLKcuekZR3+gZzJ8nF+P6ZKxo8y+y1fKYDTk903ugamazjUa2Cv6OPA+6SZNN3PB/3Q==
X-Received: by 2002:a1c:ed04:0:b0:3cf:7514:a82e with SMTP id
 l4-20020a1ced04000000b003cf7514a82emr32594886wmh.23.1671464620974; 
 Mon, 19 Dec 2022 07:43:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm26175759wmq.27.2022.12.19.07.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 07:43:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A31E1FFB7;
 Mon, 19 Dec 2022 15:43:40 +0000 (GMT)
References: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: TaiseiIto <taisei1212@outlook.jp>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack
 in 'g' packets.
Date: Mon, 19 Dec 2022 15:40:04 +0000
In-reply-to: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Message-ID: <87359bl7pv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
> index c3a2cf6f28..6109ad166d 100644
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

Shouldn't this have Richard's reviewed by tag? It's also useful if you
add a revision number to the subject (e.g. git send-email -v2) as well
as noting the differences under a --- marker so reviewers can see what
changed.

  https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html#when-=
resending-patches-add-a-version-tag

Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

