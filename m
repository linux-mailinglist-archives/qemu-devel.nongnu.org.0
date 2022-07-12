Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658AA571604
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:45:43 +0200 (CEST)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCSc-0007tj-GM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJ9-0005I1-Et
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJ7-0006Vj-HP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzBc0nl4yI9EOA558uood9/BjlvTEJkzBDosBBKzsnk=;
 b=PoRUXeDMpGgaOZng/G+1WT3RucGbf//0w/Vbrtuxd4/wkDUKLGfQuooJZHTgVMmlPFHS5J
 Cgh0OJi64N4VdE9MYLUuAYNB4y/cNBuFlemnv/L01FWV7QjmYtQ2gN2Z0zMZsE/1+yV2X1
 NXD9V30WGrXLoskgJ6xgrdH3lAJO4fE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-FKTduMrANg2r4WvaBzKfVg-1; Tue, 12 Jul 2022 05:35:49 -0400
X-MC-Unique: FKTduMrANg2r4WvaBzKfVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FF3F811E7A;
 Tue, 12 Jul 2022 09:35:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13AD9492C3B;
 Tue, 12 Jul 2022 09:35:47 +0000 (UTC)
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
Subject: [PATCH v2 02/15] error-report: introduce "detailed" variable
Date: Tue, 12 Jul 2022 13:35:15 +0400
Message-Id: <20220712093528.4144184-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Let's use a more explicit variable "detailed" instead of calling
monitor_cur() multiple times.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 util/error-report.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/error-report.c b/util/error-report.c
index 98f242b75bbf..893da10f19bc 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -195,16 +195,17 @@ real_time_iso8601(void)
  */
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
+    bool detailed = !monitor_cur();
     gchar *timestr;
 
-    if (message_with_timestamp && !monitor_cur()) {
+    if (message_with_timestamp && detailed) {
         timestr = real_time_iso8601();
         error_printf("%s ", timestr);
         g_free(timestr);
     }
 
     /* Only prepend guest name if -msg guest-name and -name guest=... are set */
-    if (error_with_guestname && error_guest_name && !monitor_cur()) {
+    if (error_with_guestname && error_guest_name && detailed) {
         error_printf("%s ", error_guest_name);
     }
 
-- 
2.37.0.rc0


