Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF967694178
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVJ8-0001T6-Mt; Mon, 13 Feb 2023 04:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRVJ1-0001SX-9m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:39:27 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRVIw-0001Wn-Tz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:39:27 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so11444611wrd.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 01:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cX3Zk7Jc4/AaxmCmjuLRp7mTBEkKcjrjYVeuv5jBFEs=;
 b=BYN2WYdG6qJpCmUxS3ypwUGy/PdXxVJihTq4eIfSRYatxp0t5/oWWWkJ47F/Tx+88R
 5nVx2ikHhzW7763OMIF5FclDJAx4BnNpWinCb/5kVPEwDd/LSKPKKoBjlMsQlG1LlOZu
 7kk66eJ8Kqo+I/II2rywZbP4Z2OUtSdxPVML3+/goT4HDxWqCOVUtjLQngF7Hty48AKF
 ihzfyH6GedaJvEjWl41Cb+JzKLvUl4LQfZM+124JgURxRAGoR6gpYk6j1/sOc2gUCRqf
 VFo7uUOG6dz6uZq6FUM+YcXXRTLSblWM+NxLRXhRiMLOFY7bFsDYa9Rjbhn4SAzkW3ol
 FLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cX3Zk7Jc4/AaxmCmjuLRp7mTBEkKcjrjYVeuv5jBFEs=;
 b=NaMrtr8l/D9y36Kei0MFUg4nDHDQmX0hUYag83iNf33ZxsrfjGbSsbQ21yP9Xc2+1F
 JInVqym5n4NOaw6+fTWDTuNpCjgXim5PdDSaXd0IUKCzrn4RNDjrwOHpByqxCyczb5/Q
 VqQrEDMwhaGw2OqQokk6xDj1zCRTs8AotjJweuMAGn+GvscnMrJbskIg9pxmIV7VbAzK
 zlg7bJgqum82ospftkd54iDS7r+o7jNy4hbDpqClf99FKzmyb8FWiq1Lg2ftsL2Z8rG1
 j3N1eohYvPqSfW/3IOu5U4IO33kIA1sNduTRnuMO29yM7Br24CdTxTFjy8VriIW6ds2N
 FQqQ==
X-Gm-Message-State: AO0yUKWCbRUa12FfVsx+DyyMxuf3QLW7jz3KQnMZyrdRfDoZszpQTLf7
 /QcSkB7Y/SzAtHhRiCv3eFF8XQ==
X-Google-Smtp-Source: AK7set9ye3ZqguefJwWG7Mf0ejgnFc/cyT9yJm9Vy+cbFFMBt3CN9t9c1w2JJwBO2ydt2nwG/B6C0A==
X-Received: by 2002:a5d:514e:0:b0:2c5:5870:b589 with SMTP id
 u14-20020a5d514e000000b002c55870b589mr2544137wrt.14.1676281160984; 
 Mon, 13 Feb 2023 01:39:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a5d6589000000b002c559405a1csm1808668wru.20.2023.02.13.01.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 01:39:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17DB91FFB7;
 Mon, 13 Feb 2023 09:39:20 +0000 (GMT)
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <TY0PR0101MB4285B3006CB19B1BF77C3961A4DF9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: TaiseiIto <taisei1212@outlook.jp>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH v2] [PING^3] target/i386/gdbstub: Fix a bug about order
 of FPU stack in 'g' packets.
Date: Mon, 13 Feb 2023 09:38:48 +0000
In-reply-to: <TY0PR0101MB4285B3006CB19B1BF77C3961A4DF9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Message-ID: <877cwldhvc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
> https://patchew.org/QEMU/TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR01=
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

I'm confused what changed between v1 and v2? Why isn't Richard's tag applie=
d?

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


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

