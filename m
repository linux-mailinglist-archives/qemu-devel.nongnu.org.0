Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13D64FAC36
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:06:45 +0200 (CEST)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQii-0000hu-Lf
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZo-0001xQ-DT
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:32 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZm-0002z1-PH
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:32 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h19so11941238pfv.1
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRUTijrX/dWDGgF7d1LOxJ77lZwiKODTAAz7SOC7SIQ=;
 b=bnU455ssQErSvA0G+tCdBo+iKZ6v9JPpgG+JPvJDZ1GhlYABWzkKTpCVA7oHiPfpxR
 o5X73YHfr3VcHRe0E18zsVFTex24vYhxcVeIaBPuywzq87Hrb+nRi/ZQ3doL6hLQ1gfM
 8Z20Y0/DJkTjXguYvYNsnB0zIzJt3vBmPoFfuQMDRouiGC2NKLoxOeET7NsJqBgxTK0I
 2iEJOkU18OOSkItsn3/YyxWtEu7cBvQPw+49WYVUd+cw6zjua3agHnMsvqdiu4kEf6nR
 3V0BE0bhIG+jAuIOforNedWyu2iaqP0a52eExE/+8hxXkjcYq2jPtkaYnKi7Ua2fKntv
 6puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRUTijrX/dWDGgF7d1LOxJ77lZwiKODTAAz7SOC7SIQ=;
 b=qK4t+A4rhFu8NFQnxe/zDgj4H2KLGuGnbx13vm37vMo13k9TUZ34uuXBnCqFtsNCgC
 M9aYqxJ0tXunF7kgqLJfDff86vYjQMonruFba2ltWBpsJqXe2W1CESMhsHk1TMdCfTww
 q7R3E0kk3xoFOjsoP+fYptaHj5KeZmJmc+JBwe764KNdjfUALflUjHcg6Gv3fkEvKT/U
 Ota7lZ7Xhz/ySkajUrkkpfgziIYCV6JV4dkRkfMvr39HEtnkSTwqiS7OYXKAgvBYoJwO
 yv1TaFmMjEs11qh4i7iFHlrdOWZ5i4RpV5X8aobWPctunijx5lQA+9HQTW9ZY5qsdAn1
 WgNg==
X-Gm-Message-State: AOAM533RnChKSHWfYdgdtb5ZqtWn7GKVra1FNdIaY3ngyP2vp6kkvdJL
 x4vRVMgkyInBFnQMhgWs1w+8ZoKzzt9S2g==
X-Google-Smtp-Source: ABdhPJylkbEaBQXS9RWq9am5VUuxK1mPg5MUUU4GkjIjB8DFONXmwWT2okm+mDS6cBxatlAeoGRERg==
X-Received: by 2002:a63:6c04:0:b0:398:54fb:5632 with SMTP id
 h4-20020a636c04000000b0039854fb5632mr21383554pgc.78.1649570248620; 
 Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Update ISAR fields for ARMv8.8
Date: Sat,  9 Apr 2022 22:57:20 -0700
Message-Id: <20220410055725.380246-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update isar fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index eb8cb738b5..c6c6d89a69 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1941,6 +1941,7 @@ FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
 FIELD(ID_MMFR5, ETS, 0, 4)
+FIELD(ID_MMFR5, NTLBPA, 4, 4)
 
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
@@ -1993,6 +1994,16 @@ FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
 FIELD(ID_AA64ISAR1, BF16, 44, 4)
 FIELD(ID_AA64ISAR1, DGH, 48, 4)
 FIELD(ID_AA64ISAR1, I8MM, 52, 4)
+FIELD(ID_AA64ISAR1, XS, 56, 4)
+FIELD(ID_AA64ISAR1, LS64, 60, 4)
+
+FIELD(ID_AA64ISAR2, WFXT, 0, 4)
+FIELD(ID_AA64ISAR2, RPRES, 4, 4)
+FIELD(ID_AA64ISAR2, GPA3, 8, 4)
+FIELD(ID_AA64ISAR2, APA3, 12, 4)
+FIELD(ID_AA64ISAR2, MOPS, 16, 4)
+FIELD(ID_AA64ISAR2, BC, 20, 4)
+FIELD(ID_AA64ISAR2, PAC_FRAC, 24, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -2015,6 +2026,10 @@ FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
+FIELD(ID_AA64PFR1, SME, 24, 4)
+FIELD(ID_AA64PFR1, RNDR_TRAP, 28, 4)
+FIELD(ID_AA64PFR1, CSV2_FRAC, 32, 4)
+FIELD(ID_AA64PFR1, NMI, 36, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -2041,6 +2056,11 @@ FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
 FIELD(ID_AA64MMFR1, TWED, 32, 4)
 FIELD(ID_AA64MMFR1, ETS, 36, 4)
+FIELD(ID_AA64MMFR1, HCX, 40, 4)
+FIELD(ID_AA64MMFR1, AFP, 44, 4)
+FIELD(ID_AA64MMFR1, NTLBPA, 48, 4)
+FIELD(ID_AA64MMFR1, TIDCP1, 52, 4)
+FIELD(ID_AA64MMFR1, CMOW, 56, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -2067,7 +2087,9 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, TRACEBUFFER, 44, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
+FIELD(ID_AA64DFR0, BRBE, 52, 4)
 
 FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
 FIELD(ID_AA64ZFR0, AES, 4, 4)
@@ -2089,6 +2111,7 @@ FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
 FIELD(ID_DFR1, MTPMU, 0, 4)
+FIELD(ID_DFR1, HPMN0, 4, 4)
 
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
-- 
2.25.1


