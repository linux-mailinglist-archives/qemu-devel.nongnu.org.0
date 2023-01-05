Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79865F702
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYzv-0001NK-UQ; Thu, 05 Jan 2023 17:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTv-0006i4-VM; Thu, 05 Jan 2023 17:13:03 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTu-00023S-Eu; Thu, 05 Jan 2023 17:13:03 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 807E320B92AE;
 Thu,  5 Jan 2023 14:13:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 807E320B92AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672956781;
 bh=0vqipwJO687PYjgTT1xXJiaZkuc8ITjjIBNOXxLxqcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UCqlOsYAK5YdJHFhB95Nzae/kf/JV37Rwq4gOH+A6n/D35ucLqVL3OmKDcLarRuaY
 vW5HTKkZX0utZKdk79zXLeM71vLQwOqVx5U7En8xPrxze1KP/IlvIlBgsdurd8AAXq
 Xtt7YerXGs6Qwt+FSIZVHQBta222vNxpwcrzv86Q=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 3/3] target/arm: allow writes to SCR_EL3.HXEn bit when
 FEAT_HCX is enabled
Date: Thu,  5 Jan 2023 23:12:51 +0100
Message-Id: <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:46:05 -0500
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

ARM trusted firmware, when built with FEAT_HCX support, sets SCR_EL3.HXEn bit
to allow EL2 to modify HCRX_EL2 register without trapping it in EL3. Qemu
uses a valid mask to clear unsupported SCR_EL3 bits when emulating SCR_EL3
write, and that mask doesn't include SCR_EL3.HXEn bit even if FEAT_HCX is
enabled and exposed to the guest. As a result EL3 writes of that bit are
ignored.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..962affdd52 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1844,6 +1844,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_sme, cpu)) {
             valid_mask |= SCR_ENTP2;
         }
+        if (cpu_isar_feature(aa64_hcx, cpu)) {
+            valid_mask |= SCR_HXEN;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.34.1


