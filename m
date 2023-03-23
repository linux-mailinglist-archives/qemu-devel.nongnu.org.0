Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71F6C6271
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGht-00030R-30; Thu, 23 Mar 2023 04:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfGhq-000309-1d
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:53:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfGhn-0004gQ-OW
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:53:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id kq3so9278864plb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679561634;
 h=content-transfer-encoding:in-reply-to:from:to:references:cc
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3SPXnlWqEQ96YPjGWh0R9I50iC8S71mLaGMjlXAiApQ=;
 b=T8Y5Y7DS0LRPo5MZdNPSxWj5VoWwZa6wyUKWaanhHXf7YFEQukthD7pnpFwycWUUfA
 CB55q5wnp11HvNH1+vFM8v8ywRliSl3XIrnwe4506Vpnyfj7DgJ+NtE+IkzIhISUZPow
 GqhmqXjG6RRYdrznXMz0b+Q9/eBt1vvFm/OJWq2NhakPklIafB5FpaLPKpld+iUMHdmC
 ImlOVmOHVg/AoZq19+bRnuCHwQDBX827cfWeFcMto247qM7QKvEtHC/oTcEuweA2jNTq
 Rmj8ifWDfZ7BVM5eHrgeatQxKGLujYZ5jAe2qI1jIuhv9aNFR4Zv7g27H1Qi40omk0K2
 566g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679561634;
 h=content-transfer-encoding:in-reply-to:from:to:references:cc
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3SPXnlWqEQ96YPjGWh0R9I50iC8S71mLaGMjlXAiApQ=;
 b=OJ67sjeYA3fSxIcw+xw3To2rc6k32cW83mD7zq1yvRtz8ehFPNDiiN04P3wec6TMaJ
 QR7hZGtWjaXcmH3Gz5ow1+DIy1iXfWk7CG+IquQaBlAtyyOi17mB1nl11xJ1DWfHa0/R
 SXDzOswJhlbThZJJAsoW7169ERUZmwWDbh6lOQIuD+WeykBpLTIrHEtM3wcu623NE3ro
 3GRem1uB0KICB6Duzae6ksBk2Xg52c+eLFnpg15iOBJf9MAVFg4+WFcVrRY+bwVvE0VX
 K3dKIk/Ia9egBa6254CfHJaLuBbcfG0dsZb8JPA9ThkGcPp41eqrWNtIosl89jzfsh7/
 tWHw==
X-Gm-Message-State: AO0yUKWiB/B9tDxjLE1G3S1ZpuvWnlt/r0rrMrqBA25xxxmvgZuQBHFi
 0vq5obcrUqYaLOo2EVtHR0DLAw==
X-Google-Smtp-Source: AK7set/3dsN+XpkzfCUbJCqg6gdTzIicsgRMkzjuAswGSrkLbv5P14ekw01edvl6/HcymrXbM/6urg==
X-Received: by 2002:a05:6a20:7196:b0:d4:9fce:6c6a with SMTP id
 s22-20020a056a20719600b000d49fce6c6amr2145587pzb.49.1679561633864; 
 Thu, 23 Mar 2023 01:53:53 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i10-20020aa78d8a000000b006281bc04392sm3780970pfr.191.2023.03.23.01.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 01:53:53 -0700 (PDT)
Message-ID: <21ae4db0-2adc-ad01-c06e-2f4a8d8ee172@daynix.com>
Date: Thu, 23 Mar 2023 17:53:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] hw/net/net_tx_pkt: Align l3_hdr
Content-Language: en-US
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20230316122653.10770-1-akihiko.odaki@daynix.com>
To: Jason Wang <jasowang@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230316122653.10770-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi Jason,

I have sent some patches for igb and packet abstractions. They are fixes 
intended to be included in 8.0 so please have a look at them.

Regards,
Akihiko Odaki

On 2023/03/16 21:26, Akihiko Odaki wrote:
> Align the l3_hdr member of NetTxPkt by defining it as a union of
> ip_header, ip6_header, and an array of octets.
> 
> Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1544
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/net_tx_pkt.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index efe80b1a80..8dc8568ba2 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -43,7 +43,11 @@ struct NetTxPkt {
>       struct iovec *vec;
>   
>       uint8_t l2_hdr[ETH_MAX_L2_HDR_LEN];
> -    uint8_t l3_hdr[ETH_MAX_IP_DGRAM_LEN];
> +    union {
> +        struct ip_header ip;
> +        struct ip6_header ip6;
> +        uint8_t octets[ETH_MAX_IP_DGRAM_LEN];
> +    } l3_hdr;
>   
>       uint32_t payload_len;
>   
> @@ -89,16 +93,14 @@ void net_tx_pkt_update_ip_hdr_checksum(struct NetTxPkt *pkt)
>   {
>       uint16_t csum;
>       assert(pkt);
> -    struct ip_header *ip_hdr;
> -    ip_hdr = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base;
>   
> -    ip_hdr->ip_len = cpu_to_be16(pkt->payload_len +
> +    pkt->l3_hdr.ip.ip_len = cpu_to_be16(pkt->payload_len +
>           pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len);
>   
> -    ip_hdr->ip_sum = 0;
> -    csum = net_raw_checksum((uint8_t *)ip_hdr,
> +    pkt->l3_hdr.ip.ip_sum = 0;
> +    csum = net_raw_checksum(pkt->l3_hdr.octets,
>           pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len);
> -    ip_hdr->ip_sum = cpu_to_be16(csum);
> +    pkt->l3_hdr.ip.ip_sum = cpu_to_be16(csum);
>   }
>   
>   void net_tx_pkt_update_ip_checksums(struct NetTxPkt *pkt)
> @@ -832,15 +834,14 @@ void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
>   {
>       struct iovec *l2 = &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
>       if (eth_get_l3_proto(l2, 1, l2->iov_len) == ETH_P_IPV6) {
> -        struct ip6_header *ip6 = (struct ip6_header *) pkt->l3_hdr;
>           /*
>            * TODO: if qemu would support >64K packets - add jumbo option check
>            * something like that:
>            * 'if (ip6->ip6_plen == 0 && !has_jumbo_option(ip6)) {'
>            */
> -        if (ip6->ip6_plen == 0) {
> +        if (pkt->l3_hdr.ip6.ip6_plen == 0) {
>               if (pkt->payload_len <= ETH_MAX_IP_DGRAM_LEN) {
> -                ip6->ip6_plen = htons(pkt->payload_len);
> +                pkt->l3_hdr.ip6.ip6_plen = htons(pkt->payload_len);
>               }
>               /*
>                * TODO: if qemu would support >64K packets

