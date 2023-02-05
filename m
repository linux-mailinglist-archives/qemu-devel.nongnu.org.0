Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E69668AE8D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 07:49:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOYoq-00020M-Gj; Sun, 05 Feb 2023 01:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu-weinan@qq.com>) id 1pOYon-0001zx-M5
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 01:48:06 -0500
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu-weinan@qq.com>) id 1pOYoi-0000Xf-I0
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 01:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1675579669; bh=BDMRFHW+vkF0WhaOJQJar3rLKBvR8V5Z6mEeiPkOZlk=;
 h=From:To:Cc:Subject:Date;
 b=TIr8DWHyIj0FR2vARsRcccXdkMtN2VY0qeUE+woPN/c17RinbHMYXfn7e6Jx3C4kE
 qOhcj9voafCMCTZtdwcW6HhxQd2X4jHreoJPDIOLaorSQDIA2HHlHpYy3qM8Rrkfvf
 i25XbL9XctsyWCSSPnpTMHDLxRMqRCGa7+rjuLWY=
Received: from localhost.localdomain ([117.28.251.142])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id BF004200; Sun, 05 Feb 2023 14:47:48 +0800
X-QQ-mid: xmsmtpt1675579668t6kfr7nx2
Message-ID: <tencent_C41A2B79E7EEC277A95730BB7B1C94EDEB06@qq.com>
X-QQ-XMAILINFO: Mv8oRO7AAqEFkcOWhV84LthxxpJIEGMEyab99lra0YhMEwc59hy3BM3rHC+gup
 HeF9nPM4WC+XUzZophAxl7r+QAML+IAe1etQF7ORJSu6kvzIxOxPXwIk/Pj/IBR5zoeXBfdqYNat
 12L3aAK1Po9eqPX3oc//9BYnDPnja0oVVG2iYRhecE0mFGnr3A/p+aG/WiQA4Hxyb4lWN1/g1ZUJ
 mxDbLfCrYQJK7O3cQYN/V7qcchGSXqmcPEfYUHzvPuzyWxdQIo5cHo82HTzomCxXy/cUx6kSmFEH
 9dsjSc47hGCEPvHNcfaJai1HlpzhAudQz2qzB7kO7ZskcR4Tvgg+z4mBUJbhxzbhK14NnLTjSTCQ
 93hAt0zdmXjcW/AUsirSDsRqONd6PxdJKv28Xv2PkAeSogNOyDN3imqf+PBV69ckiG3JPjSaUUj1
 ZuNygoOAqg5JOFQL0tTFLW21A0EZiZeCU+HYUQnxXK5gW0jQL9c/hQg7ngX3MHwKcuYhGEV7+pwo
 DY59cqpNc1zxRkluPUhsrsYIZ5zhxd68uEqa6f5Go41Nx8oxGU15l8orBHelzic4/wKB3g5Q1cPT
 sAZFJjef3JX9qfGAwh9hUQRK6vmUJD9rn6qozxAElpogS9JdaI2GNRXbbgrb4RrFNHwRjm0GPNfv
 QaX1niQGn/J0kImheHjXuJ0z1fDJ+flIEp3imD5JsOV9FZwQlQt5h+bCEi7N/2N6LDdp448xXUIQ
 OQixl9azrRtQM0ctYbcxVDOJythY1ySSONpEQ7IW7GvkVYPAs7MsjjgassnLgQEnqjSI6F/1LuxV
 aqJsqtU5b3spKhfveLSf2qoiunjJ1N5XOCurZPvcSOfnAg0aHaWgB75TtJu7BQi9VnluJL7MJg2j
 EjrCVDaFlJyulTT8cAOtkxXcWg13svqvI89gMDZlnzHH5h0JECPrkmBIGct28VDu0M3IyzN9q4Q/
 AlLZ1vyko75JS8h2GywMI6U9SNCqOj/ph4v5I/GKVVljxYg71QXw==
From: Weinan Liu <liu-weinan@qq.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com,
	dgilbert@redhat.com,
	Weinan Liu <liu-weinan@qq.com>
Subject: [PATCH v2] KVM: dirty ring: check if vcpu is created before
 dirty_ring_reap_one
Date: Sun,  5 Feb 2023 06:45:45 +0000
X-OQ-MSGID: <20230205064544.1047103-1-liu-weinan@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.221.205; envelope-from=liu-weinan@qq.com;
 helo=out203-205-221-205.mail.qq.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

Signed-off-by: Weinan Liu <liu-weinan@qq.com>
---
 accel/kvm/kvm-all.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7e6a6076b1..0070ad72b8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1416,6 +1416,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
          */
         sleep(1);
 
+        /* ensure kvm_init_vcpu is finished, so cpu->kvm_dirty_gfns is ok */
+        if (!phase_check(PHASE_MACHINE_READY)) {
+            continue;
+        }
+
         /* keep sleeping so that dirtylimit not be interfered by reaper */
         if (dirtylimit_in_service()) {
             continue;
-- 
2.25.1


