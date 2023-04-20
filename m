Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B96E9AEB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:37:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppYDB-0001am-5r; Thu, 20 Apr 2023 13:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppYD8-0001aV-UT
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:36:46 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppYD6-0003lq-RX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:36:46 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso8814019b3a.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682012203; x=1684604203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vLGaecZ8MCVncXH1uC8Zw7FnMFmiuMbchSPeX7Zl7gQ=;
 b=I8K6D2UIUFbjIqKOKv0NYaQQkLmtCGeUiYWs5SLCi7q8mHaKF8BUILYC9iP3X+ozdR
 zDzabjLCCbK0gh1EYkGlI9i6MP6PFLmbdzm+RflAdZgTif6mB0wGaX46tKn/ji4ObQJd
 z52LkfvcN2CtQHrLS+Pt4nF0zFRbW+xmxp6/Z5GvTISUZmZT6XjoAxPdH7rFJVfWdv27
 3cuWkOLzWUhp6DCsu5F1F3MbLN1LhiueI6rxG8rFDn3NQa0FMmPjGrdF38kdR0FZEqml
 GY9O/jhnzs5PwxostKfxupJj0JqzHRcQWsrAUbd5hbu3JLv7r6V598j4nMRO1Nu+R+QL
 aFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682012203; x=1684604203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLGaecZ8MCVncXH1uC8Zw7FnMFmiuMbchSPeX7Zl7gQ=;
 b=OOLPVbfZwGR4KZwrtpwbkXtzX/E+xeLkh8t2r+BSDBD6GbTe9FZ6rAI68tKutmwrFi
 Vhi22/BnLrGoCNP505GiHqMIzdvF68PKULRqFa3R2aaL641GLGi41+VOQoYhC/Cf5Vw7
 VGI2eQgeaE+u8JVNd3IRkV+X6qsmc/Dn4LnGTddt+O7nZ3PJa88oVqhe51xunnC5uY/2
 EjjSFcwXNmiJIBBIRIEUGdmWSjj7alCjMxCzsOuojM5elDVoxJO41COaovLv/w1ibOc4
 njKb0j3dbcCnpOjYnqTprkPTsZcHdP5GNHPyKEQv2HkdvlGRmMS9TqJ2eBiSForww9Jj
 0v4w==
X-Gm-Message-State: AAQBX9dgH4xYTBUbHn6Svxicj9afG9fG53VT5tujUpU2lWygm+1zFnEm
 iNx5LGPCjhB0lSsWog5ene8QlA==
X-Google-Smtp-Source: AKy350axP7/SIsA392EV3/N5WJTP5/FCGTIKf0MAarnyfLg8AIgSeAfOVeozU17dpAp9Azyx68LIdQ==
X-Received: by 2002:a17:90b:1b4e:b0:247:4fe5:f09c with SMTP id
 nv14-20020a17090b1b4e00b002474fe5f09cmr2535700pjb.15.1682012203158; 
 Thu, 20 Apr 2023 10:36:43 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902748a00b001a258041049sm1421501pll.32.2023.04.20.10.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 10:36:42 -0700 (PDT)
Message-ID: <987a50c3-934d-174a-eddd-30f145e0cdbe@daynix.com>
Date: Fri, 21 Apr 2023 02:36:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 16/41] e1000x: Rename TcpIpv6 into TcpIpv6Ex
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
 <20230420054657.50367-17-akihiko.odaki@daynix.com>
 <DBBP189MB1433EBC9CBA18991C5A960C795639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433EBC9CBA18991C5A960C795639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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
