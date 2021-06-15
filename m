Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA813A7611
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:44:01 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0vg-0008Dx-9W
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lt0t4-0005bW-Hn; Tue, 15 Jun 2021 00:41:18 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lt0t2-0008MV-T7; Tue, 15 Jun 2021 00:41:18 -0400
Received: by mail-pf1-x429.google.com with SMTP id x16so8101375pfa.13;
 Mon, 14 Jun 2021 21:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vydPdIutGORcNNReapEn+93jf/JX4O9ma43RT6TvW30=;
 b=Vxd3i0PvlTyK0DMUavNoJoo4yFX5I89KXHV3y1ZpGsJ10PDAr3paGUQYWhyoY+ap+V
 bUAirmrwch8kSwQdD3O3T7qzzkuQqWifV/YXtXziJnd++chbW77kQ//gtnx04qcpzPMK
 fSWR+ELT+4eVVtM5iY89EORy0ch1BQYNlyXjeofAru0c8zvfAEo+1dIW+7CQ3d6QxGUh
 1nrq5rNHaITkMjBYE9GlVQx9DFpOjxDRzVXEb5s8Dap+NohRqwQgSAXxGhD6nSmEv9Bv
 TgiTWGHG+eT8UzHJ7/8sFix8yXXSVCpJEyNtspfZXcIk4VUNFc4FaCc3KOrLSKiFahPd
 p2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vydPdIutGORcNNReapEn+93jf/JX4O9ma43RT6TvW30=;
 b=hOjMDuDiozwFb1JuY32JgdU4dE4NaYFqCBTteVONbU0NFp/7uGwzeJcYbgpURI2kGg
 THz/RP1gR3ZTBeK2xGxqPcX0HtmH/12Xumgn2ZcX4pcxtBtpOtqzNbqiLQ8Z8lwRj3ph
 SiktmZfay/EiwxpTeUiEczD2dKR4cSfUR6ORhSMkXbqTwfMlK0fInt7Z53PPOSONxn0F
 bR9WXiNc6fBN0zwdHGYbq5KraKkRJ1SOXtvazzp1prLaGXUl1EB0t8X1VFZheWDRbTOj
 h4qPANQjIGnqH391W21UCw5GoWkyeEZrQcI+PR3ftCs4DkNFkXMMVMmNqluvgB2RacX4
 eWUw==
X-Gm-Message-State: AOAM531uuV73DECm2/mmplIhR71yWsSYye8LNvMFJRtvG7V8kZoSUimP
 ZHSsaoC8oZTjmIp4NhXLjcrXGdlpgOE=
X-Google-Smtp-Source: ABdhPJwQn14leByXcc+8tqNkmGqOTQjGStrhoVDx/ZIdyLfS5vFFqRgYYJt66fVb+8j1dNyvko4hig==
X-Received: by 2002:a63:464b:: with SMTP id v11mr20291747pgk.156.1623732075163; 
 Mon, 14 Jun 2021 21:41:15 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id cq24sm985867pjb.18.2021.06.14.21.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 21:41:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D cache
 flush bits
Date: Tue, 15 Jun 2021 14:41:07 +1000
Message-Id: <20210615044107.1481608-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are several new L1D cache flush bits added to the hcall which reflect
hardware security features for speculative cache access issues.

These behaviours are now being specified as negative in order to simplify
patched kernel compatibility with older firmware (a new problem found in
existing systems would automatically be vulnerable).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c   | 2 ++
 include/hw/ppc/spapr.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f25014afda..dfd9df469d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1299,6 +1299,8 @@ static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
         behaviour |= H_CPU_BEHAV_L1D_FLUSH_PR;
         break;
     case SPAPR_CAP_FIXED:
+        behaviour |= H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
+        behaviour |= H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
         break;
     default: /* broken */
         assert(safe_cache == SPAPR_CAP_BROKEN);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f05219f75e..0f25d081a8 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -398,10 +398,13 @@ struct SpaprMachineState {
 #define H_CPU_CHAR_THR_RECONF_TRIG              PPC_BIT(6)
 #define H_CPU_CHAR_CACHE_COUNT_DIS              PPC_BIT(7)
 #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST           PPC_BIT(9)
+
 #define H_CPU_BEHAV_FAVOUR_SECURITY             PPC_BIT(0)
 #define H_CPU_BEHAV_L1D_FLUSH_PR                PPC_BIT(1)
 #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR           PPC_BIT(2)
 #define H_CPU_BEHAV_FLUSH_COUNT_CACHE           PPC_BIT(5)
+#define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY          PPC_BIT(7)
+#define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS        PPC_BIT(8)
 
 /* Each control block has to be on a 4K boundary */
 #define H_CB_ALIGNMENT     4096
-- 
2.23.0


