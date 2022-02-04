Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CEF4A94C5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:53:28 +0100 (CET)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFtPL-00017M-Lt
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa3-0006c9-KV
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:27 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41596
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa2-0006TO-39
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:27 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 p12-20020a17090a2d8c00b001b833dec394so5392593pjd.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5/xMg5JmnQhX3P7JdxIT0db5qBXvDtWPFnoD+IGj8I=;
 b=bXJQ/8IB8f2eItNjAmaictFyZ3hbsmvtOLBwaRSvHSVNnVFH7SGPqlXJwuFeXrLSc/
 5zcGx7MzYyoc5dS4cDfKXxtF/S8Z6/kNay5Wvv3HqWMb0Ik7h07sXGzdXpQBXHRW521W
 LJtRcNY8rfStopif+gNOF3B4+Np4JfFcfCjfmxrZQpAq/Cemz+0yee6P2bVDb+VgYgSa
 6irHUf8QGEHqeCUV+9z8nQMpBR0VfX6Imhu4SZGIOUaZ0vnsCBcBLPOY9yunOWwlCyzv
 VqDI8kewZ/KB0X6c5+4Ezz7i4i/w+xtj4wA/LFtUg/NyBt/JF592PPIRaYbAmcu1NkGd
 vgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5/xMg5JmnQhX3P7JdxIT0db5qBXvDtWPFnoD+IGj8I=;
 b=bejpC5vWmTi7pnSiWwMUdvjy5WDe29xpofHwYiadPMPw/0biA+CMDl+rOpqY7Z67Tn
 uleWekg6JfPrwbObrqaS2svTvotjXwBVcwnF6FePAHEraNqoZYvXBF/oRIM3ogPaA+YF
 45VPQM6fNfIJE7kCeSwezkyxyovdxpx3NcjD9vjHgXtoe3+eI0Zx2hMSICqLBT6PgneX
 M6mdqrGlfc9QqFBlgv/cc1MJfFLkwFAkoYwIKsxl8rF594i+5PSPxCzC/xMW695kA669
 r1W0nir6cf3TDL+BV7gRaaimWYQ0JLUCI4+qc2IYSMP5dd7crK6ztH9n29aHQTxwlPhS
 0Tog==
X-Gm-Message-State: AOAM530CAjCtriseih+sPFDzxM2m4/tRYpKGMWowFplVRwdzNVSMuS8d
 fNTEUxmuQchDgqYhrlmz347PIYLbsC1mLTcF
X-Google-Smtp-Source: ABdhPJx8hm9LiCcB//X0vyzMJVaGApDJdqJx7g8hZ/L9Z2WLY4UaJ3N5vhqJxi15knbWOIl3cT4sxA==
X-Received: by 2002:a17:902:e849:: with SMTP id
 t9mr1656207plg.106.1643958024563; 
 Thu, 03 Feb 2022 23:00:24 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:ed23:b22a:8415:8857])
 by smtp.gmail.com with ESMTPSA id 9sm11808619pjg.50.2022.02.03.23.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:00:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] tcg/sparc: Use the constant pool for 64-bit constants
Date: Fri,  4 Feb 2022 18:00:09 +1100
Message-Id: <20220204070011.573941-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204070011.573941-1-richard.henderson@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 6349f750cc..47bdf314a0 100644
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


