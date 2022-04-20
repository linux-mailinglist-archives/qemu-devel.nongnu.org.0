Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E792508A95
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:17:17 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhB8u-00046Q-BX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPn-0002Y8-2N
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPl-0005M0-E9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9YVbBvymtGk5GUo4NYzmed2gFkzDLm6bLt2LR82tHg=;
 b=HEf+v8at40SsuVBcxXr/DumR5cuqjHxoFrTyDpXndtC5Pzidc5wDkMiyHbVhE4dcxSont5
 JLCFuCUJXSSU8udfqSaWJYFoAnJUBaJVH4gluSsghjHhyUfHzKwUFV0rVKtBuXXUOmEvFc
 x5sm7xI3GRz9YR88hULYTe9FOl0oic4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-SIe-FomwNFew5LC2QcbZhA-1; Wed, 20 Apr 2022 09:30:35 -0400
X-MC-Unique: SIe-FomwNFew5LC2QcbZhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE4FD1C05130
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:30:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3A687AE2;
 Wed, 20 Apr 2022 13:30:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 35/41] util: simplify write in signal handler
Date: Wed, 20 Apr 2022 17:26:18 +0400
Message-Id: <20220420132624.2439741-36-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Use qemu_write_full() instead of open-coding a write loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/compatfd.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index ab810c42a927..55b6e0b7fb27 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -42,25 +42,11 @@ static void *sigwait_compat(void *opaque)
             }
         } else {
             struct qemu_signalfd_siginfo buffer;
-            size_t offset = 0;
-
             memset(&buffer, 0, sizeof(buffer));
             buffer.ssi_signo = sig;
 
-            while (offset < sizeof(buffer)) {
-                ssize_t len;
-
-                len = write(info->fd, (char *)&buffer + offset,
-                            sizeof(buffer) - offset);
-                if (len == -1 && errno == EINTR) {
-                    continue;
-                }
-
-                if (len <= 0) {
-                    return NULL;
-                }
-
-                offset += len;
+            if (qemu_write_full(info->fd, &buffer, sizeof(buffer)) != sizeof(buffer)) {
+                return NULL;
             }
         }
     }
-- 
2.35.1.693.g805e0a68082a


