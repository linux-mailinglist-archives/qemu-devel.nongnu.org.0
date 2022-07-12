Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BB45715F4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:42:27 +0200 (CEST)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCPS-0003M8-3y
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJL-0005Yn-Rd
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJJ-0007JG-VM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/MaKWOw9mwRiSAv5OIby/ogCfM8Tj/+vc4r0Ph5fLA=;
 b=BiAra7xBWzKC+Te+1nVTTz0YRMzaonxvnlEHJdqLRbCRiFE8taXJKcMc+F6NoRbk9Uap6p
 I/dAwBpEM1Xg+hAuVO5rIvejdXNgSUdaGVS2y2AgQFUY3OMmH62Gu8yQyKfNbpy7xC+yIP
 aoRfBg26sx6Zyc0qG6jDU2iK5ezf6zc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-IRRLzPbUP_GD-ZNhdW3HEQ-1; Tue, 12 Jul 2022 05:35:55 -0400
X-MC-Unique: IRRLzPbUP_GD-ZNhdW3HEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C80BF185A7A4;
 Tue, 12 Jul 2022 09:35:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C1A40D2827;
 Tue, 12 Jul 2022 09:35:53 +0000 (UTC)
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
Subject: [PATCH v2 03/15] error-report: simplify print_loc()
Date: Tue, 12 Jul 2022 13:35:16 +0400
Message-Id: <20220712093528.4144184-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Pass the program name as "prefix" argument to print_loc() if printing
with "details". This allows to get rid of monitor_cur() call in
print_loc().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 util/error-report.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/error-report.c b/util/error-report.c
index 893da10f19bc..c43227a975e2 100644
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
2.37.0.rc0


