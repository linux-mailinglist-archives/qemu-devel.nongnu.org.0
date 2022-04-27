Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D493C511044
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:44:45 +0200 (CEST)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZXf-0000tf-TF
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSy-0001JS-8e
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:52 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSw-0007Ss-Pp
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:51 -0400
Received: by mail-pf1-x429.google.com with SMTP id j17so591692pfi.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vj2pfmJyu+VBd81eZurWJYtZCi/tXlPkPdE7lYV8+vU=;
 b=jf5CGVy71OVXkDaJBLz3nPkutTSMBLxKgKHhW5khl8DgYuGbP2iLlhWLuU0tMgmdj7
 cca0rz2RqMrxm7Nxt50TqBtpgWoKTLGkkuEfUanzVLeZcTUX6zSB8R9Ghi3C2Oxcnq/B
 o2R3I8AikVKxMWtjgYNFriny0lEJYWxiGccv1DLtdXYUdYVXmShCI+1G6Bxji9C62ROF
 8tj5kql9EgmoHui9QyfbFj36fYmMdXxRQqgQehDCKmf35zdSqKHP6yGZ4MNWHgQnScF7
 MmiznmER7BohnUWbnjXGjw6VJsrAV9U/BgSebw0M4bIvRm4GUgWq6BzNKIfBqnZvAi7/
 9MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vj2pfmJyu+VBd81eZurWJYtZCi/tXlPkPdE7lYV8+vU=;
 b=7vituUxd+uVRBfq19guCGE7QkD81Dq3afd7iJIRLA5hnN/P/PRBlIXncfKutPeY84A
 WvlwN+zM5wBIZqJrBeLDqAAuD3Jo4RDL3X0UdbBQGhC2zQGL2+iZCca+r20FVWlA0Bfg
 IPw8VQ1iV26NMV6aYjaD6etjfjOyVTYq+14EccFgdl0PM098T65qU3WusyQxYoo1HggM
 dor2x9NGsKQAMjmrXEXJPaj40YttN5lFKzSH4DUMLfhFz4WwIQsNTehLgocsmyDqPWsM
 afo1gFIR0vbg5j+4Xk0MzcWWVChxZ5D1pyIuOELYAG6GcLiGRGdZt/YIQKvaVv6y356H
 yH2A==
X-Gm-Message-State: AOAM5312GgePt3A7yuPKUUi2meEBI5JI32y+HgCdIl8IN1tF8UqH2BNW
 4TaLRo4mgbRkKQfhe72SH71kW8xTgimtHg==
X-Google-Smtp-Source: ABdhPJwXlNGW1G5TM3lujvL7S1oqXtntTqJGM/bSbpNQNmOZyLO3my9nM1k4mi7BzfuMbB+41mWwOg==
X-Received: by 2002:a63:4e62:0:b0:398:cb40:19b0 with SMTP id
 o34-20020a634e62000000b00398cb4019b0mr22679402pgl.445.1651034389269; 
 Tue, 26 Apr 2022 21:39:49 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] softfloat: Use FloatRelation for fracN_cmp
Date: Tue, 26 Apr 2022 21:39:42 -0700
Message-Id: <20220427043942.294654-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
References: <20220427043942.294654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the caller, partsN_compare, is now exclusively
using FloatRelation, it's clearer to use it here too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220401132240.79730-4-richard.henderson@linaro.org>
---
 fpu/softfloat.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e7d7ad56bc..4a871ef2a1 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -957,21 +957,23 @@ static void frac128_allones(FloatParts128 *a)
 
 #define frac_allones(A)  FRAC_GENERIC_64_128(allones, A)(A)
 
-static int frac64_cmp(FloatParts64 *a, FloatParts64 *b)
+static FloatRelation frac64_cmp(FloatParts64 *a, FloatParts64 *b)
 {
-    return a->frac == b->frac ? 0 : a->frac < b->frac ? -1 : 1;
+    return (a->frac == b->frac ? float_relation_equal
+            : a->frac < b->frac ? float_relation_less
+            : float_relation_greater);
 }
 
-static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
+static FloatRelation frac128_cmp(FloatParts128 *a, FloatParts128 *b)
 {
     uint64_t ta = a->frac_hi, tb = b->frac_hi;
     if (ta == tb) {
         ta = a->frac_lo, tb = b->frac_lo;
         if (ta == tb) {
-            return 0;
+            return float_relation_equal;
         }
     }
-    return ta < tb ? -1 : 1;
+    return ta < tb ? float_relation_less : float_relation_greater;
 }
 
 #define frac_cmp(A, B)  FRAC_GENERIC_64_128(cmp, A)(A, B)
-- 
2.34.1


