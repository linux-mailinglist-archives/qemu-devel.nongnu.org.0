Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270FA64EC64
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:55:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BAs-0008DV-5r; Fri, 16 Dec 2022 08:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAp-0008Cr-VQ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAo-0007lT-7c
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amyO5A6TAVza9yGkm738fnrgpxj9PU3x4Ey/E0znrcc=;
 b=YMM6p2z/NSPEzbb14KitlFV/mSAct9uCSVMmK82rx8fP3q75yHuWtdP/+GAgnmOZFaLAHh
 7+/8MHGzJRV1h3YNx98WncUniwXTYJtF3m3UwDjyT3BoM4kV/aLYeWkK/QPVu+Ki7u1QmI
 FYaKNZxMwekxC2GPhd+TxrKn+MTCa/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-Jr6egCfdPvG8vbYR2gAqQw-1; Fri, 16 Dec 2022 08:54:46 -0500
X-MC-Unique: Jr6egCfdPvG8vbYR2gAqQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F249A802C1C;
 Fri, 16 Dec 2022 13:54:45 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0177440C2064;
 Fri, 16 Dec 2022 13:54:44 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 2/8] qga: Add ZFS TRIM support for FreeBSD
Date: Fri, 16 Dec 2022 15:54:33 +0200
Message-Id: <20221216135439.465033-3-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
References: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

Use zpool tool for ZFS pools trimming in FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-bsd.c    | 109 ++++++++++++++++++++++++++++++++++++++++++
 qga/commands-common.h |   1 +
 2 files changed, 110 insertions(+)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index 15cade2d4c..960c4209e5 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -170,6 +170,115 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
 }
 #endif /* CONFIG_FSFREEZE */
 
+#if defined(CONFIG_FSTRIM)
+typedef struct FsPool {
+    char *name;
+    QTAILQ_ENTRY(FsPool) next;
+} FsPool;
+
+typedef QTAILQ_HEAD(FsPoolList, FsPool) FsPoolList;
+
+static void build_fs_pool_list(FsPoolList *pools, Error **errp)
+{
+    FILE *fp;
+    char *line = NULL, *p;
+    size_t linecap = 0;
+    ssize_t linelen;
+    FsPool *pool;
+
+    fp = popen("/sbin/zpool list -H", "r");
+    if (fp == NULL) {
+        error_setg_errno(errp, errno, "failed to run zpool");
+        return;
+    }
+
+    while ((linelen = getline(&line, &linecap, fp)) > 0) {
+        p = strchr(line, '\t');
+        if (!p) {
+            continue;
+        }
+
+        *p = '\0';
+
+        pool = g_new0(FsPool, 1);
+        pool->name = g_strdup(line);
+        QTAILQ_INSERT_TAIL(pools, pool, next);
+    }
+
+    free(line);
+    pclose(fp);
+}
+
+static void free_fs_pool_list(FsPoolList *pools)
+{
+    FsPool *pool, *temp;
+
+    if (!pools) {
+        return;
+    }
+
+    QTAILQ_FOREACH_SAFE(pool, pools, next, temp) {
+        QTAILQ_REMOVE(pools, pool, next);
+        g_free(pool->name);
+        g_free(pool);
+    }
+}
+
+/*
+ * Walk the list of ZFS pools in the guest, and trim them.
+ */
+GuestFilesystemTrimResponse *
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
+{
+    GuestFilesystemTrimResponse *response;
+    GuestFilesystemTrimResultList *list;
+    GuestFilesystemTrimResult *result;
+    int ret;
+    FsPoolList pools;
+    FsPool *pool;
+    char cmd[256];
+    Error *local_err = NULL;
+
+    slog("guest-fstrim called");
+
+    QTAILQ_INIT(&pools);
+    build_fs_pool_list(&pools, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    response = g_malloc0(sizeof(*response));
+
+    QTAILQ_FOREACH(pool, &pools, next) {
+        result = g_malloc0(sizeof(*result));
+        result->path = g_strdup(pool->name);
+
+        list = g_malloc0(sizeof(*list));
+        list->value = result;
+        list->next = response->paths;
+        response->paths = list;
+
+        snprintf(cmd, sizeof(cmd), "/sbin/zpool trim %s", pool->name);
+        ret = system(cmd);
+        if (ret != 0) {
+            result->error = g_strdup_printf("failed to trim %s: %s",
+                                            pool->name, strerror(errno));
+            result->has_error = true;
+            continue;
+        }
+
+        result->has_minimum = true;
+        result->minimum = 0;
+        result->has_trimmed = true;
+        result->trimmed = 0;
+    }
+
+    free_fs_pool_list(&pools);
+    return response;
+}
+#endif /* CONFIG_FSTRIM */
+
 #ifdef HAVE_GETIFADDRS
 /*
  * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
diff --git a/qga/commands-common.h b/qga/commands-common.h
index 8c1c56aac9..922f9c479b 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -28,6 +28,7 @@
 #ifdef UFSSUSPEND
 #define CONFIG_FSFREEZE
 #endif
+#define CONFIG_FSTRIM
 #endif /* __FreeBSD__ */
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
-- 
2.25.1


