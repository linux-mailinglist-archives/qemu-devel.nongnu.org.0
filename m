Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2C6F01A4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:25:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prvzO-0004HI-Iu; Thu, 27 Apr 2023 03:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prvzI-0004H2-89
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:24:20 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prvzE-0006ya-MP
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:24:19 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64115eef620so2883029b3a.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682580255; x=1685172255;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k60UEeEi3NuOzK2AH53vfEF5BHJt2SbqjtyA2zjtLlE=;
 b=mFqCw6VqMbaeUSHnjVFs6dWt1jA5XKW/RI8MR3kVgtyhalBa/CmUv6dTA7X0TnB5w9
 PmHBckyZUKsM4TiqRj2cp4cQfk1buPT5rMhlaHImNi4e7LwBaa9T9jWhDgx2iVeXUFAj
 5AxNxMYnU/NFJllsTFJ6NGNFOHfwbV65elLIRYY31wKTgWexla3SQSrH6CyeojIGXt9E
 tyFScGwms5dy+gFIA6gpCXjbNj5CxMYvLtdYHwcS6UjWoumiT63pW5CZld0J0kRFGkfs
 jrj+pngjqWuNEIJUyIDzzUgOpWJs0l4q/ybzsjLrtbzEe6JnEdOR6/pyFmMcxbvpmEoO
 bYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682580255; x=1685172255;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k60UEeEi3NuOzK2AH53vfEF5BHJt2SbqjtyA2zjtLlE=;
 b=VXgoOa2Y97OQx01wFsy0D66lX20XSfy4jg6WDP1TK3kPVDzIUJVMVYVPqZcQXdOPvx
 0YurXm7KsoGJGwVIFoQb4HcwX/cLgsxeVd8cRn3QNTZCO//5Pk+t/D4KEODudpsokKv2
 SpZuk3Qbp3IpeEKsCSd3LlmXC0qFZ7z6sQUOFU0fE3sROD5UqjTmMSFVb3Il4od7PIG/
 EXkomHWFIx7C8idWSA+BsrveXXSYYCH/GHJI89NqgN8g6NOK87YRJGgq960Uh1re19Nb
 h9zogMZ0isV6AWyuIwuijWUKDM/2PQDwwgsscPUsWe2rjpOEqgmRqsoMFQ5dcy/vY3zp
 TAlw==
X-Gm-Message-State: AC+VfDxzv5FGeC18PihKGmGUXEphDzU3JF1xlUTpj9VGa61Y/TmG3FiW
 TDWmMxBgZbDKCZOlM1YB3gIh2A==
X-Google-Smtp-Source: ACHHUZ4g7LOS+Nna9vVeyAacJbOBDmOmVzLMAz4uA+HkbBominIOGqna6iNak9NJywXcB94QEkZJNg==
X-Received: by 2002:aa7:888e:0:b0:63d:3a99:f9f0 with SMTP id
 z14-20020aa7888e000000b0063d3a99f9f0mr1342106pfe.3.1682580254864; 
 Thu, 27 Apr 2023 00:24:14 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b0063b7a0b9cc5sm12481555pfv.186.2023.04.27.00.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:24:14 -0700 (PDT)
Message-ID: <24b65775-fd80-d608-2fb2-3565fcced855@daynix.com>
Date: Thu, 27 Apr 2023 16:24:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] igb: RX descriptors handling cleanup
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: jasowang@redhat.com, k.kwiecien@samsung.com, m.sochacki@samsung.com,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <CGME20230426160915eucas1p1c5f8933d7c737d3b6fe466baafd2c86b@eucas1p1.samsung.com>
 <20230426160908.4768-1-t.dzieciol@partner.samsung.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230426160908.4768-1-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/04/27 1:09, Tomasz Dzieciol wrote:
> Format of Intel 82576 was changed in comparison to Intel 82574 extended
> descriptors. This change updates filling of advanced descriptors fields
> accordingly:
> * remove TCP ACK detection
> * add IPv6 with extensions traffic detection
> * fragment checksum and IP ID is filled only when RXCSUM.IPPCSE is set (in
>    addition to RXCSUM.PCSD bit cleared condition)
> 
> Refactoring is done in preparation for support of multiple advanced
> descriptors RX modes, especially packet-split modes.
> 
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>

As I wrote earlier:
 > Please rebase to:
 > https://patchew.org/QEMU/20230420054657.50367-1-akihiko.odaki@daynix.com/
 >
 > And add a cover letter with the following lines:
 > Based-on: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 > ("[PATCH v2 00/41] igb: Fix for DPDK")
 >
 > I want the series to be merged first as it includes several bug fixes.

Also, next time CC: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
He is a reviewer of igb.

