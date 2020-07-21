Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E92275E3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 04:43:28 +0200 (CEST)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxiFb-0000sc-CV
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 22:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jxiDv-00086r-7P; Mon, 20 Jul 2020 22:41:43 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:42615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jxiDt-0007Q4-Mk; Mon, 20 Jul 2020 22:41:42 -0400
Received: by mail-yb1-xb43.google.com with SMTP id x138so9296149ybg.9;
 Mon, 20 Jul 2020 19:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GygHfAmuW7x9/AhKEkXZYoXQJRI3jRpXzdKG1RG/yYY=;
 b=BHUaeXBkMWhwYSmxRBbO34g+gywFpcNERzclO7OM/XhkehkzB+1h9qqPvbtucn8zU7
 ZUlmLJuQuBoCgkMmasDbbjWfNRU7LOjjP76091stxkAscMnSPm5VJNStVNsR6YQI2Xj4
 olCjHiaPQNflnLIxp/D+J1DNEdIpPRTkxthfpP2RJtQf0LZrxoLyjW1RDw/bM0Dv3NuZ
 kzIQaxIKUg/gGTPdvF3eAeXoq13xXClTK5wsLf9pbAUmVqGRJHEJeNKMY/8S8JpIgK2Q
 baMN1fxJiVWdNnbj0FIlhkAiIvef40BZ5UL/29N8HN0O7mYS2zKvhpxjOeJqspikMZDv
 ZP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GygHfAmuW7x9/AhKEkXZYoXQJRI3jRpXzdKG1RG/yYY=;
 b=D5Z/fREA63bGFymsgIimqrUR67sY2ghOzCKi4TYwCjI057v05hv1FefR6hr5iMy31O
 6GfJzm4uOa66WGHAserDkwIHy2kQLA0I26z0F5Ject6NYw+t4igXEI6pDcRBGLDxnVVD
 xrYoWR4Wpxs5exGK3Zj8d9ovzCLl6SFDyccvw8MrQByQG/HX4kgIqSzIlJq3RHHIwNcd
 F6doZjW2IHiDSLk04zQx9a7pYQ+xFGsyX2tP5oDj7ttcV71WcVxWrADzh1xMr28qRnh7
 fxOFslM4nnAVspiZrUnOhIXH3HTpaJ5adD58Q0pZt61hhm94WtpXxKKsecdMW3TiVjyM
 0y6g==
X-Gm-Message-State: AOAM5322sCnYnpaEhlqtUps95gF4XMCZr88Qwa2e97YrKCY1L5+QwKbX
 baMJf/QgvOdaZn89I0XD9NvFCyCOPdsqQVI9bBU=
X-Google-Smtp-Source: ABdhPJyW0DF+WpgSfc2rg5Ejvpov8t3FjtkmMFFV6JlI51yDDti3tb7e60XMcsbHzqo6pUhlqvrq17Je3G9NY0aIz9M=
X-Received: by 2002:a25:d94d:: with SMTP id q74mr42647110ybg.387.1595299300609; 
 Mon, 20 Jul 2020 19:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595234208.git.zong.li@sifive.com>
 <c01aa428c0b4dc9c3e5b24a3d04040a1253bb3a5.1595234208.git.zong.li@sifive.com>
In-Reply-To: <c01aa428c0b4dc9c3e5b24a3d04040a1253bb3a5.1595234208.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Jul 2020 10:41:29 +0800
Message-ID: <CAEUhbmVVjVSBrthywf5+Hf9msF+p7Pnb1i9MvHyLDYfsCrvqZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fix the range of pmpcfg of CSR funcion
 table
To: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 20, 2020 at 5:48 PM Zong Li <zong.li@sifive.com> wrote:
>
> The range of Physical Memory Protection should be from CSR_PMPCFG0
> to CSR_PMPCFG3, not to CSR_PMPADDR9.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

