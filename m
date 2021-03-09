Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAA332C3C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:37:36 +0100 (CET)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfMT-0004A5-Jj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefY-0004fn-7q
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:12 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefW-0001CO-2x
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:11 -0500
Received: by mail-oi1-x22e.google.com with SMTP id f3so15386230oiw.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1hAPjphDb7JdVH1DtHKU8lsgpgDqsKcv7jopV79CjZI=;
 b=eCmZkqmXhq0JQRYodrXdKzTsrDv4ke+pHdvpD0Rm6GmmCBJ22XF+M/l5v+3wZ/9M/n
 3EoQAuuIjhSSK9dZB1le6ZhKt8PYH4ctL3IAFAxr8j86QrgtUe/ZvWlnWRIc+SxjoMgF
 py5ZegefUN57h/AR9BIlK0vj1BujA6s3fj1p8j1nxTKSYyzu/A0BB8lkrveeFNq2zfvK
 Tf0JqrrTg0Pl8iqSJGBMYzHXYMdy4IvKWmIKWyiMrVmkwCbzLblTu2Zh4eZwNJIvDXKU
 kek1L7y047NThnmZ2iURiJTguKJt2ZOMJI1xOg4cKldRqzV3UVMroYe/rKQFsVlOlXl5
 WENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1hAPjphDb7JdVH1DtHKU8lsgpgDqsKcv7jopV79CjZI=;
 b=mjbZOhMrAD6C7jdujm9CKfH/r9gi+xXIkvBiJ1ih/tEXj+4p6coIbAwpYXI6MzzGC9
 tgA8U9+aObl/HEbyaVeMfqHLIgsf6UMzLNTtvD682awgiplviu+DagV7HTOPAtIH+m/s
 4gkUyJbGVQBfRYFPhDPU1DPUGhL2kscHYr7ktaDTnLnSy5kqdCFjqdpFEh5MlXA0Mx2F
 idIMiURIu1K5ADi1PLj01yhSXD3BdMFaV+nYRUXGcqvgg7gRU/hg7MjYBE3ixZhqH7gs
 yJao0AbYFSmsLz+birnsLFXwQI3NY46mvzLzXde6glZKwW8WpwhAmN1x7HmToAUMMVji
 bewA==
X-Gm-Message-State: AOAM532yHXLkYFRouVJ0O603V6yr57MsKYqV2S1uqS/ifhl569yUTga6
 JSFhNy1r/g6I0ABKxvZfqV8Tu5twtBFJtfcu
X-Google-Smtp-Source: ABdhPJxirUUwwYaCdTJLEPWLQkAkR9dTv/SFxI0l/bSIhQDvAowMiEidhv73YyD39NrbW1knZx3n/g==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr3475624oib.40.1615305189002; 
 Tue, 09 Mar 2021 07:53:09 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/8] target/arm: Fix sve_uzp_p vs odd vector lengths
Date: Tue,  9 Mar 2021 07:52:58 -0800
Message-Id: <20210309155305.11301-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missed out on compressing the second half of a predicate
with length vl % 512 > 256.

Adjust all of the x + (y << s) to x | (y << s) as a
general style fix.  Drop the extract64 because the input
uint64_t are known to be already zero-extended from the
current size of the predicate.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 844db08bd5..11c9397dbb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1939,7 +1939,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     if (oprsz <= 8) {
         l = compress_bits(n[0] >> odd, esz);
         h = compress_bits(m[0] >> odd, esz);
-        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
+        d[0] = l | (h << (4 * oprsz));
     } else {
         ARMPredicateReg tmp_m;
         intptr_t oprsz_16 = oprsz / 16;
@@ -1953,23 +1953,35 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
             h = n[2 * i + 1];
             l = compress_bits(l >> odd, esz);
             h = compress_bits(h >> odd, esz);
-            d[i] = l + (h << 32);
+            d[i] = l | (h << 32);
         }
 
-        /* For VL which is not a power of 2, the results from M do not
-           align nicely with the uint64_t for D.  Put the aligned results
-           from M into TMP_M and then copy it into place afterward.  */
+        /*
+         * For VL which is not a multiple of 512, the results from M do not
+         * align nicely with the uint64_t for D.  Put the aligned results
+         * from M into TMP_M and then copy it into place afterward.
+         */
         if (oprsz & 15) {
-            d[i] = compress_bits(n[2 * i] >> odd, esz);
+            int final_shift = (oprsz & 15) * 2;
+
+            l = n[2 * i + 0];
+            h = n[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            d[i] = l | (h << final_shift);
 
             for (i = 0; i < oprsz_16; i++) {
                 l = m[2 * i + 0];
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                tmp_m.p[i] = l + (h << 32);
+                tmp_m.p[i] = l | (h << 32);
             }
-            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
+            l = m[2 * i + 0];
+            h = m[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            tmp_m.p[i] = l | (h << final_shift);
 
             swap_memmove(vd + oprsz / 2, &tmp_m, oprsz / 2);
         } else {
@@ -1978,7 +1990,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                d[oprsz_16 + i] = l + (h << 32);
+                d[oprsz_16 + i] = l | (h << 32);
             }
         }
     }
-- 
2.25.1


