Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A335DF8F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:58:22 +0200 (CEST)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIcX-0000bv-PA
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZT-0006X4-Eb; Tue, 13 Apr 2021 08:55:11 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZQ-0005Oy-PM; Tue, 13 Apr 2021 08:55:11 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z22so3033375plo.3;
 Tue, 13 Apr 2021 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZY/g1DDp//F/F5LFsGZagO1HYB3lEEm5TGBFu+93DlY=;
 b=CSm3zibNli/5wDq9tkVE5rAHeDLx0bCpNheiif+MGFBDkdS3LYfPyMMd6zPaqzeSt1
 G3TzsdlYBSaCSiV29Dm64o9slMT16CzhkF7eKFOwuE+vXZ3TdHtKt0T/JJWLYOzP8dLY
 UUBLlUZfHvd2bveeQYP6lPg66TGYtGRE+gKRJkbK+yevY/sHWtDPT1bLdaUMGVAg2dMu
 HKu/QKfbKX4iKuWV283JnJBwl1ndTyWwRRXpPXu/ILRLNE4o8wlw5B3fkg6N2AdmHT+q
 axQkvQ9dByGqcTeweIEHfkQgS9VsmhntgTEUVwC9cRFTq8+lfhvWTXP5UVYBb0nI6VXX
 TT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZY/g1DDp//F/F5LFsGZagO1HYB3lEEm5TGBFu+93DlY=;
 b=mhIF4wEPK2xhZx2jxWr8UTVFi+uEY0rzrxNq77AULeJyblFPPaeTe6Fycs5BcgG3+g
 OPQal4TzG9qt9i7aiPa8XzEtw/QB7TYeWaosrwLYSM9+tKBZFjsdg27mJSF7gSP36BDW
 WxnJreZ0APq9znGgpjr2n9TTVGZ3kP/FMI9DqmsTH4FY2rlSvf0p1DLIUztT7N87XQVl
 h4C5TMPB2vIQfrR4BgOWlltzdmrARp6wnr7AiUBnz4zv75QMvyhoerr6cx/m3GajinQ6
 Z044czy14wRoo2CucAMJiyAsD6Bn1MeMHq6wYkzFMiGJ4xUJeLhYtNm8jpBIGCPhSocc
 35mw==
X-Gm-Message-State: AOAM531y2/oIyVt1CavHjDcVOSrjf7/CVs+gZLA1Bbl0JecAxQm5w1KA
 FjUkuxUVEVkdH4p8mWXrWzflk23PL7A=
X-Google-Smtp-Source: ABdhPJxo7Momz6MM7/LHKPe81Zw3k2++L9Wg7JulItsJK//HmyRi7aShIgYG/8cc6mSzJDB5geGDwQ==
X-Received: by 2002:a17:902:fe91:b029:eb:ad8:c5f with SMTP id
 x17-20020a170902fe91b02900eb0ad80c5fmr8029266plm.63.1618318506690; 
 Tue, 13 Apr 2021 05:55:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-90-211.tpgi.com.au.
 [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id s40sm9627352pfw.133.2021.04.13.05.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:55:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 1/3] target/ppc: Fix POWER9 radix guest HV interrupt AIL
 behaviour
Date: Tue, 13 Apr 2021 22:54:46 +1000
Message-Id: <20210413125448.1689545-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210413125448.1689545-1-npiggin@gmail.com>
References: <20210413125448.1689545-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
the LPCR[AIL] value can apply to hypervisor interrupts.

This affects machines that emulate HV=1 mode (i.e., powernv9).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 85de7e6c90..b8881c0f85 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
 
     /*
-     * AIL only works if there is no HV transition and we are running
-     * with translations enabled
+     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
      */
-    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
-        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
+    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
         ail = 0;
     }
 
+    /*
+     * AIL does not work if there is a MSR[HV] 0->1 transition and the
+     * partition is in HPT mode. For radix guests, such interrupts are
+     * allowed to be delivered to the hypervisor in ail mode.
+     */
+    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
+        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
+            ail = 0;
+        }
+    }
+
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
-- 
2.23.0


