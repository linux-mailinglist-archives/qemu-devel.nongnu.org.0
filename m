Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464204E5692
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:35:34 +0100 (CET)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3xM-0004rF-VJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:35:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QJ-00061Q-QX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QI-0005bB-3S
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+UzCaNLeUllJnP2z7iXTv9ecUiObeT8WS79lORUgWo=;
 b=B2g5k0gBPrcQ+cv0ibNsWd4IkUXmljwCRfKEhBA86CjRzhjCtkyK78ALQ/LG6LNDeqRqrB
 F+y7QLBBa7JfktEeFvf2ZheT1oAfHZ6AGH1unVtB5M4YD7/6tsZ3a9SO5j7m5ljbi1Ng5N
 V4w/iiHVK3BTLTrJgWA3T8lnlTRkzRY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-DM3YGGc4PPCtSpERquBL-w-1; Wed, 23 Mar 2022 12:01:20 -0400
X-MC-Unique: DM3YGGc4PPCtSpERquBL-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7BC21C09047;
 Wed, 23 Mar 2022 16:01:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BDD4C202C9;
 Wed, 23 Mar 2022 16:01:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 26/32] include: move os_*() to os-foo.h
Date: Wed, 23 Mar 2022 19:57:37 +0400
Message-Id: <20220323155743.1585078-27-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For consistency with other os_ functions that do not have POSIX
implementation, declare an inline function for the stub in os-win32.h.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h     | 4 ----
 include/sysemu/os-posix.h | 2 ++
 include/sysemu/os-win32.h | 4 +++-
 os-win32.c                | 9 ---------
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1fbc20e4bcf7..a271cac66a1b 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,10 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-/* OS specific functions */
-void os_setup_early_signal_handling(void);
-int os_parse_cmd_args(int index, const char *optarg);
-
 void page_size_init(void);
 
 #endif
diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index dd64fb401dfb..a49c6848ff1a 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -42,7 +42,9 @@
 extern "C" {
 #endif
 
+int os_parse_cmd_args(int index, const char *optarg);
 void os_set_line_buffering(void);
+void os_setup_early_signal_handling(void);
 void os_set_proc_name(const char *s);
 void os_setup_signal_handling(void);
 void os_daemonize(void);
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 770752222ae3..c0ba65389986 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -62,8 +62,10 @@ struct tm *localtime_r(const time_t *timep, struct tm *result);
 static inline void os_setup_signal_handling(void) {}
 static inline void os_daemonize(void) {}
 static inline void os_setup_post(void) {}
-void os_set_line_buffering(void);
 static inline void os_set_proc_name(const char *dummy) {}
+static inline int os_parse_cmd_args(int index, const char *optarg) { return -1; }
+void os_set_line_buffering(void);
+void os_setup_early_signal_handling(void);
 
 int getpagesize(void);
 
diff --git a/os-win32.c b/os-win32.c
index e31c921983b4..6f21b578417c 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -61,12 +61,3 @@ void os_set_line_buffering(void)
     setbuf(stdout, NULL);
     setbuf(stderr, NULL);
 }
-
-/*
- * Parse OS specific command line options.
- * return 0 if option handled, -1 otherwise
- */
-int os_parse_cmd_args(int index, const char *optarg)
-{
-    return -1;
-}
-- 
2.35.1.273.ge6ebfd0e8cbb


