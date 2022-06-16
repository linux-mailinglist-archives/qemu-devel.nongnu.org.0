Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1E54E134
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:57:09 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1p3c-0001Yn-20
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooO-0001Cq-E7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1oo5-0005P7-N7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655383263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1o27EBUfNWT2QpBtPZu+Zc5UCpj4z+bwGHt6RXKOyfU=;
 b=BdWtmv09avGtKvJzZ7XECsu/Zi/SuNZshsMwURS4THsguWuHYsiZPvtvstB+ghEVnjuwuz
 6yClNDYaWlvWv8ywQY/FGqDiNd8drQCV5xTNYN1qy518wwP5VPgfTZRZEeaZGbFXdRiZki
 hp3LB3IEjtpRo7GfvJWu4BWwrff/DHs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-HahSN54VO6i1XBLDQsxNdQ-1; Thu, 16 Jun 2022 08:40:59 -0400
X-MC-Unique: HahSN54VO6i1XBLDQsxNdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDA771C1C1A9;
 Thu, 16 Jun 2022 12:40:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2EB92166B26;
 Thu, 16 Jun 2022 12:40:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 4/9] error-report: simplify print_loc()
Date: Thu, 16 Jun 2022 16:40:29 +0400
Message-Id: <20220616124034.3381391-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


