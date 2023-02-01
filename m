Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966A685EA5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:57:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN5AW-00020Z-HJ; Tue, 31 Jan 2023 23:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN5AO-00020H-9A
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:56:16 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN58G-0007M4-C8
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:56:15 -0500
Received: by mail-pf1-f174.google.com with SMTP id ay1so11666658pfb.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLdrAHJRC35ZV36knEhn72p41fk/cUzXulDYGy8NbeE=;
 b=N9/CncO9XGWsdOcZG92m7T/LjLM0cimltmlnAxJTefauqvw+m51Ihj962YEuVv5i4b
 m3RLEdeudeSBuj+K0vEaFznMZXcKtGlejc8dDhcfJccoUlTPouhactTrTCfqoamBJKm9
 HsCt7a+y47fbC9w8KuzVSnMpVm/Ak0YVSdSxmm2wIKqDsxKwqXjVmQPuFgt9ag1w/PUQ
 6saLBX1MDqRhp9Xj90Mxct0PRT4NiDOirsvSl1Y06bBH/lWNWis0AjtU+99gXk4Ka/NM
 16JMWr6h/rOY0GGW8osQ8uaRHthOyPtI325QtZxOoTj/OfwwRUpBrJk0hxEFZKILR0JU
 jV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLdrAHJRC35ZV36knEhn72p41fk/cUzXulDYGy8NbeE=;
 b=nB+YgSB6Bub8JB1IqdGxpW/sG/BCy8yJhjZYSMxd8P73ZHUbgpITHwoLN2d03/kf2B
 NxP+QxTp9fNytvGeuxRPJ9OEYACux/VwYEz9QuJVuO1g4x622WtQjnXMFl4OQU1JTcgv
 ZsO3aSrkqW0myzVzpSqhelB6dAzkFB5Bq1AVIj8lLDqrr0BEssGUa8T4MhzeqmHwpNZa
 R9WddEUfZiaVI5O5CEuuemD6rJJw64wUQrHDLGUveZrwkNL6of8sF1/kQGHV7+47T9NT
 SnG9u/Gs1nHg4jb4D9mmJ/kAnHuCG93n2HiYP9xU70+h1nK+wQu44bHHZgSzrTeXnps7
 OI3w==
X-Gm-Message-State: AO0yUKWnWut5EPXGTMud4FL2f7Bum/IlyiOVbzcXwSoplkWefM0tKS8j
 U1ceWYKy1ZYTRAB9naKUHPyVhw==
X-Google-Smtp-Source: AK7set8/PTcSW4iz9krUCZSDTCjpNi5/Mn1AYxUqsGv+703hLzVeaISMBNQOsmcA8/YSggEgaA1Qdw==
X-Received: by 2002:aa7:91d2:0:b0:581:1c:82a3 with SMTP id
 z18-20020aa791d2000000b00581001c82a3mr970515pfa.1.1675227204358; 
 Tue, 31 Jan 2023 20:53:24 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c7-20020aa78c07000000b00576259507c0sm10356321pfd.100.2023.01.31.20.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 20:53:24 -0800 (PST)
Message-ID: <b20acdcd-207a-00cf-316e-7e6504ab968b@daynix.com>
Date: Wed, 1 Feb 2023 13:53:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 9/9] igb: respect VMVIR and VMOLR for VLAN
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-10-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230131094232.28863-10-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=209.85.210.174;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-f174.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/31 18:42, Sriram Yagnaraman wrote:
> Add support for stripping/inserting VLAN for VFs.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 51 ++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 8115be2d76..a697fcf56a 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -386,6 +386,25 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
>       info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
>   }
>   
> +static inline bool
> +igb_tx_insert_vlan(IGBCore *core, uint16_t qn,
> +                   struct igb_tx *tx, bool desc_vle)
> +{
> +    if (core->mac[MRQC] & 1) {
> +        uint16_t pool = qn % IGB_NUM_VM_POOLS;
> +
> +        if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_DEFAULT) {
> +            /* always insert default VLAN */
> +            desc_vle = true;
> +            tx->vlan = core->mac[VMVIR0 + pool] & 0xffff;
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
> @@ -581,7 +600,8 @@ igb_process_tx_desc(IGBCore *core,
>   
>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
> -            if (cmd_type_len & E1000_TXD_CMD_VLE) {
> +            if (igb_tx_insert_vlan(core, queue_index, tx,
> +                !!(cmd_type_len & E1000_TXD_CMD_VLE))) {
>                   net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
>                       core->mac[VET] & 0xffff);
>               }
> @@ -1543,6 +1563,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>       igb_update_rx_stats(core, rxi, size, total_size);
>   }
>   
> +static bool
> +igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi)
> +{
> +    if (core->mac[MRQC] & 1) {
> +        uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;
> +        /* Sec 7.10.3.8: CTRL.VME is ignored, only VMOLR/RPLOLR is used */
> +        return (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) ?
> +                core->mac[RPLOLR] & E1000_RPLOLR_STRVLAN :
> +                core->mac[VMOLR0 + pool] & E1000_VMOLR_STRVLAN;
> +    }
> +
> +    return e1000x_vlan_enabled(core->mac);
> +}
> +
>   static inline void
>   igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
>   {
> @@ -1624,10 +1658,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>   
>       ehdr = PKT_GET_ETH_HDR(filter_buf);
>       net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
> -
> -    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
> -                               e1000x_vlan_enabled(core->mac),
> -                               core->mac[VET] & 0xffff);
> +    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
>   
>       queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
>       if (!queues) {
> @@ -1635,11 +1666,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           return orig_size;
>       }
>   
> -    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
> -        e1000x_fcs_len(core->mac);
> -
>       retval = orig_size;
> -    igb_rx_fix_l4_csum(core, core->rx_pkt);
> +    total_size = size + e1000x_fcs_len(core->mac);

This change to total_size should be reverted; total_size will be 
different from size if VLAN stripping is enabled. There is also no 
reason to reorder the statements.

>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>           if (!(queues & BIT(i)) ||
> @@ -1648,6 +1676,11 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           }
>   
>           igb_rx_ring_init(core, &rxr, i);
> +        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
> +                                   igb_rx_strip_vlan(core, rxr.i),
> +                                   core->mac[VET] & 0xffff);
> +        igb_rx_fix_l4_csum(core, core->rx_pkt);
> +
>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>               icr_bits |= E1000_ICS_RXO;
>               continue;

