Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15120B2DF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 15:49:39 +0200 (CEST)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jooja-0007FH-GV
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 09:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jolSo-0008Bh-Sx
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:20:06 -0400
Received: from mail.ispras.ru ([83.149.199.84]:59376)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jolSn-0000AU-0e
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:20:06 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2DF9A4089EF0;
 Fri, 26 Jun 2020 10:20:03 +0000 (UTC)
Subject: [PATCH 04/13] iotests: update snapshot test for new output format
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jun 2020 13:20:02 +0300
Message-ID: <159316680291.10508.18200905213455758659.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159316678008.10508.6615172353109944370.stgit@pasha-ThinkPad-X280>
References: <159316678008.10508.6615172353109944370.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 06:19:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Jun 2020 09:41:37 -0400
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>

This patch updates iotests that verify qemu monitor output.
New output format for snapshot listing include ICOUNT column.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 0 files changed

diff --git a/tests/qemu-iotests/267.out b/tests/qemu-iotests/267.out
index 8dddb4baa4..c4f3d8dd33 100644
--- a/tests/qemu-iotests/267.out
+++ b/tests/qemu-iotests/267.out
@@ -33,8 +33,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -44,8 +44,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -69,8 +69,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -94,8 +94,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -105,8 +105,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -119,8 +119,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -134,8 +134,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
@@ -145,15 +145,15 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
 Internal snapshots on overlay:
 Snapshot list:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
-1         snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+1         snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 Internal snapshots on backing file:
 
 === -blockdev with NBD server on the backing file ===
@@ -166,17 +166,17 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 (qemu) info snapshots
 List of snapshots present on all disks:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 (qemu) loadvm snap0
 (qemu) quit
 
 Internal snapshots on overlay:
 Snapshot list:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
-1         snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+1         snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 Internal snapshots on backing file:
 Snapshot list:
-ID        TAG                 VM SIZE                DATE       VM CLOCK
-1         snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
+ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
+1         snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000           
 *** done


