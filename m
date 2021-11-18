Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F9456247
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:22:09 +0100 (CET)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnm2y-0005QU-OY
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzk-0002B1-3X
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:18:48 -0500
Received: from [2001:41c9:1:41f::167] (port=45156
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzh-0006S1-E3
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:18:47 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzW-0001qH-5b; Thu, 18 Nov 2021 18:18:38 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 18 Nov 2021 18:18:33 +0000
Message-Id: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-6.2 0/2] escc: fixes for STATUS_TXEMPTY and SPEC_ALLSENT
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This is another attempt to fix booting 32-bit QEMU SPARC machines in
qemu-system-sparc using a real Sun PROM based upon further experiments and
re-reading of the ESCC datasheet from a previous patch posted at
https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00324.html.

It appears that both the Sun PROM and OpenBSD with OpenBIOS fail to send an
explicit reset command as recommended in the ESCC datasheet, which causes
hangs during serial port enumeration since the introduction of the recent
ESCC reset changes.

The first patch always sets STATUS_TXEMPTY in R_STATUS on hardware reset
which wasn't documented in the "Reset" section(s) but is documented in the
"Transmit Interrupts and Transmit Buffer Empty Bit" section, whilst the
second patch updates SPEC_ALLSENT when writing to W_TXCTRL1.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (2):
  escc: always set STATUS_TXEMPTY in R_STATUS on device reset
  escc: update the R_SPEC register SPEC_ALLSENT bit when writing to
    W_TXCTRL1

 hw/char/escc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

-- 
2.20.1


