Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1509469479A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:04:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZPK-0006kK-Q1; Mon, 13 Feb 2023 09:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOq-0006eY-I0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:48 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOm-0005vj-9i
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:42 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id AA4B65E636;
 Mon, 13 Feb 2023 17:01:26 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-4G9UTDW8; Mon, 13 Feb 2023 17:01:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296885; bh=37xbgqgW/+R2nNL48ilUQ7NpTPizc85TuRqHPxwlIN4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=OHyGtT268MP4pcha6QmL9hUrlTsv8tPm1xol6eB/bhpdMRbBdkg4hOYf3oQaMcqti
 Mm8+BsSLt0IJ1a2ITDGdcK2QNhDuM44xbttnYOYDCAfCAvb/d9P+tLJAFUQprDrifp
 7WQjdXb+EY4xDQRG3eMrRmTx/gnjk4g8v9P9J3zs=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 libvir-list@redhat.com (reviewer:Incompatible changes)
Subject: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Date: Mon, 13 Feb 2023 17:01:01 +0300
Message-Id: <20230213140103.1518173-15-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
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

The device field is redundant, because QOM path always include device
ID when this ID exist.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 docs/about/deprecated.rst |  9 +++++++++
 qapi/qdev.json            | 12 ++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index da2e6fe63d..b389934691 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -171,6 +171,15 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
+QEMU Machine Protocol (QMP) events
+----------------------------------
+
+``DEVICE_DELETED`` & ``DEVICE_UNPLUG_GUEST_ERROR`` field ``device`` (since 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Devices that has ``ID`` always has QOM path `/machine/peripheral/ID`. So, the
+``device`` field is redundant and deprecated. Use the ``path`` field instead.
+
 Host Architectures
 ------------------
 
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2708fb4e99..325ef554f9 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -124,6 +124,9 @@
 #
 # @path: the device's QOM path
 #
+# Features:
+# @deprecated: Member @device is deprecated as redundant. Use @path instead.
+#
 # Since: 1.5
 #
 # Example:
@@ -135,7 +138,8 @@
 #
 ##
 { 'event': 'DEVICE_DELETED',
-  'data': { '*device': 'str', 'path': 'str' } }
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
+            'path': 'str' } }
 
 ##
 # @DEVICE_UNPLUG_GUEST_ERROR:
@@ -146,6 +150,9 @@
 #
 # @path: the device's QOM path
 #
+# Features:
+# @deprecated: Member @device is deprecated as redundant. Use @path instead.
+#
 # Since: 6.2
 #
 # Example:
@@ -157,4 +164,5 @@
 #
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
-  'data': { '*device': 'str', 'path': 'str' } }
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
+            'path': 'str' } }
-- 
2.34.1


