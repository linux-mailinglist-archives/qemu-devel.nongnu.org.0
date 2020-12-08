Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937B2D3490
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:58:06 +0100 (CET)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmk3h-0008TC-8k
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiyw-0001OB-TP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:43514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiyu-0000ve-Qo
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A8CAAD35;
 Tue,  8 Dec 2020 19:48:53 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v9 12/32] tcg: make CPUClass.cpu_exec_* optional
Date: Tue,  8 Dec 2020 20:48:19 +0100
Message-Id: <20201208194839.31305-13-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208194839.31305-1-cfontana@suse.de>
References: <20201208194839.31305-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

This will let us simplify the code that initializes CPU class
methods, when we move cpu_exec_*() to a separate struct.
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/tcg/cpu-exec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8d31145ad2..890b88861a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -240,14 +240,18 @@ static void cpu_exec_enter(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->cpu_exec_enter(cpu);
+    if (cc->cpu_exec_enter) {
+        cc->cpu_exec_enter(cpu);
+    }
 }
 
 static void cpu_exec_exit(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->cpu_exec_exit(cpu);
+    if (cc->cpu_exec_exit) {
+        cc->cpu_exec_exit(cpu);
+    }
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -619,7 +623,8 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
            True when it is, and we should restart on a new TB,
            and via longjmp via cpu_loop_exit.  */
         else {
-            if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {
+            if (cc->cpu_exec_interrupt &&
+                cc->cpu_exec_interrupt(cpu, interrupt_request)) {
                 if (need_replay_interrupt(interrupt_request)) {
                     replay_interrupt();
                 }
-- 
2.26.2


