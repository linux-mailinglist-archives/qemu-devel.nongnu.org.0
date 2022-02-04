Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884454A9481
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:25:40 +0100 (CET)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFsyR-0003Cx-K9
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa2-0006ag-Bm
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:26 -0500
Received: from [2607:f8b0:4864:20::430] (port=33722
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa0-0006T4-5Q
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:25 -0500
Received: by mail-pf1-x430.google.com with SMTP id i186so4386042pfe.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xOfHTCwqJCAxGgD5mi+OdXnrE9oa2hucTy+9kx4K81s=;
 b=cNcVKYYsC717X9pcvAio49fInKkmyOSZ6jLrewcUi0mJ/eS82oT0xuRqV3q9cJ5tM9
 nJLzusWICXtm4JC9QlP98TqG8tsK++s0XZx0O9ABmzh1Uf3RbWU9r897U3jCdwE9UvMg
 rtUyZAkCOa2lteGG/M6Z8mmaJwwqD6fhTNrp76t/KXK1nHZ5peAcvwYCVEK4oOvqwPfk
 OUdVuRm4BrMyRZTFhicPIZsoMsR7ydewAblpvRXncxfP+xzoMWUO5RcAkSfmUty66FK/
 HzEtDzM+wrsCEB5Ugp7UAVMWFiXC7gGq37+SzSlbVlU8NTytb10TlR9+f7xcRsBzbrg9
 A2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOfHTCwqJCAxGgD5mi+OdXnrE9oa2hucTy+9kx4K81s=;
 b=NQAb0Zh6+5msDOntdgRh8riWpWSrcMSDIDvm7OHYFBqLB+8/QjuaU9flvqRVwR1kCf
 ubzJ4jg29ait+fge/bnS4Z6W4qXwEn0yYPMiCuuKqzikNLGxzB+nv37YTgCfpJA/JYL+
 HZy0fDqUYqtfem9KBVV2Nl81nDNzNmnHb/G861POxiJG+FaWzz+0XuY/dfaTTy+/wc0e
 idQjmpADEdjQHO+chyvePu4ZN59s2VwYc1JMxuHRcamdSbHrndwiHPbWP1G7SQhBfxxg
 5Aw5/zD2WgMWwJuXngpNRCtTwFGOeg/OKm1+QnD0OTkqs3K0D9GM2gjQLv8M9tOo76fQ
 huNw==
X-Gm-Message-State: AOAM531GWj+aElHqD4+HkT7xGkzB4d4ztxkREYViEgy3Eahc/Gv/1Wpn
 J/ybc5xOz7iObE0RrImr139oiQfHRK3gU1hF
X-Google-Smtp-Source: ABdhPJwtddnpdc78vmV7BwuQfvXDV4ddR9OAH4WxaGDml915iV/bFcMKpiPy3L1/SvJ4kJArZYoNuA==
X-Received: by 2002:a63:5f48:: with SMTP id t69mr1345295pgb.98.1643958022254; 
 Thu, 03 Feb 2022 23:00:22 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:ed23:b22a:8415:8857])
 by smtp.gmail.com with ESMTPSA id 9sm11808619pjg.50.2022.02.03.23.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] tcg/sparc: Improve code gen for shifted 32-bit
 constants
Date: Fri,  4 Feb 2022 18:00:08 +1100
Message-Id: <20220204070011.573941-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204070011.573941-1-richard.henderson@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

We had code for checking for 13 and 21-bit shifted constants,
but we can do better and allow 32-bit shifted constants.
This is still 2 insns shorter than the full 64-bit sequence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 7e3758b798..6349f750cc 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -456,17 +456,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
-    /* A 21-bit constant, shifted.  */
+    /* A 32-bit constant, shifted.  */
     lsb = ctz64(arg);
     test = (tcg_target_long)arg >> lsb;
-    if (check_fit_tl(test, 13)) {
-        tcg_out_movi_imm13(s, ret, test);
-        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
-        return;
-    } else if (lsb > 10 && test == extract64(test, 0, 21)) {
+    if (lsb > 10 && test == extract64(test, 0, 21)) {
         tcg_out_sethi(s, ret, test << 10);
         tcg_out_arithi(s, ret, ret, lsb - 10, SHIFT_SLLX);
         return;
+    } else if (test == (uint32_t)test || test == (int32_t)test) {
+        tcg_out_movi_int(s, TCG_TYPE_I64, ret, test, in_prologue, scratch);
+        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
+        return;
     }
 
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
-- 
2.25.1


