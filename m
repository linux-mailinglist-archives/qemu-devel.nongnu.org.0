Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51A30FB45
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:24:22 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jIj-00061N-M4
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIY-0007zw-No
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIP-0005gW-RU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PAMIFGXEZffGzCZZ4pKKkrTnrT0sfVqxuCXEAkrhyw=;
 b=Ir9oBIhcOkKf1fF5sVDmIBY9Be5/IuDe3FX52o0omJwp66P2hIMm6gmuGfE64hHlrwZoFS
 8YvsMKRxJx9fUKxf1YproUtUJF9hEujuYWpTVmKBa/Dl+i7p5GsDSBJ6zsn7+iIk1fLRCb
 vdwjpMvJmcrZsgDZhu4t28X4ERoMo2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-Om1uMpSCOsmYpvsWzN0oQg-1; Thu, 04 Feb 2021 12:19:55 -0500
X-MC-Unique: Om1uMpSCOsmYpvsWzN0oQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2B8107ACE3;
 Thu,  4 Feb 2021 17:19:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074E650E2F;
 Thu,  4 Feb 2021 17:19:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/33] migration: simplify some error reporting in
 save_snapshot()
Date: Thu,  4 Feb 2021 17:18:57 +0000
Message-Id: <20210204171907.901471-24-berrange@redhat.com>
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

Re-arrange code to remove need for a separate 'ret2' variable, accepting
the duplicated qemu_fclose() call as resulting in clearer code to follow
the flow of.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 23e4d5a1a2..fdf8b6edfb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2788,7 +2788,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 {
     BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1;
-    int ret = -1, ret2;
+    int ret = -1;
     QEMUFile *f;
     int saved_vm_running;
     uint64_t vm_state_size;
@@ -2818,11 +2818,11 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
                 return false;
             }
         } else {
-            ret2 = bdrv_all_has_snapshot(name, has_devices, devices, errp);
-            if (ret2 < 0) {
+            ret = bdrv_all_has_snapshot(name, has_devices, devices, errp);
+            if (ret < 0) {
                 return false;
             }
-            if (ret2 == 1) {
+            if (ret == 1) {
                 error_setg(errp,
                            "Snapshot '%s' already exists in one or more devices",
                            name);
@@ -2874,13 +2874,14 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     f = qemu_fopen_bdrv(bs, 1);
 
     ret = qemu_savevm_state(f, errp);
-    vm_state_size = qemu_ftell(f);
-    ret2 = qemu_fclose(f);
     if (ret < 0) {
+        qemu_fclose(f);
         goto the_end;
     }
-    if (ret2 < 0) {
-        ret = ret2;
+    vm_state_size = qemu_ftell(f);
+    ret = qemu_fclose(f);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to close vmstate file");
         goto the_end;
     }
 
-- 
2.29.2


