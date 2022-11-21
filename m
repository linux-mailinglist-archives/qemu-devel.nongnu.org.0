Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89047632223
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:32:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5xs-0001GU-Fz; Mon, 21 Nov 2022 07:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ox5xo-0001G6-MD; Mon, 21 Nov 2022 07:31:52 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ox5xn-0000qi-4H; Mon, 21 Nov 2022 07:31:52 -0500
Received: by mail-yb1-xb31.google.com with SMTP id e68so13403511ybh.2;
 Mon, 21 Nov 2022 04:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hq4IPEJ80vwuMqUgMF0/Lno9/MCiKQ+3WrldK8L1a7M=;
 b=jbosdRu/WQuqQ/qF9qVa5Tq8YWSyZImCAqbXCl4Rsgg+vvfE8OT9aokZy345bKX1CT
 OV5ZrdnQ4XRhYSQsLICkwJ1gYPArVbqyeKwAnVQVuQsrK5EWzys8gZo7ws5gX5E9QfU6
 pDGigfoAv44YXBhZ93QVYCs0wIh4ytzl6YxQgjNKKXODBHmaCNVe7LmX2m3XfDBDRg0W
 yaa31LTQ6wro2OS8uILxHjIjUk+T3WGa9LbROYVQPmrkvRnKZIvOYErJbobcaXT1bd97
 JDNQDLcriReKlH3Pdb46Nles0lpKR4bf2HFQTVkSbRw9TQwnbMCKLhFA7z8uS2zEMhZp
 BddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hq4IPEJ80vwuMqUgMF0/Lno9/MCiKQ+3WrldK8L1a7M=;
 b=3V8aO3iy6uQ5fvAP8VDzeR1zo/29cuL+C8WFfRMiVbrMge0183wYdR5p0w/Nv/PxD/
 njWj7qT7SDPkFMS7zwoR/v3XpDdBQQrkWsfcxnbgbd5FvDEbCb8JbeunvUm+gc/PGELV
 +UPrR/os/Se4O3XXL/PolRDAIdfJK5mjHPrqGrdhnmqMM2f5AiepxSf7jU27jZX16+VE
 TaYFwtlFhf2FD8kGEn1OLXhnlN+3iqxkpRT+Ourls1q6dCSvQHAKs0Og8HT7ovMFcqsZ
 zZLXTFyco8Xwtdz7ipNYvHhBV2tROtgkRwuw3fM8DXmgJFH2JW2jWK85d+BLEPRaKuoU
 LX0w==
X-Gm-Message-State: ANoB5pl3f26iJNW9ydfYogT9RxG5KRbJWyad+xPepFu8zvDbw8YZBHH5
 qoDJYbtIWMa5MmC9J9Wjmfe+X2yhqCgrEINFTjQ=
X-Google-Smtp-Source: AA0mqf4IQ2gsZhKNgAOx2WMPd9bpcPXT3xr8O4FIWV0GmxIHmT5useHkgaltXsIFKLSRcnM/xSoipahR7B6v+uaF0b8=
X-Received: by 2002:a25:bcc4:0:b0:6e7:38f3:2bf7 with SMTP id
 l4-20020a25bcc4000000b006e738f32bf7mr831381ybm.207.1669033909419; Mon, 21 Nov
 2022 04:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-2-stefanha@redhat.com>
 <CACGkMEumg2VH8eBoz7sUjtPVVeRLv=fbZfReLHtgPA4ei_=PcQ@mail.gmail.com>
In-Reply-To: <CACGkMEumg2VH8eBoz7sUjtPVVeRLv=fbZfReLHtgPA4ei_=PcQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 07:31:37 -0500
Message-ID: <CAJSP0QVg1oWUFUF+x5-5oM=9ZL+LSXZFCF-bwk+8GYJmX93o7g@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v3 1/3] rtl8139: avoid clobbering tx descriptor
 bits
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Tobias Fiebig <tobias+git@fiebig.nl>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sun, 20 Nov 2022 at 23:17, Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Nov 18, 2022 at 12:56 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The device turns the Tx Descriptor into a Tx Status descriptor after
> > fully reading the descriptor. This involves clearing Tx Own (bit 31) to
> > indicate that the driver has ownership of the descriptor again as well
> > as several other bits.
> >
> > The code keeps the first dword of the Tx Descriptor in the txdw0 local
> > variable. txdw0 is reused to build the first word of the Tx Status
> > descriptor. Later on the code uses txdw0 again, incorrectly assuming
> > that it still contains the first dword of the Tx Descriptor. The tx
> > offloading code misbehaves because it sees bogus bits in txdw0.
>
> (This is only noticeable with patch 2).

Yes, although the large_send_mss variable is already junk because some
bits have been cleared:
int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;

Luckily it's not used yet, aside from DPRINTF().

>
> >
> > Use a separate local variable for Tx Status and preserve Tx Descriptor
> > in txdw0.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> > ---
> >  hw/net/rtl8139.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> > index e6643e3c9d..ffef3789b5 100644
> > --- a/hw/net/rtl8139.c
> > +++ b/hw/net/rtl8139.c
> > @@ -2027,18 +2027,21 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
> >              s->currCPlusTxDesc = 0;
> >      }
> >
> > +    /* Build the Tx Status Descriptor */
> > +    uint32_t tx_status = txdw0;
> > +
> >      /* transfer ownership to target */
> > -    txdw0 &= ~CP_TX_OWN;
> > +    tx_status &= ~CP_TX_OWN;
> >
> >      /* reset error indicator bits */
> > -    txdw0 &= ~CP_TX_STATUS_UNF;
> > -    txdw0 &= ~CP_TX_STATUS_TES;
> > -    txdw0 &= ~CP_TX_STATUS_OWC;
> > -    txdw0 &= ~CP_TX_STATUS_LNKF;
> > -    txdw0 &= ~CP_TX_STATUS_EXC;
> > +    tx_status &= ~CP_TX_STATUS_UNF;
> > +    tx_status &= ~CP_TX_STATUS_TES;
> > +    tx_status &= ~CP_TX_STATUS_OWC;
> > +    tx_status &= ~CP_TX_STATUS_LNKF;
> > +    tx_status &= ~CP_TX_STATUS_EXC;
> >
> >      /* update ring data */
> > -    val = cpu_to_le32(txdw0);
> > +    val = cpu_to_le32(tx_status);
> >      pci_dma_write(d, cplus_tx_ring_desc, (uint8_t *)&val, 4);
> >
> >      /* Now decide if descriptor being processed is holding the last segment of packet */
> > --
> > 2.38.1
> >
>
>

