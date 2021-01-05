Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF82EA41A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 04:52:16 +0100 (CET)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwdOK-0001Bl-1y
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 22:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdMd-000099-La; Mon, 04 Jan 2021 22:50:31 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdMV-0005ac-W9; Mon, 04 Jan 2021 22:50:31 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id b64so28028465ybg.7;
 Mon, 04 Jan 2021 19:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e6G4tiZsMUCqTdpmgh3NjQFCJENAhIXjyNRTiJ9Lcpk=;
 b=t0qAozK5o0vGp2M0Yvtkwj12yaiShCfd3JjB21jkn3LwzlZQD5h81QVEirl4/1vQsa
 /3XTcMZCka/lRNJbRYhTMCL9XW+zp/L19Uxoq0dFmpcdhRkm8P2z9t42c9OzF0k0KcUW
 f5okU3kAzVxUqg9VoPUfWDNq7dkZBRk8FwVTdAbw3YPW6FrRbCFqgoYK4kGvTmsW3/b5
 9iuViYnDMasJ6N4PE0bn4Rd85JHImukrFgkPMra1oYxUuEHlJjLh27SxvbQIzrdSNbni
 HRC8rj3OpJa3FgIYevat6CdgMOL78Yiq8/oHP8gQINMrwWUmDJ2jgMXBRnkTLp1PCR13
 8WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e6G4tiZsMUCqTdpmgh3NjQFCJENAhIXjyNRTiJ9Lcpk=;
 b=POFOqI1//aoIc5jOpC5stP3fV12Pi+a0UTCXdXwediLkNKXnpSsYBjtyuiaj9K3o1w
 yVeUhMSoJv4YAfKGS/rwKmVt3j4kXp+tRBkeTAh8xVpMaNiS5kqzbmmSxMSfBDGtcg/N
 QriX5q2FJciywa9SjhXhLXJkq+0uZ3eZvBsBpOjRxA2FCkeMxlKaS5+T7CK4TC5GoApp
 FRLtWL3XZyMEKcIO0f104BNFKaOB07LvNgif31ZF3jhNqprIx18ZWlWN/jKR+B0OgAoz
 ZTcUzAfKR9WE34FiuBRlyuXLK9KjXFeEF+hHMWk8TGjHBgbFx+KzwELUFLolc12PZOJ1
 ihXg==
X-Gm-Message-State: AOAM530ovGQTVYW3Q/Ig738KjqBdUv48sWyGN+2rHB29xGMG8O6xVLFy
 qGiMCWj6RAZGZhgdyvrQOIr1VDYLsosmJzFBROE=
X-Google-Smtp-Source: ABdhPJxxvHbjedq+JiTvQPQ69wU3Y0Qv3GqwBYFFSf3LV4GZgyPKuzjHNDlvWnfee2WYIGYqtL65GAWZBJ9MrtgV+kQ=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr112511597ybs.122.1609818620072; 
 Mon, 04 Jan 2021 19:50:20 -0800 (PST)
MIME-Version: 1.0
References: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 11:50:09 +0800
Message-ID: <CAEUhbmVU=f_tfJFMcCErnY+qS00QLoKVGcezoVc-WoaTtB1eBQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
To: Alistair Francis <alistair.francis@wdc.com>, 
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 23, 2020 at 10:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> When write is disabled, the write to flash should be avoided
> in flash_write8().
>
> Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device"=
)
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - new patch: honor write enable flag in flash write
>
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>

Ping?

