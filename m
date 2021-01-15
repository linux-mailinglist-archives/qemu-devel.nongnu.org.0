Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9402F70B7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 03:49:36 +0100 (CET)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0FB9-0000xe-Q0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 21:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l0FAJ-0000Yw-CV
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 21:48:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:48570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l0FAG-0004Jn-Fh
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 21:48:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3F1C23AFD
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610678916;
 bh=erUJo+HseroPKwoG59jFpKppxWYHq5RPCNX2wtvL4Fc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UlxmRUJTBgbTcrBT3kmNZiPoD27c64F0AF+x62tamllgpUXSZUrHMSkwkdp5viKdm
 9rmmuf1NjEDozFb1rMrEQxlvG9jKmbcCU5j6+iT+k4VJG9kgOy/1no8bpCFe5sthK0
 4PNdnP5l1cbxknNahaSWd8ZABc63FW/U/sEIW6c3xWD+PZaIfOq+dy0zzTflBOabGs
 nZw7gDYvoXAadeBdVoWI6tSqypoH4Cz6G/8pyjk6eobZmPW3z8IrOaAJjp5WHYThcg
 s41JeLtir6NbMRpCC8PmQ+wnXK/UjcENoGY2Wv4X8wm/hDnfHz9bfuDGiA0YuMwZR9
 mBLVA7Qap7fUg==
Received: by mail-io1-f41.google.com with SMTP id d9so15501384iob.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 18:48:36 -0800 (PST)
X-Gm-Message-State: AOAM533DY1kvJjLLbc0wNh1NYZNPKrvQD5O9waUDYJsUFxyBTNv2RMHX
 1R8C2jWByKfvk+1uGtRo6EcorTTEosS5wN6VHJE=
X-Google-Smtp-Source: ABdhPJwqMf+yg2Ifcig3uLVcVQZ8N9YLQdDHJenWGHLuqkj5L6x2v1wwH8f6JtZoo+cAi5mZU6LQSz/UbFziXj7WAxs=
X-Received: by 2002:a92:874d:: with SMTP id d13mr9183051ilm.270.1610678916217; 
 Thu, 14 Jan 2021 18:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 15 Jan 2021 10:48:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6yp3whJMxKYwyw8QsCL8qBmC=qbT0DO4M+NfUc-3=YVA@mail.gmail.com>
Message-ID: <CAAhV-H6yp3whJMxKYwyw8QsCL8qBmC=qbT0DO4M+NfUc-3=YVA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/loongson_liointc: Fix per core ISR handling
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Jan 12, 2021 at 9:25 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Per core ISR is a set of 32-bit registers spaced by 8 bytes.
> This patch fixed calculation of it's size and also added check
> of alignment at reading & writing.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/intc/loongson_liointc.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
> index f823d484e0..cc11b544cb 100644
> --- a/hw/intc/loongson_liointc.c
> +++ b/hw/intc/loongson_liointc.c
> @@ -41,7 +41,7 @@
>  #define R_IEN_CLR               0x2c
>  #define R_ISR_SIZE              0x8
>  #define R_START                 0x40
> -#define R_END                   0x64
> +#define R_END                   (R_START + R_ISR_SIZE * NUM_CORES)
>
>  struct loongson_liointc {
>      SysBusDevice parent_obj;
> @@ -125,7 +125,12 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>      }
>
>      if (addr >= R_START && addr < R_END) {
> -        int core = (addr - R_START) / R_ISR_SIZE;
> +        hwaddr offset = addr - R_START;
> +        int core = offset / R_ISR_SIZE;
> +
> +        if (offset % R_ISR_SIZE) {
> +            goto out;
> +        }
>          r = p->per_core_isr[core];
>          goto out;
>      }
> @@ -169,7 +174,12 @@ liointc_write(void *opaque, hwaddr addr,
>      }
>
>      if (addr >= R_START && addr < R_END) {
> -        int core = (addr - R_START) / R_ISR_SIZE;
> +        hwaddr offset = addr - R_START;
> +        int core = offset / R_ISR_SIZE;
> +
> +        if (offset % R_ISR_SIZE) {
> +            goto out;
> +        }
>          p->per_core_isr[core] = value;
>          goto out;
>      }
> --
> 2.30.0
>

