Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BCF2836AC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 15:36:27 +0200 (CEST)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPQfC-000235-A1
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 09:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kPQde-0000wY-PL
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 09:34:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35408
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kPQdc-00064Y-MA
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 09:34:50 -0400
Received: from host86-184-131-21.range86-184.btcentralplus.com
 ([86.184.131.21] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kPQdV-0001q8-4G; Mon, 05 Oct 2020 14:34:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Date: Mon,  5 Oct 2020 14:34:34 +0100
Message-Id: <20201005133434.12614-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.131.21
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] configure: don't enable ASLR for --enable-debug Windows builds
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

Unlike other OSs it is not possible for gdb to temporarily disable ASLR when
debugging executables on Windows which causes gdb to fail with memory access
errors when trying to debug QEMU.

Keep ASLR enabled by default on Windows via the --dynamicbase compiler flag
except for --enable-debug builds when there is a clear expectation that a
functioning gdb is expected at the cost of slightly less security.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 configure | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index f46f433649..a3de75b9f8 100755
--- a/configure
+++ b/configure
@@ -6144,7 +6144,14 @@ fi
 
 # Use ASLR, no-SEH and DEP if available
 if test "$mingw32" = "yes" ; then
-    for flag in --dynamicbase --no-seh --nxcompat; do
+    flags="--no-seh --nxcompat"
+
+    # Disable ASLR for debug builds to allow debugging with gdb
+    if test "$debug" = "no" ; then
+        flags="--dynamicbase $flags"
+    fi
+
+    for flag in $flags; do
         if ld_has $flag ; then
             QEMU_LDFLAGS="-Wl,$flag $QEMU_LDFLAGS"
         fi
-- 
2.20.1


