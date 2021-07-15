Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9A3CADE1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 22:26:46 +0200 (CEST)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m47wT-00082e-Ky
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 16:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m47vF-00076e-DJ
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:25:29 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m47vD-0003YP-ML
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:25:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5886454wmc.1
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1XY6MTSmIlRlMLzkoNKr6xmVbTO2Onkhu7OCS5lm/FA=;
 b=GKTvM2Q6GSCQcnR++9VZY0gnNGg1gTjWtMZAduCuQ4V4sjZ3ZJOGPZh2mBabi1zbpY
 v1yXit5bNnyBlt5UtweVtRAxlcHgi7B735JeiF+7DBL0Frz1qeD9HgGlLjGubUfO3z9P
 GJyCd24pnqHQJykqplyg9pIZ3sEI98bpezK8BO7wcoiuB2iNZGD0eaguVz+jSrzgvmh0
 lLXUezqP1LmYwsKlW4MikMNoScGdoskvoSgkBLZb5Oc6p3bTYw2aY2BX5yul0rk6wKIA
 evqavhNchyXIQGdzSFHEkqjrRWdmVM1DkMGHUy6XTgF3bLbO4A9zklknOYoQGqw4F/a0
 FTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1XY6MTSmIlRlMLzkoNKr6xmVbTO2Onkhu7OCS5lm/FA=;
 b=uO4iiwER/aoXrbV60cw8X9WTSRvDdfCp0qjZyyzsXTLndBA5N1nWabrKgB7O+jx2b+
 yLMFAZF3w9PftRUVY4jKz3xxnBN/ErZkvYr72WHfdf2An+Q5zBNxLGpRK2fqVy2nazeT
 46ip3wzsMGgN7C61kf8sIbi74l+eZggNePsByrRUulU+i8zICKQVSxkuOEYcRhplIoSe
 FkkN9TZOplG6qD1NBpwkD7JeoGzdCtqHEa18FUFtOaHcR9bkbaDWD702YtQ2iIfsgqTP
 5iiAevbkHl4/O6YQgxyBwNhlYDSz/X1s0IoX0ix9bdTtPkR2q43fXSWZIev7cGUWipy2
 HZbA==
X-Gm-Message-State: AOAM5317eplgj7Q7eVIIrDO4mXMp7n5SzR4fo65d5e9dFTGlJqKIi08d
 O8t5fsibPhOrf/ZgY5AUPRU=
X-Google-Smtp-Source: ABdhPJxXofEyxH74xez2Ri7NPHHdJoXciGapGG2C94tRgD8jAtzyHbge9R02C70GPa+kggRNZjD2hQ==
X-Received: by 2002:a1c:59c9:: with SMTP id n192mr6407862wmb.81.1626380725709; 
 Thu, 15 Jul 2021 13:25:25 -0700 (PDT)
Received: from [192.168.1.24] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id e3sm7733439wra.15.2021.07.15.13.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 13:25:24 -0700 (PDT)
Subject: Re: [PATCH] hw/net/net_tx_pkt: Fix crash detected by fuzzer
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20210715193219.1132571-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08bb91aa-c23d-4b7c-3fe8-ea630506c434@amsat.org>
Date: Thu, 15 Jul 2021 22:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715193219.1132571-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 9:32 PM, Thomas Huth wrote:
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

"that causes"?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
> 


