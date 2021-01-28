Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D143078B7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:54:30 +0100 (CET)
Received: from localhost ([::1]:54266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58gi-0000NE-QP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZO-0007Xz-IR; Thu, 28 Jan 2021 09:46:50 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:28786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZM-0000c2-0Z; Thu, 28 Jan 2021 09:46:50 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1611844301; h=from:subject:to:date:message-id;
 bh=w/EyQalOWuVWocDQhP95aCvyNFJVs0DYo9EJN601YUQ=;
 b=flLeISIFqKBUHRaHsrxqNnIlUwKDKvZcdrH/m5LurAIsOJyMAPFB6t82xabk7DSBCIq8cagn7rR
 TGYUXztfF8VaSrjpiKVZXMKqVBkDTCLJI0cIzIq4oRhbIWm9rhBdWlg+6PfnDJtTMA1Q+3A5Ck5Ef
 0/MiCkp3N3lTy18+MqaIEudGNqZxtNvU6R3PNyR4jneXl/Eg5zy7ME/hISPCxj8vQ2iRa3TpIZr4N
 gCr2XBENOSGCiTSuvqnddKuUNZz/JfXRwbHFa2NCZKbNUUMFHDpIxSJ9zK+THWOZWSN+RcwWideU3
 zxufOLKIrxAnXgm4IT12qsCdArRueIALxptw==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge06.gtri.dmz
 (10.41.104.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Thu, 28 Jan 2021
 09:31:41 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Thu, 28
 Jan 2021 09:31:41 -0500
To: <qemu-arm@nongnu.org>
Subject: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
Date: Thu, 28 Jan 2021 09:31:02 -0500
Message-ID: <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-devel@nongnu.org>

Fixes an issue in migration where the reset value of SCR and the value
produced by scr_write via the writefn for SCR_EL3 mismatch.

Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbd..e3c4fe76cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5785,7 +5785,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
-      .resetvalue = 0, .writefn = scr_write },
+      .resetvalue = 0, .writefn = scr_write, .raw_writefn = raw_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.20.1


