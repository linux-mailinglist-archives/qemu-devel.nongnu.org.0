Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A23897ED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:32:43 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSry-0007CE-PK
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSjQ-0005Y8-K0; Wed, 19 May 2021 16:23:54 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48290 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSjM-0003Qw-4u; Wed, 19 May 2021 16:23:52 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 9F1FC60807A6;
 Wed, 19 May 2021 22:23:06 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 18/19] arm: Enable Windows 10 trusted SMCCC boot call
Date: Wed, 19 May 2021 22:22:52 +0200
Message-Id: <20210519202253.76782-19-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
in the trusted application call number space, but its purpose is unknown.

In our current SMC implementation, we inject a UDEF for unknown SMC calls,
including this one. However, Windows breaks on boot when we do this. Instead,
let's return an error code.

With this and -M virt,virtualization=on I can successfully boot the current
Windows 10 Insider Preview in TCG.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/kvm-consts.h | 2 ++
 target/arm/psci.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 580f1c1fee..4b64f98117 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -85,6 +85,8 @@ MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_SUSPEND, PSCI_0_2_FN64_CPU_SUSPEND);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_ON, PSCI_0_2_FN64_CPU_ON);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_MIGRATE, PSCI_0_2_FN64_MIGRATE);
 
+#define QEMU_SMCCC_TC_WINDOWS10_BOOT 0xc3000001
+
 /* PSCI v0.2 return values used by TCG emulation of PSCI */
 
 /* No Trusted OS migration to worry about when offlining CPUs */
diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..4d11dd59c4 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -69,6 +69,7 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
     case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    case QEMU_SMCCC_TC_WINDOWS10_BOOT:
         return true;
     default:
         return false;
@@ -194,6 +195,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    case QEMU_SMCCC_TC_WINDOWS10_BOOT:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
     default:
-- 
2.30.1 (Apple Git-130)


