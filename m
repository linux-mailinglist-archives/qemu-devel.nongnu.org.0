Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C98F70A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 00:33:58 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyOJh-0004Nk-Em
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 18:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1hyOH9-00034a-IW
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 18:31:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hyOH7-0006LY-Va
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 18:31:18 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:47228)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hyOH7-0006KQ-Or
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 18:31:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 88C8974AB63;
 Fri, 16 Aug 2019 00:31:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0402B7456CB; Fri, 16 Aug 2019 00:31:13 +0200 (CEST)
Message-Id: <cover.1565907489.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 16 Aug 2019 00:18:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-devel] [PATCH 0/3] ati-vga fixes for MacOS driver
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

These are some fixes to get MacOS driver closer to working. Patch 1
adds a simple VBlank interrupt (this could be refined later as MacOS
seems to poll it frequently enough to get 100% CPU usage when
enabled). Patch 2 fixes problems with mouse pointer color and movement
due to byte and word access to HW cursor regs and Patch 3 removes some
annoying trace messages that are frequent enough to flood the log when
traces are enabled.

With these fixes MacOS shows desktop and the mouse pointer can be
moved around but it does not seem to fully boot yet as nothing can be
clicked so it may still miss something somewhere. (Also to get to this
point one needs to run an FCode ROM which needs patches to OpenBIOS
currently.)

Regards,
BALATON Zoltan

BALATON Zoltan (3):
  ati-vga: Implement dummy VBlank IRQ
  ati-vga: Support unaligned access to hardware cursor registers
  ati-vga: Silence some noisy traces

 hw/display/ati.c      | 147 +++++++++++++++++++++++++++++++++++++++-----=
------
 hw/display/ati_dbg.c  |   1 +
 hw/display/ati_int.h  |   4 ++
 hw/display/ati_regs.h |   6 +++
 4 files changed, 128 insertions(+), 30 deletions(-)

--=20
2.13.7


