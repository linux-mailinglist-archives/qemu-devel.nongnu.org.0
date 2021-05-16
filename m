Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6223820C0
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 22:03:48 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liMzL-0002FZ-Jw
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 16:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMum-0001sy-8F; Sun, 16 May 2021 15:59:04 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45320 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMuh-0008CS-R4; Sun, 16 May 2021 15:59:03 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id BA7AF6080642;
 Sun, 16 May 2021 21:58:57 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 02/19] hvf: Move vcpu thread functions into common directory
Date: Sun, 16 May 2021 21:58:38 +0200
Message-Id: <20210516195855.28869-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
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

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves the vCPU thread loop over.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 {target/i386 => accel}/hvf/hvf-accel-ops.c | 0
 {target/i386 => accel}/hvf/hvf-accel-ops.h | 0
 accel/hvf/meson.build                      | 1 +
 target/i386/hvf/meson.build                | 1 -
 target/i386/hvf/x86hvf.c                   | 2 +-
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename {target/i386 => accel}/hvf/hvf-accel-ops.c (100%)
 rename {target/i386 => accel}/hvf/hvf-accel-ops.h (100%)

diff --git a/target/i386/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
similarity index 100%
rename from target/i386/hvf/hvf-accel-ops.c
rename to accel/hvf/hvf-accel-ops.c
diff --git a/target/i386/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
similarity index 100%
rename from target/i386/hvf/hvf-accel-ops.h
rename to accel/hvf/hvf-accel-ops.h
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index 227b11cd71..fc52cb7843 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -1,6 +1,7 @@
 hvf_ss = ss.source_set()
 hvf_ss.add(files(
   'hvf-all.c',
+  'hvf-accel-ops.c',
 ))
 
 specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
index d253d5fd10..f6d4c394d3 100644
--- a/target/i386/hvf/meson.build
+++ b/target/i386/hvf/meson.build
@@ -1,6 +1,5 @@
 i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
-  'hvf-accel-ops.c',
   'x86.c',
   'x86_cpuid.c',
   'x86_decode.c',
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 0d7533742e..2b99f3eaa2 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -32,7 +32,7 @@
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "hvf-accel-ops.h"
+#include "accel/hvf/hvf-accel-ops.h"
 
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
-- 
2.30.1 (Apple Git-130)


