Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC23F20A2FC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 18:32:40 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUnn-0005Tu-PD
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 12:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1joUl1-0002jL-LM
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 12:29:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55551
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1joUkz-0002Tz-Pg
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 12:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593102584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9U7MZpedfnTjTu3sSF+WyTG3/6YQv3VnFsF74dLz3s=;
 b=aZApb+5R1fhSIfT+HnWIH7sokPj//Q36HzOHw8vQJAqOIyfXZlUrrZdtZN4THKollMd3QE
 1a1BkliyveUX7HcnXFNvfXlydflFwoZvxp1M4K2N4slRXprhUQykmd8Sgg8ycXZYCn1xPZ
 lO4h114pa4yvzJy/SjkuRU96rLaJHP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-O0udD3FNO3-Bc5L49pYJlw-1; Thu, 25 Jun 2020 12:29:42 -0400
X-MC-Unique: O0udD3FNO3-Bc5L49pYJlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47DF107ACCA
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 16:29:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-254.ams2.redhat.com
 [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9E0CA09BF;
 Thu, 25 Jun 2020 16:29:40 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com,
 vgoyal@redhat.com
Subject: [PATCH 3/3] virtiofsd: Allow addition or removal of capabilities
Date: Thu, 25 Jun 2020 17:29:29 +0100
Message-Id: <20200625162929.46672-4-dgilbert@redhat.com>
In-Reply-To: <20200625162929.46672-1-dgilbert@redhat.com>
References: <20200625162929.46672-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Allow capabilities to be added or removed from the allowed set for the
daemon; e.g.

default:
CapPrm: 00000000880000df
CapEff: 00000000880000df

-o modcaps=+sys_admin

CapPrm: 00000000882000df
CapEff: 00000000882000df

-o modcaps=+sys_admin:-chown

CapPrm: 00000000882000de
CapEff: 00000000882000de

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/tools/virtiofsd.rst         |  5 ++++
 tools/virtiofsd/helper.c         |  2 ++
 tools/virtiofsd/passthrough_ll.c | 50 ++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 378594c422..824e713491 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -54,6 +54,11 @@ Options
   * flock|no_flock -
     Enable/disable flock.  The default is ``no_flock``.
 
+  * modcaps=CAPLIST
+    Modify the list of capabilities allowed; CAPLIST is a colon separated
+    list of capabilities, each preceded by either + or -, e.g.
+    ''+sys_admin:-chown''.
+
   * log_level=LEVEL -
     Print only log messages matching LEVEL or more severe.  LEVEL is one of
     ``err``, ``warn``, ``info``, or ``debug``.  The default is ``info``.
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 00a1ef666a..3105b6c23a 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -174,6 +174,8 @@ void fuse_cmdline_help(void)
            "                               default: no_writeback\n"
            "    -o xattr|no_xattr          enable/disable xattr\n"
            "                               default: no_xattr\n"
+           "    -o modcaps=CAPLIST         Modify the list of capabilities\n"
+           "                               e.g. -o modcaps=+sys_admin:-chown\n"
            "    --rlimit-nofile=<num>      set maximum number of file descriptors\n"
            "                               (0 leaves rlimit unchanged)\n"
            "                               default: min(1000000, fs.file-max - 16384)\n"
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 99d562046a..9d2cbc70ca 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -145,6 +145,7 @@ struct lo_data {
     int posix_lock;
     int xattr;
     char *source;
+    char *modcaps;
     double timeout;
     int cache;
     int timeout_set;
@@ -170,6 +171,7 @@ static const struct fuse_opt lo_opts[] = {
     { "no_posix_lock", offsetof(struct lo_data, posix_lock), 0 },
     { "xattr", offsetof(struct lo_data, xattr), 1 },
     { "no_xattr", offsetof(struct lo_data, xattr), 0 },
+    { "modcaps=%s", offsetof(struct lo_data, modcaps), 0 },
     { "timeout=%lf", offsetof(struct lo_data, timeout), 0 },
     { "timeout=", offsetof(struct lo_data, timeout_set), 1 },
     { "cache=none", offsetof(struct lo_data, cache), CACHE_NONE },
@@ -2571,7 +2573,7 @@ static void setup_mounts(const char *source)
 /*
  * Only keep whitelisted capabilities that are needed for file system operation
  */
-static void setup_capabilities(void)
+static void setup_capabilities(struct lo_data *lo)
 {
     pthread_mutex_lock(&cap.mutex);
     capng_restore_state(&cap.saved);
@@ -2604,6 +2606,50 @@ static void setup_capabilities(void)
         exit(1);
     }
 
+    /*
+     * The modcaps option is a colon separated list of caps,
+     * each preceded by either + or -.
+     */
+    while (lo->modcaps) {
+        capng_act_t action;
+        int cap;
+
+        char *next = strchr(lo->modcaps, ':');
+        if (next) {
+            *next = '\0';
+            next++;
+        }
+
+        switch (lo->modcaps[0]) {
+        case '+':
+            action = CAPNG_ADD;
+            break;
+
+        case '-':
+            action = CAPNG_DROP;
+            break;
+
+        default:
+            fuse_log(FUSE_LOG_ERR,
+                     "%s: Expecting '+'/'-' in modcaps but found '%c'\n",
+                     __func__, lo->modcaps[0]);
+            exit(1);
+        }
+        cap = capng_name_to_capability(lo->modcaps + 1);
+        if (cap < 0) {
+            fuse_log(FUSE_LOG_ERR, "%s: Unknown capability '%s'\n", __func__,
+                     lo->modcaps);
+            exit(1);
+        }
+        if (capng_update(action, CAPNG_PERMITTED | CAPNG_EFFECTIVE, cap)) {
+            fuse_log(FUSE_LOG_ERR, "%s: capng_update failed for '%s'\n",
+                     __func__, lo->modcaps);
+            exit(1);
+        }
+
+        lo->modcaps = next;
+    }
+
     if (capng_apply(CAPNG_SELECT_BOTH)) {
         fuse_log(FUSE_LOG_ERR, "%s: capng_apply failed\n", __func__);
         exit(1);
@@ -2627,7 +2673,7 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
     setup_namespaces(lo, se);
     setup_mounts(lo->source);
     setup_seccomp(enable_syslog);
-    setup_capabilities();
+    setup_capabilities(lo);
 }
 
 /* Set the maximum number of open file descriptors */
-- 
2.26.2


