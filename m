Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B96DB844
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:49:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYN-0007O5-Bj; Fri, 07 Apr 2023 22:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYJ-0007Ir-Kn
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY4-0005dc-54
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id c3so663876pjg.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UYA/jGhRJM+9A6MoPBOmAbOd+q/t7vvHeLmOB409P8=;
 b=u2rF4fWhJ8Ci9PeVl3IYHBgjlwfx65cS/iWcV4Yf/wusb1jy9lEIU/2jxqZYTRwQQe
 MNjWj1PLEWyipIp3wzsTClT5GnWvDW1v30qKJxQM4Ew+9dk/T1qLnWLPeDgnsu1pSHIJ
 ShlgvVC+5gcQl0Se96VPjrDHy53Im1foUBnOUNNB7mUSE12H1KBeF3ZbD82yI1vyrJjQ
 xALwavkLh70NHZWYybDgRq0qkfX/U2JfANvP+GkX4wLiKiHaVNAik75CwvvuJBUh0E8f
 OciA6Mz/z5KtKSq76AgWcA9/1E1SorIFT3AFCMv0u01PH3hU/mCGjjd6Z2beUaIt1alM
 9Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UYA/jGhRJM+9A6MoPBOmAbOd+q/t7vvHeLmOB409P8=;
 b=lkuxJ/U2Umel+QBtC7opd44qq8fp9lA0ViCTnLh7nI/IR9JZAy6lHSSESdpVkzS+2h
 BiQRKEfosXkIVr4czhOVQGXziG4e3x5NqXQC/fmvd5SHCiOr+HgPQ5J0PVSZjD4U5zkq
 YYH4e8z5AHztdKO/SvwJvRZpyv4zRMMrRlge2wOJyIrIvNbrLEsmUQaOSglNZakCqxPG
 g/auUVyUcMwjqlqm7KXUKCdaTjMyqpLCO9wgr5edY9Nezf3e5MzT7trWorJ+ypfGRny3
 6iM34uA0k32MiB6S6lLLHGvEcAvJRlOot6fBNWZDjiUD5rAOEb5OvnGwzC0IH/OimHdw
 SB5Q==
X-Gm-Message-State: AAQBX9d4/+B+DkV20w5Qf0HbHM/rBSDZfr199431Zr8TgdBsZeywSDDI
 ftjKAKu/mqEg9WTdxwtFTM6V3+cQg6CS9cdFT8Q=
X-Google-Smtp-Source: AKy350Y7JQrtlrM3NuyBbmPFeS2i7QarYZzA3ZiWugdBq1ZjugNMkvOz0XDHciZlcoSOX6kKL7cRtg==
X-Received: by 2002:a17:902:d192:b0:19c:e664:5e64 with SMTP id
 m18-20020a170902d19200b0019ce6645e64mr535056plb.2.1680921806724; 
 Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 11/42] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:43 -0700
Message-Id: <20230408024314.3357414-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
extend if the register matches.  This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index df36bec5c0..2bc885e00e 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,7 +582,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_ext32s(s, rd, rs);
+    if (rd != rs) {
+        tcg_out_ext32s(s, rd, rs);
+    }
 }
 
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
-- 
2.34.1


