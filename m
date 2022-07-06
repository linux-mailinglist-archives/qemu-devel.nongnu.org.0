Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9856847A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:02:58 +0200 (CEST)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91s0-0000Uy-Qn
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1o90z8-000333-6w
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:06:14 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:45989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1o90ys-0004uP-Tt
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:06:13 -0400
Received: by mail-qk1-f174.google.com with SMTP id p11so10540069qkg.12
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSGVQi5IKjbraoZnvUS5bTVf5cvEgksM+fBNwKEP++A=;
 b=yhJoqGY5rO6pV+XDoi/XM/TrBqTsbLMePQGaWdqevR3EBzOynboq3xgh9SNecL7m2f
 gKyxfqmh2ddDKSN+g5Lzqjzn2T1jkcppDFC4ZrpjXPZkZd1vnjbaBMbkfHFT9M6pgIcm
 Aa6AnAixlsVuudt69oxz/a4ts3mL90uGIJfRrZiV/MGqrcIHvNOyITwHpQvP9kBtt/c0
 W8hLKeDgJAut5T+vKeHXrbSbiiM0Y6qVwBqO6k4VCuT+NZd6bstACdxdPMFUeRAjEBAx
 N6MDw5aQxD5RmZJlXa/6pIOqA8PuqHyJXzOLM3h/LUYR6CesMz6Y1lbNsuylDwZmBgdu
 CeWA==
X-Gm-Message-State: AJIora91g5a5fLQFhww8f0k2fq+OlxmUPYYNKhM0O87asqp1pR6v1Dvw
 VfmdWO9z4oPTwIFhss7G9psG1WTEsHWDkg==
X-Google-Smtp-Source: AGRyM1vM1ZjZsUI0/MYXpGS5aXm5Be0YFEhOv+YOKn3MwDip2oy94pOialb2zpakwSN7G+ZH1d7GmQ==
X-Received: by 2002:a37:a147:0:b0:6ae:eaea:e04 with SMTP id
 k68-20020a37a147000000b006aeeaea0e04mr25486594qke.133.1657098356784; 
 Wed, 06 Jul 2022 02:05:56 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05620a298800b006b4689e3425sm7066538qkp.129.2022.07.06.02.05.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:05:56 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-31cac89d8d6so63740567b3.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:05:56 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr13226995ywg.383.1657098356032; Wed, 06
 Jul 2022 02:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <9df7a700-0744-3a9f-f925-48de994ba70e@vivier.eu>
 <20220626111804.330745-1-Jason@zx2c4.com>
In-Reply-To: <20220626111804.330745-1-Jason@zx2c4.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 11:05:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZ28mSeycCXMMtHchPNPY+yRC_=ysN4aTdA8OOJtHyXQ@mail.gmail.com>
Message-ID: <CAMuHMdXZ28mSeycCXMMtHchPNPY+yRC_=ysN4aTdA8OOJtHyXQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: virt: pass RNG seed via bootinfo block
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.222.174;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-qk1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sun, Jun 26, 2022 at 1:18 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This commit wires up bootinfo's RNG seed attribute so that Linux VMs can
> have their RNG seeded from the earliest possible time in boot, just like
> the "rng-seed" device tree property on those platforms. The link
> contains the corresponding Linux patch.
>
> Link: https://lore.kernel.org/lkml/20220626111509.330159-1-Jason@zx2c4.com/
> Based-on: <20220625152318.120849-1-Jason@zx2c4.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

