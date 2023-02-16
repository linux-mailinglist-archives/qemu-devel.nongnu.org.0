Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FB699BE5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicI-0000CU-Nm; Thu, 16 Feb 2023 13:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicF-0000Ai-SI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:19 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicE-0005pB-4i
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:19 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 95F6A62A5F;
 Thu, 16 Feb 2023 21:04:13 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-RRJ4GSMB; Thu, 16 Feb 2023 21:04:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570652; bh=9iQwB6p2IbDsuTo7h2CcmdpXMTGTs8SrDPWPSs9O2Rs=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=rSUxGyLGADDw3+2tSh4QWmYtuNr+iSq71HRpPsnfbZlTVi4fBodVIXJyfZimXT2zW
 OJImaQiM3Am3LYP36EFXYk5oU7TMpfbIcwZXXwq596jhr2cK/YyELkOl5Qt+ryn/5f
 vtaqywZNtV7VQ4w4P8asErl3IgjLsRtEQ7LY4Avo=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 14/18] qapi/qdev.json: unite DEVICE_* event data into
 single structure
Date: Thu, 16 Feb 2023 21:03:52 +0300
Message-Id: <20230216180356.156832-15-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DEVICE_DELETED and DEVICE_UNPLUG_GUEST_ERROR has equal data, let's
refactor it to one structure. That also helps to add new events
consistently.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2708fb4e99..135cd81586 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -114,16 +114,37 @@
 { 'command': 'device_del', 'data': {'id': 'str'} }
 
 ##
-# @DEVICE_DELETED:
+# @DeviceAndPath:
 #
-# Emitted whenever the device removal completion is acknowledged by the guest.
-# At this point, it's safe to reuse the specified device ID. Device removal can
-# be initiated by the guest or by HMP/QMP commands.
+# In events we designate devices by both their ID (if the device has one)
+# and QOM path.
+#
+# Why we need ID? User specify ID in device_add command and in command line
+# and expects same identifier in the event data.
+#
+# Why we need QOM path? Some devices don't have ID and we still want to emit
+# events for them.
+#
+# So, we have a bit of redundancy, as QOM path for device that has ID is
+# always /machine/peripheral/ID. But that's hard to change keeping both
+# simple interface for most users and universality for the generic case.
 #
 # @device: the device's ID if it has one
 #
 # @path: the device's QOM path
 #
+# Since: 8.0
+##
+{ 'struct': 'DeviceAndPath',
+  'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_DELETED:
+#
+# Emitted whenever the device removal completion is acknowledged by the guest.
+# At this point, it's safe to reuse the specified device ID. Device removal can
+# be initiated by the guest or by HMP/QMP commands.
+#
 # Since: 1.5
 #
 # Example:
@@ -134,18 +155,13 @@
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
 #
 ##
-{ 'event': 'DEVICE_DELETED',
-  'data': { '*device': 'str', 'path': 'str' } }
+{ 'event': 'DEVICE_DELETED', 'data': 'DeviceAndPath' }
 
 ##
 # @DEVICE_UNPLUG_GUEST_ERROR:
 #
 # Emitted when a device hot unplug fails due to a guest reported error.
 #
-# @device: the device's ID if it has one
-#
-# @path: the device's QOM path
-#
 # Since: 6.2
 #
 # Example:
@@ -156,5 +172,4 @@
 #      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
 #
 ##
-{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
-  'data': { '*device': 'str', 'path': 'str' } }
+{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR', 'data': 'DeviceAndPath' }
-- 
2.34.1


