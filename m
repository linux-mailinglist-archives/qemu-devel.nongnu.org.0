Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34B344920
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:21:11 +0100 (CET)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMMg-0004qm-J9
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOML0-0003vg-GX; Mon, 22 Mar 2021 11:19:26 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMKt-0000ME-KB; Mon, 22 Mar 2021 11:19:26 -0400
Received: by mail-io1-xd36.google.com with SMTP id x17so3041565iog.2;
 Mon, 22 Mar 2021 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F27Ano31Gep1hj0U6MW2Dizj6/P0yKIdLsqatvpKEbo=;
 b=qqZnaifaVYuOFA+tf57AyavQIhC7p3+Zad9UZf5RuGy+ialGCMxerKlbt48IxlbJUZ
 lFYzCS21g/BSK9ZMVnUL7HYWDn50t+pM1INEEIBQ5AsJCi270Tvxu8kIUOdoaRdqWDqN
 LdKM4F95TJHZln5DeneUSrC/pq1BPCPKDwCJykLMTyv7joE1m0BtaJadWuxcnj9N/lgo
 ocorhePv+DoHVUs6drB88JCMQsl8t7Uhbza2EV78ua9S+uNDFTjvFMfGwc5y+z7OSlwn
 tEEptaesmyHLKywg6vZF8lVflIfjqFsAn6hX62dd4LA5SLWl1vK/ZkVO0mA8MmJA0TNU
 mBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F27Ano31Gep1hj0U6MW2Dizj6/P0yKIdLsqatvpKEbo=;
 b=hTRlgKsNBd6H+KAQ0QjPdzMMTXAOwLDlcJkkVVTqQfCe6u3tuebevCZg4UZjRYTP7r
 aP8VJNMIAXkSQkueHxmsOc8Hg1aCtYNyajSbmI8laAP3ht91DARrnaMOTCR4LALjATE2
 d80ABG8NsUBSyXk8VioFdkDqEZ/tT9YOJCE8tkUo2dwbl6VOMyIPsDJcmMyQFIvllMG+
 +GWIsqPhbaFiHE+p25ftpBcVff6IidNGZtpo5MnPTNKTZDHoJgkNSzXV+iJVuafSzmG8
 +5yrWIThAYmcoeLbkPl43ac1bjgMtzVsMWukU2tljKygLG+6vaDNPuUXvoazRglZ2Q0O
 QF/A==
X-Gm-Message-State: AOAM532cg2NzJOjW9tx5ZRnoawP3B+W9cupMTMGO3K1OnZsdc5xVY80c
 vfrheOKFnnjw/Qy4HAokukcEnFoGYHuCBIQCO5Q=
X-Google-Smtp-Source: ABdhPJyJlu8wfl1aJNpaTZ5V3YB6DbK4MEWDOPlrcoP6ItwQCwvH/w7OEVjJPYopJeOElUdjIiX0ixFP3+78eq2HHbg=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr11434577jal.91.1616426356909; 
 Mon, 22 Mar 2021 08:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210306060152.7250-1-bmeng.cn@gmail.com>
In-Reply-To: <20210306060152.7250-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 11:17:20 -0400
Message-ID: <CAKmqyKMw_O+p5ni+aTPVS8_ihfRL5QkwHWCAKLX7CgpmKzyZvQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: m25p80: Support fast read for SST flashes
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 6, 2021 at 1:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
> the address bytes. Note only SPI mode is supported by SST flashes.
>
> [1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
> Changes in v2:
> - rebase on qemu/master
>
>  hw/block/m25p80.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 5f9471d83c..183d3f44c2 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -895,6 +895,9 @@ static void decode_fast_read_cmd(Flash *s)
>      s->needed_bytes = get_addr_length(s);
>      switch (get_man(s)) {
>      /* Dummy cycles - modeled with bytes writes instead of bits */
> +    case MAN_SST:
> +        s->needed_bytes += 1;
> +        break;
>      case MAN_WINBOND:
>          s->needed_bytes += 8;
>          break;
> --
> 2.25.1
>
>

