Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C142D2B24
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:35:02 +0100 (CET)
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcCr-0001KJ-DZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1c-0007Uc-Cz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:28 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1a-0005ny-Uk
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:24 -0500
Received: by mail-pf1-x42a.google.com with SMTP id p4so7877359pfg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4To1lOqbPeaIwjsmu5T7HJ8KFKE967ZWQg/TXbDDY6w=;
 b=OWF7Tv6dKs/dnSx9NZQ/micjrTN5w/OTc75K2zZpmwtBbC5q86uFhXF73W6qzPbHb/
 i5kEvHZnVliqL9gkBmvIocGdxPYTyH7LvXrWH3m43a69vzzO8llEdrB71OqDnbropjft
 gVYBs+Lz6S8V00hxz59BqLu394L3CFHfyXgvT0ONhwr//kKbA+53E4IfnEGTTFF2MsZY
 f0jMbbvHBfH9fvKF8YxN9iG5Ksyjcng4Eq6ch5d+kHTN4ou/J7v/E+udAmwfaSQ+xrq4
 iFGchnpVMpECHvw4Mqq8k/ZdhJsE+kQwckL20LWBEBPrY0YjVq7L0UFe9FFXaUCLw80Z
 OSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4To1lOqbPeaIwjsmu5T7HJ8KFKE967ZWQg/TXbDDY6w=;
 b=bgRXfEz4lkYwhjAgGpPB5IJQ2SGnKQvl1mwejTHZ/SOCd0Rf4Mi1yrlEpFo9bH0IdV
 hB7jamKAVBVTE25DVvPSRcVyKxQg8prAlR3JO3w1+QLNVxpb1raxljmW++HK7nn7z8i1
 Amc1VbCJIdKQH1s8dRl+48dBFihQQkVdJveQZ27oA0a6QWNF3Z9oEJN8de5slaFj/1f8
 ARz+NhjbFksg4iMM72Y3XMnCgTVW2qjMiyp38ty7DpboH+JSsBMtfeZWiuqFPuQG70wj
 rzIVkQmco1HzPYudyj1J1ccIw64AfK3Z62uUaQdzfm3l5GKxKCYvWVAQaZK7lXYne9XA
 /r5w==
X-Gm-Message-State: AOAM532AOb6y379isSpyKrc7NBrF87mUJ4glUBUlNXXp1LrP61INsx1Q
 UQ4i5oih8Ic0ngGfEozUhX2gEg==
X-Google-Smtp-Source: ABdhPJyuNlsf8urGw98q/CaBW2foI4gxQCYvRBt9nRuFnLa3Oub1Y3jwjVCDAr8y8DjKjiPFzT5O8A==
X-Received: by 2002:a63:28c4:: with SMTP id
 o187mr11092740pgo.137.1607430201786; 
 Tue, 08 Dec 2020 04:23:21 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:21 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 5/5] target/arm: add aarch32 ID register fields to cpu.h
Date: Tue,  8 Dec 2020 12:23:06 +0000
Message-Id: <20201208122306.8933-6-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208122306.8933-1-leif@nuviainc.com>
References: <20201208122306.8933-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=leif@nuviainc.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2a12a5ce92..b37a74348d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1800,6 +1800,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
 FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
+FIELD(ID_ISAR6, BF16, 20, 4)
+FIELD(ID_ISAR6, I8MM, 24, 4)
 
 FIELD(ID_MMFR0, VMSA, 0, 4)
 FIELD(ID_MMFR0, PMSA, 4, 4)
@@ -1810,6 +1812,24 @@ FIELD(ID_MMFR0, AUXREG, 20, 4)
 FIELD(ID_MMFR0, FCSE, 24, 4)
 FIELD(ID_MMFR0, INNERSHR, 28, 4)
 
+FIELD(ID_MMFR1, L1HVDVA, 0, 4)
+FIELD(ID_MMFR1, L1UNIVA, 4, 4)
+FIELD(ID_MMFR1, L1HVDSW, 8, 4)
+FIELD(ID_MMFR1, L1UNISW, 12, 4)
+FIELD(ID_MMFR1, L1HVD, 16, 4)
+FIELD(ID_MMFR1, L1UNI, 20, 4)
+FIELD(ID_MMFR1, L1TSTCLN, 24, 4)
+FIELD(ID_MMFR1, BPRED, 28, 4)
+
+FIELD(ID_MMFR2, L1HVDFG, 0, 4)
+FIELD(ID_MMFR2, L1HVDBG, 4, 4)
+FIELD(ID_MMFR2, L1HVDRNG, 8, 4)
+FIELD(ID_MMFR2, HVDTLB, 12, 4)
+FIELD(ID_MMFR2, UNITLB, 16, 4)
+FIELD(ID_MMFR2, MEMBARR, 20, 4)
+FIELD(ID_MMFR2, WFISTALL, 24, 4)
+FIELD(ID_MMFR2, HWACCFLG, 28, 4)
+
 FIELD(ID_MMFR3, CMAINTVA, 0, 4)
 FIELD(ID_MMFR3, CMAINTSW, 4, 4)
 FIELD(ID_MMFR3, BPMAINT, 8, 4)
@@ -1828,6 +1848,17 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_MMFR5, ETS, 0, 4)
+
+FIELD(ID_PFR0, STATE0, 0, 4)
+FIELD(ID_PFR0, STATE1, 4, 4)
+FIELD(ID_PFR0, STATE2, 8, 4)
+FIELD(ID_PFR0, STATE3, 12, 4)
+FIELD(ID_PFR0, CSV2, 16, 4)
+FIELD(ID_PFR0, AMU, 20, 4)
+FIELD(ID_PFR0, DIT, 24, 4)
+FIELD(ID_PFR0, RAS, 28, 4)
+
 FIELD(ID_PFR1, PROGMOD, 0, 4)
 FIELD(ID_PFR1, SECURITY, 4, 4)
 FIELD(ID_PFR1, MPROGMOD, 8, 4)
@@ -1837,6 +1868,10 @@ FIELD(ID_PFR1, SEC_FRAC, 20, 4)
 FIELD(ID_PFR1, VIRT_FRAC, 24, 4)
 FIELD(ID_PFR1, GIC, 28, 4)
 
+FIELD(ID_PFR2, CSV3, 0, 4)
+FIELD(ID_PFR2, SSBS, 4, 4)
+FIELD(ID_PFR2, RAS_FRAC, 8, 4)
+
 FIELD(ID_AA64ISAR0, AES, 4, 4)
 FIELD(ID_AA64ISAR0, SHA1, 8, 4)
 FIELD(ID_AA64ISAR0, SHA2, 12, 4)
@@ -1951,6 +1986,8 @@ FIELD(ID_DFR0, MPROFDBG, 20, 4)
 FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
+FIELD(ID_DFR1, MTPMU, 0, 4)
+
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
 FIELD(DBGDIDR, VERSION, 16, 4)
-- 
2.20.1


