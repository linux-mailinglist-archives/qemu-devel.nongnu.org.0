Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D702D2C8484
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:57:38 +0100 (CET)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjikL-0002De-Ue
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjigl-0008C8-5N; Mon, 30 Nov 2020 07:53:55 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjigi-0001zL-Kj; Mon, 30 Nov 2020 07:53:54 -0500
Received: by mail-yb1-xb42.google.com with SMTP id t33so11278252ybd.0;
 Mon, 30 Nov 2020 04:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5E/KI9GwSD1ImN2mSYFuNgBg+ye8PIX8N/w8mFTp9AU=;
 b=L/p/B7t32yS47Fo8KjHcGy/eUVIuo6FRgqgJI8EVJPm/d0tp5tCRqPD0D4CQrQYjQR
 9WDFSZ9N/jENhnQmUkYaETqZYfdGk2Nyt3znP36WFk1ziTePl3rE1Djxbq9DD19vVTLq
 G03hbRmFdBcAKmWnPQ6yO5e7RgzKDnsykImRQqc5k4owJkY9aLhUHupMm9F5m7ryAN87
 litq5jnRbYNDI3rYrRUIbnZlBeqMWy1D7aDF0Xt2ozepF0bJudN/bj5ttdUkj+NyKsUO
 OhabAM/p7dOPKrtm5DFAvRCH/jors9NtPSIdD5x/FzZh2XvY7eX/+wnXguXojy/b3sup
 nsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5E/KI9GwSD1ImN2mSYFuNgBg+ye8PIX8N/w8mFTp9AU=;
 b=Rjpg2rjaw13WpiEFv9S2HZIvfvg6MAqonvxj9PP3Mz4uZ3oI2TMxXvrsFXDRHC3+h7
 c52DRRovD6mrvTEUg/Xpti49HU4sSSedbc9KaJ/kwFJU8KjsWc066UuuHlXtwV7jfQZg
 xz+usOWw0V/yoLzKJh+cd4GWRT+xB9Gxm/99maFcBwZ0M0YcJQ2m7bDT7DTi1i7lIz8X
 iTiMCKpB2LdqG/7bLt/RAGx3Aner1GdE7ZfJoVV7NniuVsVwBjorkFRZ9LhjUUvD0Au/
 6ogFHcwNFKfx9MwuYrItZJr4KUhnlaFfMLtTraCpJNe2YcLfNVLHo2CvKHbAMmkAmVkm
 pTQQ==
X-Gm-Message-State: AOAM532JGt6kEiQVvkw/mgSmnpT6R+Gji99mmLQAQawI5mttTg+Q00g7
 GDSuK0yqXI47oBXdZ3baogQ2VUD8S3jXQAw3R0U=
X-Google-Smtp-Source: ABdhPJxa1PB4oDwh8vbpyT5y0l36Bpn16sBJ3Kt2tJUp5Yv8G2NsTHE9IwbP4NnofQaBcOKF8Qm02AgvCJsN+svO6Nk=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr31556635ybk.152.1606740831219; 
 Mon, 30 Nov 2020 04:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20201117105219.1185736-1-f4bug@amsat.org>
 <20201117105219.1185736-2-f4bug@amsat.org>
In-Reply-To: <20201117105219.1185736-2-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 30 Nov 2020 20:53:40 +0800
Message-ID: <CAEUhbmXRND_nb5oMEM4RdeAjnC2DKYzoYtyz5aJusCs2p8vo8w@mail.gmail.com>
Subject: Re: [PULL 1/1] hw/sd: Fix 2 GiB card CSD register values
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter,

On Tue, Nov 17, 2020 at 6:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per the SD spec, to indicate a 2 GiB card, BLOCK_LEN shall be 1024
> bytes, hence the READ_BL_LEN field in the CSD register shall be 10
> instead of 9.
>
> This fixes the acceptance test error for the NetBSD 9.0 test of the
> Orange Pi PC that has an expanded SD card image of 2 GiB size.
>
> Fixes: 6d2d4069c47e ("hw/sd: Correct the maximum size of a Standard Capac=
ity SD Memory Card")
> Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Message-Id: <20201025152357.11865-1-bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>

Any chance to get this patch applied to 5.2 since it's a bug fix?

Regards,
Bin

