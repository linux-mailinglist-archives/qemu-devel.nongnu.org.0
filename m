Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423C3ECC80
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 03:49:01 +0200 (CEST)
Received: from localhost ([::1]:36826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFRkJ-0007FD-Hn
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 21:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mFRj3-0006X2-0N
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 21:47:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mFRj1-00079n-1W
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 21:47:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC7FF61440
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629078455;
 bh=J+Wio7E3iMVFhHf9PABDId1pQTlaoaebnxUWUqb418w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G5/nRCKNy1GvRWtY7mOR2BwfI4gQ6UEZgH7PePRwQ+TgLfNH8JSZI3K6a7AsBPMmQ
 G30C29gbd/2RoyptrBmXFJHl6x6+PalB7zBegOBcOSBMCbLTqlPKA/Vkxa4D9TV+FB
 gRGJiTVVRGU7H/NcQTl/KHNC66Tei1cbbfSDDRLn/Pyx8btv8AGne/iPeBvzOIhUTt
 7YJQZJOfDeEQ5ocdFQo9nWr0x5lUJfW3UEfCFhkRNI5aFuNqWRcZbo45eNj8VdQ+d6
 lvTYgcbp3ySCf/lvBIrPI9KtPlUpZcPvaXAIMJemtRyGNJzAc0/UW85E6JYDYMkzKm
 DzPQ9jIANDNxA==
Received: by mail-il1-f177.google.com with SMTP id r6so15932080ilt.13
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 18:47:35 -0700 (PDT)
X-Gm-Message-State: AOAM533KfP0PMHEqOzjmlJzueMibUkAKIqryYiPo6769NUI8O1S7aixC
 RmYHrzzCdlBtaRJpHsclk/E0jcrBHuaQXhoADOY=
X-Google-Smtp-Source: ABdhPJygqJYdbYTCuUCbcrLMcwWPI3AGmZ76DYmXE62O6GO3rUeUDTLisIYMD1eDvJpRSY5PF3+m1PFOBj26zJq0UTU=
X-Received: by 2002:a92:cd0a:: with SMTP id z10mr9710294iln.137.1629078455122; 
 Sun, 15 Aug 2021 18:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210816001031.1720432-1-f4bug@amsat.org>
In-Reply-To: <20210816001031.1720432-1-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 16 Aug 2021 09:47:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4FYN=s__mOHQhPdYJfkEGDU3onTw-5Jr087higRwS8fA@mail.gmail.com>
Message-ID: <CAAhV-H4FYN=s__mOHQhPdYJfkEGDU3onTw-5Jr087higRwS8fA@mail.gmail.com>
Subject: Re: [PATCH] target/mips: Remove duplicated check_cp1_enabled() calls
 in Loongson EXT
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Mon, Aug 16, 2021 at 8:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> We already call check_cp1_enabled() earlier in the "pre-conditions"
> checks for GSLWXC1 and GSLDXC1 in gen_loongson_lsdc2() prologue.
> Remove the duplicated calls.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 5b03545f099..268460d63ee 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -4777,7 +4777,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, i=
nt rt,
>          break;
>  #endif
>      case OPC_GSLWXC1:
> -        check_cp1_enabled(ctx);
>          gen_base_offset_addr(ctx, t0, rs, offset);
>          if (rd) {
>              gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
> @@ -4790,7 +4789,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, i=
nt rt,
>          break;
>  #if defined(TARGET_MIPS64)
>      case OPC_GSLDXC1:
> -        check_cp1_enabled(ctx);
>          gen_base_offset_addr(ctx, t0, rs, offset);
>          if (rd) {
>              gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
> --
> 2.31.1
>

