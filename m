Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACC4CC337
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:51:07 +0100 (CET)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPofS-0004Id-Ds
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:51:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPodA-0001et-Ru
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:48:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPod5-0000Aq-GV
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646326113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Yl+fmCaSIhGwR2YDpHeiSfAGxUECubYnl9zBD9emxQ=;
 b=WFSsgt+8OF2BUHRiqDuw0Ki1zXK13wuZRJlC52x5TOgBU2GEB673jp7AzENf1PvpttGQuU
 DFUgmflQq0GwYuK13EMzQsB+DnMeYPKsxGdDPNL3CCG9hoHIOuLV8lNeygKLk5JG1VJ0Ec
 vhxaNQhtLerqtemTj3KABUKjpP/UadQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-wpT6uS1ANKGfPE4mlR-QEA-1; Thu, 03 Mar 2022 11:48:32 -0500
X-MC-Unique: wpT6uS1ANKGfPE4mlR-QEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 948515200;
 Thu,  3 Mar 2022 16:48:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AA49106D5B1;
 Thu,  3 Mar 2022 16:48:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/4] os-posix: Add os_set_daemonize()
Date: Thu,  3 Mar 2022 17:48:11 +0100
Message-Id: <20220303164814.284974-2-hreitz@redhat.com>
In-Reply-To: <20220303164814.284974-1-hreitz@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 include/sysemu/os-posix.h | 1 +
 include/sysemu/os-win32.h | 5 +++++
 os-posix.c                | 6 ++++++
 3 files changed, 12 insertions(+)

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
index 43f569b5c2..68af96907e 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -77,6 +77,11 @@ typedef struct {
 } qemu_timeval;
 int qemu_gettimeofday(qemu_timeval *tp);
 
+static inline int os_set_daemonize(bool d)
+{
+    return -ENOTSUP;
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
2.34.1


