Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC15F6572
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:55:12 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogPT4-0006qw-3D
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBi-0003JX-JN
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBg-0000u1-1r
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665056231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVSKmrWOeM7DpjxLiX0B8XiNqvq62Va4wdUWdXaS1HU=;
 b=J51awX05L2qFWOBS8vIn90IRXASXZMVmHmObsuE6EptZH3T7sTgO1SuI3RDK+YbmZWubOf
 o0GlCPgefWXZgBzYxPYCrpilVqBHyNsNpQzk6OGUxDJfl6slTUrehctr0KC2qdp+695Dfc
 P/Bj9oG/1F7NB8WrrYZn8OsCoC6mx7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-TRtCJ3HFPz6dSEUDNnDi3w-1; Thu, 06 Oct 2022 07:37:10 -0400
X-MC-Unique: TRtCJ3HFPz6dSEUDNnDi3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6252185A794
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 11:37:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27790483EFB;
 Thu,  6 Oct 2022 11:37:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 2/6] util: make do_send_recv work with partial send/recv
Date: Thu,  6 Oct 2022 15:36:53 +0400
Message-Id: <20221006113657.2656108-3-marcandre.lureau@redhat.com>
In-Reply-To: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
References: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

According to msdn documentation and Linux man pages, send() should try
to send as much as possible in blocking mode, while recv() may return
earlier with a smaller available amount, we should try to continue
send/recv from there.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/iov.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/util/iov.c b/util/iov.c
index 22d6996cce..b4be580022 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -111,12 +111,17 @@ do_send_recv(int sockfd, struct iovec *iov, unsigned iov_cnt, bool do_send)
     /*XXX Note: windows has WSASend() and WSARecv() */
     unsigned i = 0;
     ssize_t ret = 0;
+    ssize_t off = 0;
     while (i < iov_cnt) {
         ssize_t r = do_send
-            ? send(sockfd, iov[i].iov_base, iov[i].iov_len, 0)
-            : recv(sockfd, iov[i].iov_base, iov[i].iov_len, 0);
+            ? send(sockfd, iov[i].iov_base + off, iov[i].iov_len - off, 0)
+            : recv(sockfd, iov[i].iov_base + off, iov[i].iov_len - off, 0);
         if (r > 0) {
             ret += r;
+            off += r;
+            if (off < iov[i].iov_len) {
+                continue;
+            }
         } else if (!r) {
             break;
         } else if (errno == EINTR) {
@@ -129,6 +134,7 @@ do_send_recv(int sockfd, struct iovec *iov, unsigned iov_cnt, bool do_send)
             }
             break;
         }
+        off = 0;
         i++;
     }
     return ret;
-- 
2.37.3


