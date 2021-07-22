Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8E53D1FD8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:30:08 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6U5m-0002QO-DQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6U4h-0001m8-H5
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6U4d-0000Bg-Lz
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626942532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JR7C9AJaN1bZk266FPLtzivHKFpK6EOKaW2wnr6FH0s=;
 b=jLFsV4PQWZnr1nq+spz79lUMzMLfWTGL/FVbR1H0jid+bth6ARapfHj+btt79yGSFEigBG
 rBCFybIdRxf0GmtZ5h9qziUZ2NI/auXv4HQAqFMxaP+vO0fbhcAQBav/x4wlzelWAznrmO
 xbEO9aQtbQv+TJzhbw5v3XQ5CjDJeKI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-DWGmsRAdMmahF8LBGWsDWQ-1; Thu, 22 Jul 2021 04:28:50 -0400
X-MC-Unique: DWGmsRAdMmahF8LBGWsDWQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 j22-20020a17090a7e96b0290175fc969950so2067261pjl.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 01:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JR7C9AJaN1bZk266FPLtzivHKFpK6EOKaW2wnr6FH0s=;
 b=daqtd/BOzs/8b0YsFZIfNFFCNfNvIuRPbN78MYArYDNwx9ecZS5yPN67MWFUxDPbu7
 0CrnUvKuZX7jQ7LD8UgcGntrKPQpX74AwDCKXvw2q1rIQIz6xm8cfE9qXqE6E/BaRevN
 rVZ+2FFVG6IVskG/c9rCFCqPmn/VplJCosf0CtxcRgD1Cfi0s0N2ad7T3SKSvMuRpZCC
 jLBmw3Rd0ChivYzCY4T2sigcOUITgnVuyBvI4cjZG+yBlD/mNrol5agyw5qVvq254gnc
 3pwBHYpXIYYbC18i93bjoXRNQu6kFv3txOBliMTWV8w9a5zFuVdQW+79+MAB9kBuJZYn
 t8Pw==
X-Gm-Message-State: AOAM532wVHgX97zvJU7hQiuaG7pqH9Uy9jwUamKjWB1e9OXTkTWelr6f
 3UxSji2N3dK6OMuvI2v3ZWA/j7AVXuiOVNe4lDp1O8+64AcqUkcKW3d3PNxo0JxcImiT6W2lC0R
 A1IdnY8vMdGwrBUc=
X-Received: by 2002:a17:90a:c387:: with SMTP id
 h7mr38376925pjt.131.1626942529901; 
 Thu, 22 Jul 2021 01:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv+hmiulBCTUM4S4mbSqyGMGHOF1ekJhowJwW+q7xFQdW1TMopYZzyiYTKZl27fgxDR+F/Nw==
X-Received: by 2002:a17:90a:c387:: with SMTP id
 h7mr38376902pjt.131.1626942529578; 
 Thu, 22 Jul 2021 01:28:49 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p24sm33605157pgl.68.2021.07.22.01.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 01:28:48 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] hw/net: e1000e: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20210721041504.464403-1-bmeng.cn@gmail.com>
 <20210721041504.464403-2-bmeng.cn@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <edf8ebb3-3275-da75-ccd5-f73d71a49184@redhat.com>
Date: Thu, 22 Jul 2021 16:28:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721041504.464403-2-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Christina Wang <christina.wang@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/21 ÏÂÎç12:15, Bin Meng Ð´µÀ:
> From: Christina Wang <christina.wang@windriver.com>
>
> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> the manual and real hardware.
>
> While Linux e1000e driver always writes VET register to 0x8100, it is
> not always the case for everyone. Drivers relying on the reset value
> of VET won't be able to transmit and receive VLAN frames in QEMU.
>
> Unlike e1000 in QEMU, e1000e uses a field 'vet' in "struct E1000Core"
> to cache the value of VET register, but the cache only gets updated
> when VET register is written. To always get a consistent VET value
> no matter VET is written or remains its reset value, drop the 'vet'
> field and use 'core->mac[VET]' directly.
>
> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v3:
> - add a "init-vet" property for versioned machines
>
> Changes in v2:
> - keep the 'vet' field in "struct E1000Core" for migration compatibility
>
>   hw/core/machine.c    | 21 +++++++++++++++++++++
>   hw/net/e1000e.c      |  8 +++++++-
>   hw/net/e1000e_core.c |  9 ++++-----
>   3 files changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 29982c1ef1..8355df69c7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -42,6 +42,7 @@ GlobalProperty hw_compat_6_0[] = {
>       { "i8042", "extended-state", "false"},
>       { "nvme-ns", "eui64-default", "off"},
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };


