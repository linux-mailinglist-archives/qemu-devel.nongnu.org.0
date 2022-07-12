Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC075715F3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:42:26 +0200 (CEST)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCPQ-0003Le-KZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJM-0005ZP-7i
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJK-0007Gp-6S
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLG7pzYYdIpBU8lBmZPOqdZcw4LD0xxWf/VdLqmbweo=;
 b=ifCJOq7WVr0g6BKmglwaSyFA039pjRWmmAnc0VkkkODe3jTXilPQq5ixtCqlaaWLXFX6Bu
 I4V7V6VHQfPUpldgnyhG8EN1nwNTxICxflMoYD0fsGuZSpnGdcap/wqJMIHgOlrUjUUt5Q
 kda0Ablhbk/aQ5HZ4RuHAfEGG2LVny4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-vc7OhPtGMguSnYLY7tCPjQ-1; Tue, 12 Jul 2022 05:36:00 -0400
X-MC-Unique: vc7OhPtGMguSnYLY7tCPjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB5E3801F58;
 Tue, 12 Jul 2022 09:35:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B75B5C15D40;
 Tue, 12 Jul 2022 09:35:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 04/15] error-report: introduce overridable
 error_is_detailed()
Date: Tue, 12 Jul 2022 13:35:17 +0400
Message-Id: <20220712093528.4144184-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Remove the direct dependency from error-report to monitor code.
This will allow to move error-report to a subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/error-report.h | 2 ++
 softmmu/vl.c                | 5 +++++
 stubs/error-is-detailed.c   | 7 +++++++
 util/error-report.c         | 3 +--
 stubs/meson.build           | 1 +
 5 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 stubs/error-is-detailed.c

diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 3ae2357fda54..6ab25d458350 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -30,6 +30,8 @@ void loc_set_none(void);
 void loc_set_cmdline(char **argv, int idx, int cnt);
 void loc_set_file(const char *fname, int lno);
 
+bool error_is_detailed(void);
+
 int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3f264d4b0930..f94efc56e9d6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2589,6 +2589,11 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+bool error_is_detailed(void)
+{
+    return !monitor_cur();
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
diff --git a/stubs/error-is-detailed.c b/stubs/error-is-detailed.c
new file mode 100644
index 000000000000..c47cd236932f
--- /dev/null
+++ b/stubs/error-is-detailed.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+
+bool error_is_detailed(void)
+{
+    return TRUE;
+}
diff --git a/util/error-report.c b/util/error-report.c
index c43227a975e2..4d1d66fc0650 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "monitor/monitor.h"
 #include "qemu/error-report.h"
 
 /*
@@ -195,7 +194,7 @@ real_time_iso8601(void)
  */
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
-    bool detailed = !monitor_cur();
+    bool detailed = error_is_detailed();
     gchar *timestr;
 
     if (message_with_timestamp && detailed) {
diff --git a/stubs/meson.build b/stubs/meson.build
index d8f3fd5c44f2..0f3a782824f9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -9,6 +9,7 @@ stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('icount.c'))
 stub_ss.add(files('dump.c'))
+stub_ss.add(files('error-is-detailed.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
 stub_ss.add(files('gdbstub.c'))
-- 
2.37.0.rc0


