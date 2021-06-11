Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFC3A46EE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:46:57 +0200 (CEST)
Received: from localhost ([::1]:37816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkJ6-0000gj-Mr
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrkG0-0006Bt-As
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrkFv-00070O-5p
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623429818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vXrg9bWrXOeemMuOuF1laxRROZeJKOxXvil3sYZfToo=;
 b=OpUEYr1kyw3iu6xWyxc3mRlHotymIxNevTn9xbn9jDPKA1oNiQ4JScx31ICTeFNO0fBoWq
 8ubfggFs+UdcYCebmNt52ccUNdLmt/b2iUCM1+Ek02/oCmVEfMaWcFP5nLWdCRnR2OIbwP
 5mKfb3NJwyTFtlz6ywSs7JDl7MG7vG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-aH8KYN3WO0OKxdeCY25OcQ-1; Fri, 11 Jun 2021 12:43:36 -0400
X-MC-Unique: aH8KYN3WO0OKxdeCY25OcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0158030A0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:43:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-90.ams2.redhat.com
 [10.36.115.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE01D1001281;
 Fri, 11 Jun 2021 16:43:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtiofsd: use GDateTime for formatting timestamp for
 debug messages
Date: Fri, 11 Jun 2021 17:43:20 +0100
Message-Id: <20210611164319.67762-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Localtime is changed to UTC to avoid the need to grant extra seccomp
permissions for GLib's access of the timezone database.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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


