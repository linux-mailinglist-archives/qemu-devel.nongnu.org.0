Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA131299E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:03:18 +0100 (CET)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xld-0001m1-9R
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZc-000437-WE
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:50 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZY-00009b-7c
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:48 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a16so7023998plh.8
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pW9wjxLXorRLCkTNii0jQEnXahS9j0N+pGdhyNQW8cQ=;
 b=zxSaogKH3uce2RhD6UFHeC4yLzI/Gyu+Pe1SwLVSl9Xp0jueHItRls0qVVEAELTJXF
 CY/8y5/B4V+nmgTU5TxI8gyP5WJh21RqE/YF9bGC+C+rSzGgiT5pPfzKEewVIHiVaOoq
 z6+H00806Hd5g8IKi+wo89pEvZ4Ajn6F/s5eu90Zvj45RK0aoDGjYH0jvVYi+PiBqtqG
 eLjzSL47hMubQKWjlrUHC/YSUMw3JfhzQu7LciS9jOZUEQCWwMdnkhiglWScF4qKgE3v
 EsQ7vSShcU6f6Od7OCaN452ZbM3RqS3wiejPw+Ilw209eTGw6WIN6Fx/YAxaZ+I+LWuJ
 MWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pW9wjxLXorRLCkTNii0jQEnXahS9j0N+pGdhyNQW8cQ=;
 b=L4oI6GCa/xxq8QuDUvNfzJGQGTZywtMWHQJGMSf8RroRq51H/xOwdQqNxl4HaQgrkv
 lAlISyRFz9U7Fn4qmFfs0O1I45b+hqjLcgtGhXWmQBn+l5WHuz6AUGytE4Rq/4geB6S5
 Wx/tQuBPCLjWz8xi3wLFbq8Hm4RU3DGXRXnRkQEbgXn21IHCqPloLxw+kTHJu++nnH3T
 wOfRV74t9XXWA83Fr1S70w+BzxFVoTH7HACDWGvYSOJqa7lgvTuXU//zFTr5xRvrw2dm
 WW1DoUFqtsHHqV6zF/ydq/isbe0XkpKbcZ0rTIan5RjXjz0nnJQGLJcFLqz480yLBM6F
 LMQg==
X-Gm-Message-State: AOAM533/y2hKhWgCXl7/d2ADTtkE/gk0NhLzD7elfZmshLnISF/YUa4l
 YRfdSTmJi4shm3m+sp5ko+v34VQn9c8Hrw==
X-Google-Smtp-Source: ABdhPJwdIPSUSTFtxZEfG1ErhMNH1EdSkLN5CyG/WZbfElUM0nmTtwDuGylcdWkq70dWhMcSeq4fAg==
X-Received: by 2002:a17:90a:4606:: with SMTP id
 w6mr15086913pjg.205.1612752403133; 
 Sun, 07 Feb 2021 18:46:43 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] tcg/arm: Implement TCG_TARGET_HAS_rotv_vec
Date: Sun,  7 Feb 2021 18:46:25 -0800
Message-Id: <20210208024625.271018-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Implement via expansion, so don't actually set TCG_TARGET_HAS_rotv_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3150aae8d6..a930d51e92 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2977,6 +2977,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
     case INDEX_op_rotli_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
         return -1;
     default:
         return 0;
@@ -2987,7 +2989,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t1;
+    TCGv_vec v0, v1, v2, t1, t2, c1;
     TCGArg a2;
 
     va_start(va, a0);
@@ -3032,6 +3034,37 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t1);
         break;
 
+    case INDEX_op_rotlv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        t1 = tcg_temp_new_vec(type);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_sub_vec(vece, t1, v2, c1);
+        /* Right shifts are negative left shifts for NEON.  */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        tcg_gen_or_vec(vece, v0, v0, t1);
+        tcg_temp_free_vec(t1);
+        break;
+
+    case INDEX_op_rotrv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        t1 = tcg_temp_new_vec(type);
+        t2 = tcg_temp_new_vec(type);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_neg_vec(vece, t1, v2);
+        tcg_gen_sub_vec(vece, t2, c1, v2);
+        /* Right shifts are negative left shifts for NEON.  */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t2));
+        tcg_gen_or_vec(vece, v0, t1, t2);
+        tcg_temp_free_vec(t1);
+        tcg_temp_free_vec(t2);
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


