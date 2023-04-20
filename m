Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14ED6E9B26
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:57:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppYWS-0004xv-W3; Thu, 20 Apr 2023 13:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppYWN-0004xV-GO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:56:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppYWJ-0000wl-To
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:56:39 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b509fe13eso1051999b3a.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682013394; x=1684605394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lL0SR5ZMcU1Hmp3+9wnounOValB4yQqcAMcSuDTXSn8=;
 b=mLkwo0VrUU5d8K+i45PPDGL7y/lcHxMaxm0LiFhSBW8W7uoWYlj3b8v4obsr9sJ+pi
 47BETiFHBWs8A6Py+P1N4H3cWY6c11LXJGhyyNWTq3pBAY/G3edsXIWOHeTP++0dk+Kd
 OHP20bmgG2kPkyNxOcOKvMg3u9edTokP7IoXwXkuNHiK8e4R8l/bie+oYsIu/Nlrl5gF
 t9Qx0zEOaA17/+WDgJOLAHcJTM0kHk2u1KUv9FSFR/Qjr1U2JqRjtMtb9Tw+Qs2Iu+r7
 MKp1H7Av3phwHCSo44DVbD8ce4cOwXxeEf9XzltxOimNMQz9Vve++BPPum4A3dycRiGn
 ZXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682013394; x=1684605394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lL0SR5ZMcU1Hmp3+9wnounOValB4yQqcAMcSuDTXSn8=;
 b=eNtzyNH1GIqFcP1fbinFzIAe6OsLNaDExwKkVtOhLcbh1pCCy35ADBBSeBVpAIBkIK
 wnOAhnQ2t0FBO0YeaMxHxsj6ccRJWKPEBGmV+AH0Ma8eCah6GBah42w+cgC7vmi5bUBM
 4a6qq1BHWPUTNUwbyV32DJWsJCk9pz3YQRGZc4o910ztMoYEp8a1llhsm69Xd+HDNB45
 Jz8XoAFQek+ryNSnk1vCwZ8YqtYZRUAwjYvXHViVXYkXImtcDZqBgNh+jhPg2HY/j2vS
 vBnDcU5Ml16I2tYyhSvZjHa4WaBDTaGeZeyI+e7VFxoSe7KP1BHiUGiiKz+3fJyU2ivJ
 nITw==
X-Gm-Message-State: AAQBX9cNfIbBkyyKFO+JJMKcU83UTEpfGLO6z0+O4BfQvRBq0L4L7cCZ
 vD0hy+xGXtKjpgrSF1ez1AA5NA==
X-Google-Smtp-Source: AKy350YCXUFzDPJr4TfT7M8F0dmFXNL80bFgSz+LwvKqPNSOijeM26jpF33XmTTdxawApGONJTeAkQ==
X-Received: by 2002:a05:6a21:918c:b0:e3:86d1:55e8 with SMTP id
 tp12-20020a056a21918c00b000e386d155e8mr2861836pzb.53.1682013394308; 
 Thu, 20 Apr 2023 10:56:34 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056a00149000b0063b7af71b61sm1510364pfu.212.2023.04.20.10.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 10:56:33 -0700 (PDT)
Message-ID: <ec4a29ea-39c4-9920-c011-028420fa8299@daynix.com>
Date: Fri, 21 Apr 2023 02:56:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 32/41] igb: Implement Rx SCTP CSO
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-33-akihiko.odaki@daynix.com>
 <DBBP189MB1433CC8A208777F644D1844E95639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433CC8A208777F644D1844E95639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/04/21 1:22, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Thursday, 20 April 2023 07:47
>> Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; Jason Wang
>> <jasowang@redhat.com>; Dmitry Fleytman <dmitry.fleytman@gmail.com>;
>> Michael S . Tsirkin <mst@redhat.com>; Alex Bennée
>> <alex.bennee@linaro.org>; Philippe Mathieu-Daudé <philmd@linaro.org>;
>> Thomas Huth <thuth@redhat.com>; Wainer dos Santos Moschetta
>> <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; Cleber Rosa
>> <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Paolo Bonzini
>> <pbonzini@redhat.com>; qemu-devel@nongnu.org; Tomasz Dzieciol
>> <t.dzieciol@partner.samsung.com>; Akihiko Odaki
>> <akihiko.odaki@daynix.com>
>> Subject: [PATCH v2 32/41] igb: Implement Rx SCTP CSO
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/igb_regs.h     |  1 +
>>   include/net/eth.h     |  4 ++-
>>   include/qemu/crc32c.h |  1 +
>>   hw/net/e1000e_core.c  |  5 ++++
>>   hw/net/igb_core.c     | 15 +++++++++-
>>   hw/net/net_rx_pkt.c   | 64 +++++++++++++++++++++++++++++++++++--------
>>   net/eth.c             |  4 +++
>>   util/crc32c.c         |  8 ++++++
>>   8 files changed, 89 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h index
>> e6ac26dc0e..4b4ebd3369 100644
>> --- a/hw/net/igb_regs.h
>> +++ b/hw/net/igb_regs.h
>> @@ -670,6 +670,7 @@ union e1000_adv_rx_desc {  #define
>> E1000_ADVRXD_PKT_IP6 BIT(6)  #define E1000_ADVRXD_PKT_TCP BIT(8)
>> #define E1000_ADVRXD_PKT_UDP BIT(9)
>> +#define E1000_ADVRXD_PKT_SCTP BIT(10)
>>
>>   static inline uint8_t igb_ivar_entry_rx(uint8_t i)  { diff --git a/include/net/eth.h
>> b/include/net/eth.h index 048e434685..75e7f1551c 100644
>> --- a/include/net/eth.h
>> +++ b/include/net/eth.h
>> @@ -224,6 +224,7 @@ struct tcp_hdr {
>>   #define IP_HEADER_VERSION_6       (6)
>>   #define IP_PROTO_TCP              (6)
>>   #define IP_PROTO_UDP              (17)
>> +#define IP_PROTO_SCTP             (132)
>>   #define IPTOS_ECN_MASK            0x03
>>   #define IPTOS_ECN(x)              ((x) & IPTOS_ECN_MASK)
>>   #define IPTOS_ECN_CE              0x03
>> @@ -379,7 +380,8 @@ typedef struct eth_ip4_hdr_info_st {  typedef enum
>> EthL4HdrProto {
>>       ETH_L4_HDR_PROTO_INVALID,
>>       ETH_L4_HDR_PROTO_TCP,
>> -    ETH_L4_HDR_PROTO_UDP
>> +    ETH_L4_HDR_PROTO_UDP,
>> +    ETH_L4_HDR_PROTO_SCTP
>>   } EthL4HdrProto;
>>
>>   typedef struct eth_l4_hdr_info_st {
>> diff --git a/include/qemu/crc32c.h b/include/qemu/crc32c.h index
>> 5b78884c38..88b4d2b3b3 100644
>> --- a/include/qemu/crc32c.h
>> +++ b/include/qemu/crc32c.h
>> @@ -30,5 +30,6 @@
>>
>>
>>   uint32_t crc32c(uint32_t crc, const uint8_t *data, unsigned int length);
>> +uint32_t iov_crc32c(uint32_t crc, const struct iovec *iov, size_t
>> +iov_cnt);
>>
>>   #endif
>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c index
>> 27124bba07..8b35735799 100644
>> --- a/hw/net/e1000e_core.c
>> +++ b/hw/net/e1000e_core.c
>> @@ -1114,6 +1114,11 @@ e1000e_verify_csum_in_sw(E1000ECore *core,
>>           return;
>>       }
>>
>> +    if (l4hdr_proto != ETH_L4_HDR_PROTO_TCP &&
>> +        l4hdr_proto != ETH_L4_HDR_PROTO_UDP) {
>> +        return;
>> +    }
>> +
>>       if (!net_rx_pkt_validate_l4_csum(pkt, &csum_valid)) {
>>           trace_e1000e_rx_metadata_l4_csum_validation_failed();
>>           return;
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>> 4dc8e3ae7b..b7f7e765a5 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -1212,7 +1212,7 @@ igb_build_rx_metadata(IGBCore *core,
>>                         uint16_t *vlan_tag)  {
>>       struct virtio_net_hdr *vhdr;
>> -    bool hasip4, hasip6;
>> +    bool hasip4, hasip6, csum_valid;
>>       EthL4HdrProto l4hdr_proto;
>>
>>       *status_flags = E1000_RXD_STAT_DD;
>> @@ -1272,6 +1272,10 @@ igb_build_rx_metadata(IGBCore *core,
>>               *pkt_info |= E1000_ADVRXD_PKT_UDP;
>>               break;
>>
>> +        case ETH_L4_HDR_PROTO_SCTP:
>> +            *pkt_info |= E1000_ADVRXD_PKT_SCTP;
>> +            break;
>> +
>>           default:
>>               break;
>>           }
>> @@ -1304,6 +1308,15 @@ igb_build_rx_metadata(IGBCore *core,
>>
>>       if (igb_rx_l4_cso_enabled(core)) {
>>           switch (l4hdr_proto) {
>> +        case ETH_L4_HDR_PROTO_SCTP:
>> +            if (!net_rx_pkt_validate_l4_csum(pkt, &csum_valid)) {
> 
> Forgive my naive question, doesn't tap device validate SCTP checksum? Is it something we can improve? I can help with adding in linux tap device if you think that would make this code simpler, just like UDP/TCP.

No, Linux does not provide an option to enable SCTP checksum offloading 
for a tap device so we have no choice but validating checksum by ourselves.

> 
>> +                trace_e1000e_rx_metadata_l4_csum_validation_failed();
>> +                goto func_exit;
>> +            }
>> +            if (!csum_valid) {
>> +                *status_flags |= E1000_RXDEXT_STATERR_TCPE;
>> +            }
>> +            /* fall through */
>>           case ETH_L4_HDR_PROTO_TCP:
>>               *status_flags |= E1000_RXD_STAT_TCPCS;
>>               break;
>> diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c index
>> 1de42b4f51..3575c8b9f9 100644
>> --- a/hw/net/net_rx_pkt.c
>> +++ b/hw/net/net_rx_pkt.c
>> @@ -16,6 +16,7 @@
>>    */
>>
>>   #include "qemu/osdep.h"
>> +#include "qemu/crc32c.h"
>>   #include "trace.h"
>>   #include "net_rx_pkt.h"
>>   #include "net/checksum.h"
>> @@ -554,32 +555,73 @@ _net_rx_pkt_calc_l4_csum(struct NetRxPkt *pkt)
>>       return csum;
>>   }
>>
>> -bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool *csum_valid)
>> +static bool
>> +_net_rx_pkt_validate_sctp_sum(struct NetRxPkt *pkt)
>>   {
>> -    uint16_t csum;
>> +    size_t csum_off;
>> +    size_t off = pkt->l4hdr_off;
>> +    size_t vec_len = pkt->vec_len;
>> +    struct iovec *vec;
>> +    uint32_t calculated = 0;
>> +    uint32_t original;
>> +    bool valid;
>>
>> -    trace_net_rx_pkt_l4_csum_validate_entry();
>> +    for (vec = pkt->vec; vec->iov_len < off; vec++) {
>> +        off -= vec->iov_len;
>> +        vec_len--;
>> +    }
>>
>> -    if (pkt->l4hdr_info.proto != ETH_L4_HDR_PROTO_TCP &&
>> -        pkt->l4hdr_info.proto != ETH_L4_HDR_PROTO_UDP) {
>> -        trace_net_rx_pkt_l4_csum_validate_not_xxp();
>> +    csum_off = off + 8;
>> +
>> +    if (!iov_to_buf(vec, vec_len, csum_off, &original,
>> + sizeof(original))) {
>>           return false;
>>       }
>>
>> -    if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP &&
>> -        pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
>> -        trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
>> +    if (!iov_from_buf(vec, vec_len, csum_off,
>> +                      &calculated, sizeof(calculated))) {
>>           return false;
>>       }
>>
>> +    calculated = crc32c(0xffffffff,
>> +                        (uint8_t *)vec->iov_base + off, vec->iov_len - off);
>> +    calculated = iov_crc32c(calculated ^ 0xffffffff, vec + 1, vec_len - 1);
>> +    valid = calculated == le32_to_cpu(original);
>> +    iov_from_buf(vec, vec_len, csum_off, &original, sizeof(original));
>> +
>> +    return valid;
>> +}
>> +
>> +bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool
>> +*csum_valid) {
>> +    uint32_t csum;
>> +
>> +    trace_net_rx_pkt_l4_csum_validate_entry();
>> +
>>       if (pkt->hasip4 && pkt->ip4hdr_info.fragment) {
>>           trace_net_rx_pkt_l4_csum_validate_ip4_fragment();
>>           return false;
>>       }
>>
>> -    csum = _net_rx_pkt_calc_l4_csum(pkt);
>> +    switch (pkt->l4hdr_info.proto) {
>> +    case ETH_L4_HDR_PROTO_UDP:
>> +        if (pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
>> +            trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
>> +            return false;
>> +        }
>> +        /* fall through */
>> +    case ETH_L4_HDR_PROTO_TCP:
>> +        csum = _net_rx_pkt_calc_l4_csum(pkt);
>> +        *csum_valid = ((csum == 0) || (csum == 0xFFFF));
>> +        break;
>> +
>> +    case ETH_L4_HDR_PROTO_SCTP:
>> +        *csum_valid = _net_rx_pkt_validate_sctp_sum(pkt);
>> +        break;
>>
>> -    *csum_valid = ((csum == 0) || (csum == 0xFFFF));
>> +    default:
>> +        trace_net_rx_pkt_l4_csum_validate_not_xxp();
>> +        return false;
>> +    }
>>
>>       trace_net_rx_pkt_l4_csum_validate_csum(*csum_valid);
>>
>> diff --git a/net/eth.c b/net/eth.c
>> index 5307978486..7f02aea010 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -211,6 +211,10 @@ void eth_get_protocols(const struct iovec *iov, size_t
>> iovcnt, size_t iovoff,
>>               *l5hdr_off = *l4hdr_off + sizeof(l4hdr_info->hdr.udp);
>>           }
>>           break;
>> +
>> +    case IP_PROTO_SCTP:
>> +        l4hdr_info->proto = ETH_L4_HDR_PROTO_SCTP;
>> +        break;
>>       }
>>   }
>>
>> diff --git a/util/crc32c.c b/util/crc32c.c index 762657d853..ea7f345de8 100644
>> --- a/util/crc32c.c
>> +++ b/util/crc32c.c
>> @@ -113,3 +113,11 @@ uint32_t crc32c(uint32_t crc, const uint8_t *data,
>> unsigned int length)
>>       return crc^0xffffffff;
>>   }
>>
>> +uint32_t iov_crc32c(uint32_t crc, const struct iovec *iov, size_t
>> +iov_cnt) {
>> +    while (iov_cnt--) {
>> +        crc = crc32c(crc, iov->iov_base, iov->iov_len) ^ 0xffffffff;
>> +        iov++;
>> +    }
>> +    return crc ^ 0xffffffff;
>> +}
>> --
>> 2.40.0
> 

