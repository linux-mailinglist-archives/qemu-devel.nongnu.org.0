Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295438821B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:28:00 +0200 (CEST)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7Fv-0003cL-GN
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lj7DO-00008c-Jq; Tue, 18 May 2021 17:25:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49860
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lj7DN-0001Tl-01; Tue, 18 May 2021 17:25:22 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lj7DM-0002vs-2V; Tue, 18 May 2021 22:25:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org, pbonzini@redhat.com,
 fam@euphon.net, laurent@vivier.eu
Date: Tue, 18 May 2021 22:25:09 +0100
Message-Id: <20210518212511.21688-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/2] esp: minor fixes for older Linux versions
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

Following on from the ESP changes in QEMU 6.0 someone pointed out that the old
Linux 2.6 ESP driver as used in Aurelian's SPARC image at
https://people.debian.org/~aurel32/qemu/sparc/ emits a constant stream of
"esp0: STEP_ASEL for tgt 0" messages to the console during boot.

These patches solve the issue so that the older image is able to boot cleanly
once again. The first patch is a genuine bug fix for the QEMU 6.0 changes whilst
the second works around the delayed bus phase change when deferring IO transfers
from the end of the command phase to the start of the information transfer
phase.

I've tested this using the extended suite of images used for the QEMU 6.0 changes
and confirmed that there are no other regressions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (2):
  esp: only assert INTR_DC interrupt flag if selection fails
  esp: only set ESP_RSEQ at the start of the select sequence

 hw/scsi/esp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.20.1


