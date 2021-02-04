Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F3630FB1C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:19:31 +0100 (CET)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jE2-0005Uw-83
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI3-0007KA-Qu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHw-0005Kv-VX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4BAgbkThq9UKPe+0L3DH3cgmVZ8tj4HqG8Ncac36ro=;
 b=gqcyz1sNq2XgbdZ8Oz8ZVinl3/5KIZke/nOKxjrYimodYWGS7ECa7oQqn4PTQr67H72JKb
 ShSWSLrs4e6Af7eGNd6z/lzECoEZdZy1PF8oHgthOj0ILD6Z7iSH3mo1wFTLwuq4xi6NZp
 g3W9bAJgpREhUQjbtWGgrLF3tWHk9a0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-D3B4drhtOamJf_IInesgGA-1; Thu, 04 Feb 2021 12:19:25 -0500
X-MC-Unique: D3B4drhtOamJf_IInesgGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78DF2801979;
 Thu,  4 Feb 2021 17:19:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5540360937;
 Thu,  4 Feb 2021 17:19:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/33] migration: push Error **errp into
 qemu_loadvm_section_part_end()
Date: Thu,  4 Feb 2021 17:18:41 +0000
Message-Id: <20210204171907.901471-8-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an incremental step in converting vmstate loading code to report
via Error objects instead of printing directly to the console/monitor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index f2eee0a4a7..350d5a315a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2417,7 +2417,8 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis,
 }
 
 static int
-qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
+qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis,
+                             Error **errp)
 {
     uint32_t section_id;
     SaveStateEntry *se;
@@ -2427,9 +2428,9 @@ qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read section ID: %d",
-                     __func__, ret);
-        return ret;
+        error_setg(errp, "failed to read device state section end ID: %d",
+                   ret);
+        return -1;
     }
 
     trace_qemu_loadvm_state_section_partend(section_id);
@@ -2439,18 +2440,19 @@ qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
         }
     }
     if (se == NULL) {
-        error_report("Unknown savevm section %d", section_id);
-        return -EINVAL;
+        error_setg(errp, "unknown savevm section %d", section_id);
+        return -1;
     }
 
     ret = vmstate_load(f, se);
     if (ret < 0) {
-        error_report("error while loading state section id %d(%s)",
-                     section_id, se->idstr);
-        return ret;
+        error_setg(errp, "error while loading state section id %d(%s)",
+                   section_id, se->idstr);
+        return -1;
     }
     if (!check_section_footer(f, se)) {
-        return -EINVAL;
+        error_setg(errp, "failed check for device state section footer");
+        return -1;
     }
 
     return 0;
@@ -2610,10 +2612,8 @@ retry:
             break;
         case QEMU_VM_SECTION_PART:
         case QEMU_VM_SECTION_END:
-            ret = qemu_loadvm_section_part_end(f, mis);
+            ret = qemu_loadvm_section_part_end(f, mis, errp);
             if (ret < 0) {
-                error_setg(errp,
-                           "Failed to load device state section end: %d", ret);
                 goto out;
             }
             break;
-- 
2.29.2


