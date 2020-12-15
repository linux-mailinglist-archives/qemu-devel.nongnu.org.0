Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03C2DA481
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:03:54 +0100 (CET)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxoo-0007Di-2Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1koxnR-0006F0-Cd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:02:29 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1koxnO-0001wE-MS
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:02:29 -0500
Received: by mail-oi1-x242.google.com with SMTP id q25so21310170oij.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tWOTZfeaUyjLRUwZZMDAxAvraMFlgPEkzZ+oCEYdeGA=;
 b=nUXe4D2/fj1UzJmwgk2wYjzOjtwf0aC+oQAq+QdC7SccLmkDrcPXE/aV6Ibo35+xq7
 ZO2jhl0LA8WayqS6lje4biMq1kf238YCuvI/hmsWJuXjsRkEy4y/tzWEmnTxDIRmc7HR
 ruX9ryD0KYAdK9e4OvDT9pSWRdbGTR+SN9bSDmhvBnxxVUdHz1mR/dGfsswDNMIwSCnE
 UUzqU0OqRug2x1d2xB5ZBaqJOXZW8fznTY0toI7R70JSlVH+aHnAMPaXkgyrjllGy26c
 Kti8sOTlcSw46A9DQXQAwyF0BA12k0XgPlJ/wKIEA4UqgIA7TVn53N74SxiPWfjXv9fc
 C8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=tWOTZfeaUyjLRUwZZMDAxAvraMFlgPEkzZ+oCEYdeGA=;
 b=CrKDSX27VL3eoE34GPQxmifGGOVLjvZZxrtCTHBSyST2Pkr9blj/bpSS2gjZioLpji
 qdw7DHCUqvqz8NXAoArxHB8pnnwQhJdLEWgLoR5IjthmKcn2Nyf3T7TcdePHxqzLGY2h
 b7bAuBORTmaKObOzWMwJebEIlibvKV5i/fhgYUlFm1PNYx+y//f8GikPw/6qJ7hawNlI
 GyUPtuWepKSHUP8u78GrWpvnuh0koxfE1pnKxnwKrVDD8PzCNp4XYv5Yqa2jigIBr25S
 QTmeO06wulEIcTwCu8KgN/WHPU4i3j3hT46leyuf75eOUcu6jX6dqUC9e13hsdnXHXhp
 vmAw==
X-Gm-Message-State: AOAM531zIybbCkttDGn98chSNZX4eqAw+OpRRmMb8Z41EajPymSGHewT
 GosBFMl4Gte9ODcmShqG7w==
X-Google-Smtp-Source: ABdhPJwGJN/Ny5K70Ijjv2KTbbQGu6j7resULhwwKK2uQdu4qvyNWjJqR32WgIW2D35deyd76CcF3g==
X-Received: by 2002:aca:4e11:: with SMTP id c17mr19219095oib.14.1607990543616; 
 Mon, 14 Dec 2020 16:02:23 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id y84sm4853228oig.36.2020.12.14.16.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 16:02:22 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:e1d1:5c34:e298:1bec])
 by serve.minyard.net (Postfix) with ESMTPSA id 4D9F7180575;
 Tue, 15 Dec 2020 00:02:21 +0000 (UTC)
Date: Mon, 14 Dec 2020 18:02:20 -0600
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] Remove superfluous timer_del() calls
Message-ID: <20201215000220.GR11017@minyard.net>
References: <20201214203050.6993-1-peter.maydell@linaro.org>
 <20201214203050.6993-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214203050.6993-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x242.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Reply-To: minyard@acm.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 08:30:50PM +0000, Peter Maydell wrote:
> This commit is the result of running the timer-del-timer-free.cocci
> script on the whole source tree.

