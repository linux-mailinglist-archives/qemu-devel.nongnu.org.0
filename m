Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13A3329FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:16:28 +0100 (CET)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe5z-0000X4-KU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdL6-000686-Ul; Tue, 09 Mar 2021 09:28:05 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:38288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdKx-0006dq-5L; Tue, 09 Mar 2021 09:27:59 -0500
Received: by mail-il1-x12e.google.com with SMTP id f10so12316489ilq.5;
 Tue, 09 Mar 2021 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWMCGsO2IXqhTuYUTz0jnig0e2Ub4psMekhB8cC22ug=;
 b=kFx+4hawekk48BqAyc9qoMiZxIWleajBsfE5Vc30vqKkxPXz7CkbNw6L6lJWWI6Wv/
 cOha/sCOzZwOFB0pvmw8B/gBZ1AdDNeexvhgM873BvEBF/UK+IPkipVohSQsIizDqoIL
 +FWbmd1ylaEpsHZJnxscTcZbirzn0sZ/JF47IRA1+1fLg1N/mJhtnPcRknSGkgP9YMTp
 ixz/HMSyCapq4tk08hLJC5spMKyECeyyVDDlf4EV7EZmbrfFL2JvC43FFnQLUPaDetaY
 BopdMap4RSK6MSOlvfgp//O2DGCZGgvFgqhz7Mi3lSnG5BXKscr4KCrhtMffQV9LJ4cV
 JJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWMCGsO2IXqhTuYUTz0jnig0e2Ub4psMekhB8cC22ug=;
 b=A4iyjP6xqsmduO8b0Z3sCdkGMR5aKe2h7tVp88hJrXokpWeX2pK0ID8653V0PqXNIy
 U9P1ScQEb8g0qd7Tz4o52++I+aBKyW3Anb1mc1Cjt78iIrX5Ayz5P9KVzrwjD9ijmCz/
 GnHTM7QQJAHo8TL8PcuoWqfwNspKVqkAxubdIJViqc4AxD76OcirpOPbyWrKhywCuzdP
 l47gAkHgWUypBvMm+eVQVTYC5G3Sw/tZj5/rUxQdGulov50mArXPpcQR7O8cw976ZaIa
 oDTNsBEvLhaWbgaI/bqsLzYeBss1oQ2fDx6MSMpjbyQEfyR46W4go9y9IDJOEdQuMpBo
 xPnA==
X-Gm-Message-State: AOAM531J2diHRpMI42Ac1ao5dlhZINhJw9BnyZ+rnKBb12wg5zsPX85l
 hX0IT59AtQ32Av3btk7ihzqgDDYSP/vr8+OUWPc=
X-Google-Smtp-Source: ABdhPJyuJQt9Jg/4yjhx0ETnZQ74Xv7OoQMaImps6i20YyRfZQF2k6Y2p0DxRgvE8irk6i1viuEpnVWwny5V0PMmctg=
X-Received: by 2002:a92:c102:: with SMTP id p2mr24162648ile.227.1615300069375; 
 Tue, 09 Mar 2021 06:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20210301073947.39451-1-jasowang@redhat.com>
 <20210301193343.324840-1-alxndr@bu.edu>
In-Reply-To: <20210301193343.324840-1-alxndr@bu.edu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:26:27 -0500
Message-ID: <CAKmqyKOwp=63RBGRPapwD9F+tJ48tT-WEBGksUW0025eQcw3XQ@mail.gmail.com>
Subject: Re: [PATCH] cadence_gem: switch to use qemu_receive_packet() for
 loopback
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-security@nongnu.org, P J P <ppandit@redhat.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 1, 2021 at 2:34 PM Alexander Bulekov <alxndr@bu.edu> wrote:
>
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/cadence_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 9a4474a084..1c576a130c 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1275,7 +1275,7 @@ static void gem_transmit(CadenceGEMState *s)
>                  /* Send the packet somewhere */
>                  if (s->phy_loop || (s->regs[GEM_NWCTRL] &
>                                      GEM_NWCTRL_LOCALLOOP)) {
> -                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
> +                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
>                                  total_bytes);
>                  } else {
>                      qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
> --
> 2.28.0
>
>

