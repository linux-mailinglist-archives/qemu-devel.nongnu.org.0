Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D632CB87F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:18:27 +0100 (CET)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOHK-0004Uy-SQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDI-0003jY-Gw
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCW-0003nj-Fo
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgVoL3H0l+Hb60P23cylHjQiDNUjrl2fQXiQK1fD/HM=;
 b=hRWwrJz0YQAhbTydW99wLijd5H8ib9NmAjsZocXcq8VEt2XZHtlh2e+7fY00GBJ1LRNRiE
 v/lFszkjDzReqVLca36AzU8h7VGRp/VTEq5vnHsKifZc5EjDP5L5ENUj6Jjf7nkgPUP6oN
 ljslOtQHkRt2IZA2vn/8qoU/krJ7lEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Nt_Q-bdnPXSNdIIRlDRYUg-1; Wed, 02 Dec 2020 03:09:21 -0500
X-MC-Unique: Nt_Q-bdnPXSNdIIRlDRYUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43F1080364D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 101B760854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 081/113] config-file: move -set implementation to vl.c
Date: Wed,  2 Dec 2020 03:08:17 -0500
Message-Id: <20201202080849.4125477-82-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We want to make it independent of QemuOpts.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/config-file.h |  1 -
 softmmu/vl.c               | 33 +++++++++++++++++++++++++++++++++
 util/qemu-config.c         | 33 ---------------------------------
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index d74f920152..29226107bd 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -8,7 +8,6 @@ QemuOpts *qemu_find_opts_singleton(const char *group);
 
 void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
-int qemu_set_option(const char *str);
 int qemu_global_option(const char *str);
 
 void qemu_config_write(FILE *fp);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 77ee044c42..7146fbe219 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2797,6 +2797,39 @@ static int qemu_read_default_config_file(void)
     return 0;
 }
 
+static int qemu_set_option(const char *str)
+{
+    Error *local_err = NULL;
+    char group[64], id[64], arg[64];
+    QemuOptsList *list;
+    QemuOpts *opts;
+    int rc, offset;
+
+    rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
+    if (rc < 3 || str[offset] != '=') {
+        error_report("can't parse: \"%s\"", str);
+        return -1;
+    }
+
+    list = qemu_find_opts(group);
+    if (list == NULL) {
+        return -1;
+    }
+
+    opts = qemu_opts_find(list, id);
+    if (!opts) {
+        error_report("there is no %s \"%s\" defined",
+                     list->name, id);
+        return -1;
+    }
+
+    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
+        error_report_err(local_err);
+        return -1;
+    }
+    return 0;
+}
+
 static void user_register_global_props(void)
 {
     qemu_opts_foreach(qemu_find_opts("global"),
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 660f47b005..725e3d7e4b 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -313,39 +313,6 @@ void qemu_add_opts(QemuOptsList *list)
     abort();
 }
 
-int qemu_set_option(const char *str)
-{
-    Error *local_err = NULL;
-    char group[64], id[64], arg[64];
-    QemuOptsList *list;
-    QemuOpts *opts;
-    int rc, offset;
-
-    rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
-    if (rc < 3 || str[offset] != '=') {
-        error_report("can't parse: \"%s\"", str);
-        return -1;
-    }
-
-    list = qemu_find_opts(group);
-    if (list == NULL) {
-        return -1;
-    }
-
-    opts = qemu_opts_find(list, id);
-    if (!opts) {
-        error_report("there is no %s \"%s\" defined",
-                     list->name, id);
-        return -1;
-    }
-
-    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
-        error_report_err(local_err);
-        return -1;
-    }
-    return 0;
-}
-
 struct ConfigWriteData {
     QemuOptsList *list;
     FILE *fp;
-- 
2.26.2



