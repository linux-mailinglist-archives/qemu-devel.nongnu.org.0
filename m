Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC942E2C62
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:38:26 +0100 (CET)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstqz-0003CH-Im
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZS-0003HQ-7E
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:18 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZO-0005Ex-Nb
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:17 -0500
Received: by mail-pg1-x52a.google.com with SMTP id f17so3496223pge.6
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FnMPyDvv8qty8IO8qnH26ldICiCh5lihNUWEYMvpptg=;
 b=UbicDmUAJvMOGsWSkGL/+mVIvw5Ma7ysXht2PJH0KvhUiGENQR6YxRuo9xOA+19bBl
 rXhRRCwya9LCiM22txikfDlabxIsknrVn4US+rsLpsNsp3WSj0Zs4VfY/LdTazVKUasA
 16dVOI+qjtYrdG9TM64yUI6BCfK0R1Tqf003A2lSh3rQrSUOOH4NoPoooWJvYkrgIeFO
 MPwWni+KDMkU2DLoiqbXynnOSn0MeDyXhzNbQ5tj3n6lJfkaAs8zqZGTaOghboToqkxG
 LgL8SZc+wJdcsywLCvXQDNTwg1ZKdlARCQWK6JI3C25UvrqnfmF5s6pqmJkWmjuA1bR0
 R8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnMPyDvv8qty8IO8qnH26ldICiCh5lihNUWEYMvpptg=;
 b=h7+SZsFpwTowlrNHUSmm70WDch0hYCAxpVJfGr9bqAwsSCWKRSVL6wy2jN1Qi+rHEN
 Y2Rp/6pd5fJz/GD74Pg4REzANSoZe9nNDYUj7snpLSNVhpk66eEPwAqb1N4gZBVLZzUF
 JkcFaSidgVgPJWBY0ezouzR+/lTA2SxB/HVXFtSDPFYkokAHSWSYXZqa5bGLrzbZcFsD
 BkkykvxwRgQdZAiREvmqASuJ2HNzs354H/HQYx0Yia2IKzDkRB37H6PagFHA097qUnh3
 WYVICOwy4vgUEU87vTMwH0pzGRHuSBXjCip7ooIwIp1B99VYTG0I8djud+Ggf+qsuUsf
 t5Fw==
X-Gm-Message-State: AOAM531B4INbn2divtHdnF9TLfoZ2V1G2xYbpXq2cDw6ZMSIjP3tRWmw
 S5pBwSkVeP8KvI9qnsvC5+LS2sLDkWAs1Q==
X-Google-Smtp-Source: ABdhPJyGP8iE2YL5NiJXt2VTlddYszrapT5DMrWpykWNMzYNzeBaqdB3/BSCU1VOEfItWlrZhGJRAg==
X-Received: by 2002:aa7:9f0f:0:b029:19b:c68f:61cd with SMTP id
 g15-20020aa79f0f0000b029019bc68f61cdmr31432212pfr.45.1608927612954; 
 Fri, 25 Dec 2020 12:20:12 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/16] tcg: Expand usadd/ussub with umin/umax
Date: Fri, 25 Dec 2020 12:19:53 -0800
Message-Id: <20201225201956.692861-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


