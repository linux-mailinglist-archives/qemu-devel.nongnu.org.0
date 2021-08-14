Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFDB3EBFCD
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 04:41:58 +0200 (CEST)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEjcT-0002ac-IG
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 22:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mEjbY-0001FT-Bw
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 22:41:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mEjbW-0007Hw-Tb
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 22:41:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C08C60F51
 for <qemu-devel@nongnu.org>; Sat, 14 Aug 2021 02:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628908857;
 bh=gmPzwqvA326onsBr2ZgDpvPtBsnw9+vtDpuGqgIiQN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mwaPvxnJ7QEIYKAHZvRi1g4+A12fhoQJmVJjrdIdyQIgWB8j0Idd0wK7a00v/o0y4
 WGX0P8OxhntK94EOMcO/Z6hFLdcHAX1Vf8hWVH5KcIj8+fBGXU6V48w2U9loszn9tu
 IsFfywfyFTI+fvS5TEVKjLB15FEQvlY39jNJxvFBpzfsFlEfI6gdcrWcYaB/0VTWoh
 WtMpnJHOw0JBUOJQ15S21qQpDexA2ZZhaZdWofaNRTfXtMq5Ucl7r/gL5WHlBdvtku
 XYcEDh1Oa4etkelNAJFIo9SsJlmPW/5aNPnCCnZusTNDX66FBMEN8ZOU8G8eNRB1eq
 bjGJvnH6FZSEA==
Received: by mail-io1-f53.google.com with SMTP id f11so15773434ioj.3
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 19:40:57 -0700 (PDT)
X-Gm-Message-State: AOAM5332m6gQeQ6SxTh+vzsEDc5ifbZHw9qI+YLOTYHJf3+BuAmA5Arb
 tpeZx+pzQkyLOCEnPRzDbr9UJQaatq6eTKdGmbs=
X-Google-Smtp-Source: ABdhPJyFHWzMfZdgAthUzittXpHpNoNR5rVIiXRalcw7FEM9AwQbSjF6TP+4OwOwvGnqkHtlSMX5RB/v7UMcU9Ul5Ak=
X-Received: by 2002:a02:2348:: with SMTP id u69mr5003454jau.141.1628908856972; 
 Fri, 13 Aug 2021 19:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210813110149.1432692-1-f4bug@amsat.org>
 <20210813110149.1432692-3-f4bug@amsat.org>
In-Reply-To: <20210813110149.1432692-3-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 14 Aug 2021 10:40:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5nT9QxJs8S++nVejCs6j0KhSoQMzXe2pyHnS+XS4xdSA@mail.gmail.com>
Message-ID: <CAAhV-H5nT9QxJs8S++nVejCs6j0KhSoQMzXe2pyHnS+XS4xdSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/mips: Allow Loongson 3A1000 to use up to
 48-bit VAddr
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Fri, Aug 13, 2021 at 7:02 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Per the manual '=E9=BE=99=E8=8A=AF GS264 =E5=A4=84=E7=90=86=E5=99=A8=E6=
=A0=B8=E7=94=A8=E6=88=B7=E6=89=8B=E5=86=8C' v1.0, chapter
> 1.1.5 SEGBITS: the 3A1000 (based on GS464 core) implements
> 48 virtual address bits in each 64-bit segment, not 40.
>
> Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/cpu-defs.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index c6ab3af190e..cbc45fcb0e8 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -828,7 +828,7 @@ const mips_def_t mips_defs[] =3D
>                      (0x1 << FCR0_D) | (0x1 << FCR0_S),
>          .CP1_fcr31 =3D 0,
>          .CP1_fcr31_rw_bitmask =3D 0xFF83FFFF,
> -        .SEGBITS =3D 42,
> +        .SEGBITS =3D 48,
>          .PABITS =3D 48,
>          .insn_flags =3D CPU_MIPS64R2 | INSN_LOONGSON3A |
>                        ASE_LMMI | ASE_LEXT,
> --
> 2.31.1
>

