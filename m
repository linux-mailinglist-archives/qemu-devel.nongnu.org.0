Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD429B596
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 16:19:28 +0100 (CET)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQkx-0001GB-LL
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXQXD-0001Fz-0e
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 11:05:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50260
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXQX9-0005ta-Ja
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 11:05:14 -0400
Received: from host86-148-103-79.range86-148.btcentralplus.com
 ([86.148.103.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXQXB-0001Qg-Kz; Tue, 27 Oct 2020 15:05:18 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com,
	samuel.thibault@ens-lyon.org
Date: Tue, 27 Oct 2020 15:04:48 +0000
Message-Id: <20201027150456.24606-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 0/8] dev-serial: minor fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

This series comes from a client project that I have been working on over the
past few months which involves communicating with serial hardware and
associated simulators using the QEMU USB serial device.

With thanks to Craig Stevens at Renesas for giving permission for these
patches to be upstreamed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


v2:
- Rebase onto master
- Drop patch 8 "dev-serial: fix FTDI_GET_MDM_ST response" as it is incorrect
- Add R-B tags from Samuel
- Change USB addr field from %d to %u as suggested by Philippe
- Add R-B tags from Philippe
- Change usb_attach() logic in patch 6 as suggested by Gerd


Mark Cave-Ayland (8):
  dev-serial: style changes to improve readability and checkpatch fixes
  dev-serial: use USB_SERIAL QOM macro for USBSerialState assignments
  dev-serial: convert from DPRINTF to trace-events
  dev-serial: add trace-events for baud rate and data parameters
  dev-serial: replace DeviceOutVendor/DeviceInVendor with equivalent
    macros from usb.h
  dev-serial: add always-plugged property to ensure USB device is always
    attached
  dev-serial: add support for setting data_bits in QEMUSerialSetParams
  dev-serial: store flow control and xon/xoff characters

 hw/usb/dev-serial.c | 334 +++++++++++++++++++++++++++-----------------
 hw/usb/trace-events |  13 ++
 2 files changed, 216 insertions(+), 131 deletions(-)

-- 
2.20.1


