Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6322A9C5A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 19:34:55 +0100 (CET)
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb6Za-0005Ol-EY
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 13:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kb6WI-0002Z4-3v
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 13:31:30 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:46377)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kb6WE-0005qb-Gq
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 13:31:29 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0A6IUQse048593;
 Fri, 6 Nov 2020 19:30:26 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0A6IUQQh024823; Fri, 6 Nov 2020 19:30:26 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0A6IUPx0024822;
 Fri, 6 Nov 2020 19:30:25 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2 1/4] hw/net/can/ctucan: Don't allow guest to write
 off end of tx_buffer
Date: Fri, 6 Nov 2020 19:30:25 +0100
User-Agent: KMail/1.9.10
References: <20201106171153.32673-1-peter.maydell@linaro.org>
 <202011061847.23354.pisa@cmp.felk.cvut.cz>
 <CAFEAcA8rR0Tjx111Xzj5VpZGSVLi8R70PSQ7Wahzb1AQM2TgLA@mail.gmail.com>
In-Reply-To: <CAFEAcA8rR0Tjx111Xzj5VpZGSVLi8R70PSQ7Wahzb1AQM2TgLA@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202011061930.25439.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0A6IUQse048593
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.223, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.28,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605292229.15638@tObA1ekogkpwU1cpG130jA
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 12:48:26
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
 Ondrej Ille <ondrej.ille@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jan =?utf-8?q?Charv=C3=A1t?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Friday 06 of November 2020 19:04:38 Peter Maydell wrote:
> On Fri, 6 Nov 2020 at 17:48, Pavel Pisa <pisa@cmp.felk.cvut.cz> wrote:
> > Hello Peter,
> >
> > thanks much for the catching the problem and investing time into
> > fixing. I hope to find time for more review of remarks and Xilinx
> > patches next week. I do not find reasonable time slot till Sunday.
> > Excuse me. To not block updates, I confirm your changes.
> >
> > On Friday 06 of November 2020 18:11:50 Peter Maydell wrote:
> > > The ctucan device has 4 CAN bus cores, each of which has a set of 20
> > > 32-bit registers for writing the transmitted data. The registers are
> > > however not contiguous; each core's buffers is 0x100 bytes after
> > > the last.
> > >
> > > We got the checks on the address wrong in the ctucan_mem_write()
> > > function:
> > >  * the first "is addr in range at all" check allowed
> > >    addr == CTUCAN_CORE_MEM_SIZE, which is actually the first
> > >    byte off the end of the range
> > >  * the decode of addresses into core-number plus offset in the
> > >    tx buffer for that core failed to check that the offset was
> > >    in range, so the guest could write off the end of the
> > >    tx_buffer[] array
> > >  * the decode had an explicit check for whether the core-number
> > >    was out of range, which is actually impossible given the
> > >    CTUCAN_CORE_MEM_SIZE check and the number of cores.
> > >
> > > Fix the top level check, check the offset, and turn the check
> > > on the core-number into an assertion.
> > >
> > > Fixes: Coverity CID 1432874
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/net/can/ctucan_core.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
> > > index d20835cd7e9..ea09bf71a0c 100644
> > > --- a/hw/net/can/ctucan_core.c
> > > +++ b/hw/net/can/ctucan_core.c
> > > @@ -303,7 +303,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr
> > > addr, uint64_t val, DPRINTF("write 0x%02llx addr 0x%02x\n",
> > >              (unsigned long long)val, (unsigned int)addr);
> > >
> > > -    if (addr > CTUCAN_CORE_MEM_SIZE) {
> > > +    if (addr >= CTUCAN_CORE_MEM_SIZE) {
> > >          return;
> > >      }
> >
> > Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> >
> > > @@ -312,7 +312,8 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr
> > > addr, uint64_t val, addr -= CTU_CAN_FD_TXTB1_DATA_1;
> > >          buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
> > >          addr %= CTUCAN_CORE_TXBUFF_SPAN;
> > > -        if (buff_num < CTUCAN_CORE_TXBUF_NUM) {
> > > +        assert(buff_num < CTUCAN_CORE_TXBUF_NUM);
> >
> > Assert is not necessary. If there is not buffer at that location,
> > then write has no effect. Assert would check for driver errors,
> > but it is not a problem of QEMU and for sure should not lead to its
> > crash.
>
> We assert() here as a guide to readers of the code that we know
> that buff_num can't possibly be out of range for the array
> access we're about to do: the values of CTUCAN_CORE_MEM_SIZE,
> CTUCAN_CORE_TXBUFF_SPAN, etc, make it mathematically impossible.
> We prefer to assert() that kind of condition rather than having
> an if() test for it.

I understand but I see as fully valid to have CTUCAN_CORE_MEM_SIZE
with some reserve and only two buffers populated which would lead
to "spare" space after the end of the area where buffers are mapped
into address-space. Same for CTUCAN_CORE_TXBUFF_SPAN
and CTUCAN_CORE_MSG_MAX_LEN. There could be check

  assert(CTUCAN_CORE_MSG_MAX_LEN <= CTUCAN_CORE_TXBUFF_SPAN)

and 
 
  assert(CTUCAN_CORE_TXBUFF_SPAN * CTUCAN_CORE_TXBUF_NUM +
         CTU_CAN_FD_TXTB1_DATA_1 <= CTUCAN_CORE_MEM_SIZE)

or even some cross checks of sizeof of the filed.

But all other combination are in the fact real, depends on core
synthesis parameters. Yes, for core release 2.x are the most
fixed now. But option to provide variant compatible with actual
driver which has CTUCAN_CORE_TXBUF_NUM > 4 up to hard limit of 8
is left open still.

Best wishes,

Pavel


 

