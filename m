Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8752F3C18
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:03:24 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRl5-00009y-90
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRhj-0007Sw-NX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:59:55 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRhi-0002ur-8a
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:59:55 -0500
Received: by mail-ot1-f51.google.com with SMTP id j12so3825097ota.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P154hMLbK7J48AxEgmZ6DPjZ8p9fKQsVcPLXCafV9/g=;
 b=qQfHXL+w6AUBKIK9y2x6ZXCdQGGgaRCUGTMUwN/SSD7kG67p7ED9M56L6EdbUSeAiX
 G6Cpsn7su5RwPfDR48ggPyXvvxwnZwW8ce8Mcpyeu9ojVfD99UzWTC8sWaoyFqv4ZDOA
 EEo9jZkU7Bex9mozhgLgPmviAnHyAsTzaCIUDQ5vdONuanIT54LIO76hqEU28XIR9boE
 8fiYKu6UOOK3MthNbY6c31XJPHSiubwIEksrYSrppAazgjvbdS/h1vHF8oNjv4trqUBU
 HN1HP9NAhspHrtNKPE7Ha6R5VAz00OW1zC47+mcdmJTz7tKH74JnIDY3AqF66QYhDcjK
 SoFg==
X-Gm-Message-State: AOAM531T50ufU4sfSV0jRR3C7vj3WMsOazixXMYwkpjgB1oGQIj0EujJ
 cEFu8WAcuzZIXQB5MQv3q6O417r2i0mInM4gXVUiMcff
X-Google-Smtp-Source: ABdhPJwxWE09ufUauZRxC5yWoNIfG7fuOkOP1BXhiE6CzTuaXKjF8t5jXJTSEFSY01SYeTiN9eWDYIAXUG8XjhSXbyY=
X-Received: by 2002:a9d:6f17:: with SMTP id n23mr983794otq.371.1610488792917; 
 Tue, 12 Jan 2021 13:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-4-f4bug@amsat.org>
In-Reply-To: <20210112215504.2093955-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 12 Jan 2021 22:59:41 +0100
Message-ID: <CAAdtpL6ikRO=3yv1_yVR7JcycF_PW7tyBn9UinfZtOevFoe6ew@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/mips: Convert Loongson DIV.G opcodes to
 decodetree
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 10:55 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> DIV.G and DDIV.G are very similar. Provide gen_lext_DIV_G() a
> 'is_double' argument so it can generate DIV.G (divide 32-bit
> signed integers).
>
> With this commit we explicit the template used to generate
> opcode for 32/64-bit word variants. Next commits will be less
> verbose by providing both variants at once.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/godson2.decode    |  1 +
>  target/mips/loong-ext.decode  |  1 +
>  target/mips/loong_translate.c | 28 ++++++++++++++++++++++------
>  target/mips/translate.c       | 26 --------------------------
>  4 files changed, 24 insertions(+), 32 deletions(-)
...
> @@ -51,18 +54,26 @@ static bool gen_lext_DIV_G(DisasContext *s, int rd, i=
nt rs, int rt)
>      gen_load_gpr(t0, rs);
>      gen_load_gpr(t1, rt);
>
> +    if (!is_double) {
> +        tcg_gen_ext32s_tl(t0, t0);
> +        tcg_gen_ext32s_tl(t0, t0);

Oops copy/paste problem...

> +        tcg_gen_ext32s_tl(t1, t1);
> +    }
>      tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
>      tcg_gen_movi_tl(cpu_gpr[rd], 0);
>      tcg_gen_br(l3);
>      gen_set_label(l1);
...

