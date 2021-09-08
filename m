Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01644037E5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:32:42 +0200 (CEST)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNusj-0004ur-RS
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNuTR-0001S7-JZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:06:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58780
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNuTN-0004Rr-R7
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:06:33 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNuTH-0009HG-Qm; Wed, 08 Sep 2021 11:06:27 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <146da21f-e475-66c8-775b-567312855eb1@ilande.co.uk>
Date: Wed, 8 Sep 2021 11:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 0/9] escc: fix reset and R_STATUS when SDLC mode is
 enabled
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 12:32, Mark Cave-Ayland wrote:

> Here are another set of ESCC fixes from my attempts to boot MacOS on the q800
> machine.
> 
> Patch 1 fixes up the formatting so that the remainder of the patchset keeps
> checkpatch happy.
> 
> Patches 2-8 rework the reset handling so that the QEMU device reset is separate
> from the ESCC in-built hardware and software reset as defined in the datasheet.
> The aim here is two-fold: allow QEMU's device reset to place the ESCC device in
> a known state (although we assume all registers are zeroed whilst their values are
> undefined according to the datasheet) and ensure that the reset commands sent by
> the MacOS OpenTransport extension on boot don't re-assert the active low
> STATUS_SYNC bit in R_STATUS.
> 
> Finally patch 9 is the real fix: when entering SDLC mode using an "Enter hunt"
> command the STATUS_SYNC bit in R_STATUS must remain high until the flag byte
> is detected. Without this fix the active low STATUS_SYNC is continually asserted
> causing the MacOS OpenTransport extension to hang on startup as it believes it is
> constantly receiving LocalTalk traffic during its initial negotiation phase.
> 
> NOTE: this patchset currently fails CI because it exposed a bug that OpenBIOS
> doesn't send ESCC channel reset commands before attempting to configure and use
> the serial port. Those patches have just been posted to the OpenBIOS mailing list
> here: https://mail.coreboot.org/hyperkitty/list/openbios@openbios.org/thread/PQCW5RDIDIEUYBVAHNIY3OMHCEVYYWPU/.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> v3:
> - Rebase onto master
> - Rework hard reset to call soft reset first as suggested by Peter
> - Fix a couple of bugs in escc_soft_reset_chn()
> - Add trace events for soft reset and hard reset
> 
> v2:
> - Rebase onto master
> - Rewrite cover letter to cover new reset changes
> - Change reset to separate out QEMU device reset, soft reset and hard reset
>    (ensuring register values are updated as specified in the datasheet)
> - Add R-B tags from Peter
> 
> Mark Cave-Ayland (9):
>    escc: checkpatch fixes
>    escc: reset register values to zero in escc_reset()
>    escc: introduce escc_soft_reset_chn() for software reset
>    escc: introduce escc_hard_reset_chn() for hardware reset
>    escc: implement soft reset as described in the datasheet
>    escc: implement hard reset as described in the datasheet
>    escc: remove register changes from escc_reset_chn()
>    escc: re-use escc_reset_chn() for soft reset
>    escc: fix STATUS_SYNC bit in R_STATUS register
> 
>   hw/char/escc.c       | 263 +++++++++++++++++++++++++++++--------------
>   hw/char/trace-events |   2 +
>   2 files changed, 181 insertions(+), 84 deletions(-)

Thanks for the review, Peter. I've now applied these to my qemu-sparc branch.


ATB,

Mark.

