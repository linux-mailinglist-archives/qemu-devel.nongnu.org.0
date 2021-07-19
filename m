Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C03CCDC4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:05:48 +0200 (CEST)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5MPT-0006vn-2m
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5MOX-0006HQ-IP
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:04:49 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5MOV-00084I-U5
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:04:49 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k16so18648982ios.10
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 23:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzVNd7NZDB2j1dVriwzPrWm9wpAwGSYGw6/aGEcfA3U=;
 b=Cv0JiK+vjWhQQjYpstNgiDfsN+SFUcEviN4v4ySNKCHdVcZ3Lm08du9b4rBcxGfE64
 BfJ3Od5MsxPUZzqFEgvD02cPQA54EWQyQhHQZEmCt6P7yyrq4Bg8w0E1GyA1srR2EGNK
 10BCc7g3dhTdIpa9xNtJVqUglixD/macsRMbsXN9QV1FaB0IFgzbgAgGKix50XvSsbVc
 s+RD+yHynwK1WvbftjJk3GeV4ugmqR7zAQ1i3xcczkGBC6D7ywZmIgJ15fgtXiMSnVwr
 6mts8eTUtGs6QoUmz4RNVSFp2aiN3WT2YIz/4ZxWDXVS66oYqM6tj075tjAf0cs7AlQT
 gkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzVNd7NZDB2j1dVriwzPrWm9wpAwGSYGw6/aGEcfA3U=;
 b=iRBE/2B+J+uLboeVFx1T+lHE1t+BtwE4pYFWe8g9iE3BGK1XcBGFMjg4+AOxIrfxaa
 tHtUNaGxV4Wq6fHejEGwzsY1YM7yWsNsMz/vhPg4yetFnl0wrBB5OIql2g3V3hhJZJ7M
 GJILHdafXy4LNm3zoHdg90eXzlEcnOjQsMQ+ke2jp1VEpQ2oMn68/ogYKt13KJUuv+R0
 jlstdREKGfqdcH3QFUEG8mJk8H/BcbLFjec7T33FFcmt0e97UWSsGsp7vr7T1ru6DQg+
 PujohuwZkvN+DTbuDvTmBug5Rfw8By2IUD8aggrVttG59TWkiIowqMffq+bbCtpPueU3
 xDZw==
X-Gm-Message-State: AOAM533iaafhMO1V0ZQdzvaTjS7Ib34bTlpIBqjTTmWAL7dnvej2TQHo
 3pr+H758Tyj9IhECHMgu3PkPYXHB10hgt/mWZdc=
X-Google-Smtp-Source: ABdhPJy95JuLKlT1o7vJc1xYjuFGbA7LLN7hM/kIORkI44sQ4rqJvN1guwnAw/A2D5QXC1frViM18bHSODbx8KIcack=
X-Received: by 2002:a02:cf31:: with SMTP id s17mr20414322jar.46.1626674686314; 
 Sun, 18 Jul 2021 23:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210715193219.1132571-1-thuth@redhat.com>
In-Reply-To: <20210715193219.1132571-1-thuth@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 19 Jul 2021 08:04:35 +0200
Message-ID: <CAM9Jb+iiyPTKniFjm6c29Y1_Lnk0aj2j-M6h-3RC6SOkwRXiOw@mail.gmail.com>
Subject: Re: [PATCH] hw/net/net_tx_pkt: Fix crash detected by fuzzer
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> QEMU currently crashes when it's started like this:
>
> cat << EOF | ./qemu-system-i386 -device vmxnet3 -nodefaults -qtest stdio
> outl 0xcf8 0x80001014
> outl 0xcfc 0xe0001000
> outl 0xcf8 0x80001018
> outl 0xcf8 0x80001004
> outw 0xcfc 0x7
> outl 0xcf8 0x80001083
> write 0x0 0x1 0xe1
> write 0x1 0x1 0xfe
> write 0x2 0x1 0xbe
> write 0x3 0x1 0xba
> writeq 0xe0001020 0xefefff5ecafe0000
> writeq 0xe0001020 0xffff5e5ccafe0002
> EOF
>
> It hits this assertion:
>
> qemu-system-i386: ../qemu/hw/net/net_tx_pkt.c:453: net_tx_pkt_reset:
>  Assertion `pkt->raw' failed.
>
> This happens because net_tx_pkt_init() is called with max_frags == 0 and
> thus the allocation
>
>     p->raw = g_new(struct iovec, max_frags);
>
> results in a NULL pointer that cause the
>
>     assert(pkt->raw);
>
> in net_tx_pkt_reset() to fail later. To fix this issue we can check
> that max_raw_frags was not zero before asserting that pkt->raw is
> a non-NULL pointer.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1890157
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/net/net_tx_pkt.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 1f9aa59eca..1cb1125d9f 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -450,11 +450,13 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt)
>      pkt->payload_len = 0;
>      pkt->payload_frags = 0;
>
> -    assert(pkt->raw);
> -    for (i = 0; i < pkt->raw_frags; i++) {
> -        assert(pkt->raw[i].iov_base);
> -        pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base, pkt->raw[i].iov_len,
> -                      DMA_DIRECTION_TO_DEVICE, 0);
> +    if (pkt->max_raw_frags > 0) {
> +        assert(pkt->raw);
> +        for (i = 0; i < pkt->raw_frags; i++) {
> +            assert(pkt->raw[i].iov_base);
> +            pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base,
> +                          pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, 0);
> +        }
>      }
>      pkt->raw_frags = 0;
>

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

