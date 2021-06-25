Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F583B4782
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 18:39:40 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lworj-00068l-N3
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 12:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwoq8-0004fg-LT
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:38:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59876
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwoq7-0006qL-1L
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:38:00 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwopi-000A8r-KW; Fri, 25 Jun 2021 17:37:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, hpoussin@reactos.org,
 fthain@telegraphics.com.au
References: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <23ac7f38-6378-1506-aad9-9602ae5379e8@ilande.co.uk>
Date: Fri, 25 Jun 2021 17:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] g364fb: fix migration (or: fix migration for MIPS
 magnum machines)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 08:38, Mark Cave-Ayland wrote:

> I noticed whilst testing the previous dp8393x patchset that I would always
> get a segfault whilst attempting to migrate the MIPS magnum machine.
> 
> A bit of detective work shows that the problem is an incorrect VMStateDescription
> in the g364fb device which expects a G364State but instead receives a
> G364SysBusState.
> 
> Looking back through the git history suggests that migration for this device
> (and also the MIPS magnum machines) has been broken for several years, so patch
> 1 takes the opportunity to improve the migration stream for the framebuffer
> first whilst patch 2 contains the actual fix.
> 
> Note that I don't use the MIPS magnum machines on a regular basis but the
> patchset fixes the migration error and survives some light testing here.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (2):
>    g364fb: use RAM memory region for framebuffer
>    g364fb: add VMStateDescription for G364SysBusState
> 
>   hw/display/g364fb.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)

Thanks for the review Phil, I've just sent v2 on its way. Does it make sense for this 
to be merged via the MIPS tree?


ATB,

Mark.

