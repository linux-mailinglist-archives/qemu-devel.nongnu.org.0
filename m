Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8974255923
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 13:09:41 +0200 (CEST)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBcGK-0004ID-S2
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 07:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcF3-0002Zf-Ck
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:08:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39876
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcF1-0000Q0-Mi
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598612899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4Sd4urd4/78OYOeMr4+d6SJ48/8cvfRv6qKwG++E0w=;
 b=OG9xdzC3UwP0fs/juMswUkJuKeoP+Unkp2tQJU8V4hRPrZcmyYkE/XCqbUbMVqtkZqGbKt
 j2f/UlBxaow+jLwUSpTQL4qxPV6tu/0qeURub29Ewe/UYTRksM0wREECnd8EYOZhBqM9lv
 eIGyeXJ/j8e+pgODqLwWN/zy7GO8lG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-uVHx-ZY9P0yqiwStwjVxMQ-1; Fri, 28 Aug 2020 07:08:17 -0400
X-MC-Unique: uVHx-ZY9P0yqiwStwjVxMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C9851084CA1
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:08:16 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AB9C747BD;
 Fri, 28 Aug 2020 11:08:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] meson: convert qht-bench
Date: Fri, 28 Aug 2020 15:07:22 +0400
Message-Id: <20200828110734.1638685-5-marcandre.lureau@redhat.com>
In-Reply-To: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
References: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 01:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is required by test-qht-par unit test.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/Makefile.include | 1 -
 tests/meson.build      | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9599990a83..9751a86b4c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -201,7 +201,6 @@ tests/test-rcu-slist$(EXESUF): tests/test-rcu-slist.o $(test-util-obj-y)
 tests/test-qdist$(EXESUF): tests/test-qdist.o $(test-util-obj-y)
 tests/test-qht$(EXESUF): tests/test-qht.o $(test-util-obj-y)
 tests/test-qht-par$(EXESUF): tests/test-qht-par.o tests/qht-bench$(EXESUF) $(test-util-obj-y)
-tests/qht-bench$(EXESUF): tests/qht-bench.o $(test-util-obj-y)
 tests/test-bufferiszero$(EXESUF): tests/test-bufferiszero.o $(test-util-obj-y)
 tests/atomic_add-bench$(EXESUF): tests/atomic_add-bench.o $(test-util-obj-y)
 tests/atomic64-bench$(EXESUF): tests/atomic64-bench.o $(test-util-obj-y)
diff --git a/tests/meson.build b/tests/meson.build
index 3c1586f110..c45ade551c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,3 +1,7 @@
+qht_bench = executable('qht-bench',
+                       sources: files('qht-bench.c'),
+                       dependencies: [qemuutil])
+
 test_qapi_outputs = [
   'qapi-builtin-types.c',
   'qapi-builtin-types.h',
-- 
2.26.2


