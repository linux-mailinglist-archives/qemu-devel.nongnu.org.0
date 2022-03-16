Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F464DB163
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:26:28 +0100 (CET)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTfX-0006qy-F7
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:26:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nUTO0-0004X9-Ek
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:08:20 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:45273
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nUTNy-0001W3-N7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:08:20 -0400
HMM_SOURCE_IP: 172.18.0.188:41560.1721706285
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 74A3B2800DD;
 Wed, 16 Mar 2022 21:08:09 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id df00bc8261fc4c74b74fba2536e06b17 for
 qemu-devel@nongnu.org; Wed, 16 Mar 2022 21:08:17 CST
X-Transaction-ID: df00bc8261fc4c74b74fba2536e06b17
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v21 5/9] accel/kvm/kvm-all: Introduce kvm_dirty_ring_size
 function
Date: Wed, 16 Mar 2022 21:07:17 +0800
Message-Id: <823c35ac86f0197df54e00d1a749a91519eb3096.1647435820.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1647435820.git.huangy81@chinatelecom.cn>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1647435820.git.huangy81@chinatelecom.cn>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce kvm_dirty_ring_size util function to help calculate
dirty ring ful time.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Acked-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c    | 5 +++++
 accel/stubs/kvm-stub.c | 6 ++++++
 include/sysemu/kvm.h   | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 29bf6a0..0c78bc7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2313,6 +2313,11 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+uint32_t kvm_dirty_ring_size(void)
+{
+    return kvm_state->kvm_dirty_ring_size;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 3345882..c5aafaa 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -148,3 +148,9 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
+
+uint32_t kvm_dirty_ring_size(void)
+{
+    return 0;
+}
+#endif
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a783c78..efd6dee 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -582,4 +582,6 @@ bool kvm_cpu_check_are_resettable(void);
 bool kvm_arch_cpu_check_are_resettable(void);
 
 bool kvm_dirty_ring_enabled(void);
+
+uint32_t kvm_dirty_ring_size(void);
 #endif
-- 
1.8.3.1


