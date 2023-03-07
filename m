Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F066AE5EA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:07:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZpC-0005RX-9n; Tue, 07 Mar 2023 11:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZZp8-0005QY-Sa
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:05:58 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZZp6-0002Sd-Dv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:05:58 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:5da4:0:640:ef2d:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 64D545E6F0;
 Tue,  7 Mar 2023 19:05:49 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:1223::1:36])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id d5eRk00OeKo0-LmDxUi1q; Tue, 07 Mar 2023 19:05:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1678205148; bh=9iQwB6p2IbDsuTo7h2CcmdpXMTGTs8SrDPWPSs9O2Rs=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=TiovxLva4MACCepU+GkKOZwHh4TJytWdbA7YqzGvMGrTXo6UgMnP0TbWJ49OXbFH7
 X1PKFcsYBL/vX4V3XHRdlBwY55QHM9OlJyNxiUg2fToVd96z7wZRylGj3lh8hwxpIv
 uei40+xEufqJKru6sRNgyr2GYFObhLPuTHdymvhg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 vsementsov@yandex-team.ru, philmd@linaro.org
Subject: [PATCH v6 1/4] qapi/qdev.json: unite DEVICE_* event data into single
 structure
Date: Tue,  7 Mar 2023 19:05:34 +0300
Message-Id: <20230307160537.2261803-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
References: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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


