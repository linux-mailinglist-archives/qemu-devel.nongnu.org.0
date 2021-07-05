Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C43BC3C5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:51:08 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0WUe-00068q-0A
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTM-0004RL-Mh
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43324
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTK-0006JI-W5
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:48 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WSy-0001ZF-3t; Mon, 05 Jul 2021 22:49:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, jasowang@redhat.com, laurent@vivier.eu,
 fthain@linux-m68k.org, f4bug@amsat.org
Date: Mon,  5 Jul 2021 22:49:25 +0100
Message-Id: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/4] dp8393x: fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

(was: [RFC PATCH 0/6] dp8393x: Housekeeping)

This is an updated version of Phil's patchset previously posted at
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00440.html which
I've tested locally on Linux/m68k, MacOS and NetBSD/arc.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Changes since RFC:
- Drop patch 1 "dp8393x: fix CAM descriptor entry index" from this patchset as
  it has already been queued to mips-next
- Update patch 2 "dp8393x: don't force 32-bit register access" including improved
  comment explaining the current solution
- Drop patch 3 "dp8393x: Restrict bus access to 16/32-bit operations" since it
  causes a regression with MacOS
- Fix offsets in patch 6 "dp8393x: Rewrite dp8393x_get() / dp8393x_put()"

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (1):
  dp8393x: don't force 32-bit register access

Philippe Mathieu-Daudé (3):
  dp8393x: Replace address_space_rw(is_write=1) by address_space_write()
  dp8393x: Store CAM registers as 16-bit
  dp8393x: Rewrite dp8393x_get() / dp8393x_put()

 hw/net/dp8393x.c | 195 ++++++++++++++++++++---------------------------
 1 file changed, 81 insertions(+), 114 deletions(-)

-- 
2.20.1


