Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2C533A32
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:46:09 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnai-0004Ly-Dg
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnKx-0004xs-Bo
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnKt-0007BO-BV
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653470986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWigOFJrlEduonZrYMWPYmu18zsnVV2tvQpOnvR3f4I=;
 b=f6Fa3AbsyDfr0eCccOc1Z/eB2aMo6qTBrqMlka2eya/KN1RuH5b+1lCBTFRJpVpO40LR1p
 ruzEj4UpHU5rioPHNgf7XWpz7Futnus5GJB2WIxTrzLujyujtUzLwlIUHiW2oI0Pjq1xfN
 dKBcGSKqY5zbOoo9WK1ncEfHLTQ22cU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-rgbySDAJNNSMtncTCqPFNg-1; Wed, 25 May 2022 05:29:43 -0400
X-MC-Unique: rgbySDAJNNSMtncTCqPFNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABC9B3C0218D;
 Wed, 25 May 2022 09:29:42 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 893951121320;
 Wed, 25 May 2022 09:29:41 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 1/4] qga: add guest-get-diskstats command for Linux guests
Date: Wed, 25 May 2022 12:29:35 +0300
Message-Id: <20220525092938.945611-2-kkostiuk@redhat.com>
In-Reply-To: <20220525092938.945611-1-kkostiuk@redhat.com>
References: <20220525092938.945611-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: luzhipeng <luzhipeng@cestc.cn>

Add a new 'guest-get-diskstats' command for report disk io statistics
for Linux guests. This can be useful for getting io flow or handling
IO fault, no need to enter guests.

Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
Message-Id: <20220520021935.676-1-luzhipeng@cestc.cn>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-posix.c | 123 +++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c |   6 +++
 qga/qapi-schema.json |  86 ++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 69f209af87..12b50b7124 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2783,6 +2783,122 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
     return info;
 }
 
+#define MAX_NAME_LEN 128
+static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
+{
+#ifdef CONFIG_LINUX
+    GuestDiskStatsInfoList *head = NULL, **tail = &head;
+    const char *diskstats = "/proc/diskstats";
+    FILE *fp;
+    size_t n;
+    char *line = NULL;
+
+    fp = fopen(diskstats, "r");
+    if (fp  == NULL) {
+        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
+        return NULL;
+    }
+
+    while (getline(&line, &n, fp) != -1) {
+        g_autofree GuestDiskStatsInfo *diskstatinfo = NULL;
+        g_autofree GuestDiskStats *diskstat = NULL;
+        char dev_name[MAX_NAME_LEN];
+        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;
+        unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;
+        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
+        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
+        unsigned int major, minor;
+        int i;
+
+        i = sscanf(line, "%u %u %s %lu %lu %lu"
+                   "%lu %lu %lu %lu %u %u %u %u"
+                   "%lu %lu %lu %u %lu %u",
+                   &major, &minor, dev_name,
+                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
+                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
+                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
+                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
+                   &fl_ios, &fl_ticks);
+
+        if (i < 7) {
+            continue;
+        }
+
+        diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
+        diskstatinfo->name = g_strdup(dev_name);
+        diskstatinfo->major = major;
+        diskstatinfo->minor = minor;
+
+        diskstat = g_new0(GuestDiskStats, 1);
+        if (i == 7) {
+            diskstat->has_read_ios = true;
+            diskstat->read_ios = rd_ios;
+            diskstat->has_read_sectors = true;
+            diskstat->read_sectors = rd_merges_or_rd_sec;
+            diskstat->has_write_ios = true;
+            diskstat->write_ios = rd_sec_or_wr_ios;
+            diskstat->has_write_sectors = true;
+            diskstat->write_sectors = rd_ticks_or_wr_sec;
+        }
+        if (i >= 14) {
+            diskstat->has_read_ios = true;
+            diskstat->read_ios = rd_ios;
+            diskstat->has_read_sectors = true;
+            diskstat->read_sectors = rd_sec_or_wr_ios;
+            diskstat->has_read_merges = true;
+            diskstat->read_merges = rd_merges_or_rd_sec;
+            diskstat->has_read_ticks = true;
+            diskstat->read_ticks = rd_ticks_or_wr_sec;
+            diskstat->has_write_ios = true;
+            diskstat->write_ios = wr_ios;
+            diskstat->has_write_sectors = true;
+            diskstat->write_sectors = wr_sec;
+            diskstat->has_write_merges = true;
+            diskstat->write_merges = wr_merges;
+            diskstat->has_write_ticks = true;
+            diskstat->write_ticks = wr_ticks;
+            diskstat->has_ios_pgr = true;
+            diskstat->ios_pgr = ios_pgr;
+            diskstat->has_total_ticks = true;
+            diskstat->total_ticks = tot_ticks;
+            diskstat->has_weight_ticks = true;
+            diskstat->weight_ticks = rq_ticks;
+        }
+        if (i >= 18) {
+            diskstat->has_discard_ios = true;
+            diskstat->discard_ios = dc_ios;
+            diskstat->has_discard_merges = true;
+            diskstat->discard_merges = dc_merges;
+            diskstat->has_discard_sectors = true;
+            diskstat->discard_sectors = dc_sec;
+            diskstat->has_discard_ticks = true;
+            diskstat->discard_ticks = dc_ticks;
+        }
+        if (i >= 20) {
+            diskstat->has_flush_ios = true;
+            diskstat->flush_ios = fl_ios;
+            diskstat->has_flush_ticks = true;
+            diskstat->flush_ticks = fl_ticks;
+        }
+
+        diskstatinfo->stats = g_steal_pointer(&diskstat);
+        QAPI_LIST_APPEND(tail, diskstatinfo);
+        diskstatinfo = NULL;
+    }
+    free(line);
+    fclose(fp);
+    return head;
+#else
+    g_debug("disk stats reporting available only for Linux");
+    return NULL;
+#endif
+}
+
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
+{
+    return guest_get_diskstats(errp);
+}
+
 #else /* defined(__linux__) */
 
 void qmp_guest_suspend_disk(Error **errp)
