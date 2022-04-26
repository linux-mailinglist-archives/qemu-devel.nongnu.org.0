Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0450F91C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:54:21 +0200 (CEST)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHtk-0005zT-7i
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVd-0003rZ-Jh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVb-0006MS-8u
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtQ57dpYwLD04e2ZrLLt5OMh5PoZ5/qRkuwv3aRHpXM=;
 b=LwFhsXyq3rn9euJAocVcNJo+/qcuMoq1KgvOA6cazm733w4bPjA2kEAXZ8a5IUoxD77nGb
 sWXqAa7t1kQ+FFToA3/tcEK1OggS8W4bXM6RW1bivjwHG5e4Ztch933daY6i1ySlsMw97T
 tcatZEwwNQsGba9BSGY7TjakpiKGszY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-LZbLRZHUNfijEZJ0Fdftvw-1; Tue, 26 Apr 2022 05:29:18 -0400
X-MC-Unique: LZbLRZHUNfijEZJ0Fdftvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 578A7185A794
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:29:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 227E5403D19A;
 Tue, 26 Apr 2022 09:29:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/26] virtiofsd: replace pipe() with
 g_unix_open_pipe(CLOEXEC)
Date: Tue, 26 Apr 2022 13:27:04 +0400
Message-Id: <20220426092715.3931705-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tools/virtiofsd/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index f8981e5bdf1a..f5f66f292c70 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -275,7 +275,7 @@ int fuse_daemonize(int foreground)
         int waiter[2];
         char completed;
 
-        if (pipe(waiter)) {
+        if (!g_unix_open_pipe(waiter, FD_CLOEXEC, NULL)) {
             fuse_log(FUSE_LOG_ERR, "fuse_daemonize: pipe: %s\n",
                      strerror(errno));
             return -1;
-- 
2.36.0


