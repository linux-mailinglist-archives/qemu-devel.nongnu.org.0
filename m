Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830DB4E5678
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:29:51 +0100 (CET)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3rq-0002N7-KQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:29:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PG-0005Ec-5o
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3P6-0005JR-0n
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOvlJCsG6dBJzWOBTNIBuvjZfE/VEE/t1LVfmKFYSks=;
 b=BQtWMT39jn/NXRwEDs//VHExHeGfAsURVs8ta2xEIQi/jyKVkBit2lj7L8vpI4/fCxfhtq
 WZcP9738IfbKenV1OiNYLuGi6x35GvrXBLPh5ebvdeKmKn1aT/LWwfkZPkJAUMTzTXHm2A
 ZPLamDiMkKtwhWEXTezXNGAZ5MPp9I0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-zlrLqx3FNruarD_5-8Jm5g-1; Wed, 23 Mar 2022 12:00:06 -0400
X-MC-Unique: zlrLqx3FNruarD_5-8Jm5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A62F81044561
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 16:00:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1EB440CF919;
 Wed, 23 Mar 2022 16:00:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 17/32] include: move qemu_write_full() declaration to osdep.h
Date: Wed, 23 Mar 2022 19:57:28 +0400
Message-Id: <20220323155743.1585078-18-marcandre.lureau@redhat.com>
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

Closer to other IO functions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h | 3 ---
 include/qemu/osdep.h  | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index db8b03be51f3..c6f3ed94bc7e 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,9 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-ssize_t qemu_write_full(int fd, const void *buf, size_t count)
-    G_GNUC_WARN_UNUSED_RESULT;
-
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
 #endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 489a5d1aad5f..259436ff5371 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -527,6 +527,9 @@ static inline void qemu_timersub(const struct timeval *val1,
 #define qemu_timersub timersub
 #endif
 
+ssize_t qemu_write_full(int fd, const void *buf, size_t count)
+    G_GNUC_WARN_UNUSED_RESULT;
+
 void qemu_set_cloexec(int fd);
 
 void fips_set_state(bool requested);
-- 
2.35.1.273.ge6ebfd0e8cbb


