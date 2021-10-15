Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8342FCD4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:14:10 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTaj-0007Fl-0E
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbTZ8-0006XC-GH
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:12:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51528
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbTZ6-0006XU-88
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:12:30 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbTYr-000BcQ-1I; Fri, 15 Oct 2021 21:12:13 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-9-mark.cave-ayland@ilande.co.uk>
 <40098631-e3de-b334-43a7-e0e7ff2751c4@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <20e94c6d-99e7-2ecd-412d-20265ab43c97@ilande.co.uk>
Date: Fri, 15 Oct 2021 21:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <40098631-e3de-b334-43a7-e0e7ff2751c4@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 8/8] q800: add NMI handler
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

On 15/10/2021 09:40, Laurent Vivier wrote:

> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>> This allows the programmer's switch to be triggered via the monitor for debugging
>> purposes. Since the CPU level 7 interrupt is level-triggered, use a timer to hold
>> the NMI active for 100ms before releasing it again.
> 
> I'm wondering if Qemu provides another way to have a level-triggered interrupt in this case.
> 
> I' tried to see if keeping the button pressed on a mac kept the IRQ up (as QMP NMI does), but a real
> mac is too slow and has to many things to display it was not really conclusive...

When writing the patch I rebased the outstanding MacOS patches onto the branch, 
installed Macsbug into MacOS and used "info nmi" to break into it.

Testing glue_nmi() with:

   GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 1);
   GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 0);

i.e. a simple pulse didn't launch MacsBug at all. Keeping the NMI high launches 
MacsBug (which is usable) but then as soon as you exit MacsBug with ES, MacsBug 
breaks immediately again making it impossible to return to the Finder. Adding the 
timer allows launching MacsBug and then exiting/re-entering MacsBug again on demand 
as expected.


ATB,

Mark.

