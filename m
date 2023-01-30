Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7A681356
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVBr-0002LO-Qm; Mon, 30 Jan 2023 09:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMVBp-0002L2-ON
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:31:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMVBn-0003z4-ON
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:31:21 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h9so3192731plf.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uGbwgjjAPl62G4OBS+4fEWYk5IfJMw0Y9pBqOkocwaA=;
 b=riWfVYEbixhKtL7jJ1Do+SLHD0LdoC9pHPaOeNGMje+DacYhiYzhVwnx/VUJ33jSk/
 h8eD94zKnbUlI+5Z5/eH6xb3EuEwoeygx3mGiwZh6sILVz93RhbfyGZFGc6Yd2JomDln
 FnPJCJKK+IHEkr3A1JY/uh8usVVHnND0k1H2rUI66RS1f7trflleklhPknbVaMajpkdh
 AR010A6X8nyPQMBFRlVDSv2VHqdu0VhyI8IKgbHezxc9XCZt5HekQx27fGn4BcCvoi+f
 ROTQO7HJH8nB+rBOU3TWcFSZkCCVsLtcui1lhwdTXgh7aQRyHhLOmYfUhPdeXAMQVAju
 nxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGbwgjjAPl62G4OBS+4fEWYk5IfJMw0Y9pBqOkocwaA=;
 b=se7M04LBC3MC05QuwQeEF+ZX49qmefSfxsf1Oxyc2wKE4vCDmv629iHfSVfL1nZrl/
 VsyPy4rv1WOHlzWvEINF1SExXclCLIK/V2v9z92LrbRcZN5yQPfZyvawh2dQQoei4jCH
 0lGIhg6N5kvOVq7Gf/iiWOa5dCCRNB3qsLOJDAH8y6D3zA5vjoekh/EjmXexRPvuAD/n
 8skjMsrE/QESEw8+QS4WOz8EE8w+rh4JhWHGoMpMWnfUcd/vE+nrOO+dkAGsxy9En8UN
 KlMkTi+G6U+a67VGfNBAj0249STUE0Ak2M91aLagQhmjYeUi81BHIKRUytf85j1w1yd/
 7jLw==
X-Gm-Message-State: AO0yUKUCXFehZjvVmaQv12LwQMAgoeZEL9v+LDsYgBiHEd2OTa54W3RN
 ej1buoS1cY/bqGyhJtARFpQGig==
X-Google-Smtp-Source: AK7set8PmhSZqwh6D7nvIT5tqOuA5ZyCy1o1Sji8Ut5Qyt/5yZBCccXpeFuHYEFTM+AylvoaYrMDUA==
X-Received: by 2002:a17:902:c24d:b0:196:3bbb:e9db with SMTP id
 13-20020a170902c24d00b001963bbbe9dbmr18286066plg.10.1675089078006; 
 Mon, 30 Jan 2023 06:31:18 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170902ecc100b001948720f6bdsm7861184plh.98.2023.01.30.06.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:31:17 -0800 (PST)
Message-ID: <a3a502f7-397c-d525-ce69-6bfa4501a00b@daynix.com>
Date: Mon, 30 Jan 2023 23:31:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 5/9] igb: check oversized packets for VMDq
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
 <20230130132304.2347-6-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230130132304.2347-6-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/30 22:23, Sriram Yagnaraman wrote:
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 48 +++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index cea7c036f0..89650fcfd4 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -910,12 +910,27 @@ igb_rx_l4_cso_enabled(IGBCore *core)
>       return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
>   }
>   
> +static bool
> +igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
> +{
> +    uint16_t pool = qn % IGB_MAX_VM_POOLS;
> +    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
> +    int maximum_ethernet_lpe_size =
> +        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
> +    int maximum_ethernet_vlan_size = 1522;
> +
> +    return (size > maximum_ethernet_lpe_size ||
> +        (size > maximum_ethernet_vlan_size && !lpe));

It will return true if !lpe && size > maximum_ethernet_lpe_size 
(maximum_ethernet_lpe_size can be smaller than 
maximum_ethernet_vlan_size although it is quite unlikely), but it should 
ignore maximum_ethernet_lpe_size in such a case.

Also you don't need the brace around the entire expression.

> +}
> +
>   static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
> -                                   E1000E_RSSInfo *rss_info, bool *external_tx)
> +                                   size_t size, E1000E_RSSInfo *rss_info,
> +                                   bool *external_tx)
>   {
>       static const int ta_shift[] = { 4, 3, 2, 0 };
>       uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
>       uint16_t queues = 0;
> +    uint16_t oversized = 0;
>       uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & VLAN_VID_MASK;
>       bool accepted = false;
>       int i;
> @@ -941,7 +956,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>   
>       if (core->mac[MRQC] & 1) {
>           if (is_broadcast_ether_addr(ehdr->h_dest)) {
> -            for (i = 0; i < 8; i++) {
> +            for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
>                   if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
>                       queues |= BIT(i);
>                   }
> @@ -975,7 +990,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                   f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
>                   f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
>                   if (macp[f >> 5] & (1 << (f & 0x1f))) {
> -                    for (i = 0; i < 8; i++) {
> +                    for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
>                           if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
>                               queues |= BIT(i);
>                           }
> @@ -998,7 +1013,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                       }
>                   }
>               } else {
> -                for (i = 0; i < 8; i++) {
> +                for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
>                       if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
>                           mask |= BIT(i);
>                       }
> @@ -1015,9 +1030,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>           }
>   
>           queues &= core->mac[VFRE];
> -        igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
> -        if (rss_info->queue & 1) {
> -            queues <<= 8;
> +        if (queues) {
> +            for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
> +                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
> +                    oversized |= BIT(i);
> +                }
> +            }
> +            /* 8.19.37 increment ROC if packet is oversized for all queues */
> +            if (oversized == queues) {
> +                trace_e1000x_rx_oversized(size);
> +                e1000x_inc_reg_if_not_full(core->mac, ROC);
> +            }
> +            queues &= ~oversized;
> +        }
> +
> +        if (queues) {
> +            igb_rss_parse_packet(core, core->rx_pkt,
> +                                 external_tx != NULL, rss_info);
> +            if (rss_info->queue & 1) {
> +                queues <<= 8;
> +            }
>           }
>       } else {
>           switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
> @@ -1561,7 +1593,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>                                  e1000x_vlan_enabled(core->mac),
>                                  core->mac[VET] & 0xffff);
>   
> -    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
> +    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
>       if (!queues) {
>           trace_e1000e_rx_flt_dropped();
>           return orig_size;

