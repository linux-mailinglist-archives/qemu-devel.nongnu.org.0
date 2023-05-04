Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD726F7180
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoQ-0006zv-2h; Thu, 04 May 2023 13:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puaJK-0001K4-J6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:51:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puaJI-0007Vq-JW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:51:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aaec9ad820so5048095ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683211915; x=1685803915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kqe6k0DP1jr9vC6mdbnHaC4U3Aow4sh60iqa8s/gwrA=;
 b=kE1Lx56iVEWeVdDhbbb8gz0aYYhELB59FLIZVTl5xnd7Ak2vZXDWq8WaquuF23Yxla
 IxHkr1oBYT77wt+4XLjm8S4gX06zwPUSe+gpnl+uY72raZHKCVSqWvyzvqhjLhPRdS02
 Gxg6rbLC29mxFRv3l/hUh1A+2+G2A/7F3BGicYBGKGDjbm/cMz8PlxIhkBjOvTp/5Gcq
 O5FYRMw/6PNmvPz+dXwuOt4J5YtwcifERo5nRnRWhU5EKkV4GRkwEVfsUyJphuaTrlry
 UyjQOMT1qENb4/V2CgwSUdUre8AD8c0fxLHhXu8VKBsnSR3qUK7drZVAV90bq/tvM2oH
 gv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683211915; x=1685803915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqe6k0DP1jr9vC6mdbnHaC4U3Aow4sh60iqa8s/gwrA=;
 b=QMIYojs+iw0cETDUNCUMG+MY6kkh7hAVYrytbR7Sjy4TGSzZQVwqv4LkId8GByUQP5
 87An4aFdZQeAvoB7Dnxv7aracVHbVajN0oVq/NYBiryERE9e6UR5T8eqVCu582MHfukl
 1VsYFgEyH22MYXAVQgVPsIB/oUBbyJ5F9XZmQcfuNKm/mBh8HGvS9dQV0M8dzGogU6ul
 ndMjJC/jsCSXfa70FGLvjOz/eoU0GUa2R30+zTX3iGGnIOBm56hKc+2z1oUsO6V5K/Cu
 4qKM8+aeLXlGtaFd29SkREJEcmKeSigyhfQOZmtvlI/Kf0hSIE593FfsHj3klkjvCPHo
 G6Kw==
X-Gm-Message-State: AC+VfDxi50qHGMQPHR1/8c6koXCpWb45K7NT/W3VDMa5D8RVGQ1VpoN2
 pPcLUokwdRHlU6wjcySg7+uOOQ==
X-Google-Smtp-Source: ACHHUZ7cn6SgpcnM6nHARJQT9zbFgKWBmGbWKC7fcjauSBwGUc+y1zB86fuPQI+3Tu2ST562mU4rnw==
X-Received: by 2002:a17:902:d2c4:b0:1a6:e27a:8a4d with SMTP id
 n4-20020a170902d2c400b001a6e27a8a4dmr5084937plc.2.1683211914959; 
 Thu, 04 May 2023 07:51:54 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 iw12-20020a170903044c00b001ac38343438sm300381plb.176.2023.05.04.07.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 07:51:54 -0700 (PDT)
Message-ID: <58dbab6d-3e65-b26e-c14b-c12568babe24@daynix.com>
Date: Thu, 4 May 2023 23:51:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/5] igb: rename E1000E_RingInfo_st
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131106eucas1p1714e019395c941f51155c0e9ae52a66b@eucas1p1.samsung.com>
 <20230504131055.11767-3-t.dzieciol@partner.samsung.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230504131055.11767-3-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/05/04 22:10, Tomasz Dzieciol wrote:
> Rename E1000E_RingInfo_st and E1000E_RingInfo according to qemu typdefs guide.

Please make the same change for e1000e to make it easy to compare it 
with igb.

