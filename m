Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2808D60FF69
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:36:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jE-0004Gr-LP; Thu, 27 Oct 2022 13:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jB-0004EA-9T
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6j9-0000u7-Q9
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7opvEzUdWFTV1YT3oA2R3pghRSdUwEeQHmGfOczt3g=;
 b=ZJLTdcOtZVxPg32i6K0zuobndlU+oNS1S7gIv9++85bUGakOUs9Liqjx33bqBOYMBkqs3c
 PeI7HZ+5PS7k7vzKglx57o55tAoyoyJDYkAS916HPgVHagxKT0uvZoZqH8FTq0cdkDfggE
 kU+m3hf2pLyOQAynXGy+/9ZyuDfoKNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-d5tzWtc5Pxyp7OSP5cBn1Q-1; Thu, 27 Oct 2022 13:31:20 -0400
X-MC-Unique: d5tzWtc5Pxyp7OSP5cBn1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E9B73C16E86;
 Thu, 27 Oct 2022 17:31:06 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6FA540C6EC3;
 Thu, 27 Oct 2022 17:31:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jungmin Park <pjm0616@gmail.com>
Subject: [PULL 01/20] crypto/luks: Support creating LUKS image on Darwin
Date: Thu, 27 Oct 2022 18:30:44 +0100
Message-Id: <20221027173103.299479-2-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jungmin Park <pjm0616@gmail.com>

When the user creates a LUKS-encrypted qcow2 image using the qemu-img
program, the passphrase is hashed using PBKDF2 with a dynamic
number of iterations. The number of iterations is determined by
measuring thread cpu time usage, such that it takes approximately
2 seconds to compute the hash.

Because Darwin doesn't implement getrusage(RUSAGE_THREAD), we get an
error message:
> qemu-img: test.qcow2: Unable to calculate thread CPU usage on this platform
for this command:
> qemu-img create --object secret,id=key,data=1234 -f qcow2 -o 'encrypt.format=luks,encrypt.key-secret=key' test.qcow2 100M

This patch implements qcrypto_pbkdf2_get_thread_cpu() for Darwin so that
the above command works.

Signed-off-by: Jungmin Park <pjm0616@gmail.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/pbkdf.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/crypto/pbkdf.c b/crypto/pbkdf.c
index 3775ddc6c5..8d198c152c 100644
--- a/crypto/pbkdf.c
+++ b/crypto/pbkdf.c
@@ -24,6 +24,11 @@
 #ifndef _WIN32
 #include <sys/resource.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <mach/mach_init.h>
+#include <mach/thread_act.h>
+#include <mach/mach_port.h>
+#endif
 
 
 static int qcrypto_pbkdf2_get_thread_cpu(unsigned long long *val_ms,
@@ -45,6 +50,24 @@ static int qcrypto_pbkdf2_get_thread_cpu(unsigned long long *val_ms,
     /* QuadPart is units of 100ns and we want ms as unit */
     *val_ms = thread_time.QuadPart / 10000ll;
     return 0;
+#elif defined(CONFIG_DARWIN)
+    mach_port_t thread;
+    kern_return_t kr;
+    mach_msg_type_number_t count;
+    thread_basic_info_data_t info;
+
+    thread = mach_thread_self();
+    count = THREAD_BASIC_INFO_COUNT;
+    kr = thread_info(thread, THREAD_BASIC_INFO, (thread_info_t)&info, &count);
+    mach_port_deallocate(mach_task_self(), thread);
+    if (kr != KERN_SUCCESS || (info.flags & TH_FLAGS_IDLE) != 0) {
+        error_setg_errno(errp, errno, "Unable to get thread CPU usage");
+        return -1;
+    }
+
+    *val_ms = ((info.user_time.seconds * 1000ll) +
+               (info.user_time.microseconds / 1000));
+    return 0;
 #elif defined(RUSAGE_THREAD)
     struct rusage ru;
     if (getrusage(RUSAGE_THREAD, &ru) < 0) {
-- 
2.37.3


