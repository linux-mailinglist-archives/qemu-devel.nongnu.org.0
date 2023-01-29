Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B6067FD59
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM23Q-00023A-Kj; Sun, 29 Jan 2023 02:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM23O-00022m-Lk
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:24:42 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM23M-0006Xd-LN
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:24:42 -0500
Received: by mail-pl1-x634.google.com with SMTP id 5so8742819plo.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 23:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7yzbq42PV9LMEHgMOjdPNBRBulzQuaCj6+7HLnBPjDk=;
 b=euPUP8Y1T7RYUHgIocS9gzeoLKP2moP5QWrvD2GS6a+ILqulA0yfbzGMy9pvjarFwa
 NipSjm2ytuDjC2L6QbFN8qaW0E4CMM3l8X1qCEB8E2oOtgHnBJIHSLAvgne/Drsxafaj
 aHd4TYgUXiaYgBBe4brRnoDITQ9VY9zLsrmycvpvRu+Zw+UYqOJt5ZjAAV/Sm1if/fM8
 AZt9VxkumcG+EDrdLM3nZKQXyCIzJaDt3vd5z4/cdQLc+97feWd/wiL4of+Imcu99GCs
 hq/WeAZ8xzRTeQWYs6jJgHagJ/c8J58M56v1rKCwxLJLbrYteKwmli7anifXzpoDgzAQ
 MwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yzbq42PV9LMEHgMOjdPNBRBulzQuaCj6+7HLnBPjDk=;
 b=jVLKoXpJ+mX+8WzyOvpxrwVamI4oz5/eI6tk/FUH977UMpjEBSWcmgIagd5fs2PRwS
 EcT4GnvB6/3QS1BQt7Wu65GGRVTdMsJUyAg64+lG2JltY0NUnp1r1mWB4mLtSL31XSCv
 MgbIrgz6I7e/HGQ+wtq8DGkO5HuCWm0fQtefw/CC3VW0H1k+f0lea7hVXsDl8XXjD2cL
 JXSqGQ4m2WYeG4jypHg6wMQYQFwXo80BW6aByVQxDccc7nCzFh9uTiVFifateqXszqZK
 skTpy63EmWKQLNRI0RpNEjMZqO7AgWZOJEWdbRCMASbf5Rvg6lkSCslHDZ7XAHrPPsyn
 BvRQ==
X-Gm-Message-State: AO0yUKVeLoMBXV88tTBmOQbyhQkwV3moAe7dX35VK+x/Er10NoBu5crt
 W+AQcndlSTfdljj0U3PV717FoQ==
X-Google-Smtp-Source: AK7set9mWe/zgryaLZuM0U2L54Y7tEdQw2wf5UPZXaOBrP+24WPIh4nOwjJbQ5QT9mJaniQXo8h9xQ==
X-Received: by 2002:a17:902:d48d:b0:196:4f0d:c31f with SMTP id
 c13-20020a170902d48d00b001964f0dc31fmr11522912plg.12.1674977079014; 
 Sat, 28 Jan 2023 23:24:39 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170902d34c00b00194b37940edsm5418899plk.268.2023.01.28.23.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 23:24:38 -0800 (PST)
Message-ID: <e6a03b04-2565-7ae3-ace5-1486369d000b@daynix.com>
Date: Sun, 29 Jan 2023 16:24:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/9] igb: respect E1000_VMOLR_RSSE
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-6-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230128134633.22730-6-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
> RSS for VFs is only enabled if VMOLR[n].RSSE is set.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 1eb7ba168f..e4fd4a1a5f 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -69,7 +69,7 @@ typedef struct IGBTxPktVmdqCallbackContext {
>   
>   static ssize_t
>   igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
> -                     bool has_vnet, bool *assigned);
> +                     bool has_vnet, bool *external_tx);

I admit external_tx is somewhat confusing, but it is more than just 
telling if it is assigned to Rx queue or not. If external_tx is not 
NULL, it indicates it is part of Tx packet switching. In that case, a 
bool value which describes whether the packet should be routed to 
external LAN must be assigned. The value can be false even if the packet 
is assigned to Rx queues; it will be always false if it is multicast, 
for example.

>   
>   static inline void
>   igb_set_interrupt_cause(IGBCore *core, uint32_t val);
> @@ -942,7 +942,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>   
>       if (core->mac[MRQC] & 1) {
>           if (is_broadcast_ether_addr(ehdr->h_dest)) {
> -            for (i = 0; i < 8; i++) {
> +            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {

I just left it as 8 because VMDq is not specific to VF. Perhaps it is 
better to have another macro to denote the number of VMDq pools, but it 
is not done yet.

>                   if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
>                       queues |= BIT(i);
>                   }
> @@ -976,7 +976,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                   f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
>                   f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
>                   if (macp[f >> 5] & (1 << (f & 0x1f))) {
> -                    for (i = 0; i < 8; i++) {
> +                    for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
>                           if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
>                               queues |= BIT(i);
>                           }
> @@ -999,7 +999,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                       }
>                   }
>               } else {
> -                for (i = 0; i < 8; i++) {
> +                for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
>                       if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
>                           mask |= BIT(i);
>                       }
> @@ -1018,7 +1018,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>           queues &= core->mac[VFRE];
>           igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
>           if (rss_info->queue & 1) {
> -            queues <<= 8;
> +            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
> +                if (!(queues & BIT(i))) {
> +                    continue;
> +                }
> +                if (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE) {
> +                    queues |= BIT(i + IGB_MAX_VF_FUNCTIONS);
> +                    queues &= ~BIT(i);
> +                }
> +            }
>           }
>       } else {
>           switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {

