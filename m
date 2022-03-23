Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064FF4E5623
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:16:25 +0100 (CET)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3eq-0006vw-1b
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:16:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PG-0005Ed-5o
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PB-0005KR-OB
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8RUVc5ja0drlZGqSvvr2s3GC1dSjhmo9pv+mxmBa/U=;
 b=a9RZgt0STfgO4G8fCGB8j8WE400d6btt/z0+No5H3o4qB+ekU1QY7OTK/FJpN0+cMoZBQF
 baA8V8NLfqYT7jbHOJBugpSDCl4+B2B1+9WRRMiLQM+oXP7eqqsm6HAghu+6YsV61LGRhh
 dryfUflgVd30FY6NezPtcX8gRs1rsd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-vkRo8JajMlqOTJ_6NmfXsg-1; Wed, 23 Mar 2022 12:00:10 -0400
X-MC-Unique: vkRo8JajMlqOTJ_6NmfXsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D40D8803D67
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 16:00:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF73D40CF919;
 Wed, 23 Mar 2022 16:00:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 18/32] include: move qemu_pipe() to osdep.h
Date: Wed, 23 Mar 2022 19:57:29 +0400
Message-Id: <20220323155743.1585078-19-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h | 4 ----
 include/qemu/osdep.h  | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index c6f3ed94bc7e..2e1e76014a5f 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,10 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-#ifndef _WIN32
-int qemu_pipe(int pipefd[2]);
-#endif
-
 void cpu_exec_init_all(void);
 void cpu_exec_step_atomic(CPUState *cpu);
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 259436ff5371..a7332947107a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -530,6 +530,10 @@ static inline void qemu_timersub(const struct timeval *val1,
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     G_GNUC_WARN_UNUSED_RESULT;
 
+#ifndef _WIN32
+int qemu_pipe(int pipefd[2]);
+#endif
+
 void qemu_set_cloexec(int fd);
 
 void fips_set_state(bool requested);
-- 
2.35.1.273.ge6ebfd0e8cbb


