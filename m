Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E149A30FB03
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:17:19 +0100 (CET)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jBu-00012t-Vf
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI4-0007Kd-1E
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHr-0005Jv-DI
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1spxRuGKADqe5kdWakopLr0Nmw7HaMMiS0jKdfdPYM=;
 b=XJaMUWGOcgS5kz/vs/xabBbr30rKaOS34fkfPJKrNdOFAVmlsY+opoxcUzOvg0wkZgfwQo
 HwNNj9x7elEh4uSQT46mTDCE2Paut7MSSA5DOg6i/4Gy2jCB40UnHfpx6V+IdgZYZI/2Ov
 S2/iFAUU/afeKIIfoC8pKmriEAJdyqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-xdhbw3yVPnyUcuGvySoIUQ-1; Thu, 04 Feb 2021 12:19:19 -0500
X-MC-Unique: xdhbw3yVPnyUcuGvySoIUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A408DBBEEC;
 Thu,  4 Feb 2021 17:19:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E90A60937;
 Thu,  4 Feb 2021 17:19:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/33] migration: push Error **errp into
 qemu_loadvm_state_setup()
Date: Thu,  4 Feb 2021 17:18:37 +0000
Message-Id: <20210204171907.901471-4-berrange@redhat.com>
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
 migration/savevm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 870199b629..f4ed14a230 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2490,7 +2490,7 @@ static int qemu_loadvm_state_header(QEMUFile *f, Error **errp)
     return 0;
 }
 
-static int qemu_loadvm_state_setup(QEMUFile *f)
+static int qemu_loadvm_state_setup(QEMUFile *f, Error **errp)
 {
     SaveStateEntry *se;
     int ret;
@@ -2509,7 +2509,7 @@ static int qemu_loadvm_state_setup(QEMUFile *f)
         ret = se->ops->load_setup(f, se->opaque);
         if (ret < 0) {
             qemu_file_set_error(f, ret);
-            error_report("Load state of device %s failed", se->idstr);
+            error_setg(errp, "Load state of device %s failed", se->idstr);
             return ret;
         }
     }
@@ -2656,8 +2656,7 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
         return -1;
     }
 
-    if (qemu_loadvm_state_setup(f) != 0) {
-        error_setg(errp, "Error %d while loading VM state", -EINVAL);
+    if (qemu_loadvm_state_setup(f, errp) < 0) {
         return -1;
     }
 
-- 
2.29.2


