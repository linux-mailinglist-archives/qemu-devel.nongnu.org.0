Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B3D67FD4D
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:08:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM1mP-0004Yv-T7; Sun, 29 Jan 2023 02:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM1mM-0004Yi-TP
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:07:07 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM1mK-00046E-D6
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:07:06 -0500
Received: by mail-pg1-x533.google.com with SMTP id f3so5695109pgc.2
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 23:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GZlwRrOKDxaPRP/EtyvY4dFJy6qqcrmT8kLFLCpjulE=;
 b=BHVPacQUc+QIgI2oMFEptTZB1Fat8jUE6f17OxkFifnDp8OvoW13gj6wwOExPoyzAo
 LIwYuFU2k4IvbwVhzR1NWw12kDq6SrLaA8G70Xu1xIPUdq/gnjWgTnRkrcnGm3mwFTCl
 IixOHoMsXNq1x0PZrMSCcEHD+eoKWLQPciFP989ok//5p3RYWErLfL+DGNcjdCCobjnH
 uARxNZmDAFopJJM3ylnNtr0EJBwQ7/MwjorP5boj9gsOAX1HMHg8MziuWxpqS8+ksJb3
 EcRYgYrb+lGcyaIDapCXrR2D6R85B93VWS5yZ/umRIuzr8BjgM/P67SA9HCqrxPJkdYn
 8N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GZlwRrOKDxaPRP/EtyvY4dFJy6qqcrmT8kLFLCpjulE=;
 b=3PNCOFNqJ4OkUA/CJ0OonCSzR7YQ67nvMU74WmPT8BQiR+mWKSFFvhKlPhB0T7y2ft
 MdaaHCr0sluVVrdWbbdnEHlBbFTHVk367UV1Ch6xutbBRf+HpYoomHg/QGsP0jqnJg6w
 O1n8GcG3PwfJUoIishJoh6hWn77a/5PDcC1arjUs/qhLV19K0cuNc2p6O61R0Z+Q+Wmj
 zmCm73zSeUJ3l1PWwXYhkLZ8FUVg0Q1zMR1sodbHsYaeRZm1cjhGLiS1HgOTNaEn9M8o
 1SD3yMN4t/yKUGHKLmsfxxb7TSo+n5/+NJ3HcEaW4YvWTYXLxIsQRoRBMdtp9+Ra/oyX
 4OCg==
X-Gm-Message-State: AFqh2kpoK89waa6iIRWruFF6FLP051Xxch/ikCkblQjAQLyAqp63wJMW
 rm/yq4FfHla9JaDjuzGQdcFB9g==
X-Google-Smtp-Source: AMrXdXsmAjHm0CFD7RWx2rD3Ael1KM+MVm8nIHjc3oY2GmvuVnuquWiiBS5g5wokgOSDLJtOW40IZA==
X-Received: by 2002:a05:6a00:4519:b0:58d:f047:53b7 with SMTP id
 cw25-20020a056a00451900b0058df04753b7mr38462055pfb.3.1674976022486; 
 Sat, 28 Jan 2023 23:07:02 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a625e04000000b00593b35409b2sm428029pfb.169.2023.01.28.23.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 23:07:02 -0800 (PST)
Message-ID: <705a7362-15de-7c6d-1a1c-747c88b9a9ef@daynix.com>
Date: Sun, 29 Jan 2023 16:06:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 4/9] igb: check oversized packets for VMDq
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-5-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230128134633.22730-5-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x533.google.com
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
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 74 ++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 54 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 6bca5459b9..1eb7ba168f 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -1476,6 +1476,30 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
>       igb_update_rx_stats(core, size, total_size);
>   }
>   
> +static inline bool

Please remove inline qualifier. inline qualifier has some adverse effects:
- It suppresses GCC warnings for unused functions. This behavior is 
useful when you write a function in a header file, but it is not in this 
case.
- It confuses the compiler if the function later grows and becomes 
unsuitable for inlining.
- It is noise in source code.

In this case, the compiler should be able to decide to inline the 
function or not by its own.

