Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A595D3BA984
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:35:37 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzicC-0000u5-DU
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lziZU-0005wB-TC
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:32:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:47295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lziZS-0002q7-10
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:32:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9062274570B;
 Sat,  3 Jul 2021 18:32:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 663A2745709; Sat,  3 Jul 2021 18:32:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 63C507456E3;
 Sat,  3 Jul 2021 18:32:38 +0200 (CEST)
Date: Sat, 3 Jul 2021 18:32:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/3] dp8393x: Do not amend CRC if it is inhibited
 (CRCI bit set)
In-Reply-To: <20210703150219.364582-3-f4bug@amsat.org>
Message-ID: <45c57cbe-d0a1-b3d4-66c5-71cc882b2335@eik.bme.hu>
References: <20210703150219.364582-1-f4bug@amsat.org>
 <20210703150219.364582-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1913505189-1625329958=:39827"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Finn Thain <fthain@linux-m68k.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1913505189-1625329958=:39827
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 3 Jul 2021, Philippe Mathieu-Daudé wrote:
> When the CRCI (CRC INHIBIT) bit is set, the 4-byte FCS field
> is not transmitted.

You say when CRCI is 1 then no checksum...

>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/net/dp8393x.c | 22 ++++++++++++++--------
> 1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 99e179a5e86..dee8236400c 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -472,6 +472,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
>              */
>         } else {
>             /* Remove existing FCS */
> +            /* TODO check crc */
>             tx_len -= 4;
>             if (tx_len < 0) {
>                 trace_dp8393x_transmit_txlen_error(tx_len);
> @@ -758,7 +759,10 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>         return pkt_size;
>     }
>
> -    rx_len = pkt_size + sizeof(checksum);
> +    rx_len = pkt_size;
> +    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {

... but you seem to add checksum if bit is set.

> +        rx_len += sizeof(checksum);
> +    }
>     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
>         padded_len = ((rx_len - 1) | 3) + 1;
>     } else {
> @@ -801,9 +805,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>     s->regs[SONIC_TRBA1] = s->regs[SONIC_CRBA1];
>     s->regs[SONIC_TRBA0] = s->regs[SONIC_CRBA0];
>
> -    /* Calculate the ethernet checksum */
> -    checksum = crc32(0, buf, pkt_size);
> -
>     /* Put packet into RBA */
>     trace_dp8393x_receive_packet(dp8393x_crba(s));
>     address = dp8393x_crba(s);
> @@ -811,10 +812,15 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>                         buf, pkt_size);
>     address += pkt_size;
>
> -    /* Put frame checksum into RBA */
> -    address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFIED,
> -                         NULL);
> -    address += sizeof(checksum);
> +    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {

Here too. Either these should be inverted or the commit message is wrong 
if the bit is active 0 (or I'm not getting this alltogether which is also 
possible as I've just had a quick look without really understanding it).

Regards,
BALATON Zoltan

> +        /* Calculate the ethernet checksum */
> +        checksum = crc32(0, buf, pkt_size);
> +
> +        /* Put frame checksum into RBA */
> +        address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFIED,
> +                             NULL);
> +        address += sizeof(checksum);
> +    }
>
>     /* Pad short packets to keep pointers aligned */
>     if (rx_len < padded_len) {
>
--3866299591-1913505189-1625329958=:39827--

