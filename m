Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297903D9F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:30:52 +0200 (CEST)
Received: from localhost ([::1]:53432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91RL-0005hB-7h
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JY-0005qp-2C
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JW-0007RS-JI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afhxZ/qpaCjsCN3y78vILWgHMXwEdaZ/frRUiVs6Dlw=;
 b=CazIQPjMNjVZSKDusi4QY8gB7OQWNZRNJGmQxYzmQbo0zph/ORQHu8ojW4m44ZKzJQ+R7I
 mcei+8b7SHL0667h0tU83idxkfPQ/bEY6d93t5EJMCpc5nuSeksR7vetyIVcQ9jloRKcJK
 0X5HuG52Z4S4BGvKlC/LIFxknCMTcJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-T_WPXAoGODmgyCsKQLkUlQ-1; Thu, 29 Jul 2021 04:22:44 -0400
X-MC-Unique: T_WPXAoGODmgyCsKQLkUlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE4E7107ACF5;
 Thu, 29 Jul 2021 08:22:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C985D9DC;
 Thu, 29 Jul 2021 08:22:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] tests: Fix migration-test build failure for sparc
Date: Thu, 29 Jul 2021 10:22:10 +0200
Message-Id: <20210729082211.532572-9-thuth@redhat.com>
In-Reply-To: <20210729082211.532572-1-thuth@redhat.com>
References: <20210729082211.532572-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Even if <linux/kvm.h> seems to exist for all archs on linux, however including
it with __linux__ defined seems to be not working yet as it'll try to include
asm/kvm.h and that can be missing for archs that do not support kvm.

To fix this (instead of any attempt to fix linux headers..), we can mark the
header to be x86_64 only, because it's so far only service for adding the kvm
dirty ring test.

Fixes: 1f546b709d6 ("tests: migration-test: Add dirty ring test")
Reported-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210728214128.206198-1-peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1e8b7784ef..cc5e83d98a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -27,7 +27,8 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
-#if defined(__linux__)
+/* For dirty ring test; so far only x86_64 is supported */
+#if defined(__linux__) && defined(HOST_X86_64)
 #include "linux/kvm.h"
 #endif
 
@@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
 
 static bool kvm_dirty_ring_supported(void)
 {
-#if defined(__linux__)
+#if defined(__linux__) && defined(HOST_X86_64)
     int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
 
     if (kvm_fd < 0) {
-- 
2.27.0


