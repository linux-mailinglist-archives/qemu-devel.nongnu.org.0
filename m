Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312CD6F8B08
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vt-0001H9-1y; Fri, 05 May 2023 17:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vX-0000qh-Q2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vQ-0004g4-11
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:19 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso2068801f8f.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321910; x=1685913910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBlLTyWKOiEkOq0J5b/GXBVDB4TkoIkhZS8BOvAsaM4=;
 b=kDLX2I/ck4Y1SWTYt3GY7GLelgGdJEDdkhKvGdzf+Bpz04Vx6ybwmomd2LbATuojc+
 GcoZ5Er/bdWZm7OLlC7I4grDSBjRaHLbxouhhZZ4ZJbGJak3VMMWlwu8NadX08RjknIq
 FAh93bsJnhq+Jqf8Yek1Qb9hY4WxfmWSKh5Qlp7LOV+AxVo1liN6k9yh4GYqklCYNPVa
 16BlzlfvLTShpE8v5R1k1SFdq0jYh0PstSQ+1SDXoMVgp/0PwFUV87ISXQGWRpsXHQON
 r7wLgNHGYkp2X0ulna/Jn5OQ3NEx2rkkKubPoEeLsw1MnwZFbAKil8FNcO8nR62ydV7C
 pOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321910; x=1685913910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBlLTyWKOiEkOq0J5b/GXBVDB4TkoIkhZS8BOvAsaM4=;
 b=BpP5GuB9RXB+YKNlnMeNjv2tJo+tml+QyopG+G4SITKfhyaqmEZ5waHpbhA+gVGFDW
 yxqQddhBOHcGVNY38Zb3EUijypmS6dcdZX62DM3vVK6mrvE+QsO363YKVe0nq4GoC5h1
 d/gijTYdXO+ExjlwP4ozPt50b5cFAKd02EgNnA8KtIobV2Rq2y0fMNiVrJdz2jtc60/3
 JvwbqZeCgVztInMUOsGtk0iKBhr2I0qcoRWKpXrwnRg31Set0A0Szs+qx3X2r+WKttFs
 ihckdpRx8Vtv1kDvhivP954obURLX5/nkJblmGfyeotgjPyvIARXCe6GgMCe6bILH0Jv
 HgTA==
X-Gm-Message-State: AC+VfDxI36W9MD+bVJB5OKHW9K45JPdL8HwbYjjza9Os+EEflNCYH8La
 33v9cZWEoHSheSAc6xxxfnxVovYsJupRdeLwD684wA==
X-Google-Smtp-Source: ACHHUZ4LKAkeZeiJPg4YDabbzhsiuC6GKg2zlyLxvxYcQ+CpG7a+kUVDcIe/dHc84A3c63XjuDmA/Q==
X-Received: by 2002:adf:e787:0:b0:2f6:519c:6aa6 with SMTP id
 n7-20020adfe787000000b002f6519c6aa6mr2129864wrm.9.1683321910719; 
 Fri, 05 May 2023 14:25:10 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/42] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Fri,  5 May 2023 22:24:44 +0100
Message-Id: <20230505212447.374546-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..6f5daaee5f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1


