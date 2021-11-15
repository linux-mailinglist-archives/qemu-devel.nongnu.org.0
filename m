Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D674505BB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:41:19 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmcEY-0004KN-6C
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcCJ-0003Fx-Gu
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:38:59 -0500
Received: from [2a00:1450:4864:20::32e] (port=56047
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcCG-0004MH-Oh
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:38:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p18so4635942wmq.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
 b=qZRH7NGmp1PMciSQoyUMYVXlFymS4BExsXAseBK1B8gjNV7fhXTfSBMzGWpMUvhW33
 ObFcgmCeoLByoNeaNhtvBwJ254GuzHATVvjBBtZHYMjgrlIklX0TiqCeCvXo/HJQFgZT
 RtDmcu0GZJQ1korC7xr1allEf3AuqyaF7yAjb5tfS7wQzCCqwtHXotneub2OtKC/tSat
 slvDZ6PurEUAZqLTuziK0JygPkdx7tGK4Hmt/24//NdaHnG9FTWR0P2nFJajVIpgJ93a
 rYONTU+dCi82DRk3il1SExHOH6ouF2YbXBB8iGPL0DE8fg26aWUaN1VWZQejgimbBX0F
 LzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
 b=QMpT5kmYoToALnsIrrY67dr/t3iDWwhoOz3yWIa/W/JmVki0wSweQ02Rdrn5R8l10I
 a8EGSrL9FQwA1tNwvPe6xCtbzySAstbWNNMM4tao+j9PuDlP8Lb8ML1ZzDLpAeLaM4Eg
 MpGvfivxFxYvvmwqySXpmlehRYPndq9pKV9XHTdszPAzLm3yLrkk+9T9RCwcR1AdVz6L
 9pIuglFpNIzFEfD1URzxJRsgfqXMHhGxqhSCqnNLIQmAiFwIyqNeXTrssZiX8izxeGvk
 QlHp1MYqIM/lcpQIyL/rZ3IYILm/dpYAr7fKOubOYxCtdgPg9lyxpjWnkjeDNIJWjmcX
 MWJA==
X-Gm-Message-State: AOAM530EcwWsHg833Y26KjT2x8bUPe+baUJjY9YLgYMsliYV6f26rioZ
 gUh9WGnG/TTz1A6/soAuQssWGJD+mXfJQjWprrpQPw==
X-Google-Smtp-Source: ABdhPJz4odgPhu4JFqUnTGqDJoTamgtr7UTskdt2Lr52NbabZ8CaJDn/HYHHfTJu77HHUwTODqDR4EJy5QAjLypMu2E=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr26357463wmq.32.1636983535036; 
 Mon, 15 Nov 2021 05:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-3-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:38:43 +0000
Message-ID: <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, edgar.iglesias@gmail.com, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 f4bug@amsat.org, Andrew.Baumann@microsoft.com, jcd@tribudubois.net,
 kfting@nuvoton.com, hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Explicit is better than implicit: use drive_get() directly.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/sysemu/blockdev.h           |  1 -
>  blockdev.c                          | 10 ----------
>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>  hw/arm/cubieboard.c                 |  2 +-
>  hw/arm/imx25_pdk.c                  |  2 +-
>  hw/arm/integratorcp.c               |  2 +-
>  hw/arm/mcimx6ul-evk.c               |  2 +-
>  hw/arm/mcimx7d-sabre.c              |  2 +-
>  hw/arm/msf2-som.c                   |  2 +-
>  hw/arm/npcm7xx_boards.c             |  6 +++---
>  hw/arm/orangepi.c                   |  2 +-
>  hw/arm/raspi.c                      |  2 +-
>  hw/arm/realview.c                   |  2 +-
>  hw/arm/sabrelite.c                  |  2 +-
>  hw/arm/versatilepb.c                |  4 ++--
>  hw/arm/vexpress.c                   |  6 +++---
>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>  hw/arm/xlnx-zcu102.c                |  6 +++---
>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>  hw/misc/sifive_u_otp.c              |  2 +-
>  hw/riscv/microchip_pfsoc.c          |  2 +-
>  hw/sparc64/niagara.c                |  2 +-
>  23 files changed, 49 insertions(+), 52 deletions(-)

This would be easier to review if it didn't try to change all of
these board/SoC models at once. Each one of them is entirely
separate review work.

-- PMM

