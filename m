Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE03530EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:30:56 +0200 (CEST)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7D5-000615-VH
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt78y-0003N6-P9
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:26:41 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt78v-0004BB-B7
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:26:38 -0400
Received: by mail-yb1-xb34.google.com with SMTP id q135so25089614ybg.10
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22s/yZQ54LAEnzgVRfSPDgDEXerpejwAvvoZ38GFbkk=;
 b=n91+WGnl1uSAa1/X21e+PnB5enMFzRKqvp7IysdCE+5h0+dpCvz2CN/KSfvSSePNXM
 eTlMXtCDGtWQk+huYEfT/fNpXz7A1SU6YHLASVwO3BzXE3TScRox+FZLhMEzzx8sd6xZ
 qOt68TOntyY6ahS4YfRQKWqe0YAOkXqWebeuGiJF0JobbfhC32YoQOfoCKy0vO/StGeA
 jcwQcY/jG0CAnytYGH2BLvpM8B0Xsrb3VlAAod73ustnHAI1IWmGUjv7y3ae3OhOScfz
 0IGRRNncx7aksugFWzM+o3O3wAz1klP05J6BlPQuEkxd9zPB4kK8Gry/VZiyazrc2RtV
 Arcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22s/yZQ54LAEnzgVRfSPDgDEXerpejwAvvoZ38GFbkk=;
 b=OyCyu1kLze+zMv2biTlgLqhyisRBC7fBCj8HYxOdgfI97tPaMIJUwT3v+klXa+MFzL
 eUl2fEZHHhvtlxKWPrKahrPh1c6mO7LC4cNoJvFjVtKcrIqLXbmwevotMIgrLtx3aeqI
 ho/lhjeN+iGObzbnGmnQFXtCjh1hgJscPQ0jQakCRzBydfUKCBYBYoBECfBUrFvT5icX
 5YJe2GUoXmza6Aua2ys//z7IBJJlZFKKJX5fFUOX8tFhjiEOniMRUbu6Enb6B5f8ofON
 FWiuSwVxHm/rXL8OSWbCndFQW1wl6A4zU/iaHNleZD8LYNxrWyweSwo6pnUlvSXGjCXg
 NPKA==
X-Gm-Message-State: AOAM533o5cPWoVnnEI3l6+ZcX2WjHlr0tN2oHDov7w9lzFPssPyQmd8Z
 Ba5uKr71Nhijs1Sn8b0v5TO8EKqbY9xl71wDtEyB3g==
X-Google-Smtp-Source: ABdhPJw8sCPabiyLYI/bpQjFU+0w7zUFkmxqHuADCmoBfegq05+y+FRoW8tNigaCSgw898PDiP85o4euEcNobqZTjh4=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr20516748ybu.140.1653308796327; Mon, 23
 May 2022 05:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-15-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:26:25 +0100
Message-ID: <CAFEAcA8khr2dep51EO6iuP7vSNd+OvJ9Dxtp-H_FhnAhEi9k6Q@mail.gmail.com>
Subject: Re: [PATCH v3 14/49] include/exec: Move gdb open flags to gdbstub.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There were 3 copies of these flags.  Place them in the
> file with gdb_do_syscall, with which they belong.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gdbstub.h        | 10 ++++++++++
>  semihosting/arm-compat-semi.c |  8 --------
>  target/m68k/m68k-semi.c       |  8 --------
>  target/nios2/nios2-semi.c     |  8 --------
>  4 files changed, 10 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Separately:

> +#define GDB_O_BINARY  0

The gdb remote protocol doesn't define an O_BINARY:
https://sourceware.org/gdb/onlinedocs/gdb/Open-Flags.html#Open-Flags
and files are always opened in binary mode:
https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/remote-fileio.c;h=fe191fb6069a53a3844656a81e77069afa781946;hb=HEAD#l122

so we should probably drop our definition and use of GDB_O_BINARY.

thanks
-- PMM

