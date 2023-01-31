Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B4682A1E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:14:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndB-0002cx-8x; Tue, 31 Jan 2023 05:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncv-0002MI-Ou
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002Vr-L5
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1ZNKy9K2t1Y8kp+rRktgLfBGIHFH30iixopWYmR5wg=;
 b=Xv0Kw0CYujuN3L4fmF6I39FZsp/Q+2veOVw2CvYixklzcK3cQkH+HbhkcYa9TZP1nYSC+f
 3E8kvHL5/x/gg39PepB6dqtjAo6PjfsXztK/s2MZM/X7lkSHNSZ9fgkASffxjR3dnfXxDB
 QTvpsQ71cmZ/AY0YYSc1QxCVKZr6iOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-wcMzRUfMMdSlXRwBU8U_Lg-1; Tue, 31 Jan 2023 05:12:20 -0500
X-MC-Unique: wcMzRUfMMdSlXRwBU8U_Lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3233118483B4;
 Tue, 31 Jan 2023 10:12:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45F74C15BAD;
 Tue, 31 Jan 2023 10:12:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/27] qemu/bswap: Replace bswapXXs() by compiler
 __builtin_bswap()
Date: Tue, 31 Jan 2023 11:11:48 +0100
Message-Id: <20230131101205.1499867-11-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111163147.71761-3-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/bswap.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ca2b4c3f15..d2dafdc54c 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -50,29 +50,31 @@ static inline uint64_t bswap64(uint64_t x)
 
 static inline void bswap16s(uint16_t *s)
 {
-    *s = bswap16(*s);
+    *s = __builtin_bswap16(*s);
 }
 
 static inline void bswap32s(uint32_t *s)
 {
-    *s = bswap32(*s);
+    *s = __builtin_bswap32(*s);
 }
 
 static inline void bswap64s(uint64_t *s)
 {
-    *s = bswap64(*s);
+    *s = __builtin_bswap64(*s);
 }
 
 #if HOST_BIG_ENDIAN
 #define be_bswap(v, size) (v)
-#define le_bswap(v, size) glue(bswap, size)(v)
+#define le_bswap(v, size) glue(__builtin_bswap, size)(v)
 #define be_bswaps(v, size)
-#define le_bswaps(p, size) do { *p = glue(bswap, size)(*p); } while(0)
+#define le_bswaps(p, size) \
+            do { *p = glue(__builtin_bswap, size)(*p); } while (0)
 #else
 #define le_bswap(v, size) (v)
-#define be_bswap(v, size) glue(bswap, size)(v)
+#define be_bswap(v, size) glue(__builtin_bswap, size)(v)
 #define le_bswaps(v, size)
-#define be_bswaps(p, size) do { *p = glue(bswap, size)(*p); } while(0)
+#define be_bswaps(p, size) \
+            do { *p = glue(__builtin_bswap, size)(*p); } while (0)
 #endif
 
 /**
-- 
2.31.1