For the ipmi portion:

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I could split this up into multiple patches -- is that worth while ?
> ---
>  block/iscsi.c                  | 2 --
>  block/nbd.c                    | 1 -
>  block/qcow2.c                  | 1 -
>  hw/block/nvme.c                | 2 --
>  hw/char/serial.c               | 2 --
>  hw/char/virtio-serial-bus.c    | 2 --
>  hw/ide/core.c                  | 1 -
>  hw/input/hid.c                 | 1 -
>  hw/intc/apic.c                 | 1 -
>  hw/intc/ioapic.c               | 1 -
>  hw/ipmi/ipmi_bmc_extern.c      | 1 -
>  hw/net/e1000.c                 | 3 ---
>  hw/net/e1000e_core.c           | 8 --------
>  hw/net/pcnet-pci.c             | 1 -
>  hw/net/rtl8139.c               | 1 -
>  hw/net/spapr_llan.c            | 1 -
>  hw/net/virtio-net.c            | 2 --
>  hw/s390x/s390-pci-inst.c       | 1 -
>  hw/sd/sd.c                     | 1 -
>  hw/sd/sdhci.c                  | 2 --
>  hw/usb/dev-hub.c               | 1 -
>  hw/usb/hcd-ehci.c              | 1 -
>  hw/usb/hcd-ohci-pci.c          | 1 -
>  hw/usb/hcd-uhci.c              | 1 -
>  hw/usb/hcd-xhci.c              | 1 -
>  hw/usb/redirect.c              | 1 -
>  hw/vfio/display.c              | 1 -
>  hw/virtio/vhost-vsock-common.c | 1 -
>  hw/virtio/virtio-balloon.c     | 1 -
>  hw/virtio/virtio-rng.c         | 1 -
>  hw/watchdog/wdt_diag288.c      | 1 -
>  hw/watchdog/wdt_i6300esb.c     | 1 -
>  migration/colo.c               | 1 -
>  monitor/hmp-cmds.c             | 1 -
>  net/announce.c                 | 1 -
>  net/colo-compare.c             | 1 -
>  net/slirp.c                    | 1 -
>  replay/replay-debugging.c      | 1 -
>  target/s390x/cpu.c             | 2 --
>  ui/console.c                   | 1 -
>  ui/spice-core.c                | 1 -
>  util/throttle.c                | 1 -
>  42 files changed, 58 deletions(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 7d4b3b56d5c..4d2a416ce77 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1524,12 +1524,10 @@ static void iscsi_detach_aio_context(BlockDriverState *bs)
>      iscsilun->events = 0;
>  
>      if (iscsilun->nop_timer) {
> -        timer_del(iscsilun->nop_timer);
>          timer_free(iscsilun->nop_timer);
>          iscsilun->nop_timer = NULL;
>      }
>      if (iscsilun->event_timer) {
> -        timer_del(iscsilun->event_timer);
>          timer_free(iscsilun->event_timer);
>          iscsilun->event_timer = NULL;
>      }
> diff --git a/block/nbd.c b/block/nbd.c
> index 42536702b6f..242a258f3a5 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -194,7 +194,6 @@ static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
>  static void reconnect_delay_timer_del(BDRVNBDState *s)
>  {
>      if (s->reconnect_delay_timer) {
> -        timer_del(s->reconnect_delay_timer);
>          timer_free(s->reconnect_delay_timer);
>          s->reconnect_delay_timer = NULL;
>      }
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 3a90ef27868..5d94f45be95 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -852,7 +852,6 @@ static void cache_clean_timer_del(BlockDriverState *bs)
>  {
>      BDRVQcow2State *s = bs->opaque;
>      if (s->cache_clean_timer) {
> -        timer_del(s->cache_clean_timer);
>          timer_free(s->cache_clean_timer);
>          s->cache_clean_timer = NULL;
>      }
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 01b657b1c5e..27d2c72716e 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1052,7 +1052,6 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
>  static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>  {
>      n->sq[sq->sqid] = NULL;
> -    timer_del(sq->timer);
>      timer_free(sq->timer);
>      g_free(sq->io_req);
>      if (sq->sqid) {
> @@ -1334,7 +1333,6 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
>  static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
>  {
>      n->cq[cq->cqid] = NULL;
> -    timer_del(cq->timer);
>      timer_free(cq->timer);
>      msix_vector_unuse(&n->parent_obj, cq->vector);
>      if (cq->cqid) {
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 62c627f486f..b8d5a1e9972 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -940,10 +940,8 @@ static void serial_unrealize(DeviceState *dev)
>  
>      qemu_chr_fe_deinit(&s->chr, false);
>  
> -    timer_del(s->modem_status_poll);
>      timer_free(s->modem_status_poll);
>  
> -    timer_del(s->fifo_timeout_timer);
>      timer_free(s->fifo_timeout_timer);
>  
>      fifo8_destroy(&s->recv_fifo);
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index cf08ef97281..b20038991a6 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -741,7 +741,6 @@ static void virtio_serial_post_load_timer_cb(void *opaque)
>          }
>      }
>      g_free(s->post_load->connected);
> -    timer_del(s->post_load->timer);
>      timer_free(s->post_load->timer);
>      g_free(s->post_load);
>      s->post_load = NULL;
> @@ -1138,7 +1137,6 @@ static void virtio_serial_device_unrealize(DeviceState *dev)
>      g_free(vser->ports_map);
>      if (vser->post_load) {
>          g_free(vser->post_load->connected);
> -        timer_del(vser->post_load->timer);
>          timer_free(vser->post_load->timer);
>          g_free(vser->post_load);
>      }
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index e85821637c9..b49e4cfbc6c 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -2716,7 +2716,6 @@ void ide_init2(IDEBus *bus, qemu_irq irq)
>  
>  void ide_exit(IDEState *s)
>  {
> -    timer_del(s->sector_write_timer);
>      timer_free(s->sector_write_timer);
>      qemu_vfree(s->smart_selftest_data);
>      qemu_vfree(s->io_buffer);
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index 89239b5634d..e1d2e460837 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -88,7 +88,6 @@ static void hid_idle_timer(void *opaque)
>  static void hid_del_idle_timer(HIDState *hs)
>  {
>      if (hs->idle_timer) {
> -        timer_del(hs->idle_timer);
>          timer_free(hs->idle_timer);
>          hs->idle_timer = NULL;
>      }
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 1c8be40d8b4..3ada22f4270 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -888,7 +888,6 @@ static void apic_unrealize(DeviceState *dev)
>  {
>      APICCommonState *s = APIC(dev);
>  
> -    timer_del(s->timer);
>      timer_free(s->timer);
>      local_apics[s->id] = NULL;
>  }
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index a3021a4de16..264262959d5 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -474,7 +474,6 @@ static void ioapic_unrealize(DeviceState *dev)
>  {
>      IOAPICCommonState *s = IOAPIC_COMMON(dev);
>  
> -    timer_del(s->delayed_ioapic_service_timer);
>      timer_free(s->delayed_ioapic_service_timer);
>  }
>  
> diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> index c3f3306e66b..47c4676cc64 100644
> --- a/hw/ipmi/ipmi_bmc_extern.c
> +++ b/hw/ipmi/ipmi_bmc_extern.c
> @@ -510,7 +510,6 @@ static void ipmi_bmc_extern_finalize(Object *obj)
>  {
>      IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(obj);
>  
> -    timer_del(ibe->extern_timer);
>      timer_free(ibe->extern_timer);
>  }
>  
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index d7d05ae30af..d8da2f6528b 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1647,11 +1647,8 @@ pci_e1000_uninit(PCIDevice *dev)
>  {
>      E1000State *d = E1000(dev);
>  
> -    timer_del(d->autoneg_timer);
>      timer_free(d->autoneg_timer);
> -    timer_del(d->mit_timer);
>      timer_free(d->mit_timer);
> -    timer_del(d->flush_queue_timer);
>      timer_free(d->flush_queue_timer);
>      qemu_del_nic(d->nic);
>  }
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 095c01ebc60..4dcb92d966b 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -434,23 +434,16 @@ e1000e_intrmgr_pci_unint(E1000ECore *core)
>  {
>      int i;
>  
> -    timer_del(core->radv.timer);
>      timer_free(core->radv.timer);
> -    timer_del(core->rdtr.timer);
>      timer_free(core->rdtr.timer);
> -    timer_del(core->raid.timer);
>      timer_free(core->raid.timer);
>  
> -    timer_del(core->tadv.timer);
>      timer_free(core->tadv.timer);
> -    timer_del(core->tidv.timer);
>      timer_free(core->tidv.timer);
>  
> -    timer_del(core->itr.timer);
>      timer_free(core->itr.timer);
>  
>      for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
> -        timer_del(core->eitr[i].timer);
>          timer_free(core->eitr[i].timer);
>      }
>  }
> @@ -3355,7 +3348,6 @@ e1000e_core_pci_uninit(E1000ECore *core)
>  {
>      int i;
>  
> -    timer_del(core->autoneg_timer);
>      timer_free(core->autoneg_timer);
>  
>      e1000e_intrmgr_pci_unint(core);
> diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
> index ccc3fce2a00..95d27102aa4 100644
> --- a/hw/net/pcnet-pci.c
> +++ b/hw/net/pcnet-pci.c
> @@ -183,7 +183,6 @@ static void pci_pcnet_uninit(PCIDevice *dev)
>      PCIPCNetState *d = PCI_PCNET(dev);
>  
>      qemu_free_irq(d->state.irq);
> -    timer_del(d->state.poll_timer);
>      timer_free(d->state.poll_timer);
>      qemu_del_nic(d->state.nic);
>  }
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index ba5ace1ab75..4675ac878e9 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -3338,7 +3338,6 @@ static void pci_rtl8139_uninit(PCIDevice *dev)
>  
>      g_free(s->cplus_txbuffer);
>      s->cplus_txbuffer = NULL;
> -    timer_del(s->timer);
>      timer_free(s->timer);
>      qemu_del_nic(s->nic);
>  }
> diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
> index 581320a0e7d..10e85a45560 100644
> --- a/hw/net/spapr_llan.c
> +++ b/hw/net/spapr_llan.c
> @@ -363,7 +363,6 @@ static void spapr_vlan_instance_finalize(Object *obj)
>      }
>  
>      if (dev->rxp_timer) {
> -        timer_del(dev->rxp_timer);
>          timer_free(dev->rxp_timer);
>      }
>  }
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 044ac95f6f2..bfbfee3bf27 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1869,7 +1869,6 @@ static void virtio_net_rsc_cleanup(VirtIONet *n)
>              g_free(seg);
>          }
>  
> -        timer_del(chain->drain_timer);
>          timer_free(chain->drain_timer);
>          QTAILQ_REMOVE(&n->rsc_chains, chain, next);
>          g_free(chain);
> @@ -2652,7 +2651,6 @@ static void virtio_net_del_queue(VirtIONet *n, int index)
>  
>      virtio_del_queue(vdev, index * 2);
>      if (q->tx_timer) {
> -        timer_del(q->tx_timer);
>          timer_free(q->tx_timer);
>          q->tx_timer = NULL;
>      } else {
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index d9e1e29f1e2..a5da3a11a17 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -953,7 +953,6 @@ void pci_dereg_ioat(S390PCIIOMMU *iommu)
>  void fmb_timer_free(S390PCIBusDevice *pbdev)
>  {
>      if (pbdev->fmb_timer) {
> -        timer_del(pbdev->fmb_timer);
>          timer_free(pbdev->fmb_timer);
>          pbdev->fmb_timer = NULL;
>      }
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 1842c037978..b3029b392c6 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2132,7 +2132,6 @@ static void sd_instance_finalize(Object *obj)
>  {
>      SDState *sd = SD_CARD(obj);
>  
> -    timer_del(sd->ocr_power_timer);
>      timer_free(sd->ocr_power_timer);
>  }
>  
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 2f8b74a84f7..8ffa53999d8 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1330,9 +1330,7 @@ void sdhci_initfn(SDHCIState *s)
>  
>  void sdhci_uninitfn(SDHCIState *s)
>  {
> -    timer_del(s->insert_timer);
>      timer_free(s->insert_timer);
> -    timer_del(s->transfer_timer);
>      timer_free(s->transfer_timer);
>  
>      g_free(s->fifo_buffer);
> diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
> index 40c1f906942..e35813d7722 100644
> --- a/hw/usb/dev-hub.c
> +++ b/hw/usb/dev-hub.c
> @@ -576,7 +576,6 @@ static void usb_hub_unrealize(USBDevice *dev)
>                              &s->ports[i].port);
>      }
>  
> -    timer_del(s->port_timer);
>      timer_free(s->port_timer);
>  }
>  
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index ae7f20c502a..aca018d8b5f 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2534,7 +2534,6 @@ void usb_ehci_unrealize(EHCIState *s, DeviceState *dev)
>      trace_usb_ehci_unrealize();
>  
>      if (s->frame_timer) {
> -        timer_del(s->frame_timer);
>          timer_free(s->frame_timer);
>          s->frame_timer = NULL;
>      }
> diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
> index f95199e0bbc..8e1146b8627 100644
> --- a/hw/usb/hcd-ohci-pci.c
> +++ b/hw/usb/hcd-ohci-pci.c
> @@ -97,7 +97,6 @@ static void usb_ohci_exit(PCIDevice *dev)
>          usb_bus_release(&s->bus);
>      }
>  
> -    timer_del(s->eof_timer);
>      timer_free(s->eof_timer);
>  }
>  
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 27ca237d71f..5969eb86b31 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -1283,7 +1283,6 @@ static void usb_uhci_exit(PCIDevice *dev)
>      trace_usb_uhci_exit();
>  
>      if (s->frame_timer) {
> -        timer_del(s->frame_timer);
>          timer_free(s->frame_timer);
>          s->frame_timer = NULL;
>      }
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 9ce7ca706e3..46212b1e695 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -3395,7 +3395,6 @@ static void usb_xhci_unrealize(DeviceState *dev)
>      }
>  
>      if (xhci->mfwrap_timer) {
> -        timer_del(xhci->mfwrap_timer);
>          timer_free(xhci->mfwrap_timer);
>          xhci->mfwrap_timer = NULL;
>      }
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 3238de6bb82..44606b0047f 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -1480,7 +1480,6 @@ static void usbredir_unrealize(USBDevice *udev)
>      qemu_bh_delete(dev->chardev_close_bh);
>      qemu_bh_delete(dev->device_reject_bh);
>  
> -    timer_del(dev->attach_timer);
>      timer_free(dev->attach_timer);
>  
>      usbredir_cleanup_device_queues(dev);
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index 342054193b3..42d67e870b7 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -186,7 +186,6 @@ static void vfio_display_edid_exit(VFIODisplay *dpy)
>  
>      g_free(dpy->edid_regs);
>      g_free(dpy->edid_blob);
> -    timer_del(dpy->edid_link_timer);
>      timer_free(dpy->edid_link_timer);
>  }
>  
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 5b2ebf34961..4ad6e234adf 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -151,7 +151,6 @@ static void vhost_vsock_common_post_load_timer_cleanup(VHostVSockCommon *vvc)
>          return;
>      }
>  
> -    timer_del(vvc->post_load_timer);
>      timer_free(vvc->post_load_timer);
>      vvc->post_load_timer = NULL;
>  }
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e83017c02df..e7709551767 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -204,7 +204,6 @@ static bool balloon_stats_enabled(const VirtIOBalloon *s)
>  static void balloon_stats_destroy_timer(VirtIOBalloon *s)
>  {
>      if (balloon_stats_enabled(s)) {
> -        timer_del(s->stats_timer);
>          timer_free(s->stats_timer);
>          s->stats_timer = NULL;
>          s->stats_poll_interval = 0;
> diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
> index 2886c0ce2a6..76ce9376931 100644
> --- a/hw/virtio/virtio-rng.c
> +++ b/hw/virtio/virtio-rng.c
> @@ -233,7 +233,6 @@ static void virtio_rng_device_unrealize(DeviceState *dev)
>      VirtIORNG *vrng = VIRTIO_RNG(dev);
>  
>      qemu_del_vm_change_state_handler(vrng->vmstate);
> -    timer_del(vrng->rate_limit_timer);
>      timer_free(vrng->rate_limit_timer);
>      virtio_del_queue(vdev, 0);
>      virtio_cleanup(vdev);
> diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
> index 4c4b6a6ab70..e135a4de8b2 100644
> --- a/hw/watchdog/wdt_diag288.c
> +++ b/hw/watchdog/wdt_diag288.c
> @@ -110,7 +110,6 @@ static void wdt_diag288_unrealize(DeviceState *dev)
>  {
>      DIAG288State *diag288 = DIAG288(dev);
>  
> -    timer_del(diag288->timer);
>      timer_free(diag288->timer);
>  }
>  
> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> index 502f45a9399..4c52e3bb9e1 100644
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -454,7 +454,6 @@ static void i6300esb_exit(PCIDevice *dev)
>  {
>      I6300State *d = WATCHDOG_I6300ESB_DEVICE(dev);
>  
> -    timer_del(d->timer);
>      timer_free(d->timer);
>  }
>  
> diff --git a/migration/colo.c b/migration/colo.c
> index 3f1d3dfd956..de27662cab5 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -636,7 +636,6 @@ out:
>       * error.
>       */
>      colo_compare_unregister_notifier(&packets_compare_notifier);
> -    timer_del(s->colo_delay_timer);
>      timer_free(s->colo_delay_timer);
>      qemu_event_destroy(&s->colo_checkpoint_event);
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 65d8ff48494..17b21197b81 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1586,7 +1586,6 @@ static void hmp_migrate_status_cb(void *opaque)
>              error_report("%s", info->error_desc);
>          }
>          monitor_resume(status->mon);
> -        timer_del(status->timer);
>          timer_free(status->timer);
>          g_free(status);
>      }
> diff --git a/net/announce.c b/net/announce.c
> index db90d3bd4b9..26f057f5ee4 100644
> --- a/net/announce.c
> +++ b/net/announce.c
> @@ -41,7 +41,6 @@ void qemu_announce_timer_del(AnnounceTimer *timer, bool free_named)
>  {
>      bool free_timer = false;
>      if (timer->tm) {
> -        timer_del(timer->tm);
>          timer_free(timer->tm);
>          timer->tm = NULL;
>      }
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 337025b44f8..84db4978ac3 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -951,7 +951,6 @@ static void colo_compare_timer_init(CompareState *s)
>  static void colo_compare_timer_del(CompareState *s)
>  {
>      if (s->packet_check_timer) {
> -        timer_del(s->packet_check_timer);
>          timer_free(s->packet_check_timer);
>          s->packet_check_timer = NULL;
>      }
> diff --git a/net/slirp.c b/net/slirp.c
> index 77042e6df74..8350c6d45f7 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -184,7 +184,6 @@ static void *net_slirp_timer_new(SlirpTimerCb cb,
>  
>  static void net_slirp_timer_free(void *timer, void *opaque)
>  {
> -    timer_del(timer);
>      timer_free(timer);
>  }
>  
> diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
> index 1d6a9684060..5ec574724a2 100644
> --- a/replay/replay-debugging.c
> +++ b/replay/replay-debugging.c
> @@ -78,7 +78,6 @@ static void replay_delete_break(void)
>      assert(replay_mutex_locked());
>  
>      if (replay_break_timer) {
> -        timer_del(replay_break_timer);
>          timer_free(replay_break_timer);
>          replay_break_timer = NULL;
>      }
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 8a734c2f8c0..7da70afbf22 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -313,9 +313,7 @@ static void s390_cpu_finalize(Object *obj)
>  #if !defined(CONFIG_USER_ONLY)
>      S390CPU *cpu = S390_CPU(obj);
>  
> -    timer_del(cpu->env.tod_timer);
>      timer_free(cpu->env.tod_timer);
> -    timer_del(cpu->env.cpu_timer);
>      timer_free(cpu->env.cpu_timer);
>  
>      qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
> diff --git a/ui/console.c b/ui/console.c
> index 30e70be555d..2625a65c29c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -253,7 +253,6 @@ static void gui_setup_refresh(DisplayState *ds)
>          timer_mod(ds->gui_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
>      }
>      if (!need_timer && ds->gui_timer != NULL) {
> -        timer_del(ds->gui_timer);
>          timer_free(ds->gui_timer);
>          ds->gui_timer = NULL;
>      }
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index eea52f53899..5746d0aae7c 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -76,7 +76,6 @@ static void timer_cancel(SpiceTimer *timer)
>  
>  static void timer_remove(SpiceTimer *timer)
>  {
> -    timer_del(timer->timer);
>      timer_free(timer->timer);
>      g_free(timer);
>  }
> diff --git a/util/throttle.c b/util/throttle.c
> index b38e742da53..81f247a8d18 100644
> --- a/util/throttle.c
> +++ b/util/throttle.c
> @@ -247,7 +247,6 @@ static void throttle_timer_destroy(QEMUTimer **timer)
>  {
>      assert(*timer != NULL);
>  
> -    timer_del(*timer);
>      timer_free(*timer);
>      *timer = NULL;
>  }
> -- 
> 2.20.1
> 
> 

