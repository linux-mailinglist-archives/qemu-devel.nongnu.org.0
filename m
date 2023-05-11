Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B56FF58F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:10:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7v8-0003wS-Q2; Thu, 11 May 2023 11:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1px7v6-0003vq-1Z
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:09:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1px7v1-0001zk-6w
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:09:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ab13da70a3so84516405ad.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683817761; x=1686409761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L5smDrxf2oX34mlWuYzasGwJaqf3jMQUdCPiVqrIzxE=;
 b=eD1KW0H436FTKaUQYHV7faLWgLjbDV7dO6R43zi86fqJ78CBU+Wvv53pSxsMgk/b/j
 wM2WA8cYBnbJfrVqpZaSVALgOBvaNBR/CNRNhDwoFw4Yh36KwF8v4MaXNLlbJrFHrhAD
 CiGojmxvPIrv+4zxoRat5AAX2FR3IT4/G3but1G61fg1/qvtZDO396bs6LVZxiWWflnz
 e1o3hSalzJw/1TIPSPEzQC1axvY0wvXCzp1Fo3Si/NlfIF+aMga8kF1O6bj0xNKodEVN
 d5LY9IjTY3WpqDRjf+XywAK3GRaYaPoEnkvjvCeMTS6oz4AxWl+T8GLZnXQVr5gt2/DP
 ljeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817761; x=1686409761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L5smDrxf2oX34mlWuYzasGwJaqf3jMQUdCPiVqrIzxE=;
 b=gYWFuPJ2xFd+mg0tkS8Yw7qzH5Z6htsj7Aj1bzLfTtGKPASz6xq2X3hrQyp5i2ci0z
 mPaX9Czu773CASFcnjTndcrsPxCXR3lXK6j9MF7UTGE4u+tuP+erdU2HUyfmFzZ2VJl8
 c2GXksl6hP4bwYOYKJ/faDs3WCLtncOMHmbBcynMncPo6+6D25tgDyTm8xrzc0GHkFCj
 WrGyptWlUk2LY1kF/bnEqLfJPok+yQ76xBOhQqUSAHUNOg/0FMAP3hm2L3pQtEGmjd4C
 m4VRTAXCU2j4UZepyPXuWSQwLU2YnnSKNFAzzoaO4EgwymEZ+7TJGK9cpl2Hwb/xVR3H
 9rog==
X-Gm-Message-State: AC+VfDx7Bpm/VIPTznr20PrNlyK1ZsKB/G3ogkrvw9Q/752o/xprgXor
 osPpZRfMcdxkHs0f0Tf4Mq0c+g==
X-Google-Smtp-Source: ACHHUZ7FWJHGAEYN72vwdEOk0zmeQzhhL7bSyPExjhksG1W9cu4HDHVs2E9G8qCKLB7d2ayG9pN31g==
X-Received: by 2002:a17:903:2681:b0:1a9:b8c3:c2c2 with SMTP id
 jf1-20020a170903268100b001a9b8c3c2c2mr20519010plb.37.1683817761235; 
 Thu, 11 May 2023 08:09:21 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170903244b00b001aaed55aff3sm6035023pls.137.2023.05.11.08.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 08:09:20 -0700 (PDT)
Message-ID: <db3fc6e4-4c61-b210-8ba2-86d024e47a2c@daynix.com>
Date: Fri, 12 May 2023 00:09:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 6/6] igb: packet-split descriptors support
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
References: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
 <CGME20230510082303eucas1p1df93402a1771f308faec7a76d03282cc@eucas1p1.samsung.com>
 <20230510082254.1036-7-t.dzieciol@partner.samsung.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230510082254.1036-7-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi,

Thank you for continuously working on this series. I have some comments, 
but I guess this series will be ready after one or two more rounds.

On 2023/05/10 17:22, Tomasz Dzieciol wrote:
> Packet-split descriptors are used by Linux VF driver for MTU values from 2048
> 
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
> ---
>   hw/net/e1000e_core.c |  10 +-
>   hw/net/igb_core.c    | 403 ++++++++++++++++++++++++++++++++++++++-----
>   hw/net/igb_regs.h    |   7 +
>   hw/net/trace-events  |   2 +-
>   4 files changed, 373 insertions(+), 49 deletions(-)
> 
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index f9ff31fd70..be0cf2f941 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c

