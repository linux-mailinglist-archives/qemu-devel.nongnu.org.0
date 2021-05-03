Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2536371FE4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:46:53 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddam-0001OA-NB
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQK-0005pu-9s
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:04 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ8-0008I6-NU
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so4836066pfl.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnMPyDvv8qty8IO8qnH26ldICiCh5lihNUWEYMvpptg=;
 b=Ct3iOL7+iU01jb08pwg0eBbzpcObKDsiiDkp5tNQZfjvwa/c3KPcxPzYDyvnF++2XW
 Oo12epaxEM6Y8wl7ZFTtKh8QIQ1nc9/c6oh/zs3Fd+oQElrWRvMAzrNNWLUdwjeLwE6N
 lJf8wc+1IGJ5ZGsskRbhMDeLgZIJ6UPRP0gav7To8MaDYQYfgcF91VvTHfizbOlAEe46
 Qwa6qS5Lstm9st+SrRwNhvY7m6OxRBCxeb5UR2KZZkZFZaTlgZdu3rexv8dQ2d4Krb4H
 iwgqT1ZcxfA6GWICbJB3DlMJtmdntbqkQ3FNK/eIH3ZIwzOhKUm1KSP7wavhKWeC1pUl
 ZUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnMPyDvv8qty8IO8qnH26ldICiCh5lihNUWEYMvpptg=;
 b=tnNoUZZACvJqTqzgmEB9B6pozofnU2oWBWtBtMaoBYKhjPzUe2LgT2OHkwmyTJYz9l
 S657PfXO/0xaQts1Xbo1gT+Uf1gWjL2Xz+hEoVV4F7pfKeAEXCORuqT/AOazwbQwyNOU
 YtMlSymEyCxRFnwt7GwCixICHHwg0F150x1sIAdrFbqtUG2K8H5Vof2tP9YbukLilGzG
 MPCJWjdeOZhllu8KzhY5FM7if8ivpUiOGZ7yLLQZ0Vk7W83UUpooWfieYDFTcwwXmqTq
 XJmZmqsG5huA9gtGf5BbKQiSOmEnlTDtUzAPdzGb0HIepeXsaWNgwdOmCPfHvC1sdy7Z
 CwAQ==
X-Gm-Message-State: AOAM532sLbLWxEzutnPDoyG2UBt4R73Y9NJ4va7jNRF+DpdEwOBqGT/6
 Xi3cHj47eron2eJkYDMs/kzGRSje5jUGKw==
X-Google-Smtp-Source: ABdhPJzPtcFcvnxM9yHL1l3so7+Jr0kIUEWwXOQtupjKDV+aNk+LFjx2gVOT4EAZ35dredj7szL+Zw==
X-Received: by 2002:a62:b609:0:b029:28e:af60:60f5 with SMTP id
 j9-20020a62b6090000b029028eaf6060f5mr3931436pff.43.1620066951074; 
 Mon, 03 May 2021 11:35:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/16] tcg: Expand usadd/ussub with umin/umax
Date: Mon,  3 May 2021 11:35:38 -0700
Message-Id: <20210503183541.2014496-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: thuth@redhat.com, david@redhat.com
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


