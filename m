Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D087364CE59
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:49:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu7-00050I-OQ; Wed, 14 Dec 2022 11:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu2-0004x5-0f
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu0-0002QH-GU
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdH16TsdXRbK4YU7eo/QTRkdyonpnoPKqNI8a3Y/UmM=;
 b=N+mIO34vsJDZKTQyS1gVbRYQUQE7TRQvauJnRJJewrqd9W9qmO37JXERBOA8k8ksukCUwO
 AB6YriSfolovcIOdl0DEkNpA2RvJcO0pqVcyc83i9D/2TUurDIyKNHplb2lK95Aycs+iKn
 KUVt8SJlYNHUxF8g8ipSmvt/o7BdhyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-27BM-bpcMY6K93GjuuG3vg-1; Wed, 14 Dec 2022 11:46:36 -0500
X-MC-Unique: 27BM-bpcMY6K93GjuuG3vg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB0AA1991C40;
 Wed, 14 Dec 2022 16:46:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E8B2026D68;
 Wed, 14 Dec 2022 16:46:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FD5721E6481; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 06/14] monitor: Use ERRP_GUARD() in monitor_init()
Date: Wed, 14 Dec 2022 17:46:21 +0100
Message-Id: <20221214164629.919880-7-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221121085054.683122-6-armbru@redhat.com>
---
 monitor/monitor.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 86949024f6..7ed7bd5342 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -711,8 +711,8 @@ void monitor_init_globals_core(void)
 
 int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
 {
+    ERRP_GUARD();
     Chardev *chr;
-    Error *local_err = NULL;
 
     chr = qemu_chr_find(opts->chardev);
     if (chr == NULL) {
@@ -726,7 +726,7 @@ int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
 
     switch (opts->mode) {
     case MONITOR_MODE_CONTROL:
-        monitor_init_qmp(chr, opts->pretty, &local_err);
+        monitor_init_qmp(chr, opts->pretty, errp);
         break;
     case MONITOR_MODE_READLINE:
         if (!allow_hmp) {
@@ -737,17 +737,13 @@ int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
             error_setg(errp, "'pretty' is not compatible with HMP monitors");
             return -1;
         }
-        monitor_init_hmp(chr, true, &local_err);
+        monitor_init_hmp(chr, true, errp);
         break;
     default:
         g_assert_not_reached();
     }
 
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-    return 0;
+    return *errp ? -1 : 0;
 }
 
 int monitor_init_opts(QemuOpts *opts, Error **errp)
-- 
2.37.3


