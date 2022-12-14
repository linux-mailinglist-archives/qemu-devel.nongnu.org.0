Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657E64CC12
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5o-0005lx-E8; Wed, 14 Dec 2022 08:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S57-0004kF-Vj
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S55-0003hp-9T
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajDis2e4opLPd0VJW3q+kLT5lBh2lKhhBCahiFEeoJA=;
 b=MBYfq6i+iTFUWweJ5uBW3OM226GcvxJS8mB3Ow0SizOyojt2WtDE2Wez3INb7QieCfy1s0
 aH//WHT0Te8T/rShQ1HUqO0wQkVu0otd5avrc+ZicTNwuGPFnY9fcqTelHPu0Ptbruu1E8
 o3qAPjfVqFA1vEkOPDG+EjbR8n2RH/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-TWZ4i8W1NwqEwFSE2xTbdA-1; Wed, 14 Dec 2022 08:45:48 -0500
X-MC-Unique: TWZ4i8W1NwqEwFSE2xTbdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 461EE85A588;
 Wed, 14 Dec 2022 13:45:48 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B6714171BE;
 Wed, 14 Dec 2022 13:45:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 40/51] clang-tsa: Add macros for shared locks
Date: Wed, 14 Dec 2022 14:44:42 +0100
Message-Id: <20221214134453.31665-41-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20221207131838.239125-8-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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


