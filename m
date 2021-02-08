Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6F312989
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:49:39 +0100 (CET)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xYR-0003Tb-0M
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8we0-0008Jn-HO
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:20 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdy-0001Ow-V7
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:20 -0500
Received: by mail-pj1-x1031.google.com with SMTP id e9so7955190pjj.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FnMPyDvv8qty8IO8qnH26ldICiCh5lihNUWEYMvpptg=;
 b=yoHpBcbKKvkGr/i2BhZ6r6txdvgIkf9a2j0+qxbnBZNnvcVi93/tMvVPogMT2QWj69
 IAwJTzEbuFrr1gdB3rhjCz5P+73jTxaNwFWMyYx7XOQ2Z4hm9Jn1WpyPP4CDmxiNUj1t
 w7vNZtGyEhM+sZ0V4auPAvdh4cYv3AilfjAvkVuRWGYo5ZENRkKnbhgubiucrcKY78hk
 So550p+wqiToPsMFt1XueT2FC2L6iIRnXeRLzxcat2bOsmj52xKCsbaGHhdNDdDEl3s7
 k/EZw7Divpg6rrWVKVfOwVxfRwU7SIPMcFy3ojjUxnaMB7oY35r9ttllQJXtRBDg00YN
 aKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnMPyDvv8qty8IO8qnH26ldICiCh5lihNUWEYMvpptg=;
 b=B6Yf+p0d6b5lWBaHyQNZdWULC3Ubb5A7h2xIS+IsnF1ZFQfxEly+Ag+M4SzOlx4sja
 I7p5C/ipZ4LXR6KRLobH43O8Ko4Qq45sD5/HJ74xDyMaH0VymtocM6oCY212cLhjCPty
 7YUTVzkEP/SXyuJLeWbumiuoueoubrBGGJagZkYjdAWIu4NfFHJnmLl1BYu5c+ZblGTX
 cv+NWbxgBiFqCjt/HKZcgP/IYDilyn0l1mFB/HiQreRldkOi49Pq/8VtcDO7wRk5B7uv
 +OrodgWfszMAoVq2MeCq5bA2QlmEQl8f1Gfwy7dta9klwoWiG+XdyYKeoG8Q6f/scHUq
 BssA==
X-Gm-Message-State: AOAM531gDZqf9emnejY9s6Wh+9PyIYVDYyv73I++2fIOdV1fpzcwwqK7
 zjehUHDQPQ2ZzbkYtlVwqGi0RJmDE8ZUnA==
X-Google-Smtp-Source: ABdhPJwUX+G3B9lIce4NIqkaiRq9oOhpYWbm5tqa3YLZB7++LOtDc2a3Jj6hHdtX9OoERk14kv3p5Q==
X-Received: by 2002:a17:90a:e292:: with SMTP id
 d18mr14684029pjz.66.1612752677803; 
 Sun, 07 Feb 2021 18:51:17 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/16] tcg: Expand usadd/ussub with umin/umax
Date: Sun,  7 Feb 2021 18:50:58 -0800
Message-Id: <20210208025101.271726-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

For usadd, we only have to consider overflow.  Since ~B + B == -1,
the maximum value for A that saturates is ~B.

For ussub, we only have to consider underflow.  The minimum value
that saturates to 0 from A - B is B.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-vec.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index d19aa7373e..9747b7bb06 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -120,6 +120,18 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
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
@@ -604,7 +616,18 @@ void tcg_gen_ssadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
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
@@ -614,7 +637,17 @@ void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
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


