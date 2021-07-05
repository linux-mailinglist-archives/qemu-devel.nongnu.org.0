Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6D3BBAE9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:13:11 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LbC-00030c-3Y
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LS6-00012w-TN
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LS1-000186-3C
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoKhpUuiY+tW/MIokd2pOT+nKwF7gHjwHqcpMCtK4Mg=;
 b=RyLW/apNb1SAmVz+p++mSMMKk3L4xh+ZGHQmkLfcFzdvVgES4YnwPS9G503vfXo8SjXWcg
 o4oGYPGHdHxObgnXPVzTRY6gkDIqc2BlwXnMq5TrXV5ReZhawQ8RAHUqno82tzSCl4ZgaA
 Ea8rEIDHr4rocpH4tX2SgbTxYHZKwos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-9RLR5am3NFSqDbVEtl3Rxg-1; Mon, 05 Jul 2021 06:03:38 -0400
X-MC-Unique: 9RLR5am3NFSqDbVEtl3Rxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 292191835AC3;
 Mon,  5 Jul 2021 10:03:37 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C7A760C0F;
 Mon,  5 Jul 2021 10:03:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 07/19] virtiofsd: use GDateTime for formatting timestamp for
 debug messages
Date: Mon,  5 Jul 2021 11:02:23 +0100
Message-Id: <20210705100235.157093-8-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Localtime is changed to UTC to avoid the need to grant extra seccomp
permissions for GLib's access of the timezone database.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210611164319.67762-1-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 49c21fd855..9858e961d9 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3559,10 +3559,6 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
-    struct timespec ts;
-    struct tm tm;
-    char sec_fmt[sizeof "2020-12-07 18:17:54"];
-    char zone_fmt[sizeof "+0100"];
 
     if (current_log_level < level) {
         return;
@@ -3574,23 +3570,10 @@ static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
             localfmt = g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid),
                                        fmt);
         } else {
-            /* try formatting a broken-down timestamp */
-            if (clock_gettime(CLOCK_REALTIME, &ts) != -1 &&
-                localtime_r(&ts.tv_sec, &tm) != NULL &&
-                strftime(sec_fmt, sizeof sec_fmt, "%Y-%m-%d %H:%M:%S",
-                         &tm) != 0 &&
-                strftime(zone_fmt, sizeof zone_fmt, "%z", &tm) != 0) {
-                localfmt = g_strdup_printf("[%s.%02ld%s] [ID: %08ld] %s",
-                                           sec_fmt,
-                                           ts.tv_nsec / (10L * 1000 * 1000),
-                                           zone_fmt, syscall(__NR_gettid),
-                                           fmt);
-            } else {
-                /* fall back to a flat timestamp */
-                localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
-                                           get_clock(), syscall(__NR_gettid),
-                                           fmt);
-            }
+            g_autoptr(GDateTime) now = g_date_time_new_now_utc();
+            g_autofree char *nowstr = g_date_time_format(now, "%Y-%m-%d %H:%M:%S.%f%z");
+            localfmt = g_strdup_printf("[%s] [ID: %08ld] %s",
+                                       nowstr, syscall(__NR_gettid), fmt);
         }
         fmt = localfmt;
     }
-- 
2.31.1


