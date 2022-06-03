Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93853C5C0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:11:07 +0200 (CEST)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1Sc-0004a5-64
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HJ-0005f6-0A
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HG-0003JE-HH
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiITbjjjR+UhW51YU4h8vWx72oaJ+6kKGI9+cL7Q9VA=;
 b=H9bfV7Et8Kp4Vr1BaPQszSfuxJXjyrCy8VFd2BxUSZnJtRkGeNEgnJUbRkZTySqTkjLxVI
 gDwrxPorh8KdXDgu3MWXrimS/ulUqew8pvncLpU6hwRyIgKZgMdH7xDq604Je71Mn5nekJ
 brsEK2aia9wUkvt0IF9todTveItaPaE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-XM_BCAW6OIalliKhNKxbJA-1; Fri, 03 Jun 2022 02:59:20 -0400
X-MC-Unique: XM_BCAW6OIalliKhNKxbJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44245810BCF;
 Fri,  3 Jun 2022 06:59:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDE8E2166B26;
 Fri,  3 Jun 2022 06:59:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
	Gautam Agrawal <gautamnagrawal@gmail.com>
Subject: [PULL 05/12] tests/tcg: Test overflow conditions
Date: Fri,  3 Jun 2022 08:58:58 +0200
Message-Id: <20220603065905.23805-6-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gautam Agrawal <gautamnagrawal@gmail.com>

Add a test to check for overflow conditions in s390x.
This patch is based on the following patches :
* https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
* https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51

Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
Message-Id: <20220531183524.40948-1-gautamnagrawal@gmail.com>
[thuth: Move overflow.c to tests/tcg/multiarch/ to make it generic]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/multiarch/overflow.c | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 tests/tcg/multiarch/overflow.c

diff --git a/tests/tcg/multiarch/overflow.c b/tests/tcg/multiarch/overflow.c
new file mode 100644
index 0000000000..1c59c2cb70
--- /dev/null
+++ b/tests/tcg/multiarch/overflow.c
@@ -0,0 +1,58 @@
+#include <stdio.h>
+
+int overflow_add_32(int x, int y)
+{
+    int res;
+    return __builtin_add_overflow(x, y, &res);
+}
+
+int overflow_add_64(long long x, long long y)
+{
+    long long res;
+    return __builtin_add_overflow(x, y, &res);
+}
+
+int overflow_sub_32(int x, int y)
+{
+    int res;
+    return __builtin_sub_overflow(x, y, &res);
+}
+
+int overflow_sub_64(long long x, long long y)
+{
+    long long res;
+    return __builtin_sub_overflow(x, y, &res);
+}
+
+int a1_add = -2147483648;
+int b1_add = -2147483648;
+long long a2_add = -9223372036854775808ULL;
+long long b2_add = -9223372036854775808ULL;
+
+int a1_sub;
+int b1_sub = -2147483648;
+long long a2_sub = 0L;
+long long b2_sub = -9223372036854775808ULL;
+
+int main()
+{
+    int ret = 0;
+
+    if (!overflow_add_32(a1_add, b1_add)) {
+        fprintf(stderr, "data overflow while adding 32 bits\n");
+        ret = 1;
+    }
+    if (!overflow_add_64(a2_add, b2_add)) {
+        fprintf(stderr, "data overflow while adding 64 bits\n");
+        ret = 1;
+    }
+    if (!overflow_sub_32(a1_sub, b1_sub)) {
+        fprintf(stderr, "data overflow while subtracting 32 bits\n");
+        ret = 1;
+    }
+    if (!overflow_sub_64(a2_sub, b2_sub)) {
+        fprintf(stderr, "data overflow while subtracting 64 bits\n");
+        ret = 1;
+    }
+    return ret;
+}
-- 
2.31.1


