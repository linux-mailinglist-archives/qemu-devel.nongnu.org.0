Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179C69625E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtOE-0007RK-Kh; Tue, 14 Feb 2023 06:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtOC-0007OQ-I0
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtOB-0002Ne-3h
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/DDOzZp1abNJ9kJJAbJ2YWdu7RqdZlH9fwSwstchuM=;
 b=cbmQoPQXaLGS/ot2NBag15ejrI1Zezh3Q9ws///63M4Um4dKQU0uoik2Lll8Iv8QHyh9nd
 JVp78IvJM7MM9jVkh2fATR4b8LU1iju1N/iHXgg49VgX0x8GdZN3y798+ooKeDSIQLoRbC
 gn3v76udiVhiUXGSoBa4/9kGJ8J0z4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-cN56BUctMtCjIUIKdKA0Ew-1; Tue, 14 Feb 2023 06:22:21 -0500
X-MC-Unique: cN56BUctMtCjIUIKdKA0Ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFD0085D060;
 Tue, 14 Feb 2023 11:22:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB83400D927;
 Tue, 14 Feb 2023 11:22:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 21/22] tests/tcg/s390x: Use -nostdlib for softmmu tests
Date: Tue, 14 Feb 2023 12:21:47 +0100
Message-Id: <20230214112148.646077-22-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

The code currently uses -nostartfiles, but this does not prevent
linking with libc. On Fedora there is no cross-libc, so the linking
step fails.

Fix by using the more comprehensive -nostdlib (that's also what
probe_target_compiler() checks for as well).

Fixes: 503e549e441e ("tests/tcg/s390x: Test unaligned accesses to lowcore")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230131182057.2261614-1-iii@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index a34fa68473..50c1b88065 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -3,7 +3,7 @@ VPATH+=$(S390X_SRC)
 QEMU_OPTS=-action panic=exit-failure -kernel
 
 %: %.S
-	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
+	$(CC) -march=z13 -m64 -nostdlib -static -Wl,-Ttext=0 \
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
-- 
2.31.1


