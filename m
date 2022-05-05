Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D151C21C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:15:43 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmcGc-00080V-Jh
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1nmbkA-0008JH-V2
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:42:10 -0400
Received: from [106.39.185.57] (port=34554 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1nmbk7-00065D-V2
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:42:10 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id BDEE1100002DD;
 Thu,  5 May 2022 21:36:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.48.58.11])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P3903393T281471033667952S1651757786582272_; 
 Thu, 05 May 2022 21:36:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <58d55bcc99ca36d420acc50f2ab56cdf>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 4
X-SENDER-IP: 111.48.58.11
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: michael.roth@amd.com, Konstantin Kostiuk <kkostiuk@redhat.com>,
 luzhipeng <luzhipeng@cestc.cn>
Subject: [PATCH] qga: add guest-get-diskstats command
Date: Thu,  5 May 2022 21:36:08 +0800
Message-Id: <20220505133608.146-1-luzhipeng@cestc.cn>
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
X-Mailman-Approved-At: Thu, 05 May 2022 10:13:16 -0400
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
of the guest. This can be usefull for handling IO fault, no need to enter
guest os.

Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
---
 qga/commands-posix.c | 94 ++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c |  6 +++
 qga/qapi-schema.json | 86 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 69f209af87..2b96c9ae6e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2783,6 +2783,93 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
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
+    char dev_name[MAX_NAME_LEN];
+    int i;
+    unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;
+    unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;
+    unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
+    unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
+    unsigned int major, minor;
+
+    fp = fopen(diskstats, "r");
+    if (fp  == NULL) {
+        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
+        return NULL;
+    }
+    while (getline(&line, &n, fp) != -1) {
+        i = sscanf(line, "%u %u %s %lu %lu %lu"
+                   "%lu %lu %lu %lu %u %u %u %u"
+                   "%lu %lu %lu %u %lu %u",
+                  &major, &minor, dev_name,
+                  &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
+                  &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
+                  &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
+                  &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
+                  &fl_ios, &fl_ticks);
+        GuestDiskStatsInfo *diskstatinfo = g_malloc0(sizeof *diskstatinfo);
+        GuestDiskStats *diskstat = g_malloc0(sizeof *diskstat);
+        if (i >= 14) {
+            diskstatinfo->name = g_strdup(dev_name);
+            diskstatinfo->major = major;
+            diskstatinfo->minor = minor;
+            diskstat->rd_ios = rd_ios;
+            diskstat->rd_merges = rd_merges_or_rd_sec;
+            diskstat->rd_sectors = rd_sec_or_wr_ios;
+            diskstat->rd_ticks = rd_ticks_or_wr_sec;
+            diskstat->wr_ios = wr_ios;
+            diskstat->wr_merges = wr_merges;
+            diskstat->wr_sectors = wr_sec;
+            diskstat->wr_ticks = wr_ticks;
+            diskstat->ios_pgr = ios_pgr;
+            diskstat->tot_ticks = tot_ticks;
+            diskstat->rq_ticks = rq_ticks;
+            if (i >= 18) {
+                diskstat->dc_ios = dc_ios;
+                diskstat->dc_merges = dc_merges;
+                diskstat->dc_sectors = dc_sec;
+                diskstat->dc_ticks = dc_ticks;
+            }
+            if (i >= 20) {
+                diskstat->fl_ios = fl_ios;
+                diskstat->fl_ticks = fl_ticks;
+            }
+            diskstatinfo->stats = diskstat;
+            QAPI_LIST_APPEND(tail, diskstatinfo);
+        } else if (i == 7) {
+            diskstatinfo->name = g_strdup(dev_name);
+            diskstatinfo->major = major;
+            diskstatinfo->minor = minor;
+            diskstat->rd_ios = rd_ios;
+            diskstat->rd_sectors = rd_merges_or_rd_sec;
+            diskstat->wr_ios = rd_sec_or_wr_ios;
+            diskstat->wr_sectors = rd_ticks_or_wr_sec;
+        } else {
+            g_free(diskstat);
+            g_free(diskstatinfo);
+        }
+    }
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
@@ -3131,6 +3218,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
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
index 4d8e506c9e..ec48629476 100644
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
+# @rd-sectors: of sectors read
+#
+# @wr-sectors: of sectors write
+#
+# @dc-sectors: of sectors discard
+#
+# @rd-ios: of read operations issued to the device
+#
+# @rd-merges: of read requests merged
+#
+# @wr-ios: of write operations issued to the device
+#
+# @wr-merges: of write requests merged
+#
+# @dc-ios: of discard operations issued to the device
+#
+# @dc-merges: of discard requests merged
+#
+# @fl-ios: of flush requests issued to the device
+#
+# @rd-ticks: Time of read requests in queue
+#
+# @wr-ticks: Time of write requests in queue
+#
+# @dc-ticks: Time of discard requests in queue
+#
+# @fl-ticks: Time of flush requests in queue
+#
+# @ios-pgr: of I/Os in progress
+#
+# @tot-ticks: of ticks total (for this device) for I/O
+#
+# @rq-ticks: of ticks requests spent in queue
+#
+# Since: 7.1
+##
+{ 'struct': 'GuestDiskStats',
+  'data': {'rd-sectors': 'uint64',
+            'wr-sectors': 'uint64',
+            'dc-sectors': 'uint64',
+            'rd-ios': 'uint64',
+            'rd-merges': 'uint64',
+            'wr-ios': 'uint64',
+            'wr-merges': 'uint64',
+            'dc-ios': 'uint64',
+            'dc-merges': 'uint64',
+            'fl-ios': 'uint64',
+            'rd-ticks': 'uint64',
+            'wr-ticks': 'uint64',
+            'dc-ticks': 'uint64',
+            'fl-ticks': 'uint64',
+            'ios-pgr': 'uint64',
+            'tot-ticks': 'uint64',
+            'rq-ticks': 'uint64'
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
+# Retrieve information about disk io.
+# Returns: List of disk stats of guest.
+#
+# Since: 7.1
+##
+{ 'command': 'guest-get-diskstats',
+  'returns': ['GuestDiskStatsInfo']
+}
-- 
2.18.2