> ---
>   hw/net/e1000e_core.c     |  16 +-
>   hw/net/e1000x_regs.h     |   1 +
>   hw/net/igb_core.c        | 505 ++++++++++++++++++++++++---------------
>   hw/net/igb_regs.h        |  21 +-
>   hw/net/trace-events      |   6 +-
>   tests/qtest/libqos/igb.c |   5 +
>   6 files changed, 344 insertions(+), 210 deletions(-)
> 
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 78373d7db7..d874809d93 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -1418,11 +1418,11 @@ e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
>   }
>   
>   static void
> -e1000e_write_to_rx_buffers(E1000ECore *core,
> -                           hwaddr ba[MAX_PS_BUFFERS],
> -                           e1000e_ba_state *bastate,
> -                           const char *data,
> -                           dma_addr_t data_len)
> +e1000e_write_payload_to_rx_buffers(E1000ECore *core,
> +                                   hwaddr ba[MAX_PS_BUFFERS],
> +                                   e1000e_ba_state *bastate,
> +                                   const char *data,
> +                                   dma_addr_t data_len)
>   {
>       while (data_len > 0) {
>           uint32_t cur_buf_len = core->rxbuf_sizes[bastate->cur_idx];
> @@ -1594,8 +1594,8 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>                   while (copy_size) {
>                       iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
>   
> -                    e1000e_write_to_rx_buffers(core, ba, &bastate,
> -                                            iov->iov_base + iov_ofs, iov_copy);
> +                    e1000e_write_payload_to_rx_buffers(core, ba, &bastate,
> +                                                       iov->iov_base + iov_ofs, iov_copy);
>   
>                       copy_size -= iov_copy;
>                       iov_ofs += iov_copy;
> @@ -1607,7 +1607,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>   
>                   if (desc_offset + desc_size >= total_size) {
>                       /* Simulate FCS checksum presence in the last descriptor */
> -                    e1000e_write_to_rx_buffers(core, ba, &bastate,
> +                    e1000e_write_payload_to_rx_buffers(core, ba, &bastate,
>                             (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
>                   }
>               }
> diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
> index 13760c66d3..344fd10359 100644
> --- a/hw/net/e1000x_regs.h
> +++ b/hw/net/e1000x_regs.h
> @@ -827,6 +827,7 @@ union e1000_rx_desc_packet_split {
>   /* Receive Checksum Control bits */
>   #define E1000_RXCSUM_IPOFLD     0x100   /* IP Checksum Offload Enable */
>   #define E1000_RXCSUM_TUOFLD     0x200   /* TCP/UDP Checksum Offload Enable */
> +#define E1000_RXCSUM_IPPCSE     0x1000  /* IP Payload Checksum enable */
>   #define E1000_RXCSUM_PCSD       0x2000  /* Packet Checksum Disable */
>   
>   #define E1000_RING_DESC_LEN       (16)
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 96b7335b31..47c4a16e84 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -267,6 +267,21 @@ igb_rx_use_legacy_descriptor(IGBCore *core)
>       return false;
>   }
>   
> +typedef struct E1000E_RingInfo_st {
> +    int dbah;
> +    int dbal;
> +    int dlen;
> +    int dh;
> +    int dt;
> +    int idx;
> +} E1000E_RingInfo;
> +
> +static uint32_t
> +igb_rx_queue_desctyp_get(IGBCore *core, const E1000E_RingInfo *r)
> +{
> +    return core->mac[E1000_SRRCTL(r->idx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK;
> +}
> +
>   static inline bool
>   igb_rss_enabled(IGBCore *core)
>   {
> @@ -694,15 +709,6 @@ static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
>       return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
>   }
>   
> -typedef struct E1000E_RingInfo_st {
> -    int dbah;
> -    int dbal;
> -    int dlen;
> -    int dh;
> -    int dt;
> -    int idx;
> -} E1000E_RingInfo;
> -
>   static inline bool
>   igb_ring_empty(IGBCore *core, const E1000E_RingInfo *r)
>   {
> @@ -941,6 +947,14 @@ igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
>                            bufsize;
>   }
>   
> +static uint32_t
> +igb_get_queue_rx_header_buf_size(IGBCore *core, const E1000E_RingInfo *r)
> +{
> +    uint32_t srr_size = (core->mac[E1000_SRRCTL(r->idx) >> 2] &
> +                         E1000_SRRCTL_BSIZEHDR_MASK) >> 8;
> +    return srr_size * 64;

Instead, do:
uint32_t srrctl = core->mac[E1000_SRRCTL(r->idx) >> 2];
return (srrctl & E1000_SRRCTL_BSIZEHDRSIZE_MASK) >> 
E1000_SRRCTL_BSIZEHDRSIZE_SHIFT;

x >> E1000_SRRCTL_BSIZEHDRSIZE_SHIFT is identical with: (x >> 8) * 64

Also, you should use E1000_SRRCTL_BSIZEHDRSIZE_MASK rather than 
E1000_SRRCTL_BSIZEHDR_MASK here. Section 8.10.2 of the datasheet says 
the field is 3-bit.

> +}
> +
>   void
>   igb_start_recv(IGBCore *core)
>   {
> @@ -1225,21 +1239,34 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
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
>   static inline void
>   igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
> -                  hwaddr *buff_addr)
> +                  hwaddr buff_addr[MAX_PS_BUFFERS],

Don't use an array here. Instead use a struct as e1000_adv_rx_desc does; 
it will be more explicit and easier to read. And I think this should be 
rather part of the next patch.

> +                  const E1000E_RingInfo *r)
>   {
> +    uint32_t desc_type;
> +
>       if (igb_rx_use_legacy_descriptor(core)) {
> -        igb_read_lgcy_rx_descr(core, &desc->legacy, buff_addr);
> -    } else {
> -        igb_read_adv_rx_descr(core, &desc->adv, buff_addr);
> +        igb_read_lgcy_rx_descr(core, &desc->legacy, &buff_addr[1]);
> +        buff_addr[0] = 0;
> +        return;
>       }
> +
> +    /* modes other than advanced single buffer descriptor not supported */
> +    desc_type = igb_rx_queue_desctyp_get(core, r);
> +    if (desc_type != E1000_SRRCTL_DESCTYPE_ADV_ONEBUF) {
> +        trace_igb_wrn_rx_desc_modes_not_supp(desc_type);
> +    }
> +
> +    /* advanced single buffer descriptor */
> +    igb_read_adv_rx_single_buf_descr(core, &desc->adv, &buff_addr[1]);
> +    buff_addr[0] = 0;
>   }
>   
>   static void
> @@ -1281,15 +1308,11 @@ igb_verify_csum_in_sw(IGBCore *core,
>   }
>   
>   static void
> -igb_build_rx_metadata(IGBCore *core,
> -                      struct NetRxPkt *pkt,
> -                      bool is_eop,
> -                      const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
> -                      uint16_t *pkt_info, uint16_t *hdr_info,
> -                      uint32_t *rss,
> -                      uint32_t *status_flags,
> -                      uint16_t *ip_id,
> -                      uint16_t *vlan_tag)
> +igb_build_rx_metadata_common(IGBCore *core,
> +                             struct NetRxPkt *pkt,
> +                             bool is_eop,
> +                             uint32_t *status_flags,
> +                             uint16_t *vlan_tag)
>   {
>       struct virtio_net_hdr *vhdr;
>       bool hasip4, hasip6, csum_valid;
> @@ -1298,7 +1321,6 @@ igb_build_rx_metadata(IGBCore *core,
>       *status_flags = E1000_RXD_STAT_DD;
>   
>       /* No additional metadata needed for non-EOP descriptors */
> -    /* TODO: EOP apply only to status so don't skip whole function. */
>       if (!is_eop) {
>           goto func_exit;
>       }
> @@ -1315,64 +1337,6 @@ igb_build_rx_metadata(IGBCore *core,
>           trace_e1000e_rx_metadata_vlan(*vlan_tag);
>       }
>   
> -    /* Packet parsing results */
> -    if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) != 0) {
> -        if (rss_info->enabled) {
> -            *rss = cpu_to_le32(rss_info->hash);
> -            trace_igb_rx_metadata_rss(*rss);
> -        }
> -    } else if (hasip4) {
> -            *status_flags |= E1000_RXD_STAT_IPIDV;
> -            *ip_id = cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
> -            trace_e1000e_rx_metadata_ip_id(*ip_id);
> -    }
> -
> -    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP && net_rx_pkt_is_tcp_ack(pkt)) {
> -        *status_flags |= E1000_RXD_STAT_ACK;
> -        trace_e1000e_rx_metadata_ack();
> -    }
> -
> -    if (pkt_info) {
> -        *pkt_info = rss_info->enabled ? rss_info->type : 0;
> -
> -        if (etqf < 8) {
> -            *pkt_info |= BIT(11) | (etqf << 4);
> -        } else {
> -            if (hasip4) {
> -                *pkt_info |= E1000_ADVRXD_PKT_IP4;
> -            }
> -
> -            if (hasip6) {
> -                *pkt_info |= E1000_ADVRXD_PKT_IP6;
> -            }
> -
> -            switch (l4hdr_proto) {
> -            case ETH_L4_HDR_PROTO_TCP:
> -                *pkt_info |= E1000_ADVRXD_PKT_TCP;
> -                break;
> -
> -            case ETH_L4_HDR_PROTO_UDP:
> -                *pkt_info |= E1000_ADVRXD_PKT_UDP;
> -                break;
> -
> -            case ETH_L4_HDR_PROTO_SCTP:
> -                *pkt_info |= E1000_ADVRXD_PKT_SCTP;
> -                break;
> -
> -            default:
> -                break;
> -            }
> -        }
> -    }
> -
> -    if (hdr_info) {
> -        *hdr_info = 0;
> -    }
> -
> -    if (ts) {
> -        *status_flags |= BIT(16);
> -    }
> -
>       /* RX CSO information */
>       if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
>           trace_e1000e_rx_metadata_ipv6_sum_disabled();
> @@ -1426,58 +1390,125 @@ func_exit:
>   }
>   
>   static inline void
> -igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
> +igb_write_lgcy_rx_descr(IGBCore *core,
> +                        struct e1000_rx_desc *d,

Why renaming desc to d?

>                           struct NetRxPkt *pkt,
> -                        const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
> +                        const E1000E_RSSInfo *rss_info,
>                           uint16_t length)
>   {
> -    uint32_t status_flags, rss;
> -    uint16_t ip_id;
> +    uint32_t status_flags;
>   
>       assert(!rss_info->enabled);
> -    desc->length = cpu_to_le16(length);
> -    desc->csum = 0;
>   
> -    igb_build_rx_metadata(core, pkt, pkt != NULL,
> -                          rss_info, etqf, ts,
> -                          NULL, NULL, &rss,
> -                          &status_flags, &ip_id,
> -                          &desc->special);
> -    desc->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
> -    desc->status = (uint8_t) le32_to_cpu(status_flags);
> +    memset(d, 0, sizeof(*d));
> +    d->length = cpu_to_le16(length);
> +    igb_build_rx_metadata_common(core, pkt, pkt != NULL,
> +                                 &status_flags,
> +                                 &d->special);
> +
> +    d->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
> +    d->status = (uint8_t) le32_to_cpu(status_flags);
> +}
> +
> +static uint16_t
> +igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
> +{
> +    uint16_t pkt_type = 0;
> +    bool hasip4, hasip6;
> +    EthL4HdrProto l4hdr_proto;
> +
> +    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
> +
> +    if (hasip6 && !(core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
> +        eth_ip6_hdr_info *ip6hdr_info  = net_rx_pkt_get_ip6_info(pkt);
> +        pkt_type |= ip6hdr_info->has_ext_hdrs ? E1000_ADVRXD_PKT_IP6E :
> +                                                E1000_ADVRXD_PKT_IP6;
> +    } else if (hasip4) {
> +        pkt_type = E1000_ADVRXD_PKT_IP4;
> +    }
> +
> +    if (etqf < 8) {
> +        pkt_type |= (BIT(11) >> 4) | etqf;
> +        return pkt_type;
> +    }
> +
> +    switch (l4hdr_proto) {
> +    case ETH_L4_HDR_PROTO_TCP:
> +        pkt_type |= E1000_ADVRXD_PKT_TCP;
> +        break;
> +    case ETH_L4_HDR_PROTO_UDP:
> +        pkt_type |= E1000_ADVRXD_PKT_UDP;
> +        break;
> +    case ETH_L4_HDR_PROTO_SCTP:
> +        pkt_type |= E1000_ADVRXD_PKT_SCTP;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return pkt_type;
>   }
>   
>   static inline void
> -igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> +igb_write_adv_rx_descr(IGBCore *core,
> +                       union e1000_adv_rx_desc *d,
>                          struct NetRxPkt *pkt,
> -                       const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
> +                       const E1000E_RSSInfo *rss_info,
> +                       uint16_t etqf,
> +                       bool ts,
>                          uint16_t length)
>   {
> -    memset(&desc->wb, 0, sizeof(desc->wb));
> +    bool hasip4, hasip6;
> +    EthL4HdrProto l4hdr_proto;
> +    uint16_t rss_type = 0, pkt_type;
> +    bool eop = (pkt != NULL);
> +    memset(&d->wb, 0, sizeof(d->wb));
> +
> +    d->wb.upper.length = cpu_to_le16(length);
> +    igb_build_rx_metadata_common(core, pkt, eop,
> +                                 &d->wb.upper.status_error,
> +                                 &d->wb.upper.vlan);
> +
> +    if (!eop) {
> +        return;
> +    }
> +
> +    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
>   
> -    desc->wb.upper.length = cpu_to_le16(length);
> +    if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) && rss_info->enabled) {

I think the older style better described that RSS and checksumming is 
mutally exclusive.

> +        d->wb.lower.hi_dword.rss = cpu_to_le32(rss_info->hash);
> +        rss_type = rss_info->type;
> +        trace_igb_rx_metadata_rss(d->wb.lower.hi_dword.rss, rss_type);
> +    } else if (!(core->mac[RXCSUM] & E1000_RXCSUM_PCSD) &&
> +               core->mac[RXCSUM] & E1000_RXCSUM_IPPCSE &&
> +               hasip4) {
> +        d->wb.lower.hi_dword.csum_ip.ip_id = cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
> +        trace_e1000e_rx_metadata_ip_id(d->wb.lower.hi_dword.csum_ip.ip_id);
> +    }
>   
> -    igb_build_rx_metadata(core, pkt, pkt != NULL,
> -                          rss_info, etqf, ts,
> -                          &desc->wb.lower.lo_dword.pkt_info,
> -                          &desc->wb.lower.lo_dword.hdr_info,
> -                          &desc->wb.lower.hi_dword.rss,
> -                          &desc->wb.upper.status_error,
> -                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
> -                          &desc->wb.upper.vlan);
> +    if (ts) {
> +        d->wb.upper.status_error |= BIT(16);
> +    }
> +
> +    pkt_type = igb_rx_desc_get_packet_type(core, pkt, etqf);
> +    trace_e1000e_rx_metadata_pkt_type(pkt_type);
> +    d->wb.lower.lo_dword.pkt_info = cpu_to_le16(rss_type | (pkt_type << 4));
>   }
>   
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
> +                   uint16_t(*written)[MAX_PS_BUFFERS],
> +                   const E1000E_RingInfo *r)
>   {
>       if (igb_rx_use_legacy_descriptor(core)) {
> -        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
> -                                etqf, ts, length);
> +        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, (*written)[1]);
>       } else {
> -        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
> -                               etqf, ts, length);
> +        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, etqf, ts, (*written)[1]);
>       }
>   }
>   
> @@ -1513,19 +1544,6 @@ igb_pci_dma_write_rx_desc(IGBCore *core, PCIDevice *dev, dma_addr_t addr,
>       }
>   }
>   
> -static void
> -igb_write_to_rx_buffers(IGBCore *core,
> -                        PCIDevice *d,
> -                        hwaddr ba,
> -                        uint16_t *written,
> -                        const char *data,
> -                        dma_addr_t data_len)
> -{
> -    trace_igb_rx_desc_buff_write(ba, *written, data, data_len);
> -    pci_dma_write(d, ba + *written, data, data_len);
> -    *written += data_len;
> -}
> -
>   static void
>   igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
>                       size_t pkt_size, size_t pkt_fcs_size)
> @@ -1551,6 +1569,136 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
>              ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
>   }
>   
> +typedef struct igb_ba_state_st {
> +    uint16_t written[MAX_PS_BUFFERS];
> +    uint8_t cur_idx;
> +} igb_ba_state;
> +
> +typedef struct {
> +    size_t size;
> +    size_t total_size;
> +    size_t ps_hdr_len;
> +    size_t desc_size;
> +    size_t desc_offset;
> +    uint32_t rx_desc_packet_buf_size;
> +    uint32_t rx_desc_header_buf_size;
> +    struct iovec *iov;
> +    size_t iov_ofs;
> +    bool is_first;
> +    igb_ba_state bastate;
> +    hwaddr ba[MAX_PS_BUFFERS];
> +} igb_packet_tx_dma_state;

