Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282517CD2E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 10:14:21 +0100 (CET)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAVXH-0003Mv-6l
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 04:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jAVWR-0002NQ-4A
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 04:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jAVWQ-0003M3-4l
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 04:13:26 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37960
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jAVWP-0003J2-Ub
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 04:13:26 -0500
Received: from host86-162-6-80.range86-162.btcentralplus.com ([86.162.6.80]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jAVWe-0006ZF-4Y; Sat, 07 Mar 2020 09:13:46 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	rth@twiddle.net,
	jsnow@redhat.com
Date: Sat,  7 Mar 2020 09:13:11 +0000
Message-Id: <20200307091313.24190-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.162.6.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 0/2] cmd646: remove pci_cmd646_ide_init() function
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41c9:1:41f::167
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

The recent cmd646 discussions reminded me of this patch I've had sitting in an
old branch for a while.

The DP264 machine is the last remaining user of the deprecated
pci_cmd646_ide_init() init function. Switch it over to using qdev via pci_create()
and then remove the now-unused pci_cmd646_ide_init() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

v3:
- Rebase onto master
- Add R-B tag from Phil
- Use pci_create_simple() instead of pci_create() as suggested by Zoltan

v2:
- Rebase onto master
- Remove setting "secondary" property to 0 for dp264 since this is already the default
- Add R-B tags from Richard


Mark Cave-Ayland (2):
  dp264: use pci_create_simple() to initialise the cmd646 device
  cmd646: remove unused pci_cmd646_ide_init() function

 hw/alpha/dp264.c |  6 +++++-
 hw/ide/cmd646.c  | 12 ------------
 include/hw/ide.h |  2 --
 3 files changed, 5 insertions(+), 15 deletions(-)

-- 
2.20.1


