Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B937158F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:59:59 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYB4-0005lR-Is
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ldY9s-0004kb-2Q; Mon, 03 May 2021 08:58:44 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ldY9q-0007wp-CU; Mon, 03 May 2021 08:58:43 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t22so3542708pgu.0;
 Mon, 03 May 2021 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imD/eY75fhs1WkYCwa0Gvz7Uh13kMU/RTqeSqiNIWkI=;
 b=I8GPBCkVXVj1/+27jUzedyWouQo7mlUMrG64AKRfS+k5Rxd3L6lpct1oKEq5+mQ+Qf
 8zKa/qk0C1/3920Um3uVitPXLtQ9SlCZn2g5J41pYw8aKz7i/VUI7MhW4VtE8x9Auch4
 VpWVpJ8/Vs5jAgGIUy3D5wyvrr3aUbzTy9K/Mhmln0L9uJIfNoO8Pr/axiW+Enyq1V6p
 ElEMWSR1KDvdfbPtXx+Qtz2gM9jLShIgDhxE4okoI6ALqkGrbH8o2Njc2gLQv9AMkoHy
 gMMRa9h5Ng1DKf4tTxVwEP4K/ymasRqw7hZ6z47QpWq2ZriNeBQFPXkH2wzh06FhPKst
 ojCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imD/eY75fhs1WkYCwa0Gvz7Uh13kMU/RTqeSqiNIWkI=;
 b=qKnnVzBn6Jzjp2QW2LjeaidSytmrUEdh25WXc4Ynrz40jbHf/H8MBYyGI6H1i7euZu
 8J2XYoJS7aaGhbXSWrtabY0JTBI6c8+ZuC6RArXIetvwq7UDQ30AyZucMVSVdvzL0TC5
 Hf/uKWLYh0E4+Oaqg724wX3WSfYZcr4pcsOU3zv82bMyCIHktP+0m6rBBlotpN0Vqx8e
 r/7cbDnC2Lu3AWgvmPnCZ0mq0sItBok7oP+7lsx+fzFeMrp46uS/NCTQgQCqjEaXyT4Z
 Xxt+Ff7E3WsruoIFgSmyoOCEjhseG03QqCFcB5fTyiHeZqnCOy6ia+0nWlffpTp0rkAh
 12yw==
X-Gm-Message-State: AOAM5333R4EVSoAxntS6mIad8eYtb51D/bNm9zixvJzSVtDHrMa2ial3
 cQa8JJkQFXbN1ERKGJqwowBVhKsy0q0=
X-Google-Smtp-Source: ABdhPJzLV3xf4df+BvWgtSnsMhDMYpqEF5ydDlNrvayVHhqTmY1FBhaa4UIubhUUX9bT4U2iULNQeA==
X-Received: by 2002:a63:1960:: with SMTP id 32mr17204791pgz.253.1620046720142; 
 Mon, 03 May 2021 05:58:40 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id w123sm3807338pfw.151.2021.05.03.05.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 05:58:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS bits
Date: Mon,  3 May 2021 22:58:33 +1000
Message-Id: <20210503125833.891752-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52e.google.com
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

There are several new bits added to the hcall which reflect new issues
found and new hardware mitigations.

This adds the link stack flush behaviour, link stack flush accelerated
instruction capability, and several L1D flush type behaviours (which are
now being specified as negative in order to simplify patched kernel
compatibility with older firmware).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c   | 5 +++++
 include/hw/ppc/spapr.h | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7275d0bba1..f656620232 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1878,6 +1878,9 @@ static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
         behaviour |= H_CPU_BEHAV_L1D_FLUSH_PR;
         break;
     case SPAPR_CAP_FIXED:
+        behaviour |= H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
+        behaviour |= H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
+        behaviour |= H_CPU_BEHAV_NO_STF_BARRIER;
         break;
     default: /* broken */
         assert(safe_cache == SPAPR_CAP_BROKEN);
@@ -1909,9 +1912,11 @@ static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
         break;
     case SPAPR_CAP_WORKAROUND:
         behaviour |= H_CPU_BEHAV_FLUSH_COUNT_CACHE;
+        behaviour |= H_CPU_BEHAV_FLUSH_LINK_STACK;
         if (count_cache_flush_assist) {
             characteristics |= H_CPU_CHAR_BCCTR_FLUSH_ASSIST;
         }
+        /* Should have a way to enable BCCTR_LINK_FLUSH_ASSIST */
         break;
     default: /* broken */
         assert(safe_indirect_branch == SPAPR_CAP_BROKEN);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 7f40a158f4..883ac1db3c 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -395,10 +395,16 @@ struct SpaprMachineState {
 #define H_CPU_CHAR_THR_RECONF_TRIG              PPC_BIT(6)
 #define H_CPU_CHAR_CACHE_COUNT_DIS              PPC_BIT(7)
 #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST           PPC_BIT(9)
+#define H_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST      PPC_BIT(11)
+
 #define H_CPU_BEHAV_FAVOUR_SECURITY             PPC_BIT(0)
 #define H_CPU_BEHAV_L1D_FLUSH_PR                PPC_BIT(1)
 #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR           PPC_BIT(2)
 #define H_CPU_BEHAV_FLUSH_COUNT_CACHE           PPC_BIT(5)
+#define H_CPU_BEHAV_FLUSH_LINK_STACK            PPC_BIT(6)
+#define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY          PPC_BIT(7)
+#define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS        PPC_BIT(8)
+#define H_CPU_BEHAV_NO_STF_BARRIER              PPC_BIT(9)
 
 /* Each control block has to be on a 4K boundary */
 #define H_CB_ALIGNMENT     4096
-- 
2.23.0