It looks to me doing compat in hw_compat_6_0 is sufficient.

The codes will do it automatically for the versions before 6.0.

E.g virt_machine_5_2_options() will call virt_machine_6_0_options() etc.

Other looks good.

Thanks


>   const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
>   
> @@ -51,6 +52,7 @@ GlobalProperty hw_compat_5_2[] = {
>       { "virtio-blk-device", "report-discard-granularity", "off" },
>       { "virtio-net-pci", "vectors", "3"},
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>   
> @@ -65,6 +67,7 @@ GlobalProperty hw_compat_5_1[] = {
>       { "pl011", "migrate-clk", "off" },
>       { "virtio-pci", "x-ats-page-aligned", "off"},
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
>   
> @@ -77,6 +80,7 @@ GlobalProperty hw_compat_5_0[] = {
>       { "vmport", "x-cmds-v2", "off" },
>       { "virtio-device", "x-disable-legacy-check", "true" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
>   
> @@ -94,12 +98,14 @@ GlobalProperty hw_compat_4_2[] = {
>       { "fw_cfg", "acpi-mr-restore", "false" },
>       { "virtio-device", "use-disabled-flag", "false" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>   
>   GlobalProperty hw_compat_4_1[] = {
>       { "virtio-pci", "x-pcie-flr-init", "off" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
>   
> @@ -113,6 +119,7 @@ GlobalProperty hw_compat_4_0[] = {
>       { "virtio-balloon-device", "qemu-4-0-config-size", "true" },
>       { "pl031", "migrate-tick-offset", "false" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
>   
> @@ -131,11 +138,13 @@ GlobalProperty hw_compat_3_1[] = {
>       { "virtio-balloon-device", "qemu-4-0-config-size", "false" },
>       { "pcie-root-port-base", "disable-acs", "true" }, /* Added in 4.1 */
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_3_1_len = G_N_ELEMENTS(hw_compat_3_1);
>   
>   GlobalProperty hw_compat_3_0[] = {
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_3_0_len = G_N_ELEMENTS(hw_compat_3_0);
>   
> @@ -147,6 +156,7 @@ GlobalProperty hw_compat_2_12[] = {
>       { "vmware-svga", "global-vmstate", "true" },
>       { "qxl-vga", "global-vmstate", "true" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_12_len = G_N_ELEMENTS(hw_compat_2_12);
>   
> @@ -156,6 +166,7 @@ GlobalProperty hw_compat_2_11[] = {
>       { "vhost-user-blk-pci", "vectors", "2" },
>       { "e1000", "migrate_tso_props", "off" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_11_len = G_N_ELEMENTS(hw_compat_2_11);
>   
> @@ -163,6 +174,7 @@ GlobalProperty hw_compat_2_10[] = {
>       { "virtio-mouse-device", "wheel-axis", "false" },
>       { "virtio-tablet-device", "wheel-axis", "false" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_10_len = G_N_ELEMENTS(hw_compat_2_10);
>   
> @@ -172,6 +184,7 @@ GlobalProperty hw_compat_2_9[] = {
>       { "virtio-net-device", "x-mtu-bypass-backend", "off" },
>       { "pcie-root-port", "x-migrate-msix", "false" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_9_len = G_N_ELEMENTS(hw_compat_2_9);
>   
> @@ -187,6 +200,7 @@ GlobalProperty hw_compat_2_8[] = {
>       { "cirrus-vga", "vgamem_mb", "8" },
>       { "isa-cirrus-vga", "vgamem_mb", "8" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_8_len = G_N_ELEMENTS(hw_compat_2_8);
>   
> @@ -197,6 +211,7 @@ GlobalProperty hw_compat_2_7[] = {
>       { "intel-iommu", "x-buggy-eim", "true" },
>       { "virtio-pci", "x-ignore-backend-features", "on" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
>   
> @@ -206,6 +221,7 @@ GlobalProperty hw_compat_2_6[] = {
>       { "virtio-pci", "disable-modern", "on",  .optional = true },
>       { "virtio-pci", "disable-legacy", "off", .optional = true },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_6_len = G_N_ELEMENTS(hw_compat_2_6);
>   
> @@ -216,6 +232,7 @@ GlobalProperty hw_compat_2_5[] = {
>       { "vmxnet3", "x-old-msi-offsets", "on" },
>       { "vmxnet3", "x-disable-pcie", "on" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_5_len = G_N_ELEMENTS(hw_compat_2_5);
>   
> @@ -224,6 +241,7 @@ GlobalProperty hw_compat_2_4[] = {
>       { "virtio-blk-device", "scsi", "true", .optional = true },
>       { "e1000", "extra_mac_registers", "off" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>       { "virtio-pci", "x-disable-pcie", "on" },
>       { "virtio-pci", "migrate-extra", "off" },
>       { "fw_cfg_mem", "dma_enabled", "off" },
> @@ -242,11 +260,13 @@ GlobalProperty hw_compat_2_3[] = {
>       { "migration", "send-section-footer", "off" },
>       { "migration", "store-global-state", "off" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_3_len = G_N_ELEMENTS(hw_compat_2_3);
>   
>   GlobalProperty hw_compat_2_2[] = {
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_2_len = G_N_ELEMENTS(hw_compat_2_2);
>   
> @@ -259,6 +279,7 @@ GlobalProperty hw_compat_2_1[] = {
>       { "usb-kbd", "usb_version", "1" },
>       { "virtio-pci", "virtio-pci-bus-master-bug-migration", "on" },
>       { "e1000", "init-vet", "off" },
> +    { "e1000e", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_1_len = G_N_ELEMENTS(hw_compat_2_1);
>   
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index a8a77eca95..ac96f7665a 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -35,6 +35,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
> +#include "net/eth.h"
>   #include "net/net.h"
>   #include "net/tap.h"
>   #include "qemu/module.h"
> @@ -79,7 +80,7 @@ struct E1000EState {
>       bool disable_vnet;
>   
>       E1000ECore core;
> -
> +    bool init_vet;
>   };
>   
>   #define E1000E_MMIO_IDX     0
> @@ -527,6 +528,10 @@ static void e1000e_qdev_reset(DeviceState *dev)
>       trace_e1000e_cb_qdev_reset();
>   
>       e1000e_core_reset(&s->core);
> +
> +    if (s->init_vet) {
> +        s->core.mac[VET] = ETH_P_VLAN;
> +    }
>   }
>   
>   static int e1000e_pre_save(void *opaque)
> @@ -666,6 +671,7 @@ static Property e1000e_properties[] = {
>                           e1000e_prop_subsys_ven, uint16_t),
>       DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
>                           e1000e_prop_subsys, uint16_t),
> +    DEFINE_PROP_BOOL("init-vet", E1000EState, init_vet, true),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index b75f2ab8fc..b4bf4ca2f1 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -731,7 +731,7 @@ e1000e_process_tx_desc(E1000ECore *core,
>               if (e1000x_vlan_enabled(core->mac) &&
>                   e1000x_is_vlan_txd(txd_lower)) {
>                   net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt,
> -                    le16_to_cpu(dp->upper.fields.special), core->vet);
> +                    le16_to_cpu(dp->upper.fields.special), core->mac[VET]);
>               }
>               if (e1000e_tx_pkt_send(core, tx, queue_index)) {
>                   e1000e_on_tx_done_update_stats(core, tx->tx_pkt);
> @@ -1012,7 +1012,7 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
>   {
>       uint32_t rctl = core->mac[RCTL];
>   
> -    if (e1000x_is_vlan_packet(buf, core->vet) &&
> +    if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
>           e1000x_vlan_rx_filter_enabled(core->mac)) {
>           uint16_t vid = lduw_be_p(buf + 14);
>           uint32_t vfta = ldl_le_p((uint32_t *)(core->mac + VFTA) +
> @@ -1686,7 +1686,7 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
>       }
>   
>       net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
> -                               e1000x_vlan_enabled(core->mac), core->vet);
> +                               e1000x_vlan_enabled(core->mac), core->mac[VET]);
>   
>       e1000e_rss_parse_packet(core, core->rx_pkt, &rss_info);
>       e1000e_rx_ring_init(core, &rxr, rss_info.queue);
> @@ -2397,8 +2397,7 @@ static void
>   e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
>   {
>       core->mac[VET] = val & 0xffff;
> -    core->vet = le16_to_cpu(core->mac[VET]);
> -    trace_e1000e_vlan_vet(core->vet);
> +    trace_e1000e_vlan_vet(core->mac[VET]);
>   }
>   
>   static void