> +igb_is_oversized(IGBCore *core, const E1000E_RingInfo *rxi, size_t size)
> +{
> +    bool vmdq = core->mac[MRQC] & 1;
> +    uint16_t qn = rxi->idx;
> +    uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
> +                   (qn - IGB_MAX_VF_FUNCTIONS) : qn;

Write as qn % 8; this pattern is already prevalent.

> +
> +    bool lpe = (vmdq ? core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE :
> +                core->mac[RCTL] & E1000_RCTL_LPE);

RCTL.LPE should be checked even if VMDq is enabled; In section 7.10.3.4, 
Size Filtering is defined to check RCTL.LPE, and it is part of packet 
switching procedure for virtualized environment. Linux also ensures it 
sets the maximum value to RLPML.RLPML if VMDq is enabled:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cfbc871c2174f352542053d25659920d6841ed41

> +    bool sbp = core->mac[RCTL] & E1000_RCTL_SBP;
> +    int maximum_ethernet_vlan_size = 1522;
> +    int maximum_ethernet_lpe_size =
> +        (vmdq ? core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK :
> +         core->mac[RLPML] & E1000_VMOLR_RLPML_MASK);
> +
> +    if (size > maximum_ethernet_lpe_size ||
> +        (size > maximum_ethernet_vlan_size && !lpe && !sbp)) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>   static inline void
>   igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
>   {
> @@ -1499,7 +1523,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>   
>       uint16_t queues = 0;
> -    uint32_t n = 0;
> +    uint16_t oversized = 0;
> +    uint32_t icr_bits = 0;
>       uint8_t min_buf[ETH_ZLEN];
>       struct iovec min_iov;
>       struct eth_header *ehdr;
> @@ -1509,7 +1534,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       E1000E_RxRing rxr;
>       E1000E_RSSInfo rss_info;
>       size_t total_size;
> -    ssize_t retval;
> +    ssize_t retval = 0;
>       int i;
>   
>       trace_e1000e_rx_receive_iov(iovcnt);
> @@ -1550,11 +1575,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           filter_buf = min_buf;
>       }
>   
> -    /* Discard oversized packets if !LPE and !SBP. */
> -    if (e1000x_is_oversized(core->mac, size)) {
> -        return orig_size;
> -    }
> -
>       ehdr = PKT_GET_ETH_HDR(filter_buf);
>       net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
>   
> @@ -1571,8 +1591,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
>           e1000x_fcs_len(core->mac);
>   
> -    retval = orig_size;
> -
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>           if (!(queues & BIT(i))) {
>               continue;
> @@ -1580,42 +1598,58 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>   
>           igb_rx_ring_init(core, &rxr, i);
>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
> -            retval = 0;
> +            icr_bits |= E1000_ICS_RXO;
>           }
>       }
>   
> -    if (retval) {
> +    if (!icr_bits) {
> +        retval = orig_size;
>           igb_rx_fix_l4_csum(core, core->rx_pkt);
>   
>           for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -            if (!(queues & BIT(i)) ||
> -                !(core->mac[E1000_RXDCTL(i) >> 2] & E1000_RXDCTL_QUEUE_ENABLE)) {
> +            if (!(queues & BIT(i))) {
>                   continue;
>               }
>   
>               igb_rx_ring_init(core, &rxr, i);
> +            if (igb_is_oversized(core, rxr.i, size)) {
> +                oversized |= BIT(i);
> +                continue;
> +            }

VMOLR.RLPML is checked during Rx queue assignment, which is implemented 
in igb_receive_assign(). The oversize check should be moved to the function.

> +
> +            if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
> +                continue;
> +            }
> +
>               trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
>               igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
>   
>               /* Check if receive descriptor minimum threshold hit */
>               if (igb_rx_descr_threshold_hit(core, rxr.i)) {
> -                n |= E1000_ICS_RXDMT0;
> +                icr_bits |= E1000_ICS_RXDMT0;
>               }
>   
>               core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
>   
>               /* same as RXDW (rx descriptor written back)*/
> -            n = E1000_ICR_RXT0;
> +            icr_bits |= E1000_ICR_RXT0;
>           }
> +    }
> +
> +    /* 8.19.37 increment ROC only if packet is oversized for all queues */
> +    if (oversized == queues) {
> +        trace_e1000x_rx_oversized(size);
> +        e1000x_inc_reg_if_not_full(core->mac, ROC);
> +    }
>   
> -        trace_e1000e_rx_written_to_guest(n);
> +    if (icr_bits & E1000_ICR_RXT0) {
> +        trace_e1000e_rx_written_to_guest(icr_bits);
>       } else {
> -        n = E1000_ICS_RXO;
> -        trace_e1000e_rx_not_written_to_guest(n);
> +        trace_e1000e_rx_not_written_to_guest(icr_bits);
>       }
>   
> -    trace_e1000e_rx_interrupt_set(n);
> -    igb_set_interrupt_cause(core, n);
> +    trace_e1000e_rx_interrupt_set(icr_bits);
> +    igb_set_interrupt_cause(core, icr_bits);
>   
>       return retval;
>   }

