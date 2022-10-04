Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97965F4C56
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 01:04:10 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofqxN-00088X-Fl
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 19:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1ofqqL-000348-TZ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:56:53 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51076 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1ofqqJ-0000HC-TI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:56:53 -0400
Received: from localhost.localdomain
 (dynamic-095-117-005-115.95.117.pool.telefonica.de [95.117.5.115])
 by csgraf.de (Postfix) with ESMTPSA id F1386608062A;
 Wed,  5 Oct 2022 00:56:45 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH 1/3] x86: Implement MSR_CORE_THREAD_COUNT MSR
Date: Wed,  5 Oct 2022 00:56:41 +0200
Message-Id: <20221004225643.65036-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20221004225643.65036-1-agraf@csgraf.de>
References: <20221004225643.65036-1-agraf@csgraf.de>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Intel CPUs starting with Haswell-E implement a new MSR called
MSR_CORE_THREAD_COUNT which exposes the number of threads and cores
inside of a package.

This MSR is used by XNU to populate internal data structures and not
implementing it prevents virtual machines with more than 1 vCPU from
booting if the emulated CPU generation is at least Haswell-E.

This patch propagates the existing hvf logic from patch 027ac0cb516
("target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT") to TCG.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/i386/tcg/sysemu/misc_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1328aa656f..e1528b7f80 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -450,6 +450,11 @@ void helper_rdmsr(CPUX86State *env)
      case MSR_IA32_UCODE_REV:
         val = x86_cpu->ucode_rev;
         break;
+    case MSR_CORE_THREAD_COUNT: {
+        CPUState *cs = CPU(x86_cpu);
+        val = (cs->nr_threads * cs->nr_cores) | (cs->nr_cores << 16);
+        break;
+    }
     default:
         if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
             && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
-- 
2.37.0 (Apple Git-136)