>> Subject: [PATCH v2 16/41] e1000x: Rename TcpIpv6 into TcpIpv6Ex
>>
>> e1000e and igb employs NetPktRssIpV6TcpEx for RSS hash if TcpIpv6 MRQC bit
>> is set. Moreover, igb also has a MRQC bit for NetPktRssIpV6Tcp though it is not
>> implemented yet. Rename it to TcpIpv6Ex to avoid confusion.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/e1000x_regs.h | 24 ++++++++++++------------  hw/net/e1000e_core.c |
>> 8 ++++----
>>   hw/net/igb_core.c    |  8 ++++----
>>   hw/net/trace-events  |  2 +-
>>   4 files changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h index
>> 6d3c4c6d3a..13760c66d3 100644
>> --- a/hw/net/e1000x_regs.h
>> +++ b/hw/net/e1000x_regs.h
>> @@ -290,18 +290,18 @@
>>   #define E1000_RETA_IDX(hash)        ((hash) & (BIT(7) - 1))
>>   #define E1000_RETA_VAL(reta, hash)  (((uint8_t
>> *)(reta))[E1000_RETA_IDX(hash)])
>>
>> -#define E1000_MRQC_EN_TCPIPV4(mrqc) ((mrqc) & BIT(16))
>> -#define E1000_MRQC_EN_IPV4(mrqc)    ((mrqc) & BIT(17))
>> -#define E1000_MRQC_EN_TCPIPV6(mrqc) ((mrqc) & BIT(18)) -#define
>> E1000_MRQC_EN_IPV6EX(mrqc)  ((mrqc) & BIT(19))
>> -#define E1000_MRQC_EN_IPV6(mrqc)    ((mrqc) & BIT(20))
>> -
>> -#define E1000_MRQ_RSS_TYPE_NONE     (0)
>> -#define E1000_MRQ_RSS_TYPE_IPV4TCP  (1)
>> -#define E1000_MRQ_RSS_TYPE_IPV4     (2)
>> -#define E1000_MRQ_RSS_TYPE_IPV6TCP  (3)
>> -#define E1000_MRQ_RSS_TYPE_IPV6EX   (4)
>> -#define E1000_MRQ_RSS_TYPE_IPV6     (5)
>> +#define E1000_MRQC_EN_TCPIPV4(mrqc)   ((mrqc) & BIT(16))
>> +#define E1000_MRQC_EN_IPV4(mrqc)      ((mrqc) & BIT(17))
>> +#define E1000_MRQC_EN_TCPIPV6EX(mrqc) ((mrqc) & BIT(18))
>> +#define E1000_MRQC_EN_IPV6EX(mrqc)    ((mrqc) & BIT(19))
>> +#define E1000_MRQC_EN_IPV6(mrqc)      ((mrqc) & BIT(20))
>> +
>> +#define E1000_MRQ_RSS_TYPE_NONE       (0)
>> +#define E1000_MRQ_RSS_TYPE_IPV4TCP    (1)
>> +#define E1000_MRQ_RSS_TYPE_IPV4       (2)
>> +#define E1000_MRQ_RSS_TYPE_IPV6TCPEX  (3)
>> +#define E1000_MRQ_RSS_TYPE_IPV6EX     (4)
>> +#define E1000_MRQ_RSS_TYPE_IPV6       (5)
>>
>>   #define E1000_ICR_ASSERTED BIT(31)
>>   #define E1000_EIAC_MASK    0x01F00000
>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c index
>> 743b36ddfb..481db41931 100644
>> --- a/hw/net/e1000e_core.c
>> +++ b/hw/net/e1000e_core.c
>> @@ -537,7 +537,7 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct
>> NetRxPkt *pkt)
>>                                   ip6info->rss_ex_dst_valid,
>>                                   ip6info->rss_ex_src_valid,
>>                                   core->mac[MRQC],
>> -                                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC]),
>> +
>> + E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC]),
> 
> Some formatting gone wrong here?  Otherwise,
> Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>

Weird. There is no formatting problem if you look at this patch with 
Patchew:
https://patchew.org/QEMU/20230420054657.50367-1-akihiko.odaki@daynix.com/20230420054657.50367-17-akihiko.odaki@daynix.com/

