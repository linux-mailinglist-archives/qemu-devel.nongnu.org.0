Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260A6C802E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:45:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfeyF-0002Z8-Gt; Fri, 24 Mar 2023 06:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfeyD-0002Yi-Ai
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfeuA-0007ME-59
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679654655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sV8sW6G8LxDbKLoVfX3nws8KsNXD6aWCfmb6I11k1no=;
 b=Uq1sBaDVGk67wtQJO4e5WPK+OSgkvJiHuF5tOVfha9Vl8fq9yrlP3OIFpEOj67YHHDDIgo
 VVJYoQgptUr+JG1qSOtRhuluccR2T7+D7eS1TalTQ7slQdymsOiZmK1db/S9a3Pyh2dPl7
 Qr0XeJbF7IqedCwTi/b2bDW55GDkSwo=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-IEtFdYsYNTWl2PDy1Mfjfg-1; Fri, 24 Mar 2023 03:43:05 -0400
X-MC-Unique: IEtFdYsYNTWl2PDy1Mfjfg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1778b36a88dso544151fac.17
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 00:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679643785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sV8sW6G8LxDbKLoVfX3nws8KsNXD6aWCfmb6I11k1no=;
 b=epHKBV9Ojz2ppMY+VvobDkzQdm2SCpia+9LBi55iwFKjFF0fC0pLESaB9rcLj4LnU8
 tX87VF7KI0dd7e8lMhnck1dJXwPJik5CKh1W18LrAtZf1iiA8nSt3MHD5FBGyTDXX6hI
 84RsajF2LDwyM6BtBT3MgFcDTn4uzQK9NVdFo57P3j0Iv+Sslc3/LKhGm0C1+xWuMtC4
 XCNy9U6TUvxArncKY4WXGL06mk8sN36KpAaMoUSu8d2WQgd/EIV+nGKYski4fiN42ox9
 Md6fgO0ca46rrX9wqfzShq+DJXKoI/szRlr2BBezi72KETKAXXp4QtfxKj3FG/YjLFxu
 kJ9w==
X-Gm-Message-State: AO0yUKU03BKcABsndynCT4fDp23GJm5Q6c24FUfiY+kwMib/IRUfVIb8
 BMiPuhdaTzRYdXi+1k2lzXmFF/xf1fMlg0NNoGWxuxt0PJwuGh4MKxu+KOVwSGmTPeCdFvhUAkz
 2txSvm2NfnxjEPa9eHHFaztqFVJJItok=
X-Received: by 2002:a05:6808:171c:b0:387:5a8c:4125 with SMTP id
 bc28-20020a056808171c00b003875a8c4125mr652823oib.3.1679643784455; 
 Fri, 24 Mar 2023 00:43:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set+yfUGPa4N8xzOvP/lDRSsBGiAkVGsp+WTKLRsoV039hVPIxgQfJPKn8XSvICVA7pgngSsEV4MbsgdNhTfY7Yo=
X-Received: by 2002:a05:6808:171c:b0:387:5a8c:4125 with SMTP id
 bc28-20020a056808171c00b003875a8c4125mr652809oib.3.1679643783264; Fri, 24 Mar
 2023 00:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230316122911.11086-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230316122911.11086-1-akihiko.odaki@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Mar 2023 15:42:52 +0800
