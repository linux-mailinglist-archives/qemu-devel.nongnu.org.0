Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822C6ED1F7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:05:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqygR-0001Bp-Bs; Mon, 24 Apr 2023 12:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqygP-0001B1-49
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqygN-0008OD-CW
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682352290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxtSIVuHb7gtaD/y/MKGISw7YNPZgYIfmHDicVZ8Wik=;
 b=iFZZu00xjWqUE3LQt7NefiifJaIyWixZPPfFVKs4Rv0d9+jwWh3+XG32lZ52n1QFB7rjGJ
 UhaX55Fq2ciSYMoUKghhIX8DNNt2dXKXW6shorNCPnZ6xLQOlfbJ0RMvbZb+0YpgkSQil/
 zZNdWZ48Y3NtTza2eH90t4U0hbT/UvA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-0J8ALhdAOZ6-Ri3d3lUD4w-1; Mon, 24 Apr 2023 12:04:44 -0400
X-MC-Unique: 0J8ALhdAOZ6-Ri3d3lUD4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F691185A78B;
 Mon, 24 Apr 2023 16:04:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 839B4492B03;
 Mon, 24 Apr 2023 16:04:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 3/3] hw/core: Move machine-qmp-cmds.c into the target
 independent source set
Date: Mon, 24 Apr 2023 18:04:34 +0200
Message-Id: <20230424160434.331175-4-thuth@redhat.com>
In-Reply-To: <20230424160434.331175-1-thuth@redhat.com>
References: <20230424160434.331175-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only target specific code that is left in here are two spots that
use TARGET_NAME. Change them to use the new target_name() wrapper
function instead, so we can move the file into the common softmmu_ss
source set. That way we only have to compile this file once, and not
for each target anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 4 ++--
 hw/core/meson.build        | 5 +----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index c158c02aa3..3860a50c3b 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -37,7 +37,7 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     CpuInfoFastList *head = NULL, **tail = &head;
-    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
+    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, target_name(),
                                           -1, &error_abort);
     CPUState *cpu;
 
@@ -117,7 +117,7 @@ TargetInfo *qmp_query_target(Error **errp)
 {
     TargetInfo *info = g_malloc0(sizeof(*info));
 
-    info->arch = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME, -1,
+    info->arch = qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
                                  &error_abort);
 
     return info;
diff --git a/hw/core/meson.build b/hw/core/meson.build
index ae977c9396..959bc924d4 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -41,6 +41,7 @@ softmmu_ss.add(files(
   'gpio.c',
   'loader.c',
   'machine-hmp-cmds.c',
+  'machine-qmp-cmds.c',
   'machine.c',
   'nmi.c',
   'null-machine.c',
@@ -51,7 +52,3 @@ softmmu_ss.add(files(
   'vm-change-state-handler.c',
   'clock-vmstate.c',
 ))
-
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
-  'machine-qmp-cmds.c',
-))
-- 
2.31.1