> 
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
> ---
>   hw/net/igb_core.c | 42 +++++++++++++++++++++---------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 012eb1e1b9..b6031dea24 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -694,24 +694,24 @@ static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
>       return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
>   }
>   
> -typedef struct E1000E_RingInfo_st {
> +typedef struct E1000ERingInfo {
>       int dbah;
>       int dbal;
>       int dlen;
>       int dh;
>       int dt;
>       int idx;
> -} E1000E_RingInfo;
> +} E1000ERingInfo;
>   
>   static inline bool
> -igb_ring_empty(IGBCore *core, const E1000E_RingInfo *r)
> +igb_ring_empty(IGBCore *core, const E1000ERingInfo *r)
>   {
>       return core->mac[r->dh] == core->mac[r->dt] ||
>                   core->mac[r->dt] >= core->mac[r->dlen] / E1000_RING_DESC_LEN;
>   }
>   
>   static inline uint64_t
> -igb_ring_base(IGBCore *core, const E1000E_RingInfo *r)
> +igb_ring_base(IGBCore *core, const E1000ERingInfo *r)
>   {
>       uint64_t bah = core->mac[r->dbah];
>       uint64_t bal = core->mac[r->dbal];
> @@ -720,13 +720,13 @@ igb_ring_base(IGBCore *core, const E1000E_RingInfo *r)
>   }
>   
>   static inline uint64_t
> -igb_ring_head_descr(IGBCore *core, const E1000E_RingInfo *r)
> +igb_ring_head_descr(IGBCore *core, const E1000ERingInfo *r)
>   {
>       return igb_ring_base(core, r) + E1000_RING_DESC_LEN * core->mac[r->dh];
>   }
>   
>   static inline void
> -igb_ring_advance(IGBCore *core, const E1000E_RingInfo *r, uint32_t count)
> +igb_ring_advance(IGBCore *core, const E1000ERingInfo *r, uint32_t count)
>   {
>       core->mac[r->dh] += count;
>   
> @@ -736,7 +736,7 @@ igb_ring_advance(IGBCore *core, const E1000E_RingInfo *r, uint32_t count)
>   }
>   
>   static inline uint32_t
> -igb_ring_free_descr_num(IGBCore *core, const E1000E_RingInfo *r)
> +igb_ring_free_descr_num(IGBCore *core, const E1000ERingInfo *r)
>   {
>       trace_e1000e_ring_free_space(r->idx, core->mac[r->dlen],
>                                    core->mac[r->dh],  core->mac[r->dt]);
> @@ -755,13 +755,13 @@ igb_ring_free_descr_num(IGBCore *core, const E1000E_RingInfo *r)
>   }
>   
>   static inline bool
> -igb_ring_enabled(IGBCore *core, const E1000E_RingInfo *r)
> +igb_ring_enabled(IGBCore *core, const E1000ERingInfo *r)
>   {
>       return core->mac[r->dlen] > 0;
>   }
>   
>   typedef struct IGB_TxRing_st {
> -    const E1000E_RingInfo *i;
> +    const E1000ERingInfo *i;
>       struct igb_tx *tx;
>   } IGB_TxRing;
>   
> @@ -774,7 +774,7 @@ igb_mq_queue_idx(int base_reg_idx, int reg_idx)
>   static inline void
>   igb_tx_ring_init(IGBCore *core, IGB_TxRing *txr, int idx)
>   {
> -    static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
> +    static const E1000ERingInfo i[IGB_NUM_QUEUES] = {
>           { TDBAH0, TDBAL0, TDLEN0, TDH0, TDT0, 0 },
>           { TDBAH1, TDBAL1, TDLEN1, TDH1, TDT1, 1 },
>           { TDBAH2, TDBAL2, TDLEN2, TDH2, TDT2, 2 },
> @@ -800,13 +800,13 @@ igb_tx_ring_init(IGBCore *core, IGB_TxRing *txr, int idx)
>   }
>   
>   typedef struct E1000E_RxRing_st {
> -    const E1000E_RingInfo *i;
> +    const E1000ERingInfo *i;
>   } E1000E_RxRing;
>   
>   static inline void
>   igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
>   {
> -    static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
> +    static const E1000ERingInfo i[IGB_NUM_QUEUES] = {
>           { RDBAH0, RDBAL0, RDLEN0, RDH0, RDT0, 0 },
>           { RDBAH1, RDBAL1, RDLEN1, RDH1, RDT1, 1 },
>           { RDBAH2, RDBAL2, RDLEN2, RDH2, RDT2, 2 },
> @@ -833,7 +833,7 @@ igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
>   static uint32_t
>   igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
>                        union e1000_adv_tx_desc *tx_desc,
> -                     const E1000E_RingInfo *txi)
> +                     const E1000ERingInfo *txi)
>   {
>       PCIDevice *d;
>       uint32_t cmd_type_len = le32_to_cpu(tx_desc->read.cmd_type_len);
> @@ -866,7 +866,7 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
>   }
>   
>   static inline bool
> -igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
> +igb_tx_enabled(IGBCore *core, const E1000ERingInfo *txi)
>   {
>       bool vmdq = core->mac[MRQC] & 1;
>       uint16_t qn = txi->idx;
> @@ -883,7 +883,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>       PCIDevice *d;
>       dma_addr_t base;
>       union e1000_adv_tx_desc desc;
> -    const E1000E_RingInfo *txi = txr->i;
> +    const E1000ERingInfo *txi = txr->i;
>       uint32_t eic = 0;
>   
>       if (!igb_tx_enabled(core, txi)) {
> @@ -918,7 +918,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>   }
>   
>   static uint32_t
> -igb_rxbufsize(IGBCore *core, const E1000E_RingInfo *r)
> +igb_rxbufsize(IGBCore *core, const E1000ERingInfo *r)
>   {
>       uint32_t srrctl = core->mac[E1000_SRRCTL(r->idx) >> 2];
>       uint32_t bsizepkt = srrctl & E1000_SRRCTL_BSIZEPKT_MASK;
> @@ -930,7 +930,7 @@ igb_rxbufsize(IGBCore *core, const E1000E_RingInfo *r)
>   }
>   
>   static bool
> -igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
> +igb_has_rxbufs(IGBCore *core, const E1000ERingInfo *r, size_t total_size)
>   {
>       uint32_t bufs = igb_ring_free_descr_num(core, r);
>       uint32_t bufsize = igb_rxbufsize(core, r);
> @@ -1522,7 +1522,7 @@ igb_write_to_rx_buffers(IGBCore *core,
>   }
>   
>   static void
> -igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
> +igb_update_rx_stats(IGBCore *core, const E1000ERingInfo *rxi,
>                       size_t pkt_size, size_t pkt_fcs_size)
>   {
>       eth_pkt_types_e pkt_type = net_rx_pkt_get_packet_type(core->rx_pkt);
> @@ -1540,7 +1540,7 @@ igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
>   }
>   
>   static inline bool
> -igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
> +igb_rx_descr_threshold_hit(IGBCore *core, const E1000ERingInfo *rxi)
>   {
>       return igb_ring_free_descr_num(core, rxi) ==
>              ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
> @@ -1562,7 +1562,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>       struct iovec *iov = net_rx_pkt_get_iovec(pkt);
>       size_t size = net_rx_pkt_get_total_len(pkt);
>       size_t total_size = size + e1000x_fcs_len(core->mac);
> -    const E1000E_RingInfo *rxi = rxr->i;
> +    const E1000ERingInfo *rxi = rxr->i;
>       size_t bufsize = igb_rxbufsize(core, rxi);
>   
>       d = pcie_sriov_get_vf_at_index(core->owner, rxi->idx % 8);
> @@ -1643,7 +1643,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>   }
>   
>   static bool
> -igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi)
> +igb_rx_strip_vlan(IGBCore *core, const E1000ERingInfo *rxi)
>   {
>       if (core->mac[MRQC] & 1) {
>           uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;

