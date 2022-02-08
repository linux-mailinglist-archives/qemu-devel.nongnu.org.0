Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5024AD33A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:25:03 +0100 (CET)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLo6-0006tI-2t
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:25:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkn-0000Pc-BC
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:35 -0500
Received: from [2607:f8b0:4864:20::429] (port=45864
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkl-00018o-8c
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:32 -0500
Received: by mail-pf1-x429.google.com with SMTP id x65so2860148pfx.12
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzinD8/kPioX6Z6jBf7AkBmyvisWOi+WtFsuBRSv8ks=;
 b=JBzMq8E/+9abiygCT9Wr9gbuvta9xKLADFxQ25n5mb+YgGDo7wCFFM+TDtg86St8cM
 RYlQb0lVYyxgjLhesHBKSr/1PFwD3opr/iySzwtdvsfqtM8NBBA6RgOmDGwYZlpaXAgU
 x0ocFXn0DbbPcTgXigsU0hVKe8YAOjEVHoPnZ+xSQKxCWgIolmUIh138Y+Uk47YzqeQW
 +chH1IIbS+0fIk1rR+F5uaKqIFzmfJXiZUeKCJNBXLOlPbWCPS+6wNEZI6LAPEZyUBq2
 mCuc9MpE6AG6iM9bogsP4w/6wdXmJHNRlplpQ5g+CpwI8SwNb0T/N3v+wCp0yg727tax
 ak6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzinD8/kPioX6Z6jBf7AkBmyvisWOi+WtFsuBRSv8ks=;
 b=sIidDOfA0KXFSzYsuOsgaG/Fx8me64F/ol3PX3Jlu7F9oIcBjp1VnG6m4V2O/ccLFu
 YexJe72JrijMeR//t/N3KfiZOpagcpbJdG/i9wtZFLoBwJgt+QlgwhTDafYnVw3kJEGB
 uD8Djz09CGZuU/7f72ACly77DbqqkZ0v+F0QE6O471HHgfNpL8cXF3/GZTjNf5oXllGk
 VOQ6lmy2rqJTsJljrQgglsVD1FGqdHQVu7qOkMAzCqBMaakPWYvRBX8R30nlSzg1bX+P
 NnttSgfkJ1hC0HESEO9ErTAQ8nkAo2owscyeA4PiQnGQRrlyLdAOzlLqGUsT82U4vYLp
 E8zg==
X-Gm-Message-State: AOAM532b9OtJoAf0xwI9EP+Wwcm0Hvvq0hMAz9bV2n2pqS/FtMV15shx
 1e4qqmAJvTXg0/u3CzOASCSwyQxmsNSJhg==
X-Google-Smtp-Source: ABdhPJyKOxFBjN/lRXgBpQs92eq5WciclNgcerdCELGD6O3vxcVAYWpjkCtKRgPjdk0oYljNbbIWBw==
X-Received: by 2002:a63:2c54:: with SMTP id s81mr2473814pgs.197.1644304649004; 
 Mon, 07 Feb 2022 23:17:29 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/8] tcg/sparc: Use the constant pool for 64-bit constants
Date: Tue,  8 Feb 2022 18:17:08 +1100
Message-Id: <20220208071710.320122-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index ae809c9941..21b0dd6734 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -336,6 +336,13 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
         insn &= ~INSN_OFF19(-1);
         insn |= INSN_OFF19(pcrel);
         break;
+    case R_SPARC_13:
+        if (!check_fit_ptr(value, 13)) {
+            return false;
+        }
+        insn &= ~INSN_IMM13(-1);
+        insn |= INSN_IMM13(value);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -479,6 +486,14 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
+    /* Use the constant pool, if possible. */
+    if (!in_prologue && USE_REG_TB) {
+        new_pool_label(s, arg, R_SPARC_13, s->code_ptr,
+                       tcg_tbrel_diff(s, NULL));
+        tcg_out32(s, LDX | INSN_RD(ret) | INSN_RS1(TCG_REG_TB));
+        return;
+    }
+
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-- 
2.25.1


