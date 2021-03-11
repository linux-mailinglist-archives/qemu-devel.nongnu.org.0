Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89879336F92
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:07:35 +0100 (CET)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIEA-0006wi-JT
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIBx-0005Bd-69
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:18 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52270
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIBv-0004CU-HO
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:16 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIBs-0001He-1M; Thu, 11 Mar 2021 10:05:15 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 11 Mar 2021 10:04:58 +0000
Message-Id: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 0/7] mac_via: fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

This patchset consists of a number of mac_via fixes and improvements taken
from my attempts to boot MacOS on the q800 machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

v2:
- Rebase on master
- Add R-B tags from Laurent
- Add VIA_60HZ_TIMER_PERIOD_NS define in patch 6 along with a comment referencing
  GTTMFH as suggested by Zoltan and Laurent


Mark Cave-Ayland (7):
  mac_via: switch rtc pram trace-events to use hex rather than decimal
    for addresses
  mac_via: fix up adb_via_receive() trace events
  mac_via: allow long accesses to VIA registers
  mac_via: don't re-inject ADB response when switching to IDLE state
  mac_via: rename VBL timer to 60Hz timer
  mac_via: fix 60Hz VIA1 timer interval
  mac_via: remove VIA1 timer optimisations

 hw/misc/mac_via.c         | 194 +++++++++++++++-----------------------
 hw/misc/trace-events      |   4 +-
 include/hw/misc/mac_via.h |   8 +-
 3 files changed, 81 insertions(+), 125 deletions(-)

-- 
2.20.1


