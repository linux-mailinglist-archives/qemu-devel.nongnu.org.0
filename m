Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC12D7578
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:22:14 +0100 (CET)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhR6-0002G3-KN
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1knhOb-0000ui-Or
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:19:42 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:55812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1knhOY-0006cl-7F
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:19:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 93D2921BC55;
 Fri, 11 Dec 2020 13:19:19 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 11 Dec
 2020 13:19:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005826530b9-912c-480b-b60c-73d675feaa08,
 9EEBF3925B94F143FF93F47EDF07ACA53746D722) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 3/3] net: checksum: Introduce fine control over
 checksum type
To: Bin Meng <bmeng.cn@gmail.com>, <qemu-devel@nongnu.org>
References: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
 <1607679312-51325-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <74ef44be-2fbe-002b-a0da-0185e87ccea8@kaod.org>
Date: Fri, 11 Dec 2020 13:19:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607679312-51325-3-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a13324fb-f895-43ae-934d-836cd71c89fa
X-Ovh-Tracer-Id: 7189715332854156243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudekvddgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegsmhgvnhhgrdgtnhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Zhang Chen <chen.zhang@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 10:35 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present net_checksum_calculate() blindly calculates all types of
> checksums (IP, TCP, UDP). Some NICs may have a per type setting in
> their BDs to control what checksum should be offloaded. To support
> such hardware behavior, introduce a 'csum_flag' parameter to the
> net_checksum_calculate() API to allow fine control over what type
> checksum is calculated.
> 
> Existing users of this API are updated accordingly.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

