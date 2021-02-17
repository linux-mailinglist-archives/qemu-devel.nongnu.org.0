Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0331E0F4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:02:30 +0100 (CET)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTxp-00055M-Lb
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMd-0001Pp-Hh
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:59 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMc-0007fL-2A
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:59 -0500
Received: by mail-pg1-x536.google.com with SMTP id t26so9228207pgv.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=EClC1AzBeHyf2FEDiEOQOKgZL7ej1kn4Hi+/sv7hVboSU4/4tBxuPCL/4X5oJEKCbJ
 3yiDw2qWW+ONnewSwN00E90qNJpYViYcQ8/38eSYQIq7aDgKSjX/B1jyQdfjwUwcnqAn
 cyCmQqGtdY6LOS3fPk2F2L+5LQppRk38gTm4boSpPkFAmBg3zAcBX38lLL3vVr53iLtF
 /IBcQDe2cF+qxhqX1hVB/p7APaV15Dd5nIdkdupm5OXPvW/XRUXpH0hsjLgxJqInWnga
 NV8wxE+TSFdJBVh3f+sDTLnHen4cU9sYi/xGU+56lz/hpseqt86Ah6r4/CDp/qdpgRyv
 5chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=i18KdFsv8AONHIpu6p+ViKj2OR06Y1mZHSo75prWAWT39L4vinm2u0BVSvtx9PX+PZ
 ayocdQP5+EBcNmvrNUm9hogiDVaY79Fp6bd+NP9fm9jr5LWBzTdJEcW6h7b0eyh3vCe7
 qC5tAVQEaW2g6uVDZCXkE/qmAfMCJV6JJ2919kyt+XRZOiXRI+YWFEvKijM70uxft4PX
 pe3PNYg5w5Lxpwsf1i0CMxhuxefmOryZvk8E0Dw2kAeRlSBmi4a1QzOirw7jesP3EsaX
 AREvFJzclznpP07akcGe8H99iYO+JmiuuoYOm2NzFbiUM1ImWpeQBqYdpSNzMFp53nx0
 mGRg==
X-Gm-Message-State: AOAM533stYC03KWZ+Geftm3XNi7aWWXBWCC+3E3DLqX99ejxk9+z0xuH
 c6rj0GCkuOLnNUhZemEFgMzHHFLU8b0BFA==
X-Google-Smtp-Source: ABdhPJxci5GU/fVSUVos7m52OHu6IHGKpfqPhHzhZWxydnX/Fr3dQEUo5SLMRCXks3GSodhCgndt9g==
X-Received: by 2002:aa7:94aa:0:b029:1eb:7783:69c5 with SMTP id
 a10-20020aa794aa0000b02901eb778369c5mr961097pfl.60.1613593436863; 
 Wed, 17 Feb 2021 12:23:56 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 50/71] tcg/tci: Split out tcg_out_op_rrcl
Date: Wed, 17 Feb 2021 12:20:15 -0800
Message-Id: <20210217202036.1724901-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 6c743a8fbd..8cc63124d4 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -341,6 +341,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrcl(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGCond c2, TCGLabel *l3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out8(s, c2);
+    tci_out_label(s, l3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -565,12 +579,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(brcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrcl(s, opc, args[0], args[1], args[2], arg_label(args[3]));
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
-- 
2.25.1


