Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9C2C99D5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:47:08 +0100 (CET)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1JT-0007kP-8p
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1II-0006f6-83
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:45:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1IG-00076s-KV
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:45:53 -0500
Received: by mail-ot1-f66.google.com with SMTP id f16so907572otl.11
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5SaqOSjVpl6CYhJpDXtjs5pD/fayu5DbiHXdupantZI=;
 b=fzCc5nqntRQMH8Kx7eTUS1KZJ1uLdeaCCshaCG1O7xR3uMcnElvVz+AGmfLIh9KNRN
 tn1Boa5eXrVh3egLBu82lICSHWbwgPfnfISXHosMgNuNgw9haZ20RifBzrYYYGG0Mwv7
 TadSbt7mMqrREPbXwsVSm/LECHVaLzbCMABc5UASB/j6L7Pn4eq4AKJD6EVF/+YzGI8f
 RdAvPpaQ/J7AdPkq7jpu1wRiLR6MHIPbrk39vMvOIuf4Wqyh2DQE0qZfMfxpBGfv7TMq
 2Fo6XoKEEcB81BJqgqdN6H+Ktc8GWHMdaqb4kYcAQty1aGUKmsvwYLFZWYb//VoZJYbi
 0saA==
X-Gm-Message-State: AOAM5303ZvGAUbeLCWQrIzfV4CBPLT1SoSsfjfouOQJwk+ik9RX69LvM
 K2i4EmILHl+ARZfMc8JU+0P6AoidJqFXyQHjJZqqvCzMXzI=
X-Google-Smtp-Source: ABdhPJx3Og2Uv5D9UktrgT6afqibvJRcqsADbAFIkZ5wtyQzhrzQ+MnCVdPwNo8qIO2HXCvy/uHfhrGNadIgKw4Hmy0=
X-Received: by 2002:a9d:3d08:: with SMTP id a8mr200610otc.126.1606812351237;
 Tue, 01 Dec 2020 00:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20201201083951.2745111-1-f4bug@amsat.org>
 <20201201083951.2745111-3-f4bug@amsat.org>
In-Reply-To: <20201201083951.2745111-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 1 Dec 2020 09:45:39 +0100
Message-ID: <CAAdtpL4koHjJrbW+HyykN34YtYH45SXyiUs9OaSVnJsN1cCdsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-user: Add support for MIPS Loongson 2F/3E
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.66;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f66.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 1, 2020 at 9:40 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Userland EFL binaries using Longsoon SIMD instructions have the
> HWCAP_LOONGSON_MMI bit set. Binaries compiled for Longsoon 3E
> have the HWCAP_LOONGSON_EXT bit set for the LQ / SQ instructions.
>

Eventually I can respin with references:

2F since 8e2d5831e4b ("target/mips: Legalize Loongson insn flags").
3E since af868995e1b ("target/mips: Add Loongson-3 CPU definition").

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 17371f8b8cd..be82fcb2c0a 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1012,6 +1012,8 @@ static uint32_t get_elf_hwcap(void)
>
>      GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
>      GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
> +    GET_FEATURE(ASE_LMMI, HWCAP_LOONGSON_MMI);
> +    GET_FEATURE(ASE_LEXT, HWCAP_LOONGSON_EXT);
>
>  #undef GET_FEATURE
>
> --
> 2.26.2
>