Message-ID: <CACGkMEsYDxrp7rC06GJ4pXHzhZnG98KWbh9oYMpd9FDW9TUH4A@mail.gmail.com>
Subject: Re: [PATCH for 8.0] igb: Fix DMA requester specification for Tx packet
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 16, 2023 at 8:29=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> igb used to specify the PF as DMA requester when reading Tx packets.
> This made Tx requests from VFs to be performed on the address space of
> the PF, defeating the purpose of SR-IOV. Add some logic to change the
> requester depending on the queue, which can be assigned to a VF.
>
> Fixes: 3a977deebe ("Intrdocue igb device emulation")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/net/e1000e_core.c |  6 +++---
>  hw/net/igb_core.c    | 13 ++++++++-----
>  hw/net/net_tx_pkt.c  |  3 ++-
>  hw/net/net_tx_pkt.h  |  3 ++-
>  hw/net/vmxnet3.c     |  4 ++--
>  5 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 4d9679ca0b..c0c09b6965 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -765,7 +765,7 @@ e1000e_process_tx_desc(E1000ECore *core,
>          }
>
>          tx->skip_cp =3D false;
> -        net_tx_pkt_reset(tx->tx_pkt);
> +        net_tx_pkt_reset(tx->tx_pkt, core->owner);
>
>          tx->sum_needed =3D 0;
>          tx->cptse =3D 0;
> @@ -3447,7 +3447,7 @@ e1000e_core_pci_uninit(E1000ECore *core)
>      qemu_del_vm_change_state_handler(core->vmstate);
>
>      for (i =3D 0; i < E1000E_NUM_QUEUES; i++) {
> -        net_tx_pkt_reset(core->tx[i].tx_pkt);
> +        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
>          net_tx_pkt_uninit(core->tx[i].tx_pkt);
>      }
>
> @@ -3572,7 +3572,7 @@ static void e1000e_reset(E1000ECore *core, bool sw)
>      e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_ma=
c);
>
>      for (i =3D 0; i < ARRAY_SIZE(core->tx); i++) {
> -        net_tx_pkt_reset(core->tx[i].tx_pkt);
> +        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
>          memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
>          core->tx[i].skip_cp =3D false;
>      }
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index a7c7bfdc75..41d1abae03 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -521,6 +521,7 @@ igb_on_tx_done_update_stats(IGBCore *core, struct Net=
TxPkt *tx_pkt)
>
>  static void
>  igb_process_tx_desc(IGBCore *core,
> +                    PCIDevice *dev,
>                      struct igb_tx *tx,
>                      union e1000_adv_tx_desc *tx_desc,
>                      int queue_index)
> @@ -585,7 +586,7 @@ igb_process_tx_desc(IGBCore *core,
>
>          tx->first =3D true;
>          tx->skip_cp =3D false;
> -        net_tx_pkt_reset(tx->tx_pkt);
> +        net_tx_pkt_reset(tx->tx_pkt, dev);
>      }
>  }
>
> @@ -800,6 +801,8 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>          d =3D core->owner;
>      }
>
> +    net_tx_pkt_reset(txr->tx->tx_pkt, d);
> +
>      while (!igb_ring_empty(core, txi)) {
>          base =3D igb_ring_head_descr(core, txi);
>
> @@ -808,7 +811,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>          trace_e1000e_tx_descr((void *)(intptr_t)desc.read.buffer_addr,
>                                desc.read.cmd_type_len, desc.wb.status);
>
> -        igb_process_tx_desc(core, txr->tx, &desc, txi->idx);
> +        igb_process_tx_desc(core, d, txr->tx, &desc, txi->idx);
>          igb_ring_advance(core, txi, 1);
>          eic |=3D igb_txdesc_writeback(core, base, &desc, txi);
>      }
> @@ -3825,7 +3828,7 @@ igb_core_pci_realize(IGBCore        *core,
>      core->vmstate =3D qemu_add_vm_change_state_handler(igb_vm_state_chan=
ge, core);
>
>      for (i =3D 0; i < IGB_NUM_QUEUES; i++) {
> -        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_=
FRAGS);
> +        net_tx_pkt_init(&core->tx[i].tx_pkt, NULL, E1000E_MAX_TX_FRAGS);
>      }
>
>      net_rx_pkt_init(&core->rx_pkt);
> @@ -3850,7 +3853,7 @@ igb_core_pci_uninit(IGBCore *core)
>      qemu_del_vm_change_state_handler(core->vmstate);
>
>      for (i =3D 0; i < IGB_NUM_QUEUES; i++) {
> -        net_tx_pkt_reset(core->tx[i].tx_pkt);
> +        net_tx_pkt_reset(core->tx[i].tx_pkt, NULL);
>          net_tx_pkt_uninit(core->tx[i].tx_pkt);
>      }
>
> @@ -4023,7 +4026,7 @@ static void igb_reset(IGBCore *core, bool sw)
>
>      for (i =3D 0; i < ARRAY_SIZE(core->tx); i++) {
>          tx =3D &core->tx[i];
> -        net_tx_pkt_reset(tx->tx_pkt);
> +        net_tx_pkt_reset(tx->tx_pkt, NULL);
>          tx->vlan =3D 0;
>          tx->mss =3D 0;
>          tx->tse =3D false;
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 986a3adfe9..cb606cc84b 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -443,7 +443,7 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt)
>  #endif
>  }
>
> -void net_tx_pkt_reset(struct NetTxPkt *pkt)
> +void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
>  {
>      int i;
>
> @@ -467,6 +467,7 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt)
>                            pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, =
0);
>          }
>      }
> +    pkt->pci_dev =3D pci_dev;
>      pkt->raw_frags =3D 0;
>
>      pkt->hdr_len =3D 0;
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index f57b4e034b..e5ce6f20bc 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -148,9 +148,10 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
>   * reset tx packet private context (needed to be called between packets)
>   *
>   * @pkt:            packet
> + * @dev:            PCI device processing the next packet

I've queued this patch, but please post a patch for post 8.0 to
replace the PCIDevice * with void *. We don't want to tightly couple
PCI devices with net_tx_pkt. But the user can store a context (e.g
PCIDevice) instead.

Thanks

>   *
>   */
> -void net_tx_pkt_reset(struct NetTxPkt *pkt);
> +void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
>
>  /**
>   * Send packet to qemu. handles sw offloads if vhdr is not supported.
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 1068b80868..f7b874c139 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -678,7 +678,7 @@ static void vmxnet3_process_tx_queue(VMXNET3State *s,=
 int qidx)
>              vmxnet3_complete_packet(s, qidx, txd_idx);
>              s->tx_sop =3D true;
>              s->skip_current_tx_pkt =3D false;
> -            net_tx_pkt_reset(s->tx_pkt);
> +            net_tx_pkt_reset(s->tx_pkt, PCI_DEVICE(s));
>          }
>      }
>  }
> @@ -1159,7 +1159,7 @@ static void vmxnet3_deactivate_device(VMXNET3State =
*s)
>  {
>      if (s->device_active) {
>          VMW_CBPRN("Deactivating vmxnet3...");
> -        net_tx_pkt_reset(s->tx_pkt);
> +        net_tx_pkt_reset(s->tx_pkt, PCI_DEVICE(s));
>          net_tx_pkt_uninit(s->tx_pkt);
>          net_rx_pkt_uninit(s->rx_pkt);
>          s->device_active =3D false;
> --
> 2.39.2
>


