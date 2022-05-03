Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B6518D81
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:54:40 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlybX-0001Xj-9K
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyUw-0007Rq-2q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:47:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyUt-0002na-IR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651607189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l76Es0Go6yi7dxLGk9I6xUcPM8tl9660m8nL2N3LWXA=;
 b=Oxr4+kDAEE3fq2CFJuudq9nqy1ZdTteY3rNVkWWN1B1aWYq5qprchDK/LpRbFEiGe+VZ1O
 xPClYBmQeswnGl+gDdfvvu8VYS6JL0dModPUHdDD9lt9Q0LaVVdDSqoj1dPSrGJTNe3aYV
 GAVS9rnjJs60agsHfXWLbrHdvBdqDtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-oQo7rzfRNGm9WdeTszsygg-1; Tue, 03 May 2022 10:46:15 -0400
X-MC-Unique: oQo7rzfRNGm9WdeTszsygg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B94EAED7AF;
 Tue,  3 May 2022 13:13:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FFFB1537DFC;
 Tue,  3 May 2022 13:13:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/23] os-posix: replace pipe()+cloexec with
 g_unix_open_pipe(CLOEXEC)
Date: Tue,  3 May 2022 17:12:44 +0400
Message-Id: <20220503131256.187238-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 os-posix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 1b746dba97a7..321fc4bd13b8 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -215,7 +215,7 @@ void os_daemonize(void)
         pid_t pid;
         int fds[2];
 
-        if (pipe(fds) == -1) {
+        if (!g_unix_open_pipe(fds, FD_CLOEXEC, NULL)) {
             exit(1);
         }
 
@@ -240,7 +240,6 @@ void os_daemonize(void)
 
         close(fds[0]);
         daemon_pipe = fds[1];
-        qemu_set_cloexec(daemon_pipe);
 
         setsid();
 
-- 
2.36.0.44.g0f828332d5ac


