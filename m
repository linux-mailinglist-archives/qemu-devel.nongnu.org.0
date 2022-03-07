Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D494CF274
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:12:42 +0100 (CET)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7Xt-0001Oh-Q6
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR7S5-0002LY-6m
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR7Rz-0001Bd-9r
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646636790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9JqBmH5jedqY3XRegXXeIek88/T3PWR7yNydAxbEXM=;
 b=JnUHybL+8ElfdQevddlmggqsWHl4Spx1kE/k3q9l+V+27pwA5aeukARQ6Pk7tEwXGjTxgq
 ALH8edCOTqQlrvbYYowcPXNaEBA0M+lySuVN91EUeYmUJfNJ1fxZKlXmPT1zzlxEW/ik6i
 qH5eVTM59XeocPh0oxnMhArFhHmJnDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-geN-rakCN3SN2lJ2RSRszw-1; Mon, 07 Mar 2022 02:06:26 -0500
X-MC-Unique: geN-rakCN3SN2lJ2RSRszw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B8C1520F;
 Mon,  7 Mar 2022 07:06:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4783567663;
 Mon,  7 Mar 2022 07:06:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] qga: replace qemu_gettimeofday() with g_get_real_time()
Date: Mon,  7 Mar 2022 11:03:59 +0400
Message-Id: <20220307070401.171986-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220307070401.171986-1-marcandre.lureau@redhat.com>
References: <20220307070401.171986-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GLib g_get_real_time() is an alternative to gettimeofday() which allows
to simplify our code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 qga/commands-posix.c | 14 --------------
 qga/commands-win32.c | 19 -------------------
 qga/commands.c       |  5 +++++
 3 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68ea9..1e7b4656edd1 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -136,20 +136,6 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     /* succeeded */
 }
 
-int64_t qmp_guest_get_time(Error **errp)
-{
-   int ret;
-   qemu_timeval tq;
-
-   ret = qemu_gettimeofday(&tq);
-   if (ret < 0) {
-       error_setg_errno(errp, errno, "Failed to get time");
-       return -1;
-   }
-
-   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
-}
-
 void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
 {
     int ret;
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4fbbad793f2e..ce0af5ba45fc 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1751,25 +1751,6 @@ static int64_t filetime_to_ns(const FILETIME *tf)
             - W32_FT_OFFSET) * 100;
 }
 
-int64_t qmp_guest_get_time(Error **errp)
-{
-    SYSTEMTIME ts = {0};
-    FILETIME tf;
-
-    GetSystemTime(&ts);
-    if (ts.wYear < 1601 || ts.wYear > 30827) {
-        error_setg(errp, "Failed to get time");
-        return -1;
-    }
-
-    if (!SystemTimeToFileTime(&ts, &tf)) {
-        error_setg(errp, "Failed to convert system time: %d", (int)GetLastError());
-        return -1;
-    }
-
-    return filetime_to_ns(&tf);
-}
-
 void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
 {
     Error *local_err = NULL;
diff --git a/qga/commands.c b/qga/commands.c
index 80501e4a737c..653ba3061e24 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -585,3 +585,8 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
 
     return read_data;
 }
+
+int64_t qmp_guest_get_time(Error **errp)
+{
+    return g_get_real_time() * 1000;
+}
-- 
2.35.1.273.ge6ebfd0e8cbb


