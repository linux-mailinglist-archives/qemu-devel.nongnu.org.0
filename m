Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14D58ECBB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:04:43 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlO5-0000cV-TW
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl9F-0001TA-PV
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl9E-0007Qg-AY
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ8uwmvbN+N0hbjJdePDsMSmyYDI/eQHq0gIKAefHZA=;
 b=QkEhQt6yUUqMIIghnMKrQ12foMNIf9DZx92umeibMulU97Q1W0Xuy/kNievkHR/oFwnE0P
 T3CKDt75ReuUWVEom67KhZTlMgIsLhGf6ZhTr81rbNXvnAeUUXKNjRpogeCJb3VZmdBREj
 1VpY4kNHs8A2eeqLEyhzEoqfoda76Gc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-vTE-6rS1N7KIhdKqfWAl9Q-1; Wed, 10 Aug 2022 08:49:18 -0400
X-MC-Unique: vTE-6rS1N7KIhdKqfWAl9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D98805B9A;
 Wed, 10 Aug 2022 12:49:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C64182166B2A;
 Wed, 10 Aug 2022 12:49:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 03/16] error-report: simplify print_loc()
Date: Wed, 10 Aug 2022 16:48:44 +0400
Message-Id: <20220810124857.1360211-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Pass the program name as "prefix" argument to print_loc() if printing
with "details". This allows to get rid of monitor_cur() call in
print_loc().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 util/error-report.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/error-report.c b/util/error-report.c
index 893da10f19..c43227a975 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -138,14 +138,14 @@ void loc_set_file(const char *fname, int lno)
 /*
  * Print current location to current monitor if we have one, else to stderr.
  */
-static void print_loc(void)
+static void print_loc(const char *prefix)
 {
     const char *sep = "";
     int i;
     const char *const *argp;
 
-    if (!monitor_cur() && g_get_prgname()) {
-        error_printf("%s:", g_get_prgname());
+    if (prefix) {
+        error_printf("%s:", prefix);
         sep = " ";
     }
     switch (cur_loc->kind) {
@@ -209,7 +209,7 @@ static void vreport(report_type type, const char *fmt, va_list ap)
         error_printf("%s ", error_guest_name);
     }
 
-    print_loc();
+    print_loc(detailed ? g_get_prgname() : NULL);
 
     switch (type) {
     case REPORT_TYPE_ERROR:
-- 
2.37.1