@@ -3131,6 +3247,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
     return NULL;
 }
 
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+
 #endif /* CONFIG_FSFREEZE */
 
 #if !defined(CONFIG_FSTRIM)
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index d56b5fd2a7..dcdeb76a68 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2532,3 +2532,9 @@ char *qga_get_host_name(Error **errp)
 
     return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
 }
+
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index f989597b0c..9fa20e791b 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1490,3 +1490,89 @@
 { 'command': 'guest-ssh-remove-authorized-keys',
   'data': { 'username': 'str', 'keys': ['str'] },
   'if': 'CONFIG_POSIX' }
+
+##
+# @GuestDiskStats:
+#
+# @read-sectors: sectors read
+#
+# @read-ios: reads completed successfully
+#
+# @read-merges: read requests merged
+#
+# @write-sectors: sectors written
+#
+# @write-ios: writes completed
+#
+# @write-merges: write requests merged
+#
+# @discard-sectors: sectors discarded
+#
+# @discard-ios: discards completed successfully
+#
+# @discard-merges: discard requests merged
+#
+# @flush-ios: flush requests completed successfully
+#
+# @read-ticks: time spent reading(ms)
+#
+# @write-ticks: time spent writing(ms)
+#
+# @discard-ticks: time spent discarding(ms)
+#
+# @flush-ticks: time spent flushing(ms)
+#
+# @ios-pgr: number of I/Os currently in flight
+#
+# @total-ticks: time spent doing I/Os (ms)
+#
+# @weight-ticks: weighted time spent doing I/Os since the last update of this field(ms)
+#
+# Since: 7.1
+##
+{ 'struct': 'GuestDiskStats',
+  'data': {'*read-sectors': 'uint64',
+           '*read-ios': 'uint64',
+           '*read-merges': 'uint64',
+           '*write-sectors': 'uint64',
+           '*write-ios': 'uint64',
+           '*write-merges': 'uint64',
+           '*discard-sectors': 'uint64',
+           '*discard-ios': 'uint64',
+           '*discard-merges': 'uint64',
+           '*flush-ios': 'uint64',
+           '*read-ticks': 'uint64',
+           '*write-ticks': 'uint64',
+           '*discard-ticks': 'uint64',
+           '*flush-ticks': 'uint64',
+           '*ios-pgr': 'uint64',
+           '*total-ticks': 'uint64',
+           '*weight-ticks': 'uint64'
+           } }
+
+##
+# @GuestDiskStatsInfo:
+#
+# @name disk name
+#
+# @major major device number of disk
+#
+# @minor minor device number of disk
+##
+{ 'struct': 'GuestDiskStatsInfo',
+  'data': {'name': 'str',
+           'major': 'uint64',
+           'minor': 'uint64',
+           'stats': 'GuestDiskStats' } }
+
+##
+# @guest-get-diskstats:
+#
+# Retrieve information about disk stats.
+# Returns: List of disk stats of guest.
+#
+# Since: 7.1
+##
+{ 'command': 'guest-get-diskstats',
+  'returns': ['GuestDiskStatsInfo']
+}
-- 
2.25.1


