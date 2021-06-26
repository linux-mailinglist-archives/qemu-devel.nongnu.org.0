Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E03B4CBF
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:08:23 +0200 (CEST)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0YI-0003Xh-Vq
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TQ-000746-FH
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:20 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TN-0008IL-32
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id c8so9140217pfp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lhsY62Axz8P4uEG2iGxE1nxCZRsB4mKyTgfXOvjyYjw=;
 b=a/00AzyrKg2sXXifK8rvABidCYpujudF5re+4qmV15W1VkOlaLx9Ipu9IMkEWbpkQ8
 somlR2OMZ+QuIr5L/wj/keWRucCNB3S5GqdvxH9SbDoXVQT20m24xyxYbvFs/EHzbUgb
 u1k8anGncFjHG9AwrW6otl10CohibYn6JlPqeLnyDvHbt7RNURQQKWIsxbx3kA2oyE5N
 /x/iT1cXlNzjIQVL8iI+d0Y5wf/FfOkHHj6+xyN6iUXbtUzy6Dv2f1NWiyGXVglbx0Tr
 UdeKdUF2jdyPYW6T/zswPtwIFWeN3FQQ1iTSO5JtsJPZ9/Nh/dITHpMvQP/FH9RQ/C37
 /4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lhsY62Axz8P4uEG2iGxE1nxCZRsB4mKyTgfXOvjyYjw=;
 b=RDd9M0cFwVMFmkY1j51vipRygHOyvGcxFjm/xxUw97EZvmQFGF4l88ISkqwQqFG9FY
 kT2p01M86aIXpRCeKLph2uuNTx+26SY6yUgrwaFVyvw7+uIFe+P8eSmxiNwnTDgB1Nn1
 KzjAEjrjJL/oBLCbz53Hc24j3WD94RHPSusg3l0XNUl2jIcW4uT0R6pMvDESNhUkdaMc
 CbtxsbbIhleqZGZO0k7vYPyRFLRN+f6pZNg5B7aGeb9KlokNw54Vnhz6nLEFQYUWcT+T
 7KfQuJAdFHE3t/ovkBD2bpdzyeVLO87rpg5k3ElTuKP+pTSvxfNvOBtJV8JcGALJ6IqH
 lUzg==
X-Gm-Message-State: AOAM531jYfZaxsDCKbQWFhkMZ8rZxkDj17uCTbhpXXWZxFPcaZnXHXAy
 4bvAU/ClPbxrBrB676sCIhz2c9b3LAeUUw==
X-Google-Smtp-Source: ABdhPJx/V5z+hGU3VJb6QfYdsSt/1YtfWEaKtZocbli5yP/NSZdqcbSlNPwxXTj2EayAL0YOmKviiA==
X-Received: by 2002:a63:312:: with SMTP id 18mr12892136pgd.33.1624683795797;
 Fri, 25 Jun 2021 22:03:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/16] tcg: Expand usadd/ussub with umin/umax
Date: Fri, 25 Jun 2021 22:03:04 -0700
Message-Id: <20210626050307.2408505-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For usadd, we only have to consider overflow.  Since ~B + B == -1,
the maximum value for A that saturates is ~B.

For ussub, we only have to consider underflow.  The minimum value
that saturates to 0 from A - B is B.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-vec.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 15e026ae49..7705a49c0b 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -119,6 +119,18 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
                 continue;
             }
             break;
+        case INDEX_op_usadd_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_umin_vec, type, vece) ||
+                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
+        case INDEX_op_ussub_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_umax_vec, type, vece) ||
+                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
         case INDEX_op_cmpsel_vec:
         case INDEX_op_smin_vec:
         case INDEX_op_smax_vec:
@@ -603,7 +615,18 @@ void tcg_gen_ssadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_usadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    do_op3_nofail(vece, r, a, b, INDEX_op_usadd_vec);
+    if (!do_op3(vece, r, a, b, INDEX_op_usadd_vec)) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec t = tcg_temp_new_vec_matching(r);
+
+        /* usadd(a, b) = min(a, ~b) + b */
+        tcg_gen_not_vec(vece, t, b);
+        tcg_gen_umin_vec(vece, t, t, a);
+        tcg_gen_add_vec(vece, r, r, b);
+
+        tcg_temp_free_vec(t);
+        tcg_swap_vecop_list(hold_list);
+    }
 }
 
 void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
@@ -613,7 +636,17 @@ void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_ussub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    do_op3_nofail(vece, r, a, b, INDEX_op_ussub_vec);
+    if (!do_op3(vece, r, a, b, INDEX_op_ussub_vec)) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec t = tcg_temp_new_vec_matching(r);
+
+        /* ussub(a, b) = max(a, b) - b */
+        tcg_gen_umax_vec(vece, t, a, b);
+        tcg_gen_sub_vec(vece, r, t, b);
+
+        tcg_temp_free_vec(t);
+        tcg_swap_vecop_list(hold_list);
+    }
 }
 
 static void do_minmax(unsigned vece, TCGv_vec r, TCGv_vec a,
-- 
2.25.1


