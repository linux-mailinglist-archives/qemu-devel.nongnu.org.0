Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17562AE012
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:49:36 +0100 (CET)
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZe3-000441-D8
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcZNA-00089X-50
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:32:08 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:30559)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcZN6-0000CU-LS
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:32:07 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AAJUwwj090527;
 Tue, 10 Nov 2020 20:30:58 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AAJUwMm012957; Tue, 10 Nov 2020 20:30:58 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AAJUwJQ012956;
 Tue, 10 Nov 2020 20:30:58 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2 v2 1/4] hw/net/can/ctucan: Don't allow guest to
 write off end of tx_buffer
Date: Tue, 10 Nov 2020 20:30:58 +0100
User-Agent: KMail/1.9.10
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <202011101901.09940.pisa@cmp.felk.cvut.cz>
 <CAFEAcA8ujRALffz8KfvxdVb6NTcNLNdR4tF6picWnF6wk3R64A@mail.gmail.com>
In-Reply-To: <CAFEAcA8ujRALffz8KfvxdVb6NTcNLNdR4tF6picWnF6wk3R64A@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202011102030.58186.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AAJUwwj090527
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605641461.85456@Y4dlQLo8IlCl2Fm5Mu578w
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
 Ondrej Ille <ondrej.ille@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jan =?utf-8?q?Charv=C3=A1t?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tuesday 10 of November 2020 19:24:03 Peter Maydell wrote:
> For unaligned accesses, for 6.0, I think the code for doing
> them to the txbuff at least is straightforward:
>
>    if (buff_num < CTUCAN_CORE_TXBUF_NUM &&
>        (addr + size) < CTUCAN_CORE_MSG_MAX_LEN) {
>       stn_le_p(s->tx_buffer[buff_num].data + addr, size, val);
>    }
>
> (stn_le_p takes care of doing an appropriate-width write.)

Thanks, great to know, I like that much.
Only small nitpicking, it should be (addr + size) <= CTUCAN_CORE_MSG_MAX_LEN

So whole code I am testing now

    if (addr >= CTU_CAN_FD_TXTB1_DATA_1) {
        int buff_num;
        addr -= CTU_CAN_FD_TXTB1_DATA_1;
        buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
        addr %= CTUCAN_CORE_TXBUFF_SPAN;
        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
            ((addr + size) <= sizeof(s->tx_buffer[buff_num].data))) {
            stn_le_p(s->tx_buffer[buff_num].data + addr, size, val);
        }
    } else {

So I have applied you whole series with above update. All works correctly
on x86_64 Linux host and with Linux x86_64 and MIPS big endian guests.

Please update to this combination.
I do not expect to have byte writes in our drivers but real core
supports byte enable bus signals.

Thanks much for teaching me QEMU stn_le_p.
In the fact, we are discussion about similar slution of peripherals
access for our https://github.com/cvut/QtMips/ education emulator
(performance vise a total toy when compared to QEMU).

It would worth to enable byte writes into registers as well.
But I would not do it before release. It would be more complex.
The reads supports bytes by reading 32/bit word and then shifting
and masking right bits into result. Cross word unaligned reads
are not supported. Again no reason for them now.

You can add

Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

to whole series.

Thanks,

Pavel

