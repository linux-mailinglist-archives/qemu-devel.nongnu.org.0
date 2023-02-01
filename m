Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1E685E97
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:40:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4uO-0005i7-Jk; Tue, 31 Jan 2023 23:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4uM-0005gu-LJ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:39:42 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4uK-0005Rd-Uc
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:39:42 -0500
Received: by mail-pf1-x42f.google.com with SMTP id w20so2812585pfn.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4CJwgYOL5W+0D1YbwQR0vvBdaTquarR6BcOTJzj5Xbs=;
 b=5dw+Nx+mtzYHn7RMKxSLvxiK6YZ6GMYQpxDseISdNeXh+WEn84kHmSVXgU/PMmjb+H
 s/higaUELlcVk8INhHQX2FGJABQCjL1lRWWkRVRu7Ky72tjEd5F32lm/nIiYZoHNlH6c
 8SAwQiB0WV0Gd81ArUFo7FfjWxckXL4Y+efAiEdqJ/wcvwkuhnN3tuHq1dKs17eQKdIY
 XleSq0bsoAXxE2YC0hvaiCHRTIhjvn47Hw5cR3pIXfKvTd7TqMOGkgdHCBAFz5zsxsTX
 CH2fhAOxzw98FYG0Pgf33HgFunOfENgLGsjGHiYOZ3aHaN3WG4Y90H+gMIaxHR+6gkgw
 12Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4CJwgYOL5W+0D1YbwQR0vvBdaTquarR6BcOTJzj5Xbs=;
 b=zccBAz7bwFnspBta1+JttLpkQB4duCr9QJMhEuT++xZPDvgmAc5K8E+0GrEfpvv9Ah
 IC4+WzRCKYgXNq7F2nuwp9x6Qp0WBX/MWJ4AX6pj9uu+KFKuvJeHCdqCvd8ul3Wkx2Jv
 k+yRrfQ/5CKVYYM8mbO+ljdDSk8RmF9CRZL4JjYsowPSGxOIf5HN2Nz/iF6rteagwXWj
 2A4MMrIQJa5s07V6zDkMReXl9wucULMrA0QmdEWnozSiOrp3isJH3ipK0dGEYYX7gTf3
 jHVDuUWnECEMYOL15ttExEZs+Zhrc358VboWEWdF9VpXODhPr1vYDYgR3xUJ5vboD/Ks
 TF4g==
X-Gm-Message-State: AO0yUKXAOSOJLTqzUSOHyuV1YbvAaEG+3wAJ7KmtLulkGSfGZxQs+psp
 VtBoM2dbgVHqm86odDQs1MGqiGtNXrAEAKkw
X-Google-Smtp-Source: AK7set/hetA4ibEUzoS3sCDbd2q0Or/MaxtL1H+jMRaZ6DbRkwOSMx0ats06uLEItQaIjqVrzp/kTA==
X-Received: by 2002:a05:6a00:1792:b0:593:befd:848c with SMTP id
 s18-20020a056a00179200b00593befd848cmr1237281pfg.16.1675226379276; 
 Tue, 31 Jan 2023 20:39:39 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a056a00178800b0058e12372079sm4017966pfg.29.2023.01.31.20.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 20:39:38 -0800 (PST)
Message-ID: <43ad50b5-8c82-ad63-4878-086647ed2055@daynix.com>
Date: Wed, 1 Feb 2023 13:39:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 5/9] igb: check oversized packets for VMDq
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-6-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230131094232.28863-6-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

On 2023/01/31 18:42, Sriram Yagnaraman wrote:
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 48 +++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 4a1b98bf0e..2f6f30341f 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -912,12 +912,27 @@ igb_rx_l4_cso_enabled(IGBCore *core)
>       return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
>   }
>   
> +static bool
> +igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
> +{
> +    uint16_t pool = qn % IGB_NUM_VM_POOLS;
> +    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
> +    int maximum_ethernet_lpe_size =
> +        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
> +    int maximum_ethernet_vlan_size = 1522;
> +
> +    return lpe ? size > maximum_ethernet_lpe_size :
> +        size > maximum_ethernet_vlan_size;

Instead do:
size > (lpe ? maximum_ethernet_lpe_size : maximum_ethernet_vlan_size)

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
> @@ -943,7 +958,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>   
>       if (core->mac[MRQC] & 1) {
>           if (is_broadcast_ether_addr(ehdr->h_dest)) {
> -            for (i = 0; i < 8; i++) {
> +            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                   if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
>                       queues |= BIT(i);
>                   }
> @@ -977,7 +992,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                   f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
>                   f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
>                   if (macp[f >> 5] & (1 << (f & 0x1f))) {
> -                    for (i = 0; i < 8; i++) {
> +                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                           if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
>                               queues |= BIT(i);
>                           }
> @@ -1000,7 +1015,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                       }
>                   }
>               } else {
> -                for (i = 0; i < 8; i++) {
> +                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                       if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
>                           mask |= BIT(i);
>                       }
> @@ -1017,9 +1032,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>           }
>   
>           queues &= core->mac[VFRE];
> -        igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
> -        if (rss_info->queue & 1) {
> -            queues <<= 8;
> +        if (queues) {
> +            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
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
> @@ -1563,7 +1595,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>                                  e1000x_vlan_enabled(core->mac),
>                                  core->mac[VET] & 0xffff);
>   
> -    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
> +    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
>       if (!queues) {
>           trace_e1000e_rx_flt_dropped();
>           return orig_size;

