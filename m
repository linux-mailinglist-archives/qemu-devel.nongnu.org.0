Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C94715AF
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:29:42 +0100 (CET)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw83v-0004bj-PL
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mp-00050x-0Y
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: from [2a00:1450:4864:20::42a] (port=34736
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mf-0006FE-EB
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j3so20403999wrp.1
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loQ+xquehh4CwIIEWlpnyYEH2qth7GSqNKiw5dsrAaY=;
 b=y0vdpt2nTfndFI0rRWV4i/jEHn/r3ryhwoJOMBQ5K6MMv37iqcpEdMZuc6iCJLO0fA
 KiWEbimICp7oDBQWrB3FMgc19fh7qbLXlfCkCSSaujgtHmkPmLkJtbmyQtFGuTpRyvDT
 qQJ7DA9Y7kQqxgeIaWUGuoTMsWWkI6WTEnhPoMOdxXshFo7JwBFrQolnHvO0wfHrVX0W
 hBwMaDF2V3V6mwffzwyQys5rk7C3QG6fTbZhZvn8lSSZB33k7kPV44X/r4yzymWVTc0v
 He9ih1OuCLdqOta1BiSTd6w1h/CMcOmyEK4TD8ZGXf4oUe+Qm+c/PclEMZBjYCmAfKaD
 d4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loQ+xquehh4CwIIEWlpnyYEH2qth7GSqNKiw5dsrAaY=;
 b=bxVhMeDCMXPogzfRU5tah56H2qfYxQkgu/LaKkBBjdUiw1hys35DnZd/EQLcvJV3YH
 jbX9XivFed6m9+bYMiReA1UeDNBbSdFD+5bLQdUekhaJ2KwcWTuy1e7FR5q90pfdc4zQ
 5GfEzMaO7ARCAclWYOrR1TUCmap1R6PA3pvZzvT4dwMIgQ/F1fBgxhHGI5DXDHgZMKCl
 YbCPHJE5Xg//Td5dLJJyk7fbn08m3IzRIg/Obcqi4jffLkEftpKP6Sq5grPefV7p1Y1Q
 16/V0ZCmlDHMLm7+4uAT4XRF1CsM1EYg2xobQmCuv4/xN1S7tpy6XzasJntVwqyaWamh
 SSLw==
X-Gm-Message-State: AOAM532lvHwfddk3+PhkBP915G5PH3BSHcX7Ksc1Ydu9Q8/jSxe0P0Hf
 7dh2APYDb4Nw6j+gpzGIh3jvXg==
X-Google-Smtp-Source: ABdhPJy8JpQeaXUD+WAEDfBYGXsRbif7M5fLErrvBQN4Yww7SnsrKZ3Ap1u24NfTi92VeQehxBm8QQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr21738061wrz.215.1639249908199; 
 Sat, 11 Dec 2021 11:11:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/26] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
Date: Sat, 11 Dec 2021 19:11:22 +0000
Message-Id: <20211211191135.1764649-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index d6637229479..ab6ce09dbc2 100644
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


