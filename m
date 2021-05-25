Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CED38F7E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:06:35 +0200 (CEST)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMSo-0007lp-6T
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb3-00069R-LX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:02 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLat-0005rf-JO
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso874802pjx.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SH4+oKBkgsx+CH0p73raOV00OXwUsTnolQbkKecgOjI=;
 b=cDVmUV1VHw/NAk9I3IxKUTMAuAg33gh6ZbN4ljcgs5SuuXAEOTb0j8VThrSsutSWFS
 DF30gPA1Qu7/haAWedrADSDihpYOoSyCnzIY2F/azNzdgflLw4Ew1JE4gmfxsnCzzSQo
 5rYGf/Lfwl8STenGDajcAK0754myqpsF8svK193cThBnK5pYwPYRAVf0MZRH63pSOzIn
 QMeMZPJcHbkZl49gTu7FnDqNZc43w++/4llEaEdBj8ds4L8pqb/ELWRm4KEoL4SNyDRE
 gESMwP+QYxK7sdc93NCm5uFdPDwUzku7ylAJQytsR3S9aQNMKYAf5GFKBIAosYlUUTTn
 sRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SH4+oKBkgsx+CH0p73raOV00OXwUsTnolQbkKecgOjI=;
 b=COx3szWKAHxyZLdDK9Y6na+tmSFosZuRWQ+sLMyqfLkqGAemZGbuxwlxaPVT18gnLG
 YJJlatOE8TQ49GO5xXGoSrr6v4/s/2U3qKTo4RtulM7vpkUosNdsqZAdNW1wC0l/5rYw
 N1wbS1kueI7aNqzkrejaeUcQrEZnY31NhQUKrOOLGE0gOZR7zbeRbz51kYo326Q+C+Up
 Lscet5Z3RcFykSjBNik7bQNk3I+nobjKHdZzY0mAOYaST+6xtyjF3k8gFMYJT2lRxMMS
 CdLIbYizPb4GmBRi3fobXgmuhpq9+olhA8KytYTatXbqi5RIsSo35m/R7YdnPfcCPDUU
 en3g==
X-Gm-Message-State: AOAM530tpX5iF+mnidjZADfKHyh2lPLASAKgWiwFoaS9bP/YTG9p8Um5
 80rR6U+H/50tZaxykLE6H41ofoambo9i7w==
X-Google-Smtp-Source: ABdhPJyDDaQ9Y1v9o9GoV7IxwbbINwG+uNjaC45ctV7jCXKcogqXrUrB0t2Aflekkk+3UeIo2ckx+g==
X-Received: by 2002:a17:903:1c3:b029:f4:9624:2c69 with SMTP id
 e3-20020a17090301c3b02900f496242c69mr28258002plh.51.1621905049956; 
 Mon, 24 May 2021 18:10:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 81/92] target/arm: Move endian adjustment macros to
 vec_internal.h
Date: Mon, 24 May 2021 18:03:47 -0700
Message-Id: <20210525010358.152808-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have two copies of these, one set of which is not complete.
Move them to a common header.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 24 ++++++++++++++++++++++++
 target/arm/sve_helper.c   | 16 ----------------
 target/arm/vec_helper.c   | 12 ------------
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index ff694d870a..dba481e001 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -20,6 +20,30 @@
 #ifndef TARGET_ARM_VEC_INTERNALS_H
 #define TARGET_ARM_VEC_INTERNALS_H
 
+/*
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing units smaller than that needs a host-endian fixup.
+ *
+ * The H<N> macros are used when indexing an array of elements of size N.
+ *
+ * The H1_<N> macros are used when performing byte arithmetic and then
+ * casting the final pointer to a type of size N.
+ */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)   ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
+#define H2(x)   ((x) ^ 3)
+#define H4(x)   ((x) ^ 1)
+#else
+#define H1(x)   (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
+#define H2(x)   (x)
+#define H4(x)   (x)
+#endif
+
+
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
     uint64_t *d = vd + opr_sz;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4afb06fb2a..40af3024df 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -29,22 +29,6 @@
 #include "vec_internal.h"
 
 
-/* Note that vector data is stored in host-endian 64-bit chunks,
-   so addressing units smaller than that needs a host-endian fixup.  */
-#ifdef HOST_WORDS_BIGENDIAN
-#define H1(x)   ((x) ^ 7)
-#define H1_2(x) ((x) ^ 6)
-#define H1_4(x) ((x) ^ 4)
-#define H2(x)   ((x) ^ 3)
-#define H4(x)   ((x) ^ 1)
-#else
-#define H1(x)   (x)
-#define H1_2(x) (x)
-#define H1_4(x) (x)
-#define H2(x)   (x)
-#define H4(x)   (x)
-#endif
-
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
  *
  * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 21ae1258f2..f5af45375d 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -25,18 +25,6 @@
 #include "qemu/int128.h"
 #include "vec_internal.h"
 
-/* Note that vector data is stored in host-endian 64-bit chunks,
-   so addressing units smaller than that needs a host-endian fixup.  */
-#ifdef HOST_WORDS_BIGENDIAN
-#define H1(x)  ((x) ^ 7)
-#define H2(x)  ((x) ^ 3)
-#define H4(x)  ((x) ^ 1)
-#else
-#define H1(x)  (x)
-#define H2(x)  (x)
-#define H4(x)  (x)
-#endif
-
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
 int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
                      bool neg, bool round)
-- 
2.25.1


