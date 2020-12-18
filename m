Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11B2DE1C5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:08:41 +0100 (CET)
Received: from localhost ([::1]:39014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDcm-0001eR-39
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDD2-0003uX-Qn
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDD0-0004hA-SA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VmwrJVa0LdXm2ZqYsR6l+c6WdFBeD8tQoyo0gfaTpXI=;
 b=Wabi2s6Y3v10W0nGdseX1EYM1jzuTyQjWkFVJvWaRQaCkk0EJFA3ZbBUC6tC1q0suoEbuu
 HRcjOL/6JDEQl07eUiKs9P6cMqHPYyWi34QzbVlqiuLDh0Vufwz//mmRWdBVZN+Y8ItoYq
 M7rsGLUNpS42rl+6W3V+0dZdK2I0sHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-zf2wfl0bPwOCrU5c_r2K4w-1; Fri, 18 Dec 2020 05:42:00 -0500
X-MC-Unique: zf2wfl0bPwOCrU5c_r2K4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AECC759;
 Fri, 18 Dec 2020 10:41:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADF7A60C15;
 Fri, 18 Dec 2020 10:41:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 13/15] savevm: Remove dead code in save_snapshot()
Date: Fri, 18 Dec 2020 10:41:15 +0000
Message-Id: <20201218104117.199096-14-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tuguoyi <tu.guoyi@h3c.com>

The snapshot in each bs is deleted at the beginning, so there is no need
to find the snapshot again.

Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
Message-Id: <1607410416-13563-2-git-send-email-tu.guoyi@h3c.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 5f937a2762..601b5144b8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2728,7 +2728,7 @@ int qemu_load_device_state(QEMUFile *f)
 int save_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs, *bs1;
-    QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
+    QEMUSnapshotInfo sn1, *sn = &sn1;
     int ret = -1, ret2;
     QEMUFile *f;
     int saved_vm_running;
@@ -2797,13 +2797,7 @@ int save_snapshot(const char *name, Error **errp)
     }
 
     if (name) {
-        ret = bdrv_snapshot_find(bs, old_sn, name);
-        if (ret >= 0) {
-            pstrcpy(sn->name, sizeof(sn->name), old_sn->name);
-            pstrcpy(sn->id_str, sizeof(sn->id_str), old_sn->id_str);
-        } else {
-            pstrcpy(sn->name, sizeof(sn->name), name);
-        }
+        pstrcpy(sn->name, sizeof(sn->name), name);
     } else {
         /* cast below needed for OpenBSD where tv_sec is still 'long' */
         localtime_r((const time_t *)&tv.tv_sec, &tm);
-- 
2.29.2


