Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196CC4CD99B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:01:50 +0100 (CET)
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBJN-0001E7-5K
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:01:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5c-0004xh-Jh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5Z-0007LQ-Jk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyGt551tDjSKyEo2xbzP525Wu/xijYhjcr0+TfWDaiM=;
 b=D5Cqb8YhIbRzMImBFUUszmPPUqZ1+ALUnO+xydjGJgOtuNkfQw3SfAfN67Wg5D4UleDrvj
 X1jxJ1klMx+E2KieJjnpT8asyzgKoAfrBavLvPaKgyWjoUxe7oGLLeTd3TroDRlXj2Rhcq
 n4O8XCTYIuFJKt4tTc2sV7oBJ3ZYgso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-pa6WxGveMnu_8ob3FzAcLw-1; Fri, 04 Mar 2022 11:47:31 -0500
X-MC-Unique: pa6WxGveMnu_8ob3FzAcLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9895824FA6;
 Fri,  4 Mar 2022 16:47:29 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DED8383BF9;
 Fri,  4 Mar 2022 16:47:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/50] os-posix: Add os_set_daemonize()
Date: Fri,  4 Mar 2022 17:46:31 +0100
Message-Id: <20220304164711.474713-11-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

The daemonizing functions in os-posix (os_daemonize() and
os_setup_post()) only daemonize the process if the static `daemonize`
variable is set.  Right now, it can only be set by os_parse_cmd_args().

In order to use os_daemonize() and os_setup_post() from the storage
daemon to have it be daemonized, we need some other way to set this
`daemonize` variable, because I would rather not tap into the system
emulator's arg-parsing code.  Therefore, this patch adds an
os_set_daemonize() function, which will return an error on os-win32
(because daemonizing is not supported there).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220303164814.284974-2-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/os-posix.h | 1 +
 include/sysemu/os-win32.h | 8 ++++++++
 os-posix.c                | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 2edf33658a..dd64fb401d 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -55,6 +55,7 @@ int os_mlock(void);
 typedef struct timeval qemu_timeval;
 #define qemu_gettimeofday(tp) gettimeofday(tp, NULL)
 
+int os_set_daemonize(bool d);
 bool is_daemonized(void);
 
 /**
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 43f569b5c2..770752222a 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -77,6 +77,14 @@ typedef struct {
 } qemu_timeval;
 int qemu_gettimeofday(qemu_timeval *tp);
 
+static inline int os_set_daemonize(bool d)
+{
+    if (d) {
+        return -ENOTSUP;
+    }
+    return 0;
+}
+
 static inline bool is_daemonized(void)
 {
     return false;
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..24692c8593 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -317,6 +317,12 @@ bool is_daemonized(void)
     return daemonize;
 }
 
+int os_set_daemonize(bool d)
+{
+    daemonize = d;
+    return 0;
+}
+
 int os_mlock(void)
 {
 #ifdef HAVE_MLOCKALL
-- 
2.35.1


