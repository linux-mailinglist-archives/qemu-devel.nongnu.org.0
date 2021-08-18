Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3733F0CF7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:50:36 +0200 (CEST)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSWB-0000aJ-EA
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRw-0000KV-Vo
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:13 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRv-00088C-JS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:12 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k14so3566127pga.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eXSlP509FPYxp/SHlpwwNwQWv2WcEvZieYKUWUJBBNw=;
 b=gqk9KmG8DO9gT64dLGnYuBjsQrjR/G6QQtpWd86GXL1kWuulL9qdiprQNQA8wG6c68
 gtrTIcvthD7z9x7PdabfyYoy588bPkNm34jVZqN99XF6IgjitWDTeJnymiMBT/p8WgEy
 ikfv+WHVzsqkCs7EEomC5QmwCv8SFJwGFS1F77z2OYLHtFHnqWNoq2orhvKoewzIXWzE
 yIen9A2aajRfpIzDBh/dBcUOux/PfFjFX5bmqAvVObp2S39iKmYMWLgGXEHxIyFucZEq
 M9vl0vjb+3dhaxq0g7bwk9QNFQ/i5FK/qzblwMMBYpWadYzqDf3Qb9pXrRiIkyJvlVwc
 j4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXSlP509FPYxp/SHlpwwNwQWv2WcEvZieYKUWUJBBNw=;
 b=ZpuCVsU+bE/mkaDF77UPp6/j+QZP8khxlcwiGbFW2wO8aq6DRcii1t1nxItSqxvbZZ
 adKw5HO3t3UjueB4fvGGQgGvceh9aLP6cd5yQ2FqxbeUXB1l5UO+1UxD6i8UWutXd3k6
 7HmMYbmJ9dNlDGTaRVoWJdIG64UUClZf7SXlQus8p+SRVzUdJ6z/bJOOOd3VQYwPl8jh
 NXenKf5sy9KFBVNJDbZfIfgh5QkOVygPQKa/Gi5Qi+lhTEoYe9cZX0zN0i9/nfmtMQi2
 DFZNwwcRSTCJ6GEphDiySeU9CeJixQ34fbO8x5Y77iHT6q2fH7pvhVv1gLw0DcfIOuPH
 OIfQ==
X-Gm-Message-State: AOAM532FsBIRvOPZFoHxD2qI74mmrB/bdrfiNXBUdKHOGFDtWT11O4ww
 F8i8MnRqwcIQNT7rfzGXCV+cLEqz9NsdRA==
X-Google-Smtp-Source: ABdhPJws5vu3Cf8u3FOnDK3L0XAV8E+d7v0Vn85kO0aslga2qijXhywKd8iLdbX5yEv2Yq7oq1fAQQ==
X-Received: by 2002:a63:a511:: with SMTP id n17mr10620250pgf.156.1629319570355; 
 Wed, 18 Aug 2021 13:46:10 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] tcg/sparc: Use the constant pool for 64-bit constants
Date: Wed, 18 Aug 2021 10:46:00 -1000
Message-Id: <20210818204602.394771-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818204602.394771-1-richard.henderson@linaro.org>
References: <20210818204602.394771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 16e2258b9b..b64760e736 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -332,6 +332,13 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
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
@@ -469,6 +476,14 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
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


