Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24668AB2E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:25:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLKQ-0003BJ-V3; Sat, 04 Feb 2023 11:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu-weinan@qq.com>) id 1pOL6h-0008EE-8g
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:09:39 -0500
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu-weinan@qq.com>) id 1pOL6c-00072j-SJ
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1675526967; bh=x9D1Snw8RWbqBQC43Urhu3itEat53Yrbhhg7aXaCoKg=;
 h=From:To:Cc:Subject:Date;
 b=zorFfEVVvhplq4VUVU/EzTG58YKZiS0v+B+//PKYwOuG2aT+pZr0lECT2yOjePkeh
 qxhjE6ty94gIY6Aend66e4RgQzulw2JWSBp4wio+ltaJAsF3Z3tLX8R6j+QDHXEegL
 s6oHEthrgMxh/2gmb1uutASUEi28jWoLaSS4qQE0=
Received: from localhost.localdomain ([117.28.251.142])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id 20A0E2FD; Sun, 05 Feb 2023 00:08:10 +0800
X-QQ-mid: xmsmtpt1675526890toup8izxw
Message-ID: <tencent_4154FDEB122B79E7FB824E2941708C7B0106@qq.com>
X-QQ-XMAILINFO: MhH68nX24TAM9xiSDU+5xWs28lnoKEFUj3mqCoyFGVfJfn6/9Ai7bwVL5tQbz1
 9jNnTsPrBE6EDefoLNcHWY5xlKpaekZNphquRLf6560V5JaGAv+euLF7P+JmdQpHoz6GwOJGJJPh
 a5hhsDhNqchYOF5jkrK2V7ZjdRuKmQQrX6O7a0MuIiww4oXiPOZe/s+rCjR/imIlSACw7YMNNcjs
 cj7t7IffLO+hCqZtfEc2wVKR2grSGOIIOsFNPl/Z+THBVpp8YG0EIqutGmJg+vTtMaaDBXEX+05a
 70fqv0jZYiFvFG3JXAS9D2kURyiDY9Rf3Sf0DiDRVTBdDXevKV98C76BT7+ubzaK2nTg9cY6yts7
 q/mgoBryADnDJIJ943wMXlehf+KYOXLw/M5X94+rfwG6FxQOerMa+GJZjBDLljdqmm36o5V/n2EP
 6eSO2Qz5dOnwgqY6Q6ubW4hkYspOf662jgrvfhil6w99ldTl/DaUyTlFkEUJM9XpZgdtT6X8rFFG
 OzTNWCIsegmnmsI5yCy3KWJetztpihG8VYbjcWt8eL/7ylDPvGCtWoeLKTH311mbFZYm0a7AdSyi
 io6ldU/T34g83EV2dyKTnh2w7Gh1fXRxpHWlgWt2YsZfNigsSvNl5z9DWMYnKf6vwaQxAcd4OyyN
 b/EX37pTAfe8g2HK/oeHWkiOvEFNwbK7rLGvJpmY4k5cXlSBxhmo5gaIrl8+Cfqy5ECaAs1YLqIO
 IPlGa4CNV+tkwj/w0ccofZjT7cDASW44dYsXSC+A2SLU6SsadFzqVwNji6MmE5OTYpoBqtiS97Or
 lKJQ+NKrmZExx/prnD55b6RCNSxoTFkI/MC4jdpDSYc3fkhSgRCtdP7J8jyion5tRsSousQFOiLF
 L3e7tYNqM7JRiuOA2X6445gfTk9VrFGHs0OTiqf9YAU+vdQ+WQLdnnnDbPEsfD+oRBSNBAqye/ps
 qtAlqOdIM=
From: Weinan Liu <liu-weinan@qq.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, dgilbert@redhat.com, Weinan Liu <wnliu@stu.xmu.edu.cn>
Subject: [PATCH] KVM: dirty ring: check if vcpu is created before
 dirty_ring_reap_one
Date: Sat,  4 Feb 2023 16:08:08 +0000
X-OQ-MSGID: <20230204160808.753494-1-liu-weinan@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.62.57.64; envelope-from=liu-weinan@qq.com;
 helo=out162-62-57-64.mail.qq.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 04 Feb 2023 11:23:47 -0500
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

From: Weinan Liu <wnliu@stu.xmu.edu.cn>

Failed to assert '(dirty_gfns && ring_size)' in kvm_dirty_ring_reap_one if
the vcpu has not been finished to create yet. This bug occasionally occurs
when I open 200+ qemu instances on my 16G 6-cores x86 machine. And it must
be triggered if inserting a 'sleep(10)' into kvm_vcpu_thread_fn as below--

 static void *kvm_vcpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
     int r;

     rcu_register_thread();

+    sleep(10);
     qemu_mutex_lock_iothread();
     qemu_thread_get_self(cpu->thread);
     cpu->thread_id = qemu_get_thread_id();
     cpu->can_do_io = 1;

where dirty ring reaper will wakeup but then a vcpu has not been finished
to create.

Signed-off-by: Weinan Liu <wnliu@stu.xmu.edu.cn>
---
 accel/kvm/kvm-all.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7e6a6076b1..840da7630e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -719,6 +719,15 @@ static uint64_t kvm_dirty_ring_reap_locked(KVMState *s, CPUState* cpu)
         total = kvm_dirty_ring_reap_one(s, cpu);
     } else {
         CPU_FOREACH(cpu) {
+            /*
+             * Must ensure kvm_init_vcpu is finished, so cpu->kvm_dirty_gfns is
+             * available.
+             */
+            while (cpu->created == false) {
+                qemu_mutex_unlock_iothread();
+                qemu_mutex_lock_iothread();
+            }
+
             total += kvm_dirty_ring_reap_one(s, cpu);
         }
     }
-- 
2.25.1


