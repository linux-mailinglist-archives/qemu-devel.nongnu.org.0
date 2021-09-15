Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C540CEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:38:32 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcbv-0000Sg-W4
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcVB-0003rw-Hq
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV9-0003Rh-O9
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 il14-20020a17090b164e00b0019c7a7c362dso264583pjb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0VVfddpuwAtx2pRoPpsQ0YwoF7o53EICFyxHEJHFwvM=;
 b=aQgYJpC8tUkjKHBAgtIcLe34FZDNO0asLyPCFz1Ttgvna6Cxafot/NLqGtZRxdi40n
 bTaKoMe6DgEBzL6hVzwdjdB6/vvrTyTOWk/sofyM5RhbYNcoxUumUvn9n3TbNswU+c5R
 eLYGhzTZxzPXz7nwkauWLBp1IaOkS+fMFrUEzq200lkCJcynaLDr6w2z/EaKZ1PAxvF5
 D7CkmveM8Gu7yQdI9ZgBe2ylQj70Gr0Ttt/qPUBwFNK3LgBer8rIVA5T5Rp8KcYBP+TO
 hdWwQdysfbsQDPZksZdZjTjOvCxtE3xbWlbYwBIwC+pWalEkLq0W+uU8PncObmEY41/A
 cotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0VVfddpuwAtx2pRoPpsQ0YwoF7o53EICFyxHEJHFwvM=;
 b=8P+RVyxu8FSl06BI1rio3ZPmPIISmBpsgaEl8eDAapUaDygA2Y5gAbdIs4CWflQXWM
 IiyR7tcLgNs094DQeGbQDoa/JDuNaIerIDz1swQ1/HNwTCMin+5QZfCwFbP+rYsLvqyM
 TMwduzdC1FbQ5yguL7fbC9edCcslk/INyFyqu1RszLp3krcNik0XvPC801EEciseDJ6b
 +xRqkMkorj+YeYSgQe09gaCfgB1vsqPYfYGQ5A1IFBFPnoKTmYhB4OoAbugisKtUSBIf
 iBMqwW5q0W2ll4F11+G5aOoLjXBiQHuwv1R1nepTV87XnSz+2uyYJa3QEHXjPxQ7A6AW
 aYkA==
X-Gm-Message-State: AOAM533D07WuqG2b6TDHeITpsatz9HqKrjZTPZ0LkhVkf4pvAe4pl0zy
 n+0yHN+2AVgEq4uADHIs0ZrreLJkKDvcxw==
X-Google-Smtp-Source: ABdhPJwQAmMpSMdNwwN6yu7PUaa76U6W8kK94dmw4iYccgC15Q9heq5ocZuogOF86qVYBYpRdgpnkw==
X-Received: by 2002:a17:902:9309:b0:13a:5519:6fa3 with SMTP id
 bc9-20020a170902930900b0013a55196fa3mr1600676plb.5.1631741490383; 
 Wed, 15 Sep 2021 14:31:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/16] tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
Date: Wed, 15 Sep 2021 14:31:14 -0700
Message-Id: <20210915213114.1923776-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

This is via expansion; don't actually set TCG_TARGET_HAS_cmpsel_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 5530c974a6..aef24d0795 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2869,6 +2869,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
+    case INDEX_op_cmpsel_vec:
     case INDEX_op_rotrv_vec:
         return -1;
     case INDEX_op_mul_vec:
@@ -2931,6 +2932,21 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_cmpsel(TCGType type, unsigned vece, TCGv_vec v0,
+                              TCGv_vec c1, TCGv_vec c2,
+                              TCGv_vec v3, TCGv_vec v4, TCGCond cond)
+{
+    TCGv_vec t = tcg_temp_new_vec(type);
+
+    if (expand_vec_cmp_noinv(type, vece, t, c1, c2, cond)) {
+        /* Invert the sense of the compare by swapping arguments.  */
+        tcg_gen_bitsel_vec(vece, v0, t, v4, v3);
+    } else {
+        tcg_gen_bitsel_vec(vece, v0, t, v3, v4);
+    }
+    tcg_temp_free_vec(t);
+}
+
 static void expand_vec_sat(TCGType type, unsigned vece, TCGv_vec v0,
                            TCGv_vec v1, TCGv_vec v2, TCGOpcode add_sub_opc)
 {
@@ -2972,7 +2988,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t0;
+    TCGv_vec v0, v1, v2, v3, v4, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2984,6 +3000,12 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
 
+    case INDEX_op_cmpsel_vec:
+        v3 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+        v4 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+        expand_vec_cmpsel(type, vece, v0, v1, v2, v3, v4, va_arg(va, TCGArg));
+        break;
+
     case INDEX_op_rotrv_vec:
         t0 = tcg_temp_new_vec(type);
         tcg_gen_neg_vec(vece, t0, v2);
-- 
2.25.1


