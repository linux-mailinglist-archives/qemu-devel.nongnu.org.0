Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82144350B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:03:29 +0100 (CET)
Received: from localhost ([::1]:59076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhy88-0008NT-WB
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2c-0008Lp-Cd
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2a-0006pG-C7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VKurEWH3KAL60hElA0PQUqjUhyiCNjOrLnesbiwSG0=;
 b=F02syGVMftJKp7QYWxHo/G980Dxqrozh8CMa3DhVNMiBtH1KypypfCXumzmLly88ZEjyGQ
 FyJxXFjBje0Zj3D96dz+mWpKZ+CrQFl1NMs+AZ2VbHywpXd2p2v4wJEFZiO5LeiM9/thT4
 5rS9dgRJ1tuagKYmed93YPyJlqZyZyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-k3by1EmJMju_7GVH7jkWmg-1; Tue, 02 Nov 2021 13:57:40 -0400
X-MC-Unique: k3by1EmJMju_7GVH7jkWmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC7D8066EB;
 Tue,  2 Nov 2021 17:57:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1762919C59;
 Tue,  2 Nov 2021 17:57:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] monitor: make hmp_handle_error return a boolean
Date: Tue,  2 Nov 2021 17:56:44 +0000
Message-Id: <20211102175700.1175996-3-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This turns the pattern

  if (err) {
     hmp_handle_error(mon, err);
     return;
  }

into

  if (hmp_handle_error(mon, err)) {
     return;
  }

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-hmp-cmds.c |  3 +--
 include/monitor/hmp.h      |  2 +-
 monitor/hmp-cmds.c         | 28 +++++++++++-----------------
 3 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 76b22b00d6..c356783ab9 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -53,8 +53,7 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
     HotpluggableCPUList *saved = l;
     CpuInstanceProperties *c;
 
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 6bc27639e0..a2cb002a3a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -16,7 +16,7 @@
 
 #include "qemu/readline.h"
 
-void hmp_handle_error(Monitor *mon, Error *err);
+bool hmp_handle_error(Monitor *mon, Error *err);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..9031cea881 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -62,11 +62,13 @@
 #include <spice/enums.h>
 #endif
 
-void hmp_handle_error(Monitor *mon, Error *err)
+bool hmp_handle_error(Monitor *mon, Error *err)
 {
     if (err) {
         error_reportf_err(err, "Error: ");
+        return true;
     }
+    return false;
 }
 
 /*
@@ -577,8 +579,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
 
     info2l = qmp_query_vnc_servers(&err);
     info2l_head = info2l;
-    if (err) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
     if (!info2l) {
@@ -693,8 +694,7 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     info = qmp_query_balloon(&err);
-    if (err) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
@@ -1065,8 +1065,7 @@ void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
     int i;
 
     data = qmp_ringbuf_read(chardev, size, false, 0, &err);
-    if (err) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
@@ -1582,8 +1581,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
 
     qmp_migrate(uri, !!blk, blk, !!inc, inc,
                 false, false, true, resume, &err);
-    if (err) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
@@ -1917,8 +1915,7 @@ void hmp_rocker(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     rocker = qmp_query_rocker(name, &err);
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
@@ -1936,8 +1933,7 @@ void hmp_rocker_ports(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     list = qmp_query_rocker_ports(name, &err);
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
@@ -1965,8 +1961,7 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     list = qmp_query_rocker_of_dpa_flows(name, tbl_id != -1, tbl_id, &err);
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
@@ -2115,8 +2110,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     list = qmp_query_rocker_of_dpa_groups(name, type != 9, type, &err);
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
+    if (hmp_handle_error(mon, err)) {
         return;
     }
 
-- 
2.31.1