> 
>>                                   E1000_MRQC_EN_IPV6EX(core->mac[MRQC]),
>>                                   E1000_MRQC_EN_IPV6(core->mac[MRQC]));
>>
>> @@ -546,8 +546,8 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct
>> NetRxPkt *pkt)
>>                                 ip6info->rss_ex_src_valid))) {
>>
>>               if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP &&
>> -                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
>> -                return E1000_MRQ_RSS_TYPE_IPV6TCP;
>> +                E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC])) {
>> +                return E1000_MRQ_RSS_TYPE_IPV6TCPEX;
>>               }
>>
>>               if (E1000_MRQC_EN_IPV6EX(core->mac[MRQC])) { @@ -581,7 +581,7
>> @@ e1000e_rss_calc_hash(E1000ECore *core,
>>       case E1000_MRQ_RSS_TYPE_IPV4TCP:
>>           type = NetPktRssIpV4Tcp;
>>           break;
>> -    case E1000_MRQ_RSS_TYPE_IPV6TCP:
>> +    case E1000_MRQ_RSS_TYPE_IPV6TCPEX:
>>           type = NetPktRssIpV6TcpEx;
>>           break;
>>       case E1000_MRQ_RSS_TYPE_IPV6:
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>> 4b9131e566..0182880adf 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -301,7 +301,7 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt
>> *pkt)
>>                                   ip6info->rss_ex_dst_valid,
>>                                   ip6info->rss_ex_src_valid,
>>                                   core->mac[MRQC],
>> -                                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC]),
>> +
>> + E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC]),
>>                                   E1000_MRQC_EN_IPV6EX(core->mac[MRQC]),
>>                                   E1000_MRQC_EN_IPV6(core->mac[MRQC]));
>>
>> @@ -310,8 +310,8 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt
>> *pkt)
>>                                 ip6info->rss_ex_src_valid))) {
>>
>>               if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP &&
>> -                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
>> -                return E1000_MRQ_RSS_TYPE_IPV6TCP;
>> +                E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC])) {
>> +                return E1000_MRQ_RSS_TYPE_IPV6TCPEX;
>>               }
>>
>>               if (E1000_MRQC_EN_IPV6EX(core->mac[MRQC])) { @@ -343,7 +343,7
>> @@ igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo
>> *info)
>>       case E1000_MRQ_RSS_TYPE_IPV4TCP:
>>           type = NetPktRssIpV4Tcp;
>>           break;
>> -    case E1000_MRQ_RSS_TYPE_IPV6TCP:
>> +    case E1000_MRQ_RSS_TYPE_IPV6TCPEX:
>>           type = NetPktRssIpV6TcpEx;
>>           break;
>>       case E1000_MRQ_RSS_TYPE_IPV6:
>> diff --git a/hw/net/trace-events b/hw/net/trace-events index
>> a34d196ff7..64d776bc2a 100644
>> --- a/hw/net/trace-events
>> +++ b/hw/net/trace-events
>> @@ -179,7 +179,7 @@ e1000e_rx_rss_disabled(void) "RSS is disabled"
>>   e1000e_rx_rss_type(uint32_t type) "RSS type is %u"
>>   e1000e_rx_rss_ip4(int l4hdr_proto, uint32_t mrqc, bool tcpipv4_enabled,
>> bool ipv4_enabled) "RSS IPv4: L4 header protocol %d, mrqc 0x%X, tcpipv4
>> enabled %d, ipv4 enabled %d"
>>   e1000e_rx_rss_ip6_rfctl(uint32_t rfctl) "RSS IPv6: rfctl 0x%X"
>> -e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, int l4hdr_proto, bool
>> has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool
>> tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis:
>> %d, new_ex_dis: %d, L4 header protocol %d, has_ext_headers %d, ex_dst_valid
>> %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6
>> enabled %d"
>> +e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, int l4hdr_proto, bool
>> has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool
>> tcpipv6ex_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6:
>> ex_dis: %d, new_ex_dis: %d, L4 header protocol %d, has_ext_headers %d,
>> ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6ex enabled %d, ipv6ex
>> enabled %d, ipv6 enabled %d"
>>
>>   e1000e_rx_metadata_protocols(bool hasip4, bool hasip6, int l4hdr_protocol)
>> "protocols: ip4: %d, ip6: %d, l4hdr: %d"
>>   e1000e_rx_metadata_vlan(uint16_t vlan_tag) "VLAN tag is 0x%X"
>> --
>> 2.40.0
> 

