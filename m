Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54767FD91
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 09:14:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM2od-0007nD-68; Sun, 29 Jan 2023 03:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM2ob-0007lt-Ga
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 03:13:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM2oZ-0005gh-23
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 03:13:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so11067183pjq.1
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 00:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FPoDEHb7WQRY+yNDUq0akabMYMQA/8K5MH2u2C2DZ8Q=;
 b=ec6Dld7x7n8DrFdVaEpqfa67eifWQWL4aUthFTxbPz90PBnl3mbCGA5c/7MEL3zNnd
 OsUT90PzFsnkfjofHXZF93ZglOqYhbpRbEjZmNbxGHAFO+qzUsbud1D4VHQ1GzEdHW3M
 GzNizSjKImd3n94brP78SeSj9d1NQsmZempE3CZBQVBdTK767yI21POjQv0SgjoND14v
 oa5WLbFZ8XAb0lYf79hIZnBcmeznSJ0dZzL4CsbSF+9cnyhmmn3IXX2OO6lsTRmEt5M+
 o0CDeiEWRNSZhukujwN+H1xgIqdTI0tqmaDi9Er6ibh4QZMy5vyDwDsTSgwSSFMCf9nc
 MH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FPoDEHb7WQRY+yNDUq0akabMYMQA/8K5MH2u2C2DZ8Q=;
 b=iMOrtnkhsqcub+Yu2v++A+055fiGXCOARwy1C2AxihFcfIlHiUZpuICdj7vttSmTSK
 v2Taik8pIOF7txcE+V1P7Zx6qTKNNAjQAxo1baVX3Fds0fF23jbG4dgLAhpzzFodi76b
 F7Gg3MppPoz/hxfobT4SiQIpkBQZCb89ldTkE6NjvIJ2oaPvCwevNwChwzXCCPg4xg3+
 miF0KBzsIfnSEUiaaXV49LXXo2u5AvD2cKttNgh6LU6sTfWkm6ElDxLZ3Z2sVK87g750
 h9mCb63xPSihN/SewB6wRDMl0F+5RVRCbPAr0jpHAhfepOKgTnU2pizDem1MMWaPQ4wl
 uDkg==
X-Gm-Message-State: AO0yUKWmMlJKCB2S2GzDZgDCOTcay1tUuDK22q5ZKUITY7pZ8s6kOT/l
 EHpiXCneo/N/oBnHRPKO3TOIQg==
X-Google-Smtp-Source: AK7set+fJ3mEzRqiZH8Nr3cibkqKjOEbAErpur6MBZbQF/HRKwHBFx40ePPMfvFdP3lZWe4im27ulw==
X-Received: by 2002:a17:902:ea08:b0:196:4049:f938 with SMTP id
 s8-20020a170902ea0800b001964049f938mr14673121plg.47.1674980005486; 
 Sun, 29 Jan 2023 00:13:25 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 jd17-20020a170903261100b00194afb5a405sm3455167plb.118.2023.01.29.00.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 00:13:25 -0800 (PST)