For the ftgmac100 part,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> 
> Changes in v2:
> - update ftgmac100.c per Cédric Le Goater's suggestion
> - simplify fsl_etsec and imx_fec checksum logic
> 
>  include/net/checksum.h        |  7 ++++++-
>  hw/net/allwinner-sun8i-emac.c |  2 +-
>  hw/net/cadence_gem.c          |  2 +-
>  hw/net/fsl_etsec/rings.c      | 18 +++++++++---------
>  hw/net/ftgmac100.c            | 13 ++++++++++++-
>  hw/net/imx_fec.c              | 20 ++++++++------------
>  hw/net/virtio-net.c           |  2 +-
>  hw/net/xen_nic.c              |  2 +-
>  net/checksum.c                | 18 ++++++++++++++----
>  net/filter-rewriter.c         |  4 ++--
>  10 files changed, 55 insertions(+), 33 deletions(-)
> 
> diff --git a/include/net/checksum.h b/include/net/checksum.h
> index 05a0d27..7dec37e 100644
> --- a/include/net/checksum.h
> +++ b/include/net/checksum.h
> @@ -21,11 +21,16 @@
>  #include "qemu/bswap.h"
>  struct iovec;
>  
> +#define CSUM_IP     0x01
> +#define CSUM_TCP    0x02
> +#define CSUM_UDP    0x04
> +#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)
> +
>  uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
>  uint16_t net_checksum_finish(uint32_t sum);
>  uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
>                               uint8_t *addrs, uint8_t *buf);
> -void net_checksum_calculate(uint8_t *data, int length);
> +void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
>  
>  static inline uint32_t
>  net_checksum_add(int len, uint8_t *buf)
> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
> index 38d3285..0427689 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -514,7 +514,7 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
>          /* After the last descriptor, send the packet */
>          if (desc.status2 & TX_DESC_STATUS2_LAST_DESC) {
>              if (desc.status2 & TX_DESC_STATUS2_CHECKSUM_MASK) {
> -                net_checksum_calculate(packet_buf, packet_bytes);
> +                net_checksum_calculate(packet_buf, packet_bytes, CSUM_ALL);
>              }
>  
>              qemu_send_packet(nc, packet_buf, packet_bytes);
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7a53469..9a4474a 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1266,7 +1266,7 @@ static void gem_transmit(CadenceGEMState *s)
>  
>                  /* Is checksum offload enabled? */
>                  if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
> -                    net_checksum_calculate(s->tx_packet, total_bytes);
> +                    net_checksum_calculate(s->tx_packet, total_bytes, CSUM_ALL);
>                  }
>  
>                  /* Update MAC statistics */
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 628648a..121415a 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -183,13 +183,11 @@ static void process_tx_fcb(eTSEC *etsec)
>      uint8_t *l3_header = etsec->tx_buffer + 8 + l3_header_offset;
>      /* L4 header */
>      uint8_t *l4_header = l3_header + l4_header_offset;
> +    int csum = 0;
>  
>      /* if packet is IP4 and IP checksum is requested */
>      if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
> -        /* do IP4 checksum (TODO This function does TCP/UDP checksum
> -         * but not sure if it also does IP4 checksum.) */
> -        net_checksum_calculate(etsec->tx_buffer + 8,
> -                etsec->tx_buffer_len - 8);
> +        csum |= CSUM_IP;
>      }
>      /* TODO Check the correct usage of the PHCS field of the FCB in case the NPH
>       * flag is on */
> @@ -201,9 +199,7 @@ static void process_tx_fcb(eTSEC *etsec)
>              /* if checksum is requested */
>              if (flags & FCB_TX_CTU) {
>                  /* do UDP checksum */
> -
> -                net_checksum_calculate(etsec->tx_buffer + 8,
> -                        etsec->tx_buffer_len - 8);
> +                csum |= CSUM_UDP;
>              } else {
>                  /* set checksum field to 0 */
>                  l4_header[6] = 0;
> @@ -211,10 +207,14 @@ static void process_tx_fcb(eTSEC *etsec)
>              }
>          } else if (flags & FCB_TX_CTU) { /* if TCP and checksum is requested */
>              /* do TCP checksum */
> -            net_checksum_calculate(etsec->tx_buffer + 8,
> -                                   etsec->tx_buffer_len - 8);
> +            csum |= CSUM_TCP;
>          }
>      }
> +
> +    if (csum) {
> +        net_checksum_calculate(etsec->tx_buffer + 8,
> +                               etsec->tx_buffer_len - 8, csum);
> +    }
>  }
>  
>  static void process_tx_bd(eTSEC         *etsec,
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 782ff19..25685ba 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -564,6 +564,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>          ptr += len;
>          frame_size += len;
>          if (bd.des0 & FTGMAC100_TXDES0_LTS) {
> +            int csum = 0;
>  
>              /* Check for VLAN */
>              if (flags & FTGMAC100_TXDES1_INS_VLANTAG &&
> @@ -573,8 +574,18 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>              }
>  
>              if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
> -                net_checksum_calculate(s->frame, frame_size);
> +                csum |= CSUM_IP;
>              }
> +            if (flags & FTGMAC100_TXDES1_TCP_CHKSUM) {
> +                csum |= CSUM_TCP;
> +            }
> +            if (flags & FTGMAC100_TXDES1_UDP_CHKSUM) {
> +                csum |= CSUM_UDP;
> +            }
> +            if (csum) {
> +                net_checksum_calculate(s->frame, frame_size, csum);
> +            }
> +
>              /* Last buffer in frame.  */
>              qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
>              ptr = s->frame;
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 2c14804..f03450c 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -561,22 +561,18 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
>          ptr += len;
>          frame_size += len;
>          if (bd.flags & ENET_BD_L) {
> +            int csum = 0;
> +
>              if (bd.option & ENET_BD_PINS) {
> -                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
> -                if (IP_HEADER_VERSION(ip_hd) == 4) {
> -                    net_checksum_calculate(s->frame, frame_size);
> -                }
> +                csum |= (CSUM_TCP | CSUM_UDP);
>              }
>              if (bd.option & ENET_BD_IINS) {
> -                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
> -                /* We compute checksum only for IPv4 frames */
> -                if (IP_HEADER_VERSION(ip_hd) == 4) {
> -                    uint16_t csum;
> -                    ip_hd->ip_sum = 0;
> -                    csum = net_raw_checksum((uint8_t *)ip_hd, sizeof(*ip_hd));
> -                    ip_hd->ip_sum = cpu_to_be16(csum);
> -                }
> +                csum |= CSUM_IP;
> +            }
> +            if (csum) {
> +                net_checksum_calculate(s->frame, frame_size, csum);
>              }
> +
>              /* Last buffer in frame.  */
>  
>              qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 044ac95..4082be3 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1471,7 +1471,7 @@ static void work_around_broken_dhclient(struct virtio_net_hdr *hdr,
>          (buf[12] == 0x08 && buf[13] == 0x00) && /* ethertype == IPv4 */
>          (buf[23] == 17) && /* ip.protocol == UDP */
>          (buf[34] == 0 && buf[35] == 67)) { /* udp.srcport == bootps */
> -        net_checksum_calculate(buf, size);
> +        net_checksum_calculate(buf, size, CSUM_UDP);
>          hdr->flags &= ~VIRTIO_NET_HDR_F_NEEDS_CSUM;
>      }
>  }
> diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
> index 00a7fdf..5c815b4 100644
> --- a/hw/net/xen_nic.c
> +++ b/hw/net/xen_nic.c
> @@ -174,7 +174,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
>                      tmpbuf = g_malloc(XC_PAGE_SIZE);
>                  }
>                  memcpy(tmpbuf, page + txreq.offset, txreq.size);
> -                net_checksum_calculate(tmpbuf, txreq.size);
> +                net_checksum_calculate(tmpbuf, txreq.size, CSUM_ALL);
>                  qemu_send_packet(qemu_get_queue(netdev->nic), tmpbuf,
>                                   txreq.size);
>              } else {
> diff --git a/net/checksum.c b/net/checksum.c
> index dabd290..70f4eae 100644
> --- a/net/checksum.c
> +++ b/net/checksum.c
> @@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
>      return net_checksum_finish(sum);
>  }
>  
> -void net_checksum_calculate(uint8_t *data, int length)
> +void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
>  {
>      int mac_hdr_len, ip_len;
>      struct ip_header *ip;
> @@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int length)
>      }
>  
>      /* Calculate IP checksum */
> -    stw_he_p(&ip->ip_sum, 0);
> -    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> -    stw_be_p(&ip->ip_sum, csum);
> +    if (csum_flag & CSUM_IP) {
> +        stw_he_p(&ip->ip_sum, 0);
> +        csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> +        stw_be_p(&ip->ip_sum, csum);
> +    }
>  
>      if (IP4_IS_FRAGMENT(ip)) {
>          return; /* a fragmented IP packet */
> @@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int length)
>      switch (ip->ip_p) {
>      case IP_PROTO_TCP:
>      {
> +        if (!(csum_flag & CSUM_TCP)) {
> +            return;
> +        }
> +
>          tcp_header *tcp = (tcp_header *)(ip + 1);
>  
>          if (ip_len < sizeof(tcp_header)) {
> @@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int length)
>      }
>      case IP_PROTO_UDP:
>      {
> +        if (!(csum_flag & CSUM_UDP)) {
> +            return;
> +        }
> +
>          udp_header *udp = (udp_header *)(ip + 1);
>  
>          if (ip_len < sizeof(udp_header)) {
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index e063a81..80caac5 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -114,7 +114,7 @@ static int handle_primary_tcp_pkt(RewriterState *rf,
>              tcp_pkt->th_ack = htonl(ntohl(tcp_pkt->th_ack) + conn->offset);
>  
>              net_checksum_calculate((uint8_t *)pkt->data + pkt->vnet_hdr_len,
> -                                   pkt->size - pkt->vnet_hdr_len);
> +                                   pkt->size - pkt->vnet_hdr_len, CSUM_TCP);
>          }
>  
>          /*
> @@ -216,7 +216,7 @@ static int handle_secondary_tcp_pkt(RewriterState *rf,
>              tcp_pkt->th_seq = htonl(ntohl(tcp_pkt->th_seq) - conn->offset);
>  
>              net_checksum_calculate((uint8_t *)pkt->data + pkt->vnet_hdr_len,
> -                                   pkt->size - pkt->vnet_hdr_len);
> +                                   pkt->size - pkt->vnet_hdr_len, CSUM_TCP);
>          }
>      }
>  
> 


