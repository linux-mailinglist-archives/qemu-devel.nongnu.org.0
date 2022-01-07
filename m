Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED45487B90
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:41:00 +0100 (CET)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tEY-0002j2-Ka
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swA-0005BM-1E
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:58 -0500
Received: from [2a00:1450:4864:20::435] (port=43588
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw5-0007uC-47
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id o3so12307210wrh.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LupUZiFadISWRd6OfQvtso37hN2ZXDsa2I1Sv18LqPg=;
 b=Sn9XcJ3XNZA1IrsSZ4LTTd6YlPIrBFzTGmnhhAfDroP4MZsv0lmc4/Y8B6/q1hi1hV
 +iOBczyRBmR7bgPvFKT8LkN37ZWcFmfhEsDUM1DiIuWSI28rP6ER6BTreGOGDyPIqnnX
 MXhpfh/zZNkR6rczl31u0fMjQLj2E+2U+7PFQ1wQ/iEQoIi9wWV7clef1af/3Mp/y7+z
 2GkPYB5/FIkAV+lkOkXomidIYt02IJVTDYFa/wOGV+JjQYNmCKz2/UTiijnDSHL+89a9
 Q0cuYIDZiPwZAho/AsORzR/uQkEDHFV/EkyWER1DVkHZXTiA3Ensfp/KovwcmszSxr40
 u5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LupUZiFadISWRd6OfQvtso37hN2ZXDsa2I1Sv18LqPg=;
 b=Htr78c4RPyCzCQExDlPEB9Fgu0XNWhipbip2QfOG/LGB6FjXPK76U6MNfcq9LV+JCV
 itvBUXTW0qJ5QB7DQCpK2mRAV+kV9j6CZ3m3UB4nBWmK1/IT4GSKvY47cz3tO5kEg1/j
 FKKeEXXcWITG4n3oJLWX/ubV38q3WI8BrHBflnTpUlzAJFn/LXAlBqZPAG6EPcXITxGA
 hdhRVFbluvVLYqsEtZBcdubl80EN70CYCTO9jeNsJ6ZpL1hywXQURIQc+QQj6fZiqjnL
 3K2tQHjVVFBjc46/UOd8+bti0LyhP5oKL/Aw/BvcbNdzA0k15AY/pG2M303LwRyt58gX
 Mmhw==
X-Gm-Message-State: AOAM53269uS7807wFxODRcO0NFJDTT8Yhgce9hXm8t+9Bv+kz/2Qfyg1
 a6ohV1A0dIAaQOIMHtPBivVZDTB3x2ek6A==
X-Google-Smtp-Source: ABdhPJyEHrTvJeCr9kGzEYYjVA2Y4pEwPx5DFcPOjJRv6KzmTuubMj5UZIDlsTmmo+blD/YmydGULg==
X-Received: by 2002:a05:6000:c:: with SMTP id
 h12mr8008573wrx.474.1641576111907; 
 Fri, 07 Jan 2022 09:21:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/19] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
Date: Fri,  7 Jan 2022 17:21:36 +0000
Message-Id: <20220107172142.2651911-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/gicv3_internal.h | 3 ++-
 hw/intc/arm_gicv3_its.c  | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 14e8ef68e02..1eeb99035da 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -403,7 +403,8 @@ FIELD(DTE, ITTADDR, 6, 44)
  * Valid = 1 bit, RDBase = 16 bits
  */
 #define GITS_CTE_SIZE                 (0x8ULL)
-#define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
+FIELD(CTE, VALID, 0, 1)
+FIELD(CTE, RDBASE, 1, RDBASE_PROCNUM_LENGTH)
 
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7a217b00f89..2949157df34 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -104,7 +104,7 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
                                       MEMTXATTRS_UNSPECIFIED, res);
     }
 
-    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
+    return FIELD_EX64(*cte, CTE, VALID);
 }
 
 static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
@@ -308,7 +308,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
          * Current implementation only supports rdbase == procnum
          * Hence rdbase physical address is ignored
          */
-        rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
+        rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
         if (rdbase >= s->gicv3->num_cpu) {
             return result;
@@ -426,7 +426,8 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
 
     if (valid) {
         /* add mapping entry to collection table */
-        cte = (valid & TABLE_ENTRY_VALID_MASK) | (rdbase << 1ULL);
+        cte = FIELD_DP64(cte, CTE, VALID, 1);
+        cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
     }
 
     /*
-- 
2.25.1


