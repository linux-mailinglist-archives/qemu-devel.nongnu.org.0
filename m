Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F66EA85B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppo4G-0007bc-Hc; Fri, 21 Apr 2023 06:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppo47-0007Tv-LR
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:32:35 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppo44-0005QF-At
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:32:31 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id BBE55600AE;
 Fri, 21 Apr 2023 13:32:21 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 8WcxnS1Op4Y0-uR1tnGGc; Fri, 21 Apr 2023 13:32:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682073140; bh=9iQwB6p2IbDsuTo7h2CcmdpXMTGTs8SrDPWPSs9O2Rs=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=dboSyYEkr7m79Kj+oCCCQBWw92APxlkQqQ4Wt96dETtNK9WMhjsHbXrLNIdBLMoEY
 bPJgmjUeEzFUtIFiO7nc+SSw1wWu0nzmhYNdMjtpXsuD6Uqj+Z/zbaEYzB0+naLCDj
 FnOKt7/z4t5zDO6LnuuYD0cSDmo+LE0GJWeFiGv0=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, philmd@linaro.org,
 antonkuchin@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v7 1/4] qapi/qdev.json: unite DEVICE_* event data into single
 structure
Date: Fri, 21 Apr 2023 13:32:04 +0300
Message-Id: <20230421103207.845847-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421103207.845847-1-vsementsov@yandex-team.ru>
References: <20230421103207.845847-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