Message-ID: <ad24bbe2-6397-26e9-c3a2-a6b88f65f97c@daynix.com>
Date: Sun, 29 Jan 2023 17:13:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 9/9] igb: respect VMVIR and VMOLR for VLAN
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-10-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230128134633.22730-10-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/28 22:46, Sriram Yagnaraman wrote:
> Add support for stripping/inserting VLAN for VFs.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 100 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 65 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 8e33e15505..96a5c5eca3 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -384,6 +384,26 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
>       info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
>   }
>   
> +static inline bool
> +igb_tx_insert_vlan(IGBCore *core, uint16_t qn,
> +                   struct igb_tx *tx, bool desc_vle)
> +{
> +    if (core->mac[MRQC] & 1) {
> +        uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
> +                        (qn - IGB_MAX_VF_FUNCTIONS) : qn;
> +
> +        if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_DEFAULT) {
> +            /* always insert default VLAN */
> +            desc_vle = true;
> +            tx->vlan = core->mac[VMVIR0 + pool] & 0xfff;

This should be masked with 0xffff; "Port VLAN ID" field is defined as 
16-bit.

> +        } else if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_NEVER) {
> +            return false;
> +        }
> +    }
> +
> +    return desc_vle && e1000x_vlan_enabled(core->mac);
> +}
> +
>   static bool
>   igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
>   {
> @@ -580,7 +600,8 @@ igb_process_tx_desc(IGBCore *core,
>   
>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
> -            if (cmd_type_len & E1000_TXD_CMD_VLE) {
> +            if (igb_tx_insert_vlan(core, queue_index, tx,
> +                (cmd_type_len & E1000_TXD_CMD_VLE))) {

The fourth parameter of igb_tx_insert_vlan() is bool, which is defined 
as it only ensures it has storage of 1-bit, but this passes a value 
greater than that.

>                   net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
>                       core->mac[VET] & 0xffff);
>               }
> @@ -1514,6 +1535,22 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>       igb_update_rx_stats(core, rxi, size, total_size);
>   }
>   
> +static inline bool
> +igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi,
> +    eth_pkt_types_e pkt_type)
> +{
> +    if (core->mac[MRQC] & 1) {
> +        uint16_t qn = rxi->idx;
> +        uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
> +                        (qn - IGB_MAX_VF_FUNCTIONS) : qn;
> +        return (pkt_type == ETH_PKT_MCAST) ?
> +                core->mac[RPLOLR] & E1000_RPLOLR_STRVLAN :
> +                core->mac[VMOLR0 + pool] & E1000_VMOLR_STRVLAN;
> +    }
> +
> +    return e1000x_vlan_enabled(core->mac);
> +}
> +
>   static inline bool
>   igb_is_oversized(IGBCore *core, const E1000E_RingInfo *rxi, size_t size)
>   {
> @@ -1574,6 +1611,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       size_t total_size;
>       ssize_t retval = 0;
>       int i;
> +    bool strip_vlan = false;

strip_vlan does not need a default value. Having a default value will 
suppresss compiler warnings when you actually need to compute a valid value.

>   
>       trace_e1000e_rx_receive_iov(iovcnt);
>   
> @@ -1615,10 +1653,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>   
>       ehdr = PKT_GET_ETH_HDR(filter_buf);
>       net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
> -
> -    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
> -                               e1000x_vlan_enabled(core->mac),
> -                               core->mac[VET] & 0xffff);
> +    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
>   
>       queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
>       if (!queues) {
> @@ -1626,8 +1661,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           return orig_size;
>       }
>   
> -    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
> -        e1000x_fcs_len(core->mac);
> +    retval = orig_size;
> +    total_size = size + e1000x_fcs_len(core->mac);
>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>           if (!(queues & BIT(i))) {
> @@ -1635,43 +1670,38 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           }
>   
>           igb_rx_ring_init(core, &rxr, i);
> +        strip_vlan = igb_rx_strip_vlan(core, rxr.i,
> +            get_eth_packet_type(ehdr));
> +        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
> +            strip_vlan, core->mac[VET] & 0xffff);
> +        igb_rx_fix_l4_csum(core, core->rx_pkt);
> +
>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>               icr_bits |= E1000_ICS_RXO;
> +            continue;
>           }
> -    }
> -
> -    if (!icr_bits) {
> -        retval = orig_size;
> -        igb_rx_fix_l4_csum(core, core->rx_pkt);
> -
> -        for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -            if (!(queues & BIT(i))) {
> -                continue;
> -            }
>   
> -            igb_rx_ring_init(core, &rxr, i);
> -            if (igb_is_oversized(core, rxr.i, size)) {
> -                oversized |= BIT(i);
> -                continue;
> -            }
> +        if (igb_is_oversized(core, rxr.i, total_size)) {
> +            oversized |= BIT(i);
> +            continue;
> +        }
>   
> -            if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
> -                continue;
> -            }
> +        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
> +            continue;
> +        }
>   
> -            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
> -            igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
> +        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
> +        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
>   
> -            /* Check if receive descriptor minimum threshold hit */
> -            if (igb_rx_descr_threshold_hit(core, rxr.i)) {
> -                icr_bits |= E1000_ICS_RXDMT0;
> -            }
> +        /* Check if receive descriptor minimum threshold hit */
> +        if (igb_rx_descr_threshold_hit(core, rxr.i)) {
> +            icr_bits |= E1000_ICS_RXDMT0;
> +        }
>   
> -            core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
> +        core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
>   
> -            /* same as RXDW (rx descriptor written back)*/
> -            icr_bits |= E1000_ICR_RXDW;
> -        }
> +        /* same as RXDW (rx descriptor written back)*/
> +        icr_bits |= E1000_ICR_RXDW;
>       }
>   
>       /* 8.19.37 increment ROC only if packet is oversized for all queues */

