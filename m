Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0430C645ABF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKp-0007dC-Nl; Wed, 07 Dec 2022 08:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKo-0007cZ-1m
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKl-0006Ry-UW
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XK/7dO8liSgOfjZsoHR1pSdW5O0q0xZ0ytSXHajFIg=;
 b=J0JNWAU8CXEB4/PUBTLvMqkNpUwgJDjKFaog6u6BKmecvu5Ul6azhpUeJSRos7nlAJtsit
 Y989+9xAuuoky4kag6/RwgW6Eb1o43sg9Q0Y/08U1pB6C0uY2G8vhZnXnIcHDrOsXuFs4U
 8xBueQces+QEmkoX/sKtqNCr1BYy8FI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-H_Z3oPgjP0m_y4MW53r8eg-1; Wed, 07 Dec 2022 08:19:32 -0500
X-MC-Unique: H_Z3oPgjP0m_y4MW53r8eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5EAE833AEF;
 Wed,  7 Dec 2022 13:19:31 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93F521121314;
 Wed,  7 Dec 2022 13:19:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 07/18] clang-tsa: Add macros for shared locks
Date: Wed,  7 Dec 2022 14:18:27 +0100
Message-Id: <20221207131838.239125-8-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/clang-tsa.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/clang-tsa.h b/include/qemu/clang-tsa.h
index 211ee0ae73..ba06fb8c92 100644
--- a/include/qemu/clang-tsa.h
+++ b/include/qemu/clang-tsa.h
@@ -62,6 +62,7 @@
  * void Foo(void) TSA_REQUIRES(mutex);
  */
 #define TSA_REQUIRES(...) TSA(requires_capability(__VA_ARGS__))
+#define TSA_REQUIRES_SHARED(...) TSA(requires_shared_capability(__VA_ARGS__))
 
 /* TSA_EXCLUDES() is used to annotate functions: the caller of the
  * function MUST NOT hold resource, the function first acquires the
@@ -82,6 +83,7 @@
  * void Foo(void) TSA_ACQUIRE(mutex);
  */
 #define TSA_ACQUIRE(...) TSA(acquire_capability(__VA_ARGS__))
+#define TSA_ACQUIRE_SHARED(...) TSA(acquire_shared_capability(__VA_ARGS__))
 
 /* TSA_RELEASE() is used to annotate functions: the caller of the
  * function MUST hold the resource, but the function will then release it.
@@ -91,6 +93,7 @@
  * void Foo(void) TSA_RELEASE(mutex);
  */
 #define TSA_RELEASE(...) TSA(release_capability(__VA_ARGS__))
+#define TSA_RELEASE_SHARED(...) TSA(release_shared_capability(__VA_ARGS__))
 
 /* TSA_NO_TSA is used to annotate functions.  Use only when you need to.
  *
@@ -106,5 +109,6 @@
  * More than one mutex may be specified, comma-separated.
  */
 #define TSA_ASSERT(...) TSA(assert_capability(__VA_ARGS__))
+#define TSA_ASSERT_SHARED(...) TSA(assert_shared_capability(__VA_ARGS__))
 
 #endif /* #ifndef CLANG_TSA_H */
-- 
2.38.1