Follow the convention described in docs/devel/style.rst for new typedefs.

Also, it says tx but it's used for rx.

> +
> +static void
> +igb_truncate_to_descriptor_size(igb_packet_tx_dma_state *pdma_st, size_t *size)
> +{
> +    if (*size > pdma_st->rx_desc_packet_buf_size) {
> +        *size = pdma_st->rx_desc_packet_buf_size;
> +    }
> +}
> +
> +static void
> +igb_write_payload_to_rx_buffers(IGBCore *core,
> +                                PCIDevice *d,
> +                                hwaddr (*ba)[MAX_PS_BUFFERS],


> +                                igb_ba_state *bastate,
> +                                uint32_t cur_buf_len,
> +                                const char *data,
> +                                dma_addr_t data_len)
> +{
> +    while (data_len > 0) {
> +        assert(bastate->cur_idx < MAX_PS_BUFFERS);
> +
> +        uint32_t cur_buf_bytes_left = cur_buf_len -
> +                                      bastate->written[bastate->cur_idx];
> +        uint32_t bytes_to_write = MIN(data_len, cur_buf_bytes_left);
> +
> +        trace_igb_rx_desc_buff_write(bastate->cur_idx,
> +                                     (*ba)[bastate->cur_idx],
> +                                     bastate->written[bastate->cur_idx],
> +                                     data,
> +                                     bytes_to_write);
> +
> +        pci_dma_write(d,
> +                      (*ba)[bastate->cur_idx] +
> +                      bastate->written[bastate->cur_idx],
> +                      data, bytes_to_write);
> +
> +        bastate->written[bastate->cur_idx] += bytes_to_write;
> +        data += bytes_to_write;
> +        data_len -= bytes_to_write;
> +
> +        if (bastate->written[bastate->cur_idx] == cur_buf_len) {
> +            bastate->cur_idx++;
> +        }
> +    }
> +}
> +
> +static void
> +igb_write_packet_payload_to_descr_addr(IGBCore *core,

The names of igb_write_payload_to_rx_buffers() and 
igb_write_packet_payload_to_descr_addr() don't disambiguate themselves. 
Since igb_write_payload_to_rx_buffers() only writes a framgent of the 
payload, you may rename it to 
igb_write_payload_fragment_to_rx_buffers(), and rename 
igb_write_packet_payload_to_descr_addr() to 
igb_write_payload_to_rx_buffers().

> +                                       struct NetRxPkt *pkt,
> +                                       PCIDevice *d,
> +                                       igb_packet_tx_dma_state *pdma_st,
> +                                       size_t *copy_size)
> +{
> +    static const uint32_t fcs_pad;
> +    size_t iov_copy;
> +
> +    /* Copy packet payload */
> +    while (*copy_size) {
> +        iov_copy = MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->iov_ofs);
> +        igb_write_payload_to_rx_buffers(core, d,
> +                                        &pdma_st->ba,
> +                                        &pdma_st->bastate,
> +                                        pdma_st->rx_desc_packet_buf_size,
> +                                        pdma_st->iov->iov_base + pdma_st->iov_ofs,
> +                                        iov_copy);
> +
> +        *copy_size -= iov_copy;
> +        pdma_st->iov_ofs += iov_copy;
> +        if (pdma_st->iov_ofs == pdma_st->iov->iov_len) {
> +            pdma_st->iov++;
> +            pdma_st->iov_ofs = 0;
> +        }
> +    }
> +
> +    if (pdma_st->desc_offset + pdma_st->desc_size >= pdma_st->total_size) {
> +        /* Simulate FCS checksum presence in the last descriptor */
> +        igb_write_payload_to_rx_buffers(core, d,
> +                                        &pdma_st->ba,
> +                                        &pdma_st->bastate,
> +                                        pdma_st->rx_desc_packet_buf_size,
> +                                        (const char *) &fcs_pad,
> +                                        e1000x_fcs_len(core->mac));
> +    }
> +}
> +
> +static void
> +igb_write_to_rx_buffers(IGBCore *core,
> +                        struct NetRxPkt *pkt,
> +                        PCIDevice *d,
> +                        igb_packet_tx_dma_state *pdma_st)
> +{
> +    size_t copy_size;
> +
> +    if (!(pdma_st->ba)[1]) {
> +        /* as per intel docs; skip descriptors with null buf addr */
> +        trace_e1000e_rx_null_descriptor();
> +        return;
> +    }
> +
> +    if (pdma_st->desc_offset >= pdma_st->size) {
> +        return;
> +    }
> +
> +    pdma_st->desc_size = pdma_st->total_size - pdma_st->desc_offset;
> +    igb_truncate_to_descriptor_size(pdma_st, &pdma_st->desc_size);
> +    copy_size = pdma_st->size - pdma_st->desc_offset;
> +    igb_truncate_to_descriptor_size(pdma_st, &copy_size);
> +    pdma_st->bastate.cur_idx = 1;
> +    igb_write_packet_payload_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
> +}
> +
>   static void
>   igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>                             const E1000E_RxRing *rxr,
> @@ -1560,91 +1708,58 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>       PCIDevice *d;
>       dma_addr_t base;
>       union e1000_rx_desc_union desc;
> -    size_t desc_size;
> -    size_t desc_offset = 0;
> -    size_t iov_ofs = 0;
> -
> -    struct iovec *iov = net_rx_pkt_get_iovec(pkt);
> -    size_t size = net_rx_pkt_get_total_len(pkt);
> -    size_t total_size = size + e1000x_fcs_len(core->mac);
> -    const E1000E_RingInfo *rxi = rxr->i;
> -    size_t bufsize = igb_rxbufsize(core, rxi);
> -
> +    const E1000E_RingInfo *rxi;
> +    size_t rx_desc_len;
> +
> +    igb_packet_tx_dma_state pdma_st = {0};
> +    pdma_st.is_first = true;
> +    pdma_st.size = net_rx_pkt_get_total_len(pkt);
> +    pdma_st.total_size = pdma_st.size + e1000x_fcs_len(core->mac);
> +
> +    rxi = rxr->i;
> +    rx_desc_len = core->rx_desc_len;
> +    pdma_st.rx_desc_packet_buf_size =
> +        igb_rxbufsize(core, rxi);
> +    pdma_st.rx_desc_header_buf_size =
> +        igb_get_queue_rx_header_buf_size(core, rxi);
> +    pdma_st.iov = net_rx_pkt_get_iovec(pkt);
>       d = pcie_sriov_get_vf_at_index(core->owner, rxi->idx % 8);
>       if (!d) {
>           d = core->owner;
>       }
>   
>       do {
> -        hwaddr ba;
> -        uint16_t written = 0;
> +        memset(&pdma_st.bastate, 0, sizeof(igb_ba_state));
>           bool is_last = false;
>   
> -        desc_size = total_size - desc_offset;
> -
> -        if (desc_size > bufsize) {
> -            desc_size = bufsize;
> -        }
> -
>           if (igb_ring_empty(core, rxi)) {
>               return;
>           }
>   
>           base = igb_ring_head_descr(core, rxi);
> +        pci_dma_read(d, base, &desc, rx_desc_len);
> +        trace_e1000e_rx_descr(rxi->idx, base, rx_desc_len);
>   
> -        pci_dma_read(d, base, &desc, core->rx_desc_len);
> -
> -        trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
> -
> -        igb_read_rx_descr(core, &desc, &ba);
> -
> -        if (ba) {
> -            if (desc_offset < size) {
> -                static const uint32_t fcs_pad;
> -                size_t iov_copy;
> -                size_t copy_size = size - desc_offset;
> -                if (copy_size > bufsize) {
> -                    copy_size = bufsize;
> -                }
> -
> -                /* Copy packet payload */
> -                while (copy_size) {
> -                    iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
> -
> -                    igb_write_to_rx_buffers(core, d, ba, &written,
> -                                            iov->iov_base + iov_ofs, iov_copy);
> +        igb_read_rx_descr(core, &desc, pdma_st.ba, rxi);
>   
> -                    copy_size -= iov_copy;
> -                    iov_ofs += iov_copy;
> -                    if (iov_ofs == iov->iov_len) {
> -                        iov++;
> -                        iov_ofs = 0;
> -                    }
> -                }
> -
> -                if (desc_offset + desc_size >= total_size) {
> -                    /* Simulate FCS checksum presence in the last descriptor */
> -                    igb_write_to_rx_buffers(core, d, ba, &written,
> -                          (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
> -                }
> -            }
> -        } else { /* as per intel docs; skip descriptors with null buf addr */
> -            trace_e1000e_rx_null_descriptor();
> -        }
> -        desc_offset += desc_size;
> -        if (desc_offset >= total_size) {
> +        igb_write_to_rx_buffers(core, pkt, d, &pdma_st);
> +        pdma_st.desc_offset += pdma_st.desc_size;
> +        if (pdma_st.desc_offset >= pdma_st.total_size) {
>               is_last = true;
>           }
>   
> -        igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
> -                           rss_info, etqf, ts, written);
> -        igb_pci_dma_write_rx_desc(core, d, base, &desc, core->rx_desc_len);
> -
> -        igb_ring_advance(core, rxi, core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
> -
> -    } while (desc_offset < total_size);
> -
> -    igb_update_rx_stats(core, rxi, size, total_size);
> +        igb_write_rx_descr(core, &desc,
> +                           is_last ? pkt : NULL,
> +                           rss_info,
> +                           etqf, ts,
> +                           &pdma_st.bastate.written,
> +                           rxi);
> +        pci_dma_write(d, base, &desc, rx_desc_len);
> +        igb_ring_advance(core, rxi,
> +                         rx_desc_len / E1000_MIN_RX_DESC_LEN);
> +    } while (pdma_st.desc_offset < pdma_st.total_size);
> +
> +    igb_update_rx_stats(core, rxi, pdma_st.size, pdma_st.total_size);
>   }
>   
>   static bool
> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
> index 82ff195dfc..b14ca834ad 100644
> --- a/hw/net/igb_regs.h
> +++ b/hw/net/igb_regs.h
> @@ -76,6 +76,15 @@ union e1000_adv_rx_desc {
>       } wb;  /* writeback */
>   };
>   
> +#define IGB_MAX_PS_BUFFERS  2
> +#define IGB_MAX_RX_DESC_LEN (sizeof(uint64_t) * MAX_PS_BUFFERS)
> +
> +#define RX_DESC_ADV_HDR_LEN_OFFSET    (21 - 16)
> +#define RX_DESC_ADV_HDR_LEN_MASK      ((BIT(10) - 1) << \
> +                                       RX_DESC_ADV_HDR_LEN_OFFSET)
> +#define RX_DESC_ADV_HDR_SPH           BIT(15)
> +#define RX_DESC_ADV_ST_ERR_HBO_OFFSET BIT(3 + 20)
> +

