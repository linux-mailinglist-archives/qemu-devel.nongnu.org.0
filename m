Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A7631920
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 05:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owyEN-0004Fe-1j; Sun, 20 Nov 2022 23:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owyEJ-0004FA-53
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owyED-0004qR-W7
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669004176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L7lFnzrPvSB18IRPZWxWkBJXK+gL5xkolmJQg90ghXc=;
 b=aEOvw9L3t7xPXsGJInIiumF7PPKOnacYbMpAsYEAgWfuLdhcBqRq0uHUBG3aOUb1jXfhvH
 cs6cVp5TTh0wefSwkYOfZB9+CT+yGwCnwuWJS0NVH4OsQZ10p3IDpcFtXDyDAn8Wy8RBu8
 qJvFg9+K4MzMzkCMojKgMF6DR79/W4w=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-rBX_AdLBPCOC9QFplZM8yw-1; Sun, 20 Nov 2022 23:16:14 -0500
X-MC-Unique: rBX_AdLBPCOC9QFplZM8yw-1
Received: by mail-oo1-f71.google.com with SMTP id
 k13-20020a4adfad000000b0049f0c8d234bso4748056ook.11
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 20:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7lFnzrPvSB18IRPZWxWkBJXK+gL5xkolmJQg90ghXc=;
 b=WIlUJDEoypHfL2GxIXtr/qypiOpdusGjRv3qkguK5zWcTpj6SfeESsAe8fjSMF6cE0
 2hfVeKZaqQf7fb0l07APSB3BbjaXaRreuazvV/EosReGos9LGAC/a3mvl5CRlMhFLH/a
 KmMeTDq+iWZ62giehR7JZXWSD3VBKbDpj2cnyAxcvhS5EUb6WJwXeQK0z86xDajErs7E
 6wQmfzhm10db9yB0wwX/2zy82VKSlZ1ozwpnVzoFmDHw412m7mY3DQdGEfQOUyfLFhpq
 Rdgafc9SnNB6Dd9v4TqBettKg/r5ki6NMPfU85lPeaTsh9cmOpel4oMt4+bi6Zs238Dj
 is5A==
X-Gm-Message-State: ANoB5pkQJ5JGy5vsnTYcDp2WcWNI8ttSBIuZhgzaBWU53fZM2rQ2gE7F
 O7GUC/xYuyiIfHBaoAA3cb/Yhi0xjj38SYzpAvv8jjRsxe7fNXmqpOV2PqyGYyS9YqloWa1NGLR
 N6GjUS8K8+4lycrsHG3HDVJtwzxcsY7Q=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr58092oab.35.1669004174275; 
 Sun, 20 Nov 2022 20:16:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4yyj+gsDpA7LVJTbH61dkAvHzQpWCgUs47hbE5C1+kpDCm2L5pJ4NweRe8b//UR1RqEAkJF+bcSofFZn9GM7I=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr58084oab.35.1669004174039; Sun, 20 Nov
 2022 20:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-2-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-2-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Nov 2022 12:16:02 +0800
Message-ID: <CACGkMEumg2VH8eBoz7sUjtPVVeRLv=fbZfReLHtgPA4ei_=PcQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v3 1/3] rtl8139: avoid clobbering tx descriptor
 bits
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Tobias Fiebig <tobias+git@fiebig.nl>,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 18, 2022 at 12:56 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The device turns the Tx Descriptor into a Tx Status descriptor after
> fully reading the descriptor. This involves clearing Tx Own (bit 31) to
> indicate that the driver has ownership of the descriptor again as well
> as several other bits.
>
> The code keeps the first dword of the Tx Descriptor in the txdw0 local
> variable. txdw0 is reused to build the first word of the Tx Status
> descriptor. Later on the code uses txdw0 again, incorrectly assuming
> that it still contains the first dword of the Tx Descriptor. The tx
> offloading code misbehaves because it sees bogus bits in txdw0.

(This is only noticeable with patch 2).

>
> Use a separate local variable for Tx Status and preserve Tx Descriptor
> in txdw0.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/rtl8139.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index e6643e3c9d..ffef3789b5 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -2027,18 +2027,21 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>              s->currCPlusTxDesc = 0;
>      }
>
> +    /* Build the Tx Status Descriptor */
> +    uint32_t tx_status = txdw0;
> +
>      /* transfer ownership to target */
> -    txdw0 &= ~CP_TX_OWN;
> +    tx_status &= ~CP_TX_OWN;
>
>      /* reset error indicator bits */
> -    txdw0 &= ~CP_TX_STATUS_UNF;
> -    txdw0 &= ~CP_TX_STATUS_TES;
> -    txdw0 &= ~CP_TX_STATUS_OWC;
> -    txdw0 &= ~CP_TX_STATUS_LNKF;
> -    txdw0 &= ~CP_TX_STATUS_EXC;
> +    tx_status &= ~CP_TX_STATUS_UNF;
> +    tx_status &= ~CP_TX_STATUS_TES;
> +    tx_status &= ~CP_TX_STATUS_OWC;
> +    tx_status &= ~CP_TX_STATUS_LNKF;
> +    tx_status &= ~CP_TX_STATUS_EXC;
>
>      /* update ring data */
> -    val = cpu_to_le32(txdw0);
> +    val = cpu_to_le32(tx_status);
>      pci_dma_write(d, cplus_tx_ring_desc, (uint8_t *)&val, 4);
>
>      /* Now decide if descriptor being processed is holding the last segment of packet */
> --
> 2.38.1
>


