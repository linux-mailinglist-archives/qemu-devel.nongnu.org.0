Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFB4EDA27
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:04:36 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZuTb-0002MO-2w
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:04:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nZny6-0005ju-CD
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:07:38 -0400
Received: from [2603:8080:1600:e3d:e59c:c4a8:be1c:3c63] (port=44908
 helo=geekhouse)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nZny4-0000F7-MH
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:07:37 -0400
Received: from geekhouse (localhost [127.0.0.1])
 by geekhouse (8.15.2/8.15.2/Debian-10) with ESMTP id 22V5ukhT026096;
 Thu, 31 Mar 2022 00:56:47 -0500
Received: (from sk@localhost)
 by geekhouse (8.15.2/8.15.2/Submit) id 22V5ukCi026085;
 Thu, 31 Mar 2022 00:56:46 -0500
From: Sakshi Kaushik <sakshikaushik717@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] [PATCH RFC v1] Implements the Backend Program conventions for
 vhost-user-scsi
Date: Thu, 31 Mar 2022 00:55:36 -0500
Message-Id: <20220331055536.26038-1-sakshikaushik717@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2603:8080:1600:e3d:e59c:c4a8:be1c:3c63 (failed)
Received-SPF: none client-ip=2603:8080:1600:e3d:e59c:c4a8:be1c:3c63;
 envelope-from=sk@geekhouse; helo=geekhouse
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 FSL_HELO_NON_FQDN_1=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RDNS_NONE=0.793, SPF_NONE=0.001,
 SPOOFED_FREEMAIL=1.522, SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.799,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 31 Mar 2022 09:02:41 -0400
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
Cc: Sakshi Kaushik <sakshikaushik717@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
---
 docs/interop/vhost-user.json | 31 +++++++++++++++++++++++++++++++
 docs/interop/vhost-user.rst  | 17 +++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index b6ade9e493..daf6a7c48e 100644
--- a/docs/interop/vhost-user.json
+++ b/docs/interop/vhost-user.json
@@ -88,6 +88,37 @@
   }
 }
 
+##
+# @VHostUserBackendSCSIFeature:
+#
+# List of vhost user "scsi" features.
+#
+# @read-only: The --read-only command line option is supported.
+# @scsi-file: The --scsi-file command line option is supported.
+#
+# Since: 5.0
+##
+{
+  'enum': 'VHostUserBackendSCSIFeature',
+  'data': [ 'read-only', 'scsi-file' ]
+}
+
+##
+# @VHostUserBackendCapabilitiesSCSI:
+#
+# Capabilities reported by vhost user "scsi" backends
+#
+# @features: list of supported features.
+#
+# Since: 5.0
+##
+{
+  'struct': 'VHostUserBackendCapabilitiesSCSI',
+  'data': {
+    'features': [ 'VHostUserBackendSCSIFeature' ]
+  }
+}
+
 ##
 # @VHostUserBackendInputFeature:
 #
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 4dbc84fd00..6f6467ede8 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1603,3 +1603,20 @@ Command line options:
   Enable read-only.
 
   (optional)
+
+vhost-user-scsi
+--------------
+
+Command line options:
+
+--scsi-file=PATH
+
+  Specify block device or file path.
+
+  (optional)
+
+--read-only
+
+  Enable read-only.
+
+  (optional)
-- 
2.17.1


