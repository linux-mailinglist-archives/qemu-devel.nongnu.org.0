Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AF50F91D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:54:28 +0200 (CEST)
Received: from localhost ([::1]:52510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHtr-0006Mm-AP
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVU-0003pY-Hy
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVS-0006L6-S7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AElJP6pa7/V+5w4cAhSz9752Vl5L2xcI2XV5j2AgjJg=;
 b=aydncVzp2507SZyRw87Hsv6iUXSJyK5Dh698Eif0hNtvT8tKEHHd0SoTwXWfJdSfUqzNyx
 XcgjMLwxSUD74TNVaVqVf9EfpxWiCBfm5f8LMbPn6yONGy6nlYr/pxLm1MVHuzyeuE5fj1
 Yd2vygTQ65T8ZkwWrtFaFaxxoqyPg3I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-KQ8b5FviNyOlbd1IEmuUeA-1; Tue, 26 Apr 2022 05:29:12 -0400
X-MC-Unique: KQ8b5FviNyOlbd1IEmuUeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B1713C01D92
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:29:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAB60112132D;
 Tue, 26 Apr 2022 09:29:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/26] os-posix: replace pipe()+cloexec with
 g_unix_open_pipe(CLOEXEC)
Date: Tue, 26 Apr 2022 13:27:03 +0400
Message-Id: <20220426092715.3931705-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 os-posix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index faf6e6978b9f..52526c2e3f76 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -223,7 +223,7 @@ void os_daemonize(void)
         pid_t pid;
         int fds[2];
 
-        if (pipe(fds) == -1) {
+        if (!g_unix_open_pipe(fds, FD_CLOEXEC, NULL)) {
             exit(1);
         }
 
@@ -248,7 +248,6 @@ void os_daemonize(void)
 
         close(fds[0]);
         daemon_pipe = fds[1];
-        qemu_set_cloexec(daemon_pipe);
 
         setsid();
 
-- 
2.36.0


