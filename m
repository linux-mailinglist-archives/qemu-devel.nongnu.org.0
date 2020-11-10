Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5486C2ADDBE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:06:36 +0100 (CET)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcY2N-0006K2-AZ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcXyH-00048H-Rj
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:02:21 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:51194)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcXyF-0001cE-CF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:02:21 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AAI1AcM086259;
 Tue, 10 Nov 2020 19:01:10 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AAI1AjM028928; Tue, 10 Nov 2020 19:01:10 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AAI1Acd028927;
 Tue, 10 Nov 2020 19:01:10 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2 v2 1/4] hw/net/can/ctucan: Don't allow guest to
 write off end of tx_buffer
Date: Tue, 10 Nov 2020 19:01:09 +0100
User-Agent: KMail/1.9.10
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <20201110170604.5897-2-peter.maydell@linaro.org>
In-Reply-To: <20201110170604.5897-2-peter.maydell@linaro.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202011101901.09940.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AAI1AcM086259
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605636075.615@QKyMtAh/YUhNbJO/vEp+FA
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 13:02:14
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tuesday 10 of November 2020 18:06:01 Peter Maydell wrote:
> The ctucan device has 4 CAN bus cores, each of which has a set of 20
> 32-bit registers for writing the transmitted data. The registers are
> however not contiguous; each core's buffers is 0x100 bytes after
> the last.
>
> We got the checks on the address wrong in the ctucan_mem_write()
> function:
>  * the first "is addr in range at all" check allowed
>    addr == CTUCAN_CORE_MEM_SIZE, which is actually the first
>    byte off the end of the range
>  * the decode of addresses into core-number plus offset in the
>    tx buffer for that core failed to check that the offset was
>    in range, so the guest could write off the end of the
>    tx_buffer[] array
>
> NB: currently the values of CTUCAN_CORE_MEM_SIZE, CTUCAN_CORE_TXBUF_NUM,
> etc, make "buff_num >= CTUCAN_CORE_TXBUF_NUM" impossible, but we
> retain this as a runtime check rather than an assertion to permit
> those values to be changed in future (in hardware they are
> configurable synthesis parameters).
>
> Fix the top level check, and check the offset is within the buffer.
>
> Fixes: Coverity CID 1432874
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/can/ctucan_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
> index d20835cd7e9..538270e62f9 100644
> --- a/hw/net/can/ctucan_core.c
> +++ b/hw/net/can/ctucan_core.c
> @@ -303,7 +303,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr,
> uint64_t val, DPRINTF("write 0x%02llx addr 0x%02x\n",
>              (unsigned long long)val, (unsigned int)addr);
>
> -    if (addr > CTUCAN_CORE_MEM_SIZE) {
> +    if (addr >= CTUCAN_CORE_MEM_SIZE) {
>          return;
>      }

Ack

> @@ -312,7 +312,8 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr,
> uint64_t val, addr -= CTU_CAN_FD_TXTB1_DATA_1;
>          buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
>          addr %= CTUCAN_CORE_TXBUFF_SPAN;
> -        if (buff_num < CTUCAN_CORE_TXBUF_NUM) {
> +        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) ||
> +            (addr < sizeof(s->tx_buffer[buff_num].data))) {

should be &&

I would use 

+        if (buff_num < CTUCAN_CORE_TXBUF_NUM &&
+            addr < CTUCAN_CORE_MSG_MAX_LEN) {

But that is equal. There can be problem that last three bytes of the uint32_t 
type can fall after the end. The correct changes to fully support
unaligned writes is not so easy an dis unnecessary for actual drivers
and use. So suggest

+        addr &= ~3;
+        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
+            (addr < sizeof(s->tx_buffer[buff_num].data))) {

You can consider that as Acked by me

>              uint32_t *bufp = (uint32_t *)(s->tx_buffer[buff_num].data +
> addr); *bufp = cpu_to_le32(val);
>          }

