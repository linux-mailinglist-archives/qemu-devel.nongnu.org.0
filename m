Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B19B65E0F1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 00:27:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDDA4-0006w9-3r; Wed, 04 Jan 2023 18:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDD9u-0006vK-EW
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 18:26:58 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDD9q-00059B-Oi
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 18:26:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C39E9748131;
 Thu,  5 Jan 2023 00:24:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8302174812D; Thu,  5 Jan 2023 00:24:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7E5BF74633D;
 Thu,  5 Jan 2023 00:24:36 +0100 (CET)
Date: Thu, 5 Jan 2023 00:24:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Joelle van Dyne <j@getutm.app>
Subject: Display update issue on M1 Macs
Message-ID: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII; format=flowed
Content-ID: <2a5a10b6-f88c-9696-4ed5-f215861c0675@eik.bme.hu>
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

Hello,

I got reports from several users trying to run AmigaOS4 on sam460ex on 
Apple silicon Macs that they get missing graphics that I can't reproduce 
on x86_64. With help from the users who get the problem we've narrowed it 
down to the following:

It looks like that data written to the sm501's ram in 
qemu/hw/display/sm501.c::sm501_2d_operation() is then not seen from 
sm501_update_display() in the same file. The sm501_2d_operation() function 
is called when the guest accesses the emulated card so it may run in a 
different thread than sm501_update_display() which is called by the ui 
backend but I'm not sure how QEMU calls these. Is device code running in 
iothread and display update in main thread? The problem is also 
independent of the display backend and was reproduced with both -display 
cocoa and -display sdl.

We have confirmed it's not the pixman routines that sm501_2d_operation() 
uses as the same issue is seen also with QEMU 4.x where pixman wasn't used 
and with all versions up to 7.2 so it's also not some bisectable change in 
QEMU. It also happens with --enable-debug so it doesn't seem to be related 
to optimisation either and I don't get it on x86_64 but even x86_64 QEMU 
builds run on Apple M1 with Rosetta 2 show the problem. It also only seems 
to affect graphics written from sm501_2d_operation() which AmigaOS4 uses 
extensively but other OSes don't and just render graphics with the vcpu 
which work without problem also on the M1 Macs that show this problem with 
AmigaOS4. Theoretically this could be some missing syncronisation which is 
something ARM and PPC may need while x86 doesn't but I don't know if this 
is really the reason and if so where and how to fix it). Any idea what may 
cause this and what could be a fix to try?

(Info on how to run it is here:
http://zero.eik.bme.hu/~balaton/qemu/amiga/#amigaos
but AmigaOS4 is not freely distributable so it's a bit hard to reproduce. 
Some Linux X servers that support sm501/sm502 may also use the card's 2d 
engine but I don't know about any live CDs that readily run on sam460ex.)

Thank you,
BALATON Zoltan

