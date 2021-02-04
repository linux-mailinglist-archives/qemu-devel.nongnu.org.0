Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45730FAAC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:08:12 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7j35-0008Fk-LT
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIZ-00080G-QY
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIU-0005hl-B9
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mr8SLq8/bJm/LCm6RE96sfTtiFdrBDO8Fkq699jo0Tk=;
 b=Y1xPw+MH4fMbCD1KLmkzSH7sHKWLsU8RrAxMUzI0a0Mr4d65CluQhrxUIha6+NJ9cMdfCf
 28JE62v9Jam8jeMm/sCtvB1PzrwreQG9/WfPozQXf6KVziAKGF+88D01Cx4ZLTZ13HxMaL
 7znX/RO4lCV9Kb06/KzcGb7SkT02ZUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-JHXvTznyMduGG1_UN94bbQ-1; Thu, 04 Feb 2021 12:19:58 -0500
X-MC-Unique: JHXvTznyMduGG1_UN94bbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15DFA100C679;
 Thu,  4 Feb 2021 17:19:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4CC260DCC;
 Thu,  4 Feb 2021 17:19:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/33] migration: push Error **errp into
 qemu_savevm_state_complete_precopy()
Date: Thu,  4 Feb 2021 17:18:59 +0000
Message-Id: <20210204171907.901471-26-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 migration/savevm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 318ba547bc..3b46fbba32 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1329,7 +1329,8 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
 }
 
 static
-int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
+int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
+                                                Error **errp)
 {
     SaveStateEntry *se;
     int ret;
@@ -1355,6 +1356,8 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
         trace_savevm_section_end(se->idstr, se->section_id, ret);
         save_section_footer(f, se);
         if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "failed to complete precopy device state save");
             qemu_file_set_error(f, ret);
             return -1;
         }
@@ -1450,9 +1453,10 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
     cpu_synchronize_all_states();
 
     if (!in_postcopy || iterable_only) {
-        ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy);
-        if (ret) {
-            return ret;
+        if (qemu_savevm_state_complete_precopy_iterable(f, in_postcopy,
+                                                        &local_err) < 0) {
+            error_report_err(local_err);
+            return -1;
         }
     }
 
-- 
2.29.2


