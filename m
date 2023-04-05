Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315AF6D82DB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:04:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5Zd-0002Uw-80; Wed, 05 Apr 2023 12:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pk5Z9-0002JV-Kw
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:00:56 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pk5Z6-000676-WB
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:00:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id z19so34846389plo.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680710451; x=1683302451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Phvz4ZAynFpqqnVfBR26XTWZM0rLvS9EiAeHd5E+R8=;
 b=D1oCXv8rZOSrTkpvmdKc+AfxO8c17rBEKwKNqz1VVK8qfejH3N/sKIRg+GLAdFRVtr
 kd+yY3P6vQIp1cRge15kiutb9XHQTU0pupi2bk/Pu+ImAgVtQ3G4g1WCayENstWppDOQ
 y3AAEDXgSYFmL8yju1ne3mjPnla50yP8ayiNP0xF/h0QJ67Q5ZA8V9o2xW+9KqNDCo2B
 etgxiZlfCzY9csZJWpVs0j+ENZxcjEzf/ds1cjenx6vNYlHsy20e0Ncve0Rf7r4csGsF
 fqUjxHKeV/0aKaT+TSG2M3+BginAjz9GdKKmTmvvcA2fpIFuRiNaq50g4xl6nsQQ/LV0
 xDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710451; x=1683302451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Phvz4ZAynFpqqnVfBR26XTWZM0rLvS9EiAeHd5E+R8=;
 b=QqdYgsxmiVtteAFBfagygi+2CAHIkHyj5V93WDQ1slsyw9MVJXt1MViqLItH9StywA
 Xs6lC+re+QESC6v7E972Pad8EG7Ls2i4t+QNtzLInvsAToxfxhRIJ+Te421JZD1KyGE5
 h+r/1aQsefLBJnbD3DTUEpkJCiFlq/iFmJTQURLIfxXlZQrhD0Nc8Es8j98s1XRFnBjZ
 mQXiDrdwlaSFmg1Jx+qKaJtZJQOhDtAcV44auO6huhVcTyY3Hdxlg+0Y0N4Ox43uiaAO
 MMfSkC3JkVwfwx6ldCSMFEki9+LmE+HxCz+Ar0I4Q2pru2MSCvUEUlcMDZXiAEhoSkVN
 09dA==
X-Gm-Message-State: AAQBX9cL1fluC8HLRa0Yb08w04Rs9BfWiKzQsaEQc04BCrNipzpxQdM9
 ZX8Jg2C6GHTzngdaFG9anhM//g==
X-Google-Smtp-Source: AKy350Y1yE13DfQKh9BekChFeNUBEPD3Oq/z9VY2iAC8RfKamu142rOssyB+vrXUVPBMuzkuXW2EGw==
X-Received: by 2002:a17:902:e5d1:b0:19e:4bc3:b1ef with SMTP id
 u17-20020a170902e5d100b0019e4bc3b1efmr8124798plf.64.1680710451151; 
 Wed, 05 Apr 2023 09:00:51 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1709026b8800b0019a74841c9bsm10233262plk.192.2023.04.05.09.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 09:00:50 -0700 (PDT)
Message-ID: <4d4fa6d2-50bb-f952-3776-86af348a00e3@daynix.com>
Date: Thu, 6 Apr 2023 01:00:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] net: TX SCTP checksum offload
Content-Language: en-US
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: jasowang@redhat.com, k.kwiecien@samsung.com
References: <CGME20230405142332eucas1p14546386ac74f8e7c6996bd80aa418061@eucas1p1.samsung.com>
 <20230405142325.1339-1-t.dzieciol@partner.samsung.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230405142325.1339-1-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/04/05 23:23, Tomasz Dzieciol wrote:
> Modern NICs are able to offload SCTP checksumming. SCTP calculates
> checksums differently than TCP / UDP: no pseudo-header and CRC32C
> algorithm are used.

Hi,

I actually have some patches to add SCTP checksumming for igb, which are 
currently under tests and I'm going to submit them soon. You can see the 
current version at:
https://github.com/daynix/qemu/commit/bee0bf5792ffbbd7331f6a22d3b498b5685724cd
https://github.com/daynix/qemu/commit/13e061667f40e015c6af2ebb131421042b86a35f

I see some room of improvement in your patches and commented below. As 
they are already addressed in my patches, I'd like to push them forward 
instead. Please review them when they are submitted to the mailing list.

Regards,
Akihiko Odaki

