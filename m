Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B72388B67
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:12:43 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJBy-0005Io-FC
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7h-0002af-UW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37234
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7g-0003FK-33
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:17 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7V-0001Gv-3B; Wed, 19 May 2021 11:08:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
Date: Wed, 19 May 2021 11:07:58 +0100
Message-Id: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/5] esp: fixes for MacOS toolbox ROM
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

This patchset contains more ESP fixes from my attempts to boot MacOS under
the QEMU q800 machine (along with a related NetBSD fix).

With these patches it is possible for the MacOS toolbox ROM and MacOS drivers
to detect and access SCSI drives and CDROMs during the MacOS boot process.

This patchset has been tested on top of the ESP fix series posted yesterday
(see https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg05763.html) with
the extended set of ESP test images without noticing any regressions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

[q800-macos-upstream patchset series: 1]


Mark Cave-Ayland (5):
  esp: allow non-DMA callback in esp_transfer_data() initial transfer
  esp: handle non-DMA transfers from the target one byte at a time
  esp: ensure PDMA write transfers are flushed from the FIFO to the
    target immediately
  esp: revert 75ef849696 "esp: correctly fill bus id with requested lun"
  esp: correctly accumulate extended messages for PDMA

 hw/scsi/esp.c | 137 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 83 insertions(+), 54 deletions(-)

-- 
2.20.1


