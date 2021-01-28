Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82603068CD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:49:45 +0100 (CET)
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vVI-0005xo-JB
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vRJ-0004ps-Us; Wed, 27 Jan 2021 19:45:37 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:42803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vRH-0006gg-TA; Wed, 27 Jan 2021 19:45:37 -0500
Received: by mail-qt1-x82f.google.com with SMTP id e15so2939863qte.9;
 Wed, 27 Jan 2021 16:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HbOajvFew/5i9TmKCi2imouWf4jIUNDBGAuPvuWAJO8=;
 b=gWK1QDzcPuX611YZVpW3Yyqo+nqdMu0gGFIZXB0CHJgdjk9XJYgA7Q60nLuOzzaJye
 ll1mM4EJw7qCVbLasa0UP4Qv8aB4Uqvpxb8ImbUdMIr8NaXh41brskD3ZXuRdC1Mel+S
 reRbh9I/ySxeAudmhlsZLkB4uS4mhBmMhNkTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HbOajvFew/5i9TmKCi2imouWf4jIUNDBGAuPvuWAJO8=;
 b=jMiLmSiFAdFmCTdKgxHqQchmUScDrciMeyz7f+n33makckFpeddRAM3ei7EI8dTtgd
 mxo8qVqHSF9XPMB9IMsJMTSMm+4nxjZ3skVr+qILYmbwG/N+eRBm4IuKSNTyYZYE4kTF
 hTg6Ap73Et5Yy8x5jlllXS56CGtlFaNUpTRuVio7cWdp6KD1F9Jkl4BpelTEq9p4nsKI
 S5454bO5Hal0w5JaZ7eFWG/OzsXa2j4clav/guIOHFwEYbTES+7JHC12jkkQwmnosFnz
 etuI//bsq+w7iYGBBXAMaoBx6srFx73AzeiZxlXy6/MPT1+4z+4jHwB7kOn1AHuKwYQU
 vLhA==
X-Gm-Message-State: AOAM530aTnpxM58VKhKEV94lfjCSoguyN+nzsNvoAsehiiMFEQfOcsKZ
 zAjprn9VeEAsFVOvO54h336NHpz4x6pRx1NNjKCSUW1T5ZY=
X-Google-Smtp-Source: ABdhPJzxWPbzsIOp+GWFTNymlPX2qt/8YOISIsGW083pnMj5NzqccEqJkJscjZ24alXtpYfkLUP4OC7hUxhvfE/QpWU=
X-Received: by 2002:ac8:5156:: with SMTP id h22mr12626908qtn.176.1611794729922; 
 Wed, 27 Jan 2021 16:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
In-Reply-To: <20210126171059.307867-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 00:45:18 +0000
Message-ID: <CACPK8Xdp12MC2yg23t61pLjFL-HEQg1tqL=aOjrQ-jrZ17b=cQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 17:11, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The current settings are useful to load large kernels (with debug) but
> it moves the initrd image in a memory region not protected by
> skiboot. If skiboot is compiled with DEBUG=3D1, memory poisoning will
> corrupt the initrd.
>
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Note that the machine's default ram size will change with this patch:

 mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;

So we will go from 1.75GB to 768MB. Does anything break when the
machine has less than 1GB of ram?

> ---
>
>  If we want to increase the kernel size limit as commit b45b56baeecd
>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
>  think we should add a machine option.
>
>  hw/ppc/pnv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 14fc9758a973..e500c2e2437e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -65,9 +65,9 @@
>  #define FW_MAX_SIZE             (16 * MiB)
>
>  #define KERNEL_LOAD_ADDR        0x20000000
> -#define KERNEL_MAX_SIZE         (256 * MiB)
> -#define INITRD_LOAD_ADDR        0x60000000
> -#define INITRD_MAX_SIZE         (256 * MiB)
> +#define KERNEL_MAX_SIZE         (128 * MiB)
> +#define INITRD_LOAD_ADDR        0x28000000
> +#define INITRD_MAX_SIZE         (128 * MiB)
>
>  static const char *pnv_chip_core_typename(const PnvChip *o)
>  {
> --
> 2.26.2
>
>

