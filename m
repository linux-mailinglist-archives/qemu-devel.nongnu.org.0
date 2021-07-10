Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51F3C36F3
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:33:12 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Kb1-0003yf-Em
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KZD-0002vV-1a
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:31:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56058
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KZ8-0007wQ-G6
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:31:18 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KZ0-000450-Fl; Sat, 10 Jul 2021 22:31:10 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-8-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <13ce3731-292d-a4d8-55bb-7ed7a51341ce@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [NOTFORMERGE PATCH v3 7/8] dp8393x: Rewrite dp8393x_get() /
 dp8393x_put()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/07/2021 18:49, Philippe Mathieu-Daudé wrote:

> Instead of accessing N registers via a single address_space API
> call using a temporary buffer (stored in the device state) and
> updating each register, move the address_space call in the
> register put/get. The load/store and word size checks are moved
> to put/get too. This simplifies a bit, making the code easier
> to read.
> 
> Co-developed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Missing:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/net/dp8393x.c | 160 +++++++++++++++++++----------------------------
>   1 file changed, 63 insertions(+), 97 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index ac93412f70b..a9224a5bc88 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -163,7 +163,6 @@ struct dp8393xState {
>   
>       /* Temporaries */
>       uint8_t tx_buffer[0x10000];
> -    uint16_t data[12];
>       int loopback_packet;
>   
>       /* Memory access */
> @@ -220,34 +219,48 @@ static uint32_t dp8393x_wt(dp8393xState *s)
>       return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
>   }
>   
> -static uint16_t dp8393x_get(dp8393xState *s, int width, int offset)
> +static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, int offset)
>   {
> +    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>       uint16_t val;
>   
> -    if (s->big_endian) {
> -        val = be16_to_cpu(s->data[offset * width + width - 1]);
> +    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> +        addr += offset << 2;
> +        if (s->big_endian) {
> +            val = address_space_ldl_be(&s->as, addr, attrs, NULL);
> +        } else {
> +            val = address_space_ldl_le(&s->as, addr, attrs, NULL);
> +        }
>       } else {
> -        val = le16_to_cpu(s->data[offset * width]);
> +        addr += offset << 1;
> +        if (s->big_endian) {
> +            val = address_space_lduw_be(&s->as, addr, attrs, NULL);
> +        } else {
> +            val = address_space_lduw_le(&s->as, addr, attrs, NULL);
> +        }
>       }
> +
>       return val;
>   }
>   
> -static void dp8393x_put(dp8393xState *s, int width, int offset,
> -                        uint16_t val)
> +static void dp8393x_put(dp8393xState *s,
> +                        hwaddr addr, int offset, uint16_t val)
>   {
> -    if (s->big_endian) {
> -        if (width == 2) {
> -            s->data[offset * 2] = 0;
> -            s->data[offset * 2 + 1] = cpu_to_be16(val);
> +    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +
> +    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> +        addr += offset << 2;
> +        if (s->big_endian) {
> +            address_space_stl_be(&s->as, addr, val, attrs, NULL);
>           } else {
> -            s->data[offset] = cpu_to_be16(val);
> +            address_space_stl_le(&s->as, addr, val, attrs, NULL);
>           }
>       } else {
> -        if (width == 2) {
> -            s->data[offset * 2] = cpu_to_le16(val);
> -            s->data[offset * 2 + 1] = 0;
> +        addr += offset << 1;
> +        if (s->big_endian) {
> +            address_space_stw_be(&s->as, addr, val, attrs, NULL);
>           } else {
> -            s->data[offset] = cpu_to_le16(val);
> +            address_space_stw_le(&s->as, addr, val, attrs, NULL);
>           }
>       }
>   }
> @@ -278,12 +291,10 @@ static void dp8393x_do_load_cam(dp8393xState *s)
>   
>       while (s->regs[SONIC_CDC] & 0x1f) {
>           /* Fill current entry */
> -        address_space_read(&s->as, dp8393x_cdp(s),
> -                           MEMTXATTRS_UNSPECIFIED, s->data, size);
> -        index = dp8393x_get(s, width, 0) & 0xf;
> -        s->cam[index][0] = dp8393x_get(s, width, 1);
> -        s->cam[index][1] = dp8393x_get(s, width, 2);
> -        s->cam[index][2] = dp8393x_get(s, width, 3);
> +        index = dp8393x_get(s, dp8393x_cdp(s), 0) & 0xf;
> +        s->cam[index][0] = dp8393x_get(s, dp8393x_cdp(s), 1);
> +        s->cam[index][1] = dp8393x_get(s, dp8393x_cdp(s), 2);
> +        s->cam[index][2] = dp8393x_get(s, dp8393x_cdp(s), 3);
>           trace_dp8393x_load_cam(index,
>                                  s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
>                                  s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
> @@ -294,9 +305,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
>       }
>   
>       /* Read CAM enable */
> -    address_space_read(&s->as, dp8393x_cdp(s),
> -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
> -    s->regs[SONIC_CE] = dp8393x_get(s, width, 0);
> +    s->regs[SONIC_CE] = dp8393x_get(s, dp8393x_cdp(s), 0);
>       trace_dp8393x_load_cam_done(s->regs[SONIC_CE]);
>   
>       /* Done */
> @@ -312,14 +321,12 @@ static void dp8393x_do_read_rra(dp8393xState *s)
>       /* Read memory */
>       width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
>       size = sizeof(uint16_t) * 4 * width;
> -    address_space_read(&s->as, dp8393x_rrp(s),
> -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
>   
>       /* Update SONIC registers */
> -    s->regs[SONIC_CRBA0] = dp8393x_get(s, width, 0);
> -    s->regs[SONIC_CRBA1] = dp8393x_get(s, width, 1);
> -    s->regs[SONIC_RBWC0] = dp8393x_get(s, width, 2);
> -    s->regs[SONIC_RBWC1] = dp8393x_get(s, width, 3);
> +    s->regs[SONIC_CRBA0] = dp8393x_get(s, dp8393x_rrp(s), 0);
> +    s->regs[SONIC_CRBA1] = dp8393x_get(s, dp8393x_rrp(s), 1);
> +    s->regs[SONIC_RBWC0] = dp8393x_get(s, dp8393x_rrp(s), 2);
> +    s->regs[SONIC_RBWC1] = dp8393x_get(s, dp8393x_rrp(s), 3);
>       trace_dp8393x_read_rra_regs(s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
>                                   s->regs[SONIC_RBWC0], s->regs[SONIC_RBWC1]);
>   
> @@ -415,28 +422,22 @@ static void dp8393x_do_receiver_disable(dp8393xState *s)
>   static void dp8393x_do_transmit_packets(dp8393xState *s)
>   {
>       NetClientState *nc = qemu_get_queue(s->nic);
> -    int width, size;
>       int tx_len, len;
>       uint16_t i;
>   
> -    width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
> -
>       while (1) {
>           /* Read memory */
> -        size = sizeof(uint16_t) * 6 * width;
>           s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
>           trace_dp8393x_transmit_packet(dp8393x_ttda(s));
> -        address_space_read(&s->as, dp8393x_ttda(s) + sizeof(uint16_t) * width,
> -                           MEMTXATTRS_UNSPECIFIED, s->data, size);
>           tx_len = 0;
>   
>           /* Update registers */
> -        s->regs[SONIC_TCR] = dp8393x_get(s, width, 0) & 0xf000;
> -        s->regs[SONIC_TPS] = dp8393x_get(s, width, 1);
> -        s->regs[SONIC_TFC] = dp8393x_get(s, width, 2);
> -        s->regs[SONIC_TSA0] = dp8393x_get(s, width, 3);
> -        s->regs[SONIC_TSA1] = dp8393x_get(s, width, 4);
> -        s->regs[SONIC_TFS] = dp8393x_get(s, width, 5);
> +        s->regs[SONIC_TCR] = dp8393x_get(s, dp8393x_ttda(s), 1) & 0xf000;
> +        s->regs[SONIC_TPS] = dp8393x_get(s, dp8393x_ttda(s), 2);
> +        s->regs[SONIC_TFC] = dp8393x_get(s, dp8393x_ttda(s), 3);
> +        s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s), 4);
> +        s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s), 5);
> +        s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s), 6);
>   
>           /* Handle programmable interrupt */
>           if (s->regs[SONIC_TCR] & SONIC_TCR_PINT) {
> @@ -458,15 +459,12 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
>               i++;
>               if (i != s->regs[SONIC_TFC]) {
>                   /* Read next fragment details */
> -                size = sizeof(uint16_t) * 3 * width;
> -                address_space_read(&s->as,
> -                                   dp8393x_ttda(s)
> -                                   + sizeof(uint16_t) * width * (4 + 3 * i),
> -                                   MEMTXATTRS_UNSPECIFIED, s->data,
> -                                   size);
> -                s->regs[SONIC_TSA0] = dp8393x_get(s, width, 0);
> -                s->regs[SONIC_TSA1] = dp8393x_get(s, width, 1);
> -                s->regs[SONIC_TFS] = dp8393x_get(s, width, 2);
> +                s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s),
> +                                                  4 + 3 * i);
> +                s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s),
> +                                                  5 + 3 * i);
> +                s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s),
> +                                                 6 + 3 * i);
>               }
>           }
>   
> @@ -499,22 +497,12 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
>           s->regs[SONIC_TCR] |= SONIC_TCR_PTX;
>   
>           /* Write status */
> -        dp8393x_put(s, width, 0,
> -                    s->regs[SONIC_TCR] & 0x0fff); /* status */
> -        size = sizeof(uint16_t) * width;
> -        address_space_write(&s->as, dp8393x_ttda(s),
> -                            MEMTXATTRS_UNSPECIFIED, s->data, size);
> +        dp8393x_put(s, dp8393x_ttda(s), 0, s->regs[SONIC_TCR] & 0x0fff);
>   
>           if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
>               /* Read footer of packet */
> -            size = sizeof(uint16_t) * width;
> -            address_space_read(&s->as,
> -                               dp8393x_ttda(s)
> -                               + sizeof(uint16_t) * width
> -                                 * (4 + 3 * s->regs[SONIC_TFC]),
> -                               MEMTXATTRS_UNSPECIFIED, s->data,
> -                               size);
> -            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
> +            s->regs[SONIC_CTDA] = dp8393x_get(s, dp8393x_ttda(s),
> +                                              4 + 3 * s->regs[SONIC_TFC]);
>               if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
>                   /* EOL detected */
>                   break;
> @@ -762,7 +750,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>       dp8393xState *s = qemu_get_nic_opaque(nc);
>       int packet_type;
>       uint32_t available, address;
> -    int width, rx_len, padded_len;
> +    int rx_len, padded_len;
>       uint32_t checksum;
>       int size;
>   
> @@ -775,10 +763,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>   
>       rx_len = pkt_size + sizeof(checksum);
>       if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> -        width = 2;
>           padded_len = ((rx_len - 1) | 3) + 1;
>       } else {
> -        width = 1;
>           padded_len = ((rx_len - 1) | 1) + 1;
>       }
>   
> @@ -799,11 +785,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>       /* Check for EOL */
>       if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
>           /* Are we still in resource exhaustion? */
> -        size = sizeof(uint16_t) * 1 * width;
> -        address = dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
> -        address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -                           s->data, size);
> -        s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
> +        s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
>           if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
>               /* Still EOL ; stop reception */
>               return -1;
> @@ -811,11 +793,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>           /* Link has been updated by host */
>   
>           /* Clear in_use */
> -        size = sizeof(uint16_t) * width;
> -        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
> -        dp8393x_put(s, width, 0, 0);
> -        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -                            s->data, size);
> +        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
>   
>           /* Move to next descriptor */
>           s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
> @@ -874,32 +852,20 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>   
>       /* Write status to memory */
>       trace_dp8393x_receive_write_status(dp8393x_crda(s));
> -    dp8393x_put(s, width, 0, s->regs[SONIC_RCR]); /* status */
> -    dp8393x_put(s, width, 1, rx_len); /* byte count */
> -    dp8393x_put(s, width, 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
> -    dp8393x_put(s, width, 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
> -    dp8393x_put(s, width, 4, s->regs[SONIC_RSC]); /* seq_no */
> -    size = sizeof(uint16_t) * 5 * width;
> -    address_space_write(&s->as, dp8393x_crda(s),
> -                        MEMTXATTRS_UNSPECIFIED,
> -                        s->data, size);
> +    dp8393x_put(s, dp8393x_crda(s), 0, s->regs[SONIC_RCR]); /* status */
> +    dp8393x_put(s, dp8393x_crda(s), 1, rx_len); /* byte count */
> +    dp8393x_put(s, dp8393x_crda(s), 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
> +    dp8393x_put(s, dp8393x_crda(s), 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
> +    dp8393x_put(s, dp8393x_crda(s), 4, s->regs[SONIC_RSC]); /* seq_no */
>   
>       /* Check link field */
> -    size = sizeof(uint16_t) * width;
> -    address_space_read(&s->as,
> -                       dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
> -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
> -    s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
> +    s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
>       if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
>           /* EOL detected */
>           s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
>       } else {
>           /* Clear in_use */
> -        size = sizeof(uint16_t) * width;
> -        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
> -        dp8393x_put(s, width, 0, 0);
> -        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -                            s->data, size);
> +        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
>   
>           /* Move to next descriptor */
>           s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];

As per the updated cover letter this works for me on MacOS/m68k, NetBSD/m68k and 
Linux/m68k so I'm happy to give a:

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Why has this been demoted to NOTFORMERGE?


ATB,

Mark.

