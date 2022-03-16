Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C84DAE1A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:12:50 +0100 (CET)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQeA-0004Jj-0f
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:12:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLi-0000ye-K4
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLh-0007nu-39
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sXtDcPvv3GOZ71hM95XLw5A0STgrboD227HVQOUcLrI=;
 b=QlxqEQL94ZBKXKOxCN8hYcNmWtJ5cv1Hhfs1o9VkPX2f12ELhwNCBCnIEwMD/FONeb0OMU
 4iUmuUtrLJOjgsOAnGGTVY8KdUCedHz4GKZokK4sjOK1gAcZ2Tf9ws98VABvM6XlrOpYAr
 7l1oYf+JlnhPdk6FORrKStToKrwYGDM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-p5f0uzggNcOi6lDITg5cYg-1; Wed, 16 Mar 2022 05:53:43 -0400
X-MC-Unique: p5f0uzggNcOi6lDITg5cYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 268B31C05EB1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:53:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ECD82EFA3;
 Wed, 16 Mar 2022 09:53:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/27] Move HOST_LONG_BITS to compiler.h
Date: Wed, 16 Mar 2022 13:53:26 +0400
Message-Id: <20220316095326.2613694-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

This will help to make common code independent.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 3 +++
 include/qemu/osdep.h    | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 7fdd88adb368..d9359859d435 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -9,6 +9,9 @@
 
 #define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
 
+/* HOST_LONG_BITS is the size of a native pointer in bits. */
+#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
+
 #if defined __clang_analyzer__ || defined __COVERITY__
 #define QEMU_STATIC_ANALYSIS 1
 #endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index de0c0ab02f4d..06cf59ba1ea8 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -250,9 +250,6 @@ extern "C" {
 #define TIME_MAX TYPE_MAXIMUM(time_t)
 #endif
 
-/* HOST_LONG_BITS is the size of a native pointer in bits. */
-#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
-
 /* Mac OSX has a <stdint.h> bug that incorrectly defines SIZE_MAX with
  * the wrong type. Our replacement isn't usable in preprocessor
  * expressions, but it is sufficient for our needs. */
-- 
2.35.1.273.ge6ebfd0e8cbb


