Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F53395DA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:08:50 +0100 (CET)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmDR-0002R4-3w
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKlW7-00073l-3E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKlVs-0000JI-6v
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCEF5AFC8;
 Fri, 12 Mar 2021 17:23:00 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v7 39/42] accel: move call to accel_init_interfaces
Date: Fri, 12 Mar 2021 18:22:40 +0100
Message-Id: <20210312172243.25334-40-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312172243.25334-1-cfontana@suse.de>
References: <20210312172243.25334-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move the call for sysemu specifically in machine_run_board_init,
mirror the calling sequence for user mode too.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 bsd-user/main.c   | 2 +-
 hw/core/machine.c | 1 +
 linux-user/main.c | 2 +-
 softmmu/vl.c      | 1 -
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 798aba512c..ae0fd75aa1 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -914,8 +914,8 @@ int main(int argc, char **argv)
     {
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
-        ac->init_machine(NULL);
         accel_init_interfaces(ac);
+        ac->init_machine(NULL);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4386f57b5c..224847a091 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1214,6 +1214,7 @@ void machine_run_board_init(MachineState *machine)
                                    "on", false);
     }
 
+    accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 4f4746dce8..3979adce83 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -706,8 +706,8 @@ int main(int argc, char **argv, char **envp)
     {
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
-        ac->init_machine(NULL);
         accel_init_interfaces(ac);
+        ac->init_machine(NULL);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff488ea3e7..7f2ec01112 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3540,7 +3540,6 @@ void qemu_init(int argc, char **argv, char **envp)
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
     /* NB: for machine none cpu_type could STILL be NULL here! */
-    accel_init_interfaces(ACCEL_GET_CLASS(current_machine->accelerator));
 
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
-- 
2.26.2


