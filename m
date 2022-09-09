Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358405B2C3A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 04:42:30 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWTyO-0002LP-Qg
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 22:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWTwz-0000zo-BE
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 22:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWTwv-000652-NP
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 22:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662691256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9da+3wl0ItPl7v3wZbpY5o6PlfFZA/Z00jV8+ewizw=;
 b=fDDdPHs2asOrxYqHwbj1vrNtNyWgibopN41nJjz7Tv5wenn9HJ99JoFBcn9xK5vm25GSib
 b/LG3eEEafB6GLPMnOzGIKrkxx+2NaPx4eTiVs93ptnvix/okSIkEOUZ1ALSFa7U3In7t1
 lqG0+LzDpHRPqtoiXwb683oSRYW9IT8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-QsL2hw70NYqSssmv_UCbyg-1; Thu, 08 Sep 2022 22:40:54 -0400
X-MC-Unique: QsL2hw70NYqSssmv_UCbyg-1
Received: by mail-vs1-f70.google.com with SMTP id
 i185-20020a676dc2000000b003981e7bbb80so32685vsc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 19:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I9da+3wl0ItPl7v3wZbpY5o6PlfFZA/Z00jV8+ewizw=;
 b=5U+li1Yp27NQgJxyWJ7Mq33kDdy7zBXxqWP2CoF3QSH3ML/DNbL0idja3cgHS41VD6
 c2agFow0Rgjq7UNI7VrFckVeZ6JFxAAYZ1lnhk2w3pqLxYEPa5BlmBIzi/EwBFQyncos
 6n5mEa5NsCgWlAuuJhZg1oI37CaORMbyAkybiV1nBvimdx9LBmpPSbIJtDAd+GvnAAq/
 oKbLSk2FHERGpGtqnwAYvcmMbIUblrn03Lr0lPp7Kdr+tCKrMzs7oDJbp/o7Trh3lyN+
 7HkvNWYuBn86D4e0+JktHJLHmARpr4IU2cmTM/5AN6UJQhd/Tbe7giZbqGdcY2V0ZcUG
 Nvdw==
X-Gm-Message-State: ACgBeo2BK7drYTeDWXg5NN11h+eDSEdyt6JbvSiIZF0tJMC69MoR8aXN
 S3ckrDjdThfdWSrQzVsY2vflHBKy58n+Vs1cKvPkH1nokKhRAzd1uMZm3YtF+a/NJTKR1WStOuc
 CSQoGlk/9FzZNN+mT3hjq+FMTDC5rKC0=
X-Received: by 2002:ab0:1473:0:b0:396:d89d:3a87 with SMTP id
 c48-20020ab01473000000b00396d89d3a87mr4031813uae.73.1662691254259; 
 Thu, 08 Sep 2022 19:40:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wnoXiB7IcCKUXWHv/o6eo0rH1BQa18smUr+7Qfe15ctoMDGYe8LG5HoxxRNXPA+Aaduu9P2PwiepXW4yUeSg=
X-Received: by 2002:ab0:1473:0:b0:396:d89d:3a87 with SMTP id
 c48-20020ab01473000000b00396d89d3a87mr4031807uae.73.1662691254005; Thu, 08
 Sep 2022 19:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220826160543.2120-1-dinghui@sangfor.com.cn>
In-Reply-To: <20220826160543.2120-1-dinghui@sangfor.com.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Sep 2022 10:40:42 +0800
Message-ID: <CACGkMEtN3=6GAvYfjTstk_JFa+8nKGsWN5NzR+TRD4LfxyS9XA@mail.gmail.com>
Subject: Re: [PATCH] e1000e: set RX desc status with DD flag in a separate
 operation
To: Ding Hui <dinghui@sangfor.com.cn>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, georgmueller@gmx.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Aug 27, 2022 at 12:06 AM Ding Hui <dinghui@sangfor.com.cn> wrote:
>
> Like commit 034d00d48581 ("e1000: set RX descriptor status in
> a separate operation"), there is also same issue in e1000e, which
> would cause lost packets or stop sending packets to VM with DPDK.
>
> Do similar fix in e1000e.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/402
> Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
> ---
>  hw/net/e1000e_core.c | 54 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 208e3e0d79..b8038e4014 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -1364,6 +1364,58 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
>      }
>  }
>
> +static inline void
> +e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
> +                             uint8_t *desc, dma_addr_t len)
> +{
> +    PCIDevice *dev = core->owner;
> +
> +    if (e1000e_rx_use_legacy_descriptor(core)) {
> +        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
> +        size_t offset = offsetof(struct e1000_rx_desc, status);
> +        typeof(d->status) status = d->status;
> +
> +        d->status &= ~E1000_RXD_STAT_DD;
> +        pci_dma_write(dev, addr, desc, len);
> +
> +        if (status & E1000_RXD_STAT_DD) {
> +            d->status = status;
> +            pci_dma_write(dev, addr + offset, &status, sizeof(status));
> +        }
> +    } else {
> +        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
> +            union e1000_rx_desc_packet_split *d =
> +                (union e1000_rx_desc_packet_split *) desc;
> +            size_t offset = offsetof(union e1000_rx_desc_packet_split,
> +                wb.middle.status_error);
> +            typeof(d->wb.middle.status_error) status =
> +                d->wb.middle.status_error;

Any reason to use typeof here? Its type is known to be uint32_t?

> +
> +            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
> +            pci_dma_write(dev, addr, desc, len);
> +
> +            if (status & E1000_RXD_STAT_DD) {
> +                d->wb.middle.status_error = status;
> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
> +            }
> +        } else {
> +            union e1000_rx_desc_extended *d =
> +                (union e1000_rx_desc_extended *) desc;
> +            size_t offset = offsetof(union e1000_rx_desc_extended,
> +                wb.upper.status_error);
> +            typeof(d->wb.upper.status_error) status = d->wb.upper.status_error;

So did here.

Thanks

> +
> +            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
> +            pci_dma_write(dev, addr, desc, len);
> +
> +            if (status & E1000_RXD_STAT_DD) {
> +                d->wb.upper.status_error = status;
> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
> +            }
> +        }
> +    }
> +}
> +
>  typedef struct e1000e_ba_state_st {
>      uint16_t written[MAX_PS_BUFFERS];
>      uint8_t cur_idx;
> @@ -1600,7 +1652,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>
>          e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
>                             rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
> -        pci_dma_write(d, base, &desc, core->rx_desc_len);
> +        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
>
>          e1000e_ring_advance(core, rxi,
>                              core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
> --
> 2.17.1
>


