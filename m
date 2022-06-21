Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA069552F1A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:48:17 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aUa-0002Zq-RM
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQr-0007hq-0P; Tue, 21 Jun 2022 05:44:25 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:37400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQp-0007Mk-DT; Tue, 21 Jun 2022 05:44:24 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so10274251otu.4; 
 Tue, 21 Jun 2022 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RJDvDPS1MFWVDLMbLiQZhvWhw1KQ6ONZCt9Aye1gJ4=;
 b=Ixq26HJh6mBCFMIO4gDACSHS93xYtEgd+dMTTiEgtvKE6ajRYLGD2GyToFArOfDo7j
 JpjJpQMvK2qTP9t4MIfkz/9R1NDZiqrMP+m6iPycMbyN+5wCKti5OpHpItP5As3mk5iS
 SjX5h0YozvS3nhJXRBCtssGTahsZr+orQ1pYtUzaou389LyCpWbDjHjNLaZZv41uD9Cd
 KUnGbVPCEtireQzKIhYJLxGDzYi2byL+ot3U3jX6ag1WdbMAHbCs3Jr+6z1XR/wZLUtV
 3O8jMlGnZbK8I+pQV2Rw3ZcuRiXW1ENtpzizQ1XsoX/KtkE7gahraxciN9N503jZPgJI
 WXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RJDvDPS1MFWVDLMbLiQZhvWhw1KQ6ONZCt9Aye1gJ4=;
 b=oHRKRJfVLMyPtzH+ZQGJyvGcrvgHq5eIEIJbXSSLjSUCZEi7liHaqu2n7ls5BvIlZa
 Mz8Q/a3q4cJMklYXzmUds/6uhsTO0NT+tFm5eC61E69+iCC6f9N/nWZ4pd1g9NEWBvno
 I8RfygNMosnhN2FgipzrDXwz0w0y74xI42V5EowMDatA8bnlq+Up2DxOjtCBukFoWm97
 VLOTfPNUNv8cAiBeziiCGwl/8aaZY303d3KGb+AbIjeBlMSnWQaiYjdsO7uHY79X3MAJ
 JnfiI1AYK5+bu+oE82rVUd95oPAJxT0AbHngxf6xu2+bd8Rp7Qk/peER4ZJS0uMDsmlZ
 6kuQ==
X-Gm-Message-State: AJIora8ltJoVt8VHF1ZruDEm/1ELxzJe9Nt8mfFIrv4dLf5rT57Pnb4O
 30H97rh3mYo9tfUGjD1X6w7ap90jfXdL5Q==
X-Google-Smtp-Source: AGRyM1s6vsm7xscNGWu5Qfyxv/a1ij5LrTS1zBDSvGNv4UCclbm+vcTe9InWMZtQeUT/z0PTU/zqiA==
X-Received: by 2002:a05:6830:1e3c:b0:60c:a24:d064 with SMTP id
 t28-20020a0568301e3c00b0060c0a24d064mr11293231otr.48.1655804657863; 
 Tue, 21 Jun 2022 02:44:17 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 05/15] host-utils: Implemented signed 256-by-128 division
Date: Tue, 21 Jun 2022 06:43:50 -0300
Message-Id: <20220621094400.122800-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Based on already existing QEMU implementation created a signed
256 bit by 128 bit division needed to implement the vector divide
extended signed quadword instruction from PowerISA 3.1

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-6-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/qemu/host-utils.h |  1 +
 util/host-utils.c         | 51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 9767af7573..bc743f5e32 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -851,4 +851,5 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
 }
 
 Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
 #endif
diff --git a/util/host-utils.c b/util/host-utils.c
index 93dfb1b6ab..fb91bcba82 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -395,3 +395,54 @@ Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
         return rem;
     }
 }
+
+/*
+ * Signed 256-by-128 division.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    bool neg_quotient = false, neg_remainder = false;
+    Int128 unsig_hi = *phigh, unsig_lo = *plow;
+    Int128 rem;
+
+    if (!int128_nonneg(*phigh)) {
+        neg_quotient = !neg_quotient;
+        neg_remainder = !neg_remainder;
+
+        if (!int128_nz(unsig_lo)) {
+            unsig_hi = int128_neg(unsig_hi);
+        } else {
+            unsig_hi = int128_not(unsig_hi);
+            unsig_lo = int128_neg(unsig_lo);
+        }
+    }
+
+    if (!int128_nonneg(divisor)) {
+        neg_quotient = !neg_quotient;
+
+        divisor = int128_neg(divisor);
+    }
+
+    rem = divu256(&unsig_lo, &unsig_hi, divisor);
+
+    if (neg_quotient) {
+        if (!int128_nz(unsig_lo)) {
+            *phigh = int128_neg(unsig_hi);
+            *plow = int128_zero();
+        } else {
+            *phigh = int128_not(unsig_hi);
+            *plow = int128_neg(unsig_lo);
+        }
+    } else {
+        *phigh = unsig_hi;
+        *plow = unsig_lo;
+    }
+
+    if (neg_remainder) {
+        return int128_neg(rem);
+    } else {
+        return rem;
+    }
+}
-- 
2.36.1


