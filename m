Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F152D40F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:31:00 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgF2-0000qg-43
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1nrgCZ-0006wd-NO
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:28:27 -0400
Received: from [106.39.185.57] (port=51204 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1nrgCW-0005Ix-ES
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:28:27 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id E1B7C100002E0;
 Thu, 19 May 2022 21:28:06 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.48.58.11])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P3903393T281470731940208S1652966885511986_; 
 Thu, 19 May 2022 21:28:06 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <10ab1ce37dedf6aca7123a97516f473c>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 7
X-SENDER-IP: 111.48.58.11
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, luzhipeng <luzhipeng@cestc.cn>
Subject: [PATCH v4] qga: add guest-get-diskstats command for Linux guests
Date: Thu, 19 May 2022 21:27:45 +0800
Message-Id: <20220519132745.1724-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add a new 'guest-get-diskstats' command for report disk io statistics
for Linux guests. This can be useful for getting io flow or handling
IO fault, no need to enter guests.

Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
---
 Changes v3->v4: https://patchew.org/QEMU/20220515095437.1291-1-luzhipeng@cestc.cn/
 Changes v2->v3: bugfix for memory leak 
 Changes v1->v2: v1:https://patchew.org/QEMU/20220512011930.214-1-luzhipeng@cestc.cn/
 
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
B
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
index 4d8e506c9e..75d2bddf4b 100644
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
+# @write-sectors: sectors written
+#
+# @discard-sectors: sectors discarded
+#
+# @read-ios: reads completed successfully
+#
+# @read-merges: Number of read requests merged
+#
+# @write-ios: writes completed
+#
+# @write-merges: Number of write requests merged
+#
+# @discard-ios: Number of discards completed successfully
+#
+# @discard-merges: NUmber of discard requests merged
+#
+# @flush-ios: Number of flush requests completed successfully
+#
+# @read-ticks: time spent reading(ms)
+#
+# @write-ticks: time spent writing(ms)
+#
+# @discard-ticks: time spent discarding(ms)
+#
+# @flush-ticks: time spent flushing(ms)
+#
+# @ios-pgr: Number of I/Os currently in flight
+#
+# @total-ticks: time spent doing I/Os (ms)
+#
+# @weight-ticks: weighted time spent doing I/Os since the last update of this field(ms)
+#
+# Since: 7.1
+##
+{ 'struct': 'GuestDiskStats',
+  'data': {'*read-sectors': 'uint64',
+           '*write-sectors': 'uint64',
+           '*discard-sectors': 'uint64',
+           '*read-ios': 'uint64',
+           '*read-merges': 'uint64',
+           '*write-ios': 'uint64',
+           '*write-merges': 'uint64',
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
+# @major major of disk
+#
+# @minor minor of disk
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
2.31.1




