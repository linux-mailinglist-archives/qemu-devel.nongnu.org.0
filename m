Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7455ABC9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:43:13 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59oO-0006Ib-Ne
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1o59kP-0003Sr-Qk
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:39:06 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53166
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1o59kN-0007SI-Vg
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:39:05 -0400
HMM_SOURCE_IP: 172.18.0.48:34982.1285566443
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.81 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 843752800DD;
 Sun, 26 Jun 2022 01:38:59 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 220381ee3d9c49e5bed5ed9e413ddb9c for
 qemu-devel@nongnu.org; Sun, 26 Jun 2022 01:39:02 CST
X-Transaction-ID: 220381ee3d9c49e5bed5ed9e413ddb9c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>
Subject: [PATCH v25 5/8] accel/kvm/kvm-all: Introduce kvm_dirty_ring_size
 function
Date: Sun, 26 Jun 2022 01:38:34 +0800
Message-Id: <f9ce1f550bfc0e3a1f711e17b1dbc8f701700e56.1656177590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce kvm_dirty_ring_size util function to help calculate
dirty ring ful time.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Acked-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c    | 5 +++++
 accel/stubs/kvm-stub.c | 5 +++++
 include/sysemu/kvm.h   | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 672ed00..59b8ea1 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2318,6 +2318,11 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
                            strList *names, strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
 
+uint32_t kvm_dirty_ring_size(void)
+{
+    return kvm_state->kvm_dirty_ring_size;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 3345882..2ac5f9c 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -148,3 +148,8 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
+
+uint32_t kvm_dirty_ring_size(void)
+{
+    return 0;
+}
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


