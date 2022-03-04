Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F84CDFB5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:22:37 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFNk-0002Pq-5n
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:22:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQFKd-00062M-82
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQFKa-0004hB-D3
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646428757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BhIS/JnHNNYBTDHavC/oPnoSqhvTw2dAy2h0aYx2BjI=;
 b=L2WI+WRvILJLi1b5Q/emYCgzD0IoR9WKNtw0ObyZUdk8we4Gxe5jQISbV5S4SC/OhQkcv9
 ui1dZtqZyhHLFz+N/VVSHATbYv3VbmDG+sarlUkn6Ok8O0Ci+m9h1CK1FnHCheAk4Mw4MO
 ftwOg6TZmn/ZVUKU+WjLCSAK5Bj4phs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-UMsXQy__OgqN6OZ1GrMvlw-1; Fri, 04 Mar 2022 16:19:16 -0500
X-MC-Unique: UMsXQy__OgqN6OZ1GrMvlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 853051006AA5;
 Fri,  4 Mar 2022 21:19:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCB421ABC1;
 Fri,  4 Mar 2022 21:18:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] oslib: drop qemu_gettimeofday()
Date: Sat,  5 Mar 2022 01:16:18 +0400
Message-Id: <20220304211618.3715999-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
References: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

No longer used after the previous patches.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/os-posix.h |  3 ---
 include/sysemu/os-win32.h |  6 ------
 util/oslib-win32.c        | 20 --------------------
 3 files changed, 29 deletions(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 2edf33658a44..c9b1d63fedda 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -52,9 +52,6 @@ int os_mlock(void);
 #define closesocket(s) close(s)
 #define ioctlsocket(s, r, v) ioctl(s, r, v)
 
-typedef struct timeval qemu_timeval;
-#define qemu_gettimeofday(tp) gettimeofday(tp, NULL)
-
 bool is_daemonized(void);
 
 /**
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 43f569b5c216..4d4be826f48c 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -71,12 +71,6 @@ int getpagesize(void);
 # define EPROTONOSUPPORT EINVAL
 #endif
 
-typedef struct {
-    long tv_sec;
-    long tv_usec;
-} qemu_timeval;
-int qemu_gettimeofday(qemu_timeval *tp);
-
 static inline bool is_daemonized(void)
 {
     return false;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef3398d..7faf59e9aaea 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -265,26 +265,6 @@ void qemu_set_cloexec(int fd)
 {
 }
 
-/* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
-#define _W32_FT_OFFSET (116444736000000000ULL)
-
-int qemu_gettimeofday(qemu_timeval *tp)
-{
-  union {
-    unsigned long long ns100; /*time since 1 Jan 1601 in 100ns units */
-    FILETIME ft;
-  }  _now;
-
-  if(tp) {
-      GetSystemTimeAsFileTime (&_now.ft);
-      tp->tv_usec=(long)((_now.ns100 / 10ULL) % 1000000ULL );
-      tp->tv_sec= (long)((_now.ns100 - _W32_FT_OFFSET) / 10000000ULL);
-  }
-  /* Always return 0 as per Open Group Base Specifications Issue 6.
-     Do not set errno on error.  */
-  return 0;
-}
-
 int qemu_get_thread_id(void)
 {
     return GetCurrentThreadId();
-- 
2.35.1.273.ge6ebfd0e8cbb


