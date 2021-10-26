Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3E43ADC7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:08:45 +0200 (CEST)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHVk-0004hG-7Q
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mfGdf-00045B-Qy
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:12:51 -0400
Received: from mail.csgraf.de ([85.25.223.15]:49104 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mfGdZ-0008O2-40
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:12:49 -0400
Received: from localhost.localdomain
 (dynamic-077-007-071-240.77.7.pool.telefonica.de [77.7.71.240])
 by csgraf.de (Postfix) with ESMTPSA id A8F486080126;
 Tue, 26 Oct 2021 09:12:42 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
Date: Tue, 26 Oct 2021 09:12:41 +0200
Message-Id: <20211026071241.74889-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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
Cc: kettenis@openbsd.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apple's Hypervisor.Framework forwards cache operations as MMIO traps
into user space. For MMIO however, these have no meaning: There is no
cache attached to them.

So let's just treat cache data exits as nops.

This fixes OpenBSD booting as guest.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: AJ Barris <AwlsomeAlex@github.com>
Reference: https://github.com/utmapp/UTM/issues/3197
---
 target/arm/hvf/hvf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bff3e0cde7..0dc96560d3 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1150,12 +1150,19 @@ int hvf_vcpu_exec(CPUState *cpu)
         uint32_t sas = (syndrome >> 22) & 3;
         uint32_t len = 1 << sas;
         uint32_t srt = (syndrome >> 16) & 0x1f;
+        uint32_t cm = (syndrome >> 8) & 0x1;
         uint64_t val = 0;
 
         trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
                              hvf_exit->exception.physical_address, isv,
                              iswrite, s1ptw, len, srt);
 
+        if (cm) {
+            /* We don't cache MMIO regions */
+            advance_pc = true;
+            break;
+        }
+
         assert(isv);
 
         if (iswrite) {
-- 
2.30.1 (Apple Git-130)


