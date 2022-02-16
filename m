Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA84B7F69
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:19:12 +0100 (CET)
Received: from localhost ([::1]:58568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKBmZ-00063M-1Y
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:19:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nKBhw-0000Gj-QD
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 23:14:24 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:52741
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nKBhr-0003Al-Kx
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 23:14:24 -0500
HMM_SOURCE_IP: 172.18.0.218:44970.1811461926
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id BC8EB2800B4;
 Wed, 16 Feb 2022 12:14:14 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 400819528a0443bb9422a92566f14cd6 for
 qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:14:17 CST
X-Transaction-ID: 400819528a0443bb9422a92566f14cd6
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v15 5/7] accel/kvm/kvm-all: Introduce kvm_dirty_ring_size
 function
Date: Wed, 16 Feb 2022 12:13:36 +0800
Message-Id: <da666337a3d8ee1ead3d77dda9da28f0640a095f.1644976046.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1644976045.git.huangy81@chinatelecom.cn>
References: <cover.1644976045.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1644976045.git.huangy81@chinatelecom.cn>
References: <cover.1644976045.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce kvm_dirty_ring_size util function to help calculate
dirty ring ful time.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 accel/kvm/kvm-all.c    | 5 +++++
 accel/stubs/kvm-stub.c | 5 +++++
 include/sysemu/kvm.h   | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7b06b8a..8821d80 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2312,6 +2312,11 @@ bool kvm_dirty_ring_enabled(void)
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
index 5319573..1128cb2 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -152,4 +152,9 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
+
+uint32_t kvm_dirty_ring_size(void)
+{
+    return 0;
+}
 #endif
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6eb39a0..bc3f0b5 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -563,4 +563,6 @@ bool kvm_cpu_check_are_resettable(void);
 bool kvm_arch_cpu_check_are_resettable(void);
 
 bool kvm_dirty_ring_enabled(void);
+
+uint32_t kvm_dirty_ring_size(void);
 #endif
-- 
1.8.3.1


