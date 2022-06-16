Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91354E179
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:08:41 +0200 (CEST)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pEm-0006T5-CU
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooN-0001Cf-MI
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ont-0005FQ-VJ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655383248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fy92f6kQJ5+uPC2RTOYG/PSXahPriSC+sovWZGw5Ewk=;
 b=Za9gzlDW0MaUJ75Kn2oKlJHwZcJrhTWC181kC7kIMja23zuS8AhBAZC/cPhChXjLDDr4I5
 kk+rIbznBybMPGkHNBKhMFYaL1yOc9wO9b1IPefCvgjquZAmKhMoaVxYrAHqcBfgkCZDAY
 eXrptQz9UEnv5yetWaDNFNdgNORSB8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-eOuc_wz5N4OnmteMfPfewA-1; Thu, 16 Jun 2022 08:40:44 -0400
X-MC-Unique: eOuc_wz5N4OnmteMfPfewA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F94B833976;
 Thu, 16 Jun 2022 12:40:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47B811415107;
 Thu, 16 Jun 2022 12:40:42 +0000 (UTC)
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
Subject: [PATCH 1/9] monitor: make error_vprintf_unless_qmp() static
Date: Thu, 16 Jun 2022 16:40:26 +0400
Message-Id: <20220616124034.3381391-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Not needed outside monitor.c. Remove the needless stub.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/monitor/monitor.h | 1 -
 monitor/monitor.c         | 3 ++-
 stubs/error-printf.c      | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index a4b40e8391db..44653e195b45 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name, bool info,
 void monitor_register_hmp_info_hrt(const char *name,
                                    HumanReadableText *(*handler)(Error **errp));
 
-int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 #endif /* MONITOR_H */
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 86949024f643..ba4c1716a48a 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_list ap)
     return vfprintf(stderr, fmt, ap);
 }
 
-int error_vprintf_unless_qmp(const char *fmt, va_list ap)
+G_GNUC_PRINTF(1, 0)
+static int error_vprintf_unless_qmp(const char *fmt, va_list ap)
 {
     Monitor *cur_mon = monitor_cur();
 
diff --git a/stubs/error-printf.c b/stubs/error-printf.c
index 0e326d801059..1afa0f62ca26 100644
--- a/stubs/error-printf.c
+++ b/stubs/error-printf.c
@@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)
     }
     return vfprintf(stderr, fmt, ap);
 }
-
-int error_vprintf_unless_qmp(const char *fmt, va_list ap)
-{
-    return error_vprintf(fmt, ap);
-}
-- 
2.37.0.rc0