> 
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
> ---
>   hw/net/net_tx_pkt.c    | 22 ++++++++++++++++++++++
>   hw/net/net_tx_pkt.h    |  8 ++++++++
>   include/net/checksum.h | 12 ++++++++++++
>   include/net/eth.h      |  8 ++++++++
>   net/checksum.c         | 24 ++++++++++++++++++++++++
>   5 files changed, 74 insertions(+)
> 
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 986a3adfe9..1b97249000 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -510,6 +510,27 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt,
>       iov_from_buf(iov, iov_len, csum_offset, &csum, sizeof csum);
>   }
>   
> +void net_tx_pkt_update_sctp_crc(struct NetTxPkt *pkt)
> +{
> +    struct iovec *iov = &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
> +    uint32_t csum_cntr = 0;
> +    /* num of iovec without vhdr */
> +    uint32_t iov_len = pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1;
> +    size_t csum_offset = pkt->hdr_len + offsetof(struct sctp_hdr, sh_sum);
> +
> +    if (pkt->l4proto != IP_PROTO_SCTP) {
> +        return;
> +    }

It checks for the protocol indicated in the packet, but it should 
actually refer to the respective bit in igb's transmit descriptor. 
Unfortunately the current net_tx_pkt is not implemented in this way for 
other protocols but we don't need to follow that bad habit for a new 
protocol.

> +
> +    /* Put zero to checksum field */
> +    iov_from_buf(iov, iov_len, csum_offset, &csum_cntr, sizeof csum_cntr);
> +
> +    csum_cntr = net_sctp_checksum_add_iov(iov, iov_len,
> +                                          pkt->hdr_len,
> +                                          pkt->payload_len);

Instead of using pkt->hdr_len as the offset, we can simply specify 
pkt->vec[NET_TX_PKT_PL_START_FRAG] as the first iov. Removing the offset 
will simplify net_sctp_checksum_add_iov() a lot.

> +    iov_from_buf(iov, iov_len, csum_offset, &csum_cntr, sizeof csum_cntr);
> +}
> +
>   #define NET_MAX_FRAG_SG_LIST (64)
>   
>   static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
> @@ -846,3 +867,4 @@ void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
>           }
>       }
>   }
> +
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index f57b4e034b..56475b462c 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -204,4 +204,12 @@ bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt);
>    */
>   void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt);
>   
> +/**
> +* Update SCTP CRC32C value.
> +*
> +* @pkt:            packet
> +*
> +*/
> +void net_tx_pkt_update_sctp_crc(struct NetTxPkt *pkt);
> +
>   #endif
> diff --git a/include/net/checksum.h b/include/net/checksum.h
> index 7dec37e56c..987d66546d 100644
> --- a/include/net/checksum.h
> +++ b/include/net/checksum.h
> @@ -64,6 +64,18 @@ uint32_t net_checksum_add_iov(const struct iovec *iov,
>                                 uint32_t iov_off, uint32_t size,
>                                 uint32_t csum_offset);
>   
> +/**
> + * net_sctp_checksum_add_iov: scatter-gather vector checksumming for SCTP
> + *
> + * @iov: input scatter-gather array
> + * @iov_cnt: number of array elements
> + * @iov_off: starting iov offset for checksumming
> + * @size: length of data to be checksummed
> + */
> +uint32_t net_sctp_checksum_add_iov(const struct iovec *iov,
> +                                   const unsigned int iov_cnt,
> +                                   uint32_t iov_off, uint32_t size);
> +
>   typedef struct toeplitz_key_st {
>       uint32_t leftmost_32_bits;
>       uint8_t *next_byte;
> diff --git a/include/net/eth.h b/include/net/eth.h
> index c5ae4493b4..a946de1250 100644
> --- a/include/net/eth.h
> +++ b/include/net/eth.h
> @@ -147,6 +147,13 @@ struct ip6_option_hdr {
>       uint8_t len;
>   };
>   
> +struct sctp_hdr {
> +  uint16_t sh_sport;           /* source port */
> +  uint16_t sh_dport;           /* destination port */
> +  uint32_t sh_vtag;            /* verification tag */
> +  uint32_t sh_sum;             /* sctp checksum */
> +};
> +
>   struct udp_hdr {
>     uint16_t uh_sport;           /* source port */
>     uint16_t uh_dport;           /* destination port */
> @@ -222,6 +229,7 @@ struct tcp_hdr {
>   #define IP_HEADER_VERSION_6       (6)
>   #define IP_PROTO_TCP              (6)
>   #define IP_PROTO_UDP              (17)
> +#define IP_PROTO_SCTP             (132)
>   #define IPTOS_ECN_MASK            0x03
>   #define IPTOS_ECN(x)              ((x) & IPTOS_ECN_MASK)
>   #define IPTOS_ECN_CE              0x03
> diff --git a/net/checksum.c b/net/checksum.c
> index 68245fd748..4869b1ef14 100644
> --- a/net/checksum.c
> +++ b/net/checksum.c
> @@ -18,6 +18,7 @@
>   #include "qemu/osdep.h"
>   #include "net/checksum.h"
>   #include "net/eth.h"
> +#include "qemu/crc32c.h"
>   
>   uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq)
>   {
> @@ -206,3 +207,26 @@ net_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
>       }
>       return res;
>   }
> +
> +uint32_t
> +net_sctp_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
> +                          uint32_t iov_off, uint32_t size)
> +{
> +    size_t iovec_off;
> +    unsigned int i;
> +    uint32_t res = 0xffffffff;
> +
> +    iovec_off = 0;
> +    for (i = 0; i < iov_cnt && size; i++) {
> +        if (iov_off < (iovec_off + iov[i].iov_len)) {
> +            size_t len = MIN((iovec_off + iov[i].iov_len) - iov_off , size);
> +            void *chunk_buf = iov[i].iov_base + (iov_off - iovec_off);
> +
> +            res = crc32c(res, chunk_buf, len);
> +            iov_off += len;
> +            size -= len;
> +        }
> +        iovec_off += iov[i].iov_len;
> +    }
> +    return res;
> +}

This is a generic function which calculates CRC for iov so I think it 
should be in crc32c.c.

