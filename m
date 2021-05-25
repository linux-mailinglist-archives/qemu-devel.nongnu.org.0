Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962D3906B4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:31:31 +0200 (CEST)
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZxq-0001K9-4h
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeu-0002jN-99
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeq-00074v-70
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso10487396wmc.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m1Z2euE9ySY9yP/ctOaB7Nsf07wGpoIEhrwtAI4K6WQ=;
 b=otKqgPM5+UxCfMBCVWFlka0k2OaRHvxDsGj3LgcuAB/s2eOnpVJSSXpNl4QL8d6Xw5
 N6XBkJB6gshJKlLJ/eYPxa7zbxkPlUl+eTacM1bs5i9gEq41wF0JGumoH46Jq8RJPwaV
 nRCS8XWhXZyVVj1h2wVeyqL2FnS5gAHqqTSwOgK2XgI3PuxP8snFgsaI9UwFdSwGNv7e
 xC8b9i5J2Pxj8y4WEbTSdClTF89h7m6U6pZNX2F7OE/MjTWOU8Y19AsidV9w4CdXd+4B
 RaDIfbNho7YJEKt0ObSl10hE/nNotyfRa0g2kMNZaX4vFN+GgfZJkHRZAjmHBKoj/VKN
 P5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1Z2euE9ySY9yP/ctOaB7Nsf07wGpoIEhrwtAI4K6WQ=;
 b=cFug29zGBf8LeZm3fJXAiB8OtWhtBopQKorT47xXYcZQVXJgsbYbbd0HkcWS+8C3v9
 Uh/Ojy4gUKsNndGnK/sWbzeS4Y9qMyeutCuUbmudj1LvJ7WoUf7TKrEzPIKDF6SRelm9
 HYaDnJQemxKy9/gsAWGwjyJ0diQp9wbTEZjVHFaJDF+UeCe02vYE6xKISOzVOHKeA7y8
 g1WvEpH8wWVOXAJB633kBfDhQUE4izS21vKULNwgej/j+qmcwYIffpDkyAmUiXA2gGXa
 yBFLfrC66kx1opSG0jzl/qbOMqAPe8LLdzxvpmrEVVRxEiT8U1x2qq33t0SC2c53VuLp
 rcHA==
X-Gm-Message-State: AOAM532UlOgXEmd8HbtWNLfYVtrr9Gd1IxufysqKrbDmWCgP+EKM9MGR
 GA8fGZZgSgKgwNfcwUJZxjdrBOLtTAZgcAeo
X-Google-Smtp-Source: ABdhPJyMmooDbBv61Dq1ykr66gEXMKxVhMnsYOnaSLpQVic9urnoszheeS20B9XrgRbjPwjNegDiaw==
X-Received: by 2002:a05:600c:410a:: with SMTP id
 j10mr25258303wmi.5.1621955266650; 
 Tue, 25 May 2021 08:07:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 103/114] target/arm: Move endian adjustment macros to
 vec_internal.h
Date: Tue, 25 May 2021 16:07:25 +0100
Message-Id: <20210525150736.32695-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We have two copies of these, one set of which is not complete.
Move them to a common header.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-82-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_internal.h | 24 ++++++++++++++++++++++++
 target/arm/sve_helper.c   | 16 ----------------
 target/arm/vec_helper.c   | 12 ------------
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index ff694d870ac..dba481e0012 100644
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
index 4afb06fb2a1..40af3024dfb 100644
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
index 21ae1258f2e..f5af45375df 100644
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
2.20.1