Please extract changes for e1000e into another patch.

> @@ -1397,15 +1397,15 @@ e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
>       }
>   }
>   
> -typedef struct e1000e_ba_state_st {
> +typedef struct E1000EBAState {
>       uint16_t written[MAX_PS_BUFFERS];
>       uint8_t cur_idx;
> -} e1000e_ba_state;
> +} E1000EBAState;
>   
>   static inline void
>   e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
>                                  hwaddr ba[MAX_PS_BUFFERS],
> -                               e1000e_ba_state *bastate,
> +                               E1000EBAState *bastate,
>                                  const char *data,
>                                  dma_addr_t data_len)
>   {
> @@ -1420,7 +1420,7 @@ e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
>   static void
>   e1000e_write_payload_frag_to_rx_buffers(E1000ECore *core,
>                                           hwaddr ba[MAX_PS_BUFFERS],
> -                                        e1000e_ba_state *bastate,
> +                                        E1000EBAState *bastate,
>                                           const char *data,
>                                           dma_addr_t data_len)
>   {
> @@ -1530,7 +1530,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>   
>       do {
>           hwaddr ba[MAX_PS_BUFFERS];
> -        e1000e_ba_state bastate = { { 0 } };
> +        E1000EBAState bastate = { { 0 } };
>           bool is_last = false;
>   
>           desc_size = total_size - desc_offset;
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 6d95cccea3..9a08f2e7d3 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -267,6 +267,29 @@ igb_rx_use_legacy_descriptor(IGBCore *core)
>       return false;
>   }
>   
> +typedef struct E1000ERingInfo {
> +    int dbah;
> +    int dbal;
> +    int dlen;
> +    int dh;
> +    int dt;
> +    int idx;
> +} E1000ERingInfo;
> +
> +static uint32_t
> +igb_rx_queue_desctyp_get(IGBCore *core, const E1000ERingInfo *r)
> +{
> +    return core->mac[E1000_SRRCTL(r->idx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK;
> +}
> +
> +static bool
> +igb_rx_use_ps_descriptor(IGBCore *core, const E1000ERingInfo *r)
> +{
> +    uint32_t desctyp = igb_rx_queue_desctyp_get(core, r);
> +    return desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT ||
> +           desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS;
> +}
> +
>   static inline bool
>   igb_rss_enabled(IGBCore *core)
>   {
> @@ -694,15 +717,6 @@ static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
>       return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
>   }
>   
> -typedef struct E1000ERingInfo {
> -    int dbah;
> -    int dbal;
> -    int dlen;
> -    int dh;
> -    int dt;
> -    int idx;
> -} E1000ERingInfo;
> -
>   static inline bool
>   igb_ring_empty(IGBCore *core, const E1000ERingInfo *r)
>   {
> @@ -1233,12 +1247,54 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
>   }
>   
>   static inline void
> -igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> -                      hwaddr *buff_addr)
> +igb_read_adv_rx_single_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> +                                 hwaddr *buff_addr)
>   {
>       *buff_addr = le64_to_cpu(desc->read.pkt_addr);
>   }
>   
> +typedef struct IGBRxDescBufAddrs {
> +    hwaddr hdr_buf_addr;
> +    hwaddr pkt_buf_addr;
> +} IGBRxDescBufAddrs;
> +
> +typedef enum IGBBastateCurrentBuffer {
> +    IgbHdrBuf = 0,
> +    IgbPktBuf = 1
> +} IGBBastateCurrentBuffer;
> +
> +static hwaddr *
> +igb_buf_addr(IGBRxDescBufAddrs *buf_addrs, IGBBastateCurrentBuffer cur_buf)
> +{
> +    return (cur_buf == IgbPktBuf) ? &buf_addrs->pkt_buf_addr :
> +                                    &buf_addrs->hdr_buf_addr;
> +}
> +
> +static inline void
> +igb_read_adv_rx_split_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> +                                IGBRxDescBufAddrs *buf_addr)
> +{
> +    buf_addr->hdr_buf_addr = le64_to_cpu(desc->read.hdr_addr);
> +    buf_addr->pkt_buf_addr = le64_to_cpu(desc->read.pkt_addr);
> +}
> +
> +typedef struct IGBRxDescBuffWritten {
> +    uint16_t hdr_buf_written;
> +    uint16_t pkt_buf_written;
> +} IGBRxDescBuffWritten;
> +
> +static uint16_t *
> +igb_buf_written(IGBRxDescBuffWritten *written, IGBBastateCurrentBuffer cur_buf)
> +{
> +    return (cur_buf == IgbPktBuf) ? &written->pkt_buf_written :
> +                                    &written->hdr_buf_written;
> +}
> +
> +typedef struct IGBBAState {
> +    IGBRxDescBuffWritten written;
> +    IGBBastateCurrentBuffer cur_buf;
> +} IGBBAState;
> +
>   typedef struct IGBPacketRxDMAState {
>       size_t size;
>       size_t total_size;
> @@ -1249,20 +1305,43 @@ typedef struct IGBPacketRxDMAState {
>       uint32_t rx_desc_header_buf_size;
>       struct iovec *iov;
>       size_t iov_ofs;
> +    bool do_ps;
>       bool is_first;
> -    uint16_t written;
> -    hwaddr ba;
> +    IGBBAState bastate;
> +    IGBRxDescBufAddrs ba;
>   } IGBPacketRxDMAState;
>   
>   static inline void
> -igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
> -                  hwaddr *buff_addr)
> +igb_read_rx_descr(IGBCore *core,
> +                  union e1000_rx_desc_union *desc,
> +                  IGBPacketRxDMAState *pdma_st,
> +                  const E1000ERingInfo *r)
>   {
> +    uint32_t desc_type;
> +
>       if (igb_rx_use_legacy_descriptor(core)) {
> -        igb_read_lgcy_rx_descr(core, &desc->legacy, buff_addr);
> -    } else {
> -        igb_read_adv_rx_descr(core, &desc->adv, buff_addr);
> +        igb_read_lgcy_rx_descr(core, &desc->legacy,
> +                               &pdma_st->ba.pkt_buf_addr);
> +        pdma_st->ba.hdr_buf_addr = 0;
> +        return;
> +    }
> +
> +    /* advanced header split descriptor */
> +    if (igb_rx_use_ps_descriptor(core, r)) {
> +        igb_read_adv_rx_split_buf_descr(core, &desc->adv, &pdma_st->ba);
> +        return;
>       }
> +
> +    /* descriptor replication modes not supported */
> +    desc_type = igb_rx_queue_desctyp_get(core, r);
> +    if (desc_type != E1000_SRRCTL_DESCTYPE_ADV_ONEBUF) {
> +        trace_igb_wrn_rx_desc_modes_not_supp(desc_type);
> +    }
> +
> +    /* advanced single buffer descriptor */
> +    igb_read_adv_rx_single_buf_descr(core, &desc->adv,
> +                                     &pdma_st->ba.pkt_buf_addr);
> +    pdma_st->ba.hdr_buf_addr = 0;
>   }
>   
>   static void
> @@ -1405,6 +1484,13 @@ igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
>       desc->status = (uint8_t) le32_to_cpu(status_flags);
>   }
>   
> +static bool
> +igb_rx_ps_descriptor_split_always(IGBCore *core, const E1000ERingInfo *r)
> +{
> +    uint32_t desctyp = igb_rx_queue_desctyp_get(core, r);
> +    return desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS;
> +}
> +
>   static uint16_t
>   igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
>   {
> @@ -1492,16 +1578,70 @@ igb_write_adv_rx_descr(IGBCore *core,
>       d->wb.lower.lo_dword.pkt_info = cpu_to_le16(rss_type | (pkt_type << 4));
>   }
>   
> +typedef struct IGBSplitDescriptorData {
> +    bool sph;
> +    bool hbo;
> +    size_t hdr_len;
> +} IGBSplitDescriptorData;
> +
> +static inline void
> +igb_write_adv_ps_split_rx_descr(IGBCore *core,

split is redundant as ps should stand for "packet split", and it's not 
present for the corresponding function of e1000e 
(e1000e_write_ps_rx_descr) so remove it.

> +                                union e1000_adv_rx_desc *d,
> +                                struct NetRxPkt *pkt,
> +                                const E1000E_RSSInfo *rss_info,
> +                                const E1000ERingInfo *r,
> +                                uint16_t etqf,
> +                                bool ts,
> +                                IGBSplitDescriptorData *ps_desc_data,
> +                                IGBPacketRxDMAState *pdma_st)
> +{
> +    size_t pkt_len;
> +    size_t hdr_len = ps_desc_data->hdr_len;
> +
> +    bool split_always = igb_rx_ps_descriptor_split_always(core, r);
> +    if (!split_always) {
> +        if ((!ps_desc_data->sph && !ps_desc_data->hbo) ||
> +            (ps_desc_data->sph &&  ps_desc_data->hbo)) {

I guess you can simply use pdma_st->do_ps here.

> +            pkt_len = pdma_st->bastate.written.hdr_buf_written +
> +                      pdma_st->bastate.written.pkt_buf_written;
> +        } else {
> +            assert(!ps_desc_data->hbo);
> +            pkt_len = pdma_st->bastate.written.pkt_buf_written;
> +        }
> +    } else {
> +        pkt_len = pdma_st->bastate.written.pkt_buf_written;
> +    }
> +
> +    igb_write_adv_rx_descr(core, d, pkt, rss_info, etqf, ts, pkt_len);
> +
> +    d->wb.lower.lo_dword.hdr_info = (hdr_len << E1000_ADVRXD_HDR_LEN_OFFSET) &
> +                                    E1000_ADVRXD_ADV_HDR_LEN_MASK;
> +    d->wb.lower.lo_dword.hdr_info |= ps_desc_data->sph ? E1000_ADVRXD_HDR_SPH
> +                                                       : 0;
> +    d->wb.upper.status_error |= ps_desc_data->hbo ?
> +                                    E1000_ADVRXD_ST_ERR_HBO_OFFSET : 0;
> +}
> +
>   static inline void
> -igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
> -                   struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
> -                   uint16_t etqf, bool ts, uint16_t length)
> +igb_write_rx_descr(IGBCore *core,
> +                   union e1000_rx_desc_union *desc,
> +                   struct NetRxPkt *pkt,
> +                   const E1000E_RSSInfo *rss_info,
> +                   uint16_t etqf,
> +                   bool ts,
> +                   IGBSplitDescriptorData *ps_desc_data,
> +                   IGBPacketRxDMAState *pdma_st,
> +                   const E1000ERingInfo *r)
>   {
>       if (igb_rx_use_legacy_descriptor(core)) {
> -        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, length);
> +        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
> +                                pdma_st->bastate.written.pkt_buf_written);
> +    } else if (igb_rx_use_ps_descriptor(core, r)) {
> +        igb_write_adv_ps_split_rx_descr(core, &desc->adv, pkt, rss_info, r,
> +                                        etqf, ts, ps_desc_data, pdma_st);
>       } else {
> -        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
> -                               etqf, ts, length);
> +        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, etqf, ts,
> +                               pdma_st->bastate.written.pkt_buf_written);
>       }
>   }
>   
> @@ -1562,26 +1702,189 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000ERingInfo *rxi)
>              ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
>   }
>   
> +static bool
> +igb_do_ps(IGBCore *core,
> +          const E1000ERingInfo *r,
> +          struct NetRxPkt *pkt,
> +          size_t *hdr_len,
> +          IGBSplitDescriptorData *ps_desc_data)
> +{
> +    bool hasip4, hasip6;
> +    EthL4HdrProto l4hdr_proto;
> +    bool fragment;
> +    bool split_always;
> +    size_t bheader_size;
> +    size_t total_pkt_len;
> +
> +    if (!igb_rx_use_ps_descriptor(core, r)) {
> +        return false;
> +    }
> +
> +    memset(ps_desc_data, 0, sizeof(IGBSplitDescriptorData));
> +
> +    total_pkt_len = net_rx_pkt_get_total_len(pkt);
> +    bheader_size = igb_get_queue_rx_header_buf_size(core, r);
> +    split_always = igb_rx_ps_descriptor_split_always(core, r);
> +    if (split_always && total_pkt_len <= bheader_size) {
> +        *hdr_len = total_pkt_len;
> +        ps_desc_data->hdr_len = total_pkt_len;
> +        return true;
> +    }
> +
> +    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
> +
> +    if (hasip4) {
> +        fragment = net_rx_pkt_get_ip4_info(pkt)->fragment;
> +    } else if (hasip6) {
> +        fragment = net_rx_pkt_get_ip6_info(pkt)->fragment;
> +    } else {
> +        ps_desc_data->hdr_len = bheader_size;
> +        goto header_not_handled;
> +    }
> +
> +    if (fragment && (core->mac[RFCTL] & E1000_RFCTL_IPFRSP_DIS)) {
> +        ps_desc_data->hdr_len = bheader_size;
> +        goto header_not_handled;
> +    }
> +
> +    /* no header splitting for SCTP */
> +    if (!fragment && (l4hdr_proto == ETH_L4_HDR_PROTO_UDP ||
> +                      l4hdr_proto == ETH_L4_HDR_PROTO_TCP)) {
> +        *hdr_len = net_rx_pkt_get_l5_hdr_offset(pkt);
> +    } else {
> +        *hdr_len = net_rx_pkt_get_l4_hdr_offset(pkt);
> +    }
> +
> +    ps_desc_data->sph = true;
> +    ps_desc_data->hdr_len = *hdr_len;
> +
> +    if (*hdr_len > bheader_size) {
> +        ps_desc_data->hbo = true;
> +        goto header_not_handled;
> +    }
> +
> +    return true;
> +
> +header_not_handled:
> +    if (split_always) {
> +        *hdr_len = bheader_size;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>   static void
>   igb_truncate_to_descriptor_size(IGBPacketRxDMAState *pdma_st, size_t *size)
>   {
> -    if (*size > pdma_st->rx_desc_packet_buf_size) {
> -        *size = pdma_st->rx_desc_packet_buf_size;
> +    if (pdma_st->do_ps && pdma_st->is_first) {
> +        if (*size > pdma_st->rx_desc_packet_buf_size + pdma_st->ps_hdr_len) {
> +            *size = pdma_st->rx_desc_packet_buf_size + pdma_st->ps_hdr_len;
> +        }
> +    } else {
> +        if (*size > pdma_st->rx_desc_packet_buf_size) {
> +            *size = pdma_st->rx_desc_packet_buf_size;
> +        }
>       }
>   }
>   
> +static inline void
> +igb_write_hdr_to_rx_buffers(IGBCore *core,
> +                            PCIDevice *d,
> +                            IGBPacketRxDMAState *pdma_st,
> +                            const char *data,
> +                            dma_addr_t data_len)
> +{
> +    assert(data_len <= pdma_st->rx_desc_header_buf_size -
> +                       pdma_st->bastate.written.hdr_buf_written);
> +    pci_dma_write(d,
> +                  pdma_st->ba.hdr_buf_addr +
> +                  pdma_st->bastate.written.hdr_buf_written,
> +                  data, data_len);
> +    pdma_st->bastate.written.hdr_buf_written += data_len;
> +    pdma_st->bastate.cur_buf = IgbPktBuf;
> +}
> +
> +static void
> +igb_write_packet_hdr_to_descr_addr(IGBCore *core,
> +                                   struct NetRxPkt *pkt,
> +                                   PCIDevice *d,
> +                                   IGBPacketRxDMAState *pdma_st,
> +                                   size_t *copy_size)
> +{
> +    size_t iov_copy;
> +    size_t ps_hdr_copied = 0;
> +
> +    if (!pdma_st->is_first) {
> +        /* Leave buffer 0 of each descriptor except first */
> +        /* empty                                          */
> +        pdma_st->bastate.cur_buf = IgbPktBuf;
> +        return;
> +    }
> +
> +    do {
> +        iov_copy = MIN(pdma_st->ps_hdr_len - ps_hdr_copied,
> +                       pdma_st->iov->iov_len - pdma_st->iov_ofs);
> +
> +        igb_write_hdr_to_rx_buffers(core, d, pdma_st,
> +                                    pdma_st->iov->iov_base,
> +                                    iov_copy);
> +
> +        *copy_size -= iov_copy;
> +        ps_hdr_copied += iov_copy;
> +
> +        pdma_st->iov_ofs += iov_copy;
> +        if (pdma_st->iov_ofs == pdma_st->iov->iov_len) {
> +            pdma_st->iov++;
> +            pdma_st->iov_ofs = 0;
> +        }
> +    } while (ps_hdr_copied < pdma_st->ps_hdr_len);
> +
> +    pdma_st->is_first = false;
> +}
> +
>   static void
>   igb_write_payload_frag_to_rx_buffers(IGBCore *core,
>                                        PCIDevice *d,
> -                                     hwaddr ba,
> -                                     uint16_t *written,
> -                                     uint32_t cur_buf_len,
> +                                     IGBPacketRxDMAState *pdma_st,
>                                        const char *data,
>                                        dma_addr_t data_len)
>   {
> -    trace_igb_rx_desc_buff_write(ba, *written, data, data_len);
> -    pci_dma_write(d, ba + *written, data, data_len);
> -    *written += data_len;
> +    while (data_len > 0) {
> +        assert(pdma_st->bastate.cur_buf == IgbHdrBuf ||
> +               pdma_st->bastate.cur_buf == IgbPktBuf);
> +
> +        uint32_t cur_buf_bytes_left =
> +            pdma_st->rx_desc_packet_buf_size -
> +            *igb_buf_written(&pdma_st->bastate.written,
> +                             pdma_st->bastate.cur_buf);
> +        uint32_t bytes_to_write = MIN(data_len, cur_buf_bytes_left);
> +
> +        trace_igb_rx_desc_buff_write(
> +            pdma_st->bastate.cur_buf,
> +            *igb_buf_addr(&pdma_st->ba, pdma_st->bastate.cur_buf),
> +            *igb_buf_written(&pdma_st->bastate.written,
> +                             pdma_st->bastate.cur_buf),
> +            data,
> +            bytes_to_write);
> +
> +        pci_dma_write(d,
> +                      *igb_buf_addr(&pdma_st->ba, pdma_st->bastate.cur_buf) +
> +                      *igb_buf_written(&pdma_st->bastate.written,
> +                                       pdma_st->bastate.cur_buf),
> +                      data, bytes_to_write);
> +
> +        *igb_buf_written(&pdma_st->bastate.written,
> +                        pdma_st->bastate.cur_buf) += bytes_to_write;
> +        data += bytes_to_write;
> +        data_len -= bytes_to_write;
> +
> +        if (*igb_buf_written(&pdma_st->bastate.written,
> +                             pdma_st->bastate.cur_buf) ==
> +            pdma_st->rx_desc_packet_buf_size) {
> +            pdma_st->bastate.cur_buf++;
> +        }
> +    }

I was wrong about converting ba array into struct. Please revert it to 
an array. Now this function is too messy and hard to read. It's possible 
to improve the code without reverting to array by e.g. assigning the 
results of igb_buf_written() to a local variable, but the original code 
was better.

>   }
>   
>   static void
> @@ -1598,9 +1901,7 @@ igb_write_payload_to_rx_buffers(IGBCore *core,
>       while (*copy_size) {
>           iov_copy = MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->iov_ofs);
>           igb_write_payload_frag_to_rx_buffers(core, d,
> -                                             pdma_st->ba,
> -                                             &pdma_st->written,
> -                                             pdma_st->rx_desc_packet_buf_size,
> +                                             pdma_st,
>                                                pdma_st->iov->iov_base +
>                                                pdma_st->iov_ofs,
>                                                iov_copy);
> @@ -1616,9 +1917,7 @@ igb_write_payload_to_rx_buffers(IGBCore *core,
>       if (pdma_st->desc_offset + pdma_st->desc_size >= pdma_st->total_size) {
>           /* Simulate FCS checksum presence in the last descriptor */
>           igb_write_payload_frag_to_rx_buffers(core, d,
> -                                             pdma_st->ba,
> -                                             &pdma_st->written,
> -                                             pdma_st->rx_desc_packet_buf_size,
> +                                             pdma_st,
>                                                (const char *) &fcs_pad,
>                                                e1000x_fcs_len(core->mac));
>       }
> @@ -1632,7 +1931,7 @@ igb_write_to_rx_buffers(IGBCore *core,
>   {
>       size_t copy_size;
>   
> -    if (!pdma_st->ba) {
> +    if (!pdma_st->ba.pkt_buf_addr) {
>           /* as per intel docs; skip descriptors with null buf addr */
>           trace_e1000e_rx_null_descriptor();
>           return;
> @@ -1646,6 +1945,14 @@ igb_write_to_rx_buffers(IGBCore *core,
>       igb_truncate_to_descriptor_size(pdma_st, &pdma_st->desc_size);
>       copy_size = pdma_st->size - pdma_st->desc_offset;
>       igb_truncate_to_descriptor_size(pdma_st, &copy_size);
> +
> +    /* For PS mode copy the packet header first */
> +    if (pdma_st->do_ps) {
> +        igb_write_packet_hdr_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
> +    } else {
> +        pdma_st->bastate.cur_buf = IgbPktBuf;
> +    }
> +
>       igb_write_payload_to_rx_buffers(core, pkt, d, pdma_st, &copy_size);
>   }
>   
> @@ -1660,6 +1967,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>       union e1000_rx_desc_union desc;
>       const E1000ERingInfo *rxi;
>       size_t rx_desc_len;
> +    IGBSplitDescriptorData ps_desc_data;
>   
>       IGBPacketRxDMAState pdma_st = {0};
>       pdma_st.is_first = true;
> @@ -1678,8 +1986,12 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>           d = core->owner;
>       }
>   
> +    pdma_st.do_ps = igb_do_ps(core, rxi, pkt,
> +                              &pdma_st.ps_hdr_len,
> +                              &ps_desc_data);
> +
>       do {
> -        pdma_st.written = 0;
> +        memset(&pdma_st.bastate, 0, sizeof(IGBBAState));
>           bool is_last = false;
>   
>           if (igb_ring_empty(core, rxi)) {
> @@ -1690,7 +2002,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>           pci_dma_read(d, base, &desc, rx_desc_len);
>           trace_e1000e_rx_descr(rxi->idx, base, rx_desc_len);
>   
> -        igb_read_rx_descr(core, &desc, &pdma_st.ba);
> +        igb_read_rx_descr(core, &desc, &pdma_st, rxi);
>   
>           igb_write_to_rx_buffers(core, pkt, d, &pdma_st);
>           pdma_st.desc_offset += pdma_st.desc_size;
> @@ -1698,8 +2010,13 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>               is_last = true;
>           }
>   
> -        igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
> -                           rss_info, etqf, ts, pdma_st.written);
> +        igb_write_rx_descr(core, &desc,
> +                           is_last ? pkt : NULL,
> +                           rss_info,
> +                           etqf, ts,
> +                           &ps_desc_data,
> +                           &pdma_st,
> +                           rxi);
>           pci_dma_write(d, base, &desc, rx_desc_len);
>           igb_ring_advance(core, rxi,
>                            rx_desc_len / E1000_MIN_RX_DESC_LEN);
> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
> index 36763f2ff7..080f03fc43 100644
> --- a/hw/net/igb_regs.h
> +++ b/hw/net/igb_regs.h
> @@ -452,6 +452,7 @@ union e1000_adv_rx_desc {
>   #define E1000_SRRCTL_BSIZEHDRSIZE_MASK         0x00000F00
>   #define E1000_SRRCTL_BSIZEHDRSIZE_SHIFT        2  /* Shift _left_ */
>   #define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF       0x02000000
> +#define E1000_SRRCTL_DESCTYPE_HDR_SPLIT        0x04000000
>   #define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
>   #define E1000_SRRCTL_DESCTYPE_MASK             0x0E000000
>   #define E1000_SRRCTL_DROP_EN                   0x80000000
> @@ -699,6 +700,12 @@ union e1000_adv_rx_desc {
>   #define E1000_ADVRXD_PKT_UDP  BIT(5)
>   #define E1000_ADVRXD_PKT_SCTP BIT(6)
>   
> +#define E1000_ADVRXD_HDR_LEN_OFFSET    (21 - 16)
> +#define E1000_ADVRXD_ADV_HDR_LEN_MASK  ((BIT(10) - 1) << \
> +                                        E1000_ADVRXD_HDR_LEN_OFFSET)
> +#define E1000_ADVRXD_HDR_SPH           BIT(15)
> +#define E1000_ADVRXD_ST_ERR_HBO_OFFSET BIT(3 + 20)
> +
>   static inline uint8_t igb_ivar_entry_rx(uint8_t i)
>   {
>       return i < 8 ? i * 4 : (i - 8) * 4 + 2;
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index def651c186..e97e9dc17b 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -277,7 +277,7 @@ igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
>   igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
>   
>   igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
> -igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "buffer %u, addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
> +igb_rx_desc_buff_write(uint8_t idx, uint64_t addr, uint16_t offset, const void* source, uint32_t len) "buffer %u, addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
>   
>   igb_rx_metadata_rss(uint32_t rss, uint16_t rss_pkt_type) "RSS data: rss: 0x%X, rss_pkt_type: 0x%X"
>   

