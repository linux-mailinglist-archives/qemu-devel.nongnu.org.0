Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6E33E23D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:39:03 +0100 (CET)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJHC-0002Ar-GX
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMJ9O-00029t-DV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:30:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33364
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMJ9M-0007BX-IS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:30:58 -0400
Received: from host109-156-104-46.range109-156.btcentralplus.com
 ([109.156.104.46] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMJ9J-0006Mg-5z; Tue, 16 Mar 2021 23:30:59 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	alxndr@bu.edu
Date: Tue, 16 Mar 2021 23:30:20 +0000
Message-Id: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.156.104.46
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/4] esp: fix asserts/segfaults discovered by fuzzer
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

Recently there have been a number of issues raised on Launchpad as a result of
fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
days checking to see if anything had improved since my last patchset: from
what I can tell the issues are still present, but the cmdfifo related failures
now assert rather than corrupting memory.

This patchset applied to master passes my local tests using the qtest fuzz test
cases added by Alexander for the following Launchpad bugs:

  https://bugs.launchpad.net/qemu/+bug/1919035
  https://bugs.launchpad.net/qemu/+bug/1919036
  https://bugs.launchpad.net/qemu/+bug/1910723
  https://bugs.launchpad.net/qemu/+bug/1909247
  
I'm posting this now just before soft freeze since I see that some of the issues
have recently been allocated CVEs and so it could be argued that even though
they have existed for some time, it is worth fixing them for 6.0.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (4):
  esp: don't underflow cmdfifo if no message out/command data is present
  esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
  esp: ensure cmdfifo is not empty and current_dev is non-NULL
  esp: always check current_req is not NULL before use in DMA callbacks

 hw/scsi/esp.c | 56 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
2.20.1