These should be added afer /* new */

And use the name ADVRXD to denote the advanced Rx descriptor to make it 
consistent with ADVTXD.

>   /* from igb/e1000_phy.h */
>   
>   /* IGP01E1000 Specific Registers */
> @@ -452,6 +461,7 @@ union e1000_adv_rx_desc {
>   #define E1000_SRRCTL_BSIZEHDRSIZE_MASK         0x00000F00
>   #define E1000_SRRCTL_BSIZEHDRSIZE_SHIFT        2  /* Shift _left_ */
>   #define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF       0x02000000
> +#define E1000_SRRCTL_DESCTYPE_HDR_SPLIT        0x04000000
>   #define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
>   #define E1000_SRRCTL_DESCTYPE_MASK             0x0E000000
>   #define E1000_SRRCTL_DROP_EN                   0x80000000
> @@ -692,11 +702,12 @@ union e1000_adv_rx_desc {
>   
>   #define E1000_STATUS_NUM_VFS_SHIFT 14
>   
> -#define E1000_ADVRXD_PKT_IP4 BIT(4)
> -#define E1000_ADVRXD_PKT_IP6 BIT(6)
> -#define E1000_ADVRXD_PKT_TCP BIT(8)
> -#define E1000_ADVRXD_PKT_UDP BIT(9)
> -#define E1000_ADVRXD_PKT_SCTP BIT(10)
> +#define E1000_ADVRXD_PKT_IP4  BIT(0)
> +#define E1000_ADVRXD_PKT_IP6  BIT(2)
> +#define E1000_ADVRXD_PKT_IP6E BIT(3)
> +#define E1000_ADVRXD_PKT_TCP  BIT(4)
> +#define E1000_ADVRXD_PKT_UDP  BIT(5)
> +#define E1000_ADVRXD_PKT_SCTP BIT(6)
>   
>   static inline uint8_t igb_ivar_entry_rx(uint8_t i)
>   {
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index e4a98b2c7d..9a02261360 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -277,9 +277,9 @@ igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
>   igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
>   
>   igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
> -igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
> +igb_rx_desc_buff_write(uint8_t idx, uint64_t addr, uint16_t offset, const void* source, uint32_t len) "buffer #%u, addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
>   
> -igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
> +igb_rx_metadata_rss(uint32_t rss, uint16_t rss_pkt_type) "RSS data: rss: 0x%X, rss_pkt_type: 0x%X"
>   
>   igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
>   igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
> @@ -294,6 +294,8 @@ igb_irq_eitr_set(uint32_t eitr_num, uint32_t val) "EITR[%u] = 0x%x"
>   igb_set_pfmailbox(uint32_t vf_num, uint32_t val) "PFMailbox[%d]: 0x%x"
>   igb_set_vfmailbox(uint32_t vf_num, uint32_t val) "VFMailbox[%d]: 0x%x"
>   
> +igb_wrn_rx_desc_modes_not_supp(int desc_type) "Not supported descriptor type: %d"
> +
>   # igbvf.c
>   igbvf_wrn_io_addr_unknown(uint64_t addr) "IO unknown register 0x%"PRIx64
>   
> diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
> index a603468beb..4e720ee7e7 100644
> --- a/tests/qtest/libqos/igb.c
> +++ b/tests/qtest/libqos/igb.c
> @@ -55,6 +55,7 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
>   {
>       static const uint8_t address[] = E1000E_ADDRESS;
>       QE1000E_PCI *d = (QE1000E_PCI *) obj;
> +    uint32_t srrctl0;
>       uint32_t val;
>   
>       /* Enable the device */
> @@ -109,6 +110,10 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
>                           E1000_RAH_AV | E1000_RAH_POOL_1 |
>                           le16_to_cpu(*(uint16_t *)(address + 4)));
>   
> +    /* Set supported receive descriptor mode */
> +    srrctl0 = e1000e_macreg_read(&d->e1000e, E1000_SRRCTL(0));
> +    e1000e_macreg_write(&d->e1000e, E1000_SRRCTL(0), srrctl0 | BIT(25));

As I wrote in previous review:
 > You don't need to read the initial value. The Linux driver also
 > doesn't do that.
 >
 > Also use: E1000_SRRCTL_DESCTYPE_ADV_ONEBUF

> +
>       /* Enable receive */
>       e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
>       e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);

