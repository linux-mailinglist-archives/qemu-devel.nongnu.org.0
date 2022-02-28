Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39714C7D42
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 23:28:05 +0100 (CET)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOoUu-0006Ri-9N
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 17:28:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoSj-0003qU-LK
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 17:25:50 -0500
Received: from [2001:41c9:1:41f::167] (port=51086
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoSh-0003IO-TT
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 17:25:49 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoRu-0004GN-Rm; Mon, 28 Feb 2022 22:25:03 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Mon, 28 Feb 2022 22:25:17 +0000
Message-Id: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/10] q800: migration fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset contains fixes for the macfb and esp devices which enable
migration of the q800 machine to succeed here in local testing.

Patches 1-5 contain fixes and improvements for migrating the macfb device
whilst patches 6-9 change the ESPState pdma_cb field from being a
function pointer to an integer index that can be included in the migration
stream.

Finally patch 10 ensures that any in-flight SCSI requests active during
migration are resumed correctly post-migration. This is required because
PDMA requires the guest to read/write DMA data and hence an active
SCSI request cannot run to completion before migration starts.

NOTE: this patchset is based upon my previous mos6522 patchset posted at
https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05248.html.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Based-on: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (10):
  macfb: add VMStateDescription for MacfbNubusState and MacfbSysBusState
  macfb: don't use special irq_state and irq_mask variables in
    MacfbState
  macfb: increase number of registers saved in MacfbState
  macfb: add VMStateDescription fields for display type and VBL timer
  macfb: set initial value of mode control registers in
    macfb_common_realize()
  esp: introduce esp_set_pdma_cb() function
  esp: introduce esp_pdma_cb() function
  esp: convert ESPState pdma_cb from a function pointer to an integer
  esp: include the current PDMA callback in the migration stream
  esp: recreate ESPState current_req after migration

 hw/display/macfb.c         | 49 ++++++++++++++++++-----
 hw/scsi/esp.c              | 80 +++++++++++++++++++++++++++++++++-----
 include/hw/display/macfb.h |  4 +-
 include/hw/scsi/esp.h      | 11 +++++-
 4 files changed, 121 insertions(+), 23 deletions(-)

-- 
2.20.1


