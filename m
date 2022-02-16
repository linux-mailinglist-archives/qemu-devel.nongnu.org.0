Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67344B8601
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:40:07 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHjC-0003aG-OR
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:40:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVt-0000y0-3X; Wed, 16 Feb 2022 05:26:22 -0500
Received: from [2607:f8b0:4864:20::433] (port=33289
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVr-0005LJ-Hv; Wed, 16 Feb 2022 05:26:20 -0500
Received: by mail-pf1-x433.google.com with SMTP id d17so1838348pfl.0;
 Wed, 16 Feb 2022 02:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dbtih0DtqaIWcdiGzJw5+r5UgVFV1kuwMUAShpRrOcA=;
 b=fA6EP8/FDlPQlPDimx99T6WoA5eQd3k3DxUZiwvyZfP1bPptF8kLq5whYgBemGWise
 39yDFofgpiLpSPVuso0of/Oj2IfOPg8iS2Be+Ij9nGEhdjaEgEfo5aslAMjk3U491/4E
 bOIS+sFyIkza+HeKUwc4BGJ8sWF5SBXBXwLqJsI3/mblZLrhcmKlFG8qL2CpKzfAD6nw
 DU8wj3z04yqtAWBbb2JYjOZhp7uvxiWIVKidfl5nMk8AIle3pqYdmHBFBB+97BIxyHKB
 tQcc63MUFvGUmDAYJNFDVmHVposEVTR1UytHqXxv9uzuGaIUVAodbXY2hV40HbVy4fAt
 QCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dbtih0DtqaIWcdiGzJw5+r5UgVFV1kuwMUAShpRrOcA=;
 b=PzJwXYDTftJOnvcpkqzeB1kQ1++P6tIotqsvFZ2904iyNJrixH58kGgt/hWx2Cklif
 tS/zdhIopjsw07ItWdKwYg90QxdO1T6OxHSXjjH5mMTNQZhVZ5JhMPB9jNNTsDT1XxIa
 3q29BHoXD9ryNckXxdWtDQw8AquLBzwhTCZ0Ayj7sTZzji/Jrky2mc1t2R/SFbxNKmYb
 jHIgERY59Np0M+QgUOaEWKrzrNAGTbb+HS9gS4yYdvhSe2mDBKTg7LOemOQMawcWmqgK
 snNTgT3ziNsrJrXgFvn2f9f/KagCwAjU+ERimxPQkJgl88lLg+4fFwjMM1uHPg4cdjFd
 wwnw==
X-Gm-Message-State: AOAM531mr7Ys56xnhn4O1E70+Hp3Etm7wBBrmb8cUscTkESwiYrZXcCx
 DCcQUAZ43mnDB5lh3REAJoypdyQ6ZfY=
X-Google-Smtp-Source: ABdhPJzPr9s4MFwZsWjrbEmhYwLGtyUB96fNfwO8ZCjh4baUJrBY/VZwVCAn4Ypq8cqT0A/iu+Vtkg==
X-Received: by 2002:a05:6a00:198e:b0:4e1:52be:877d with SMTP id
 d14-20020a056a00198e00b004e152be877dmr2020954pfl.78.1645007177959; 
 Wed, 16 Feb 2022 02:26:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 6/9] target/ppc: add helper for books vhyp hypercall handler
Date: Wed, 16 Feb 2022 20:25:42 +1000
Message-Id: <20220216102545.1808018-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtual hypervisor currently always intercepts and handles
hypercalls but with a future change this will not always be the case.

Add a helper for the test so the logic is abstracted from the mechanism.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fcc83a7701..6b6ec71bc2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1278,6 +1278,18 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 }
 
 #ifdef TARGET_PPC64
+/*
+ * When running under vhyp, hcalls are always intercepted and sent to the
+ * vhc->hypercall handler.
+ */
+static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return true;
+    }
+    return false;
+}
+
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
@@ -1439,7 +1451,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         env->nip += 4;
 
         /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && cpu->vhyp) {
+        if ((lev == 1) && books_vhyp_handles_hcall(cpu)) {
             PPCVirtualHypervisorClass *vhc =
                 PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
             vhc->hypercall(cpu->vhyp, cpu);
-- 
2.23.0


