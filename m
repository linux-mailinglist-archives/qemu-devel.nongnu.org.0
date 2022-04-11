Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7E4FB46A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:14:35 +0200 (CEST)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndoFu-0002RN-FT
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo1F-0000Ql-6b
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo1C-00077r-7Y
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFEQw6TAiR8zpvoPxHD0fZ8/v2qfC8PwRKOENW9Vpg8=;
 b=PmkiMumnIwZauj1T7j8ERz1JXbXLvSZBcBTCLoH5VGTSRObyMB75v4K4dXx+Hg4IYpNpVw
 adXa60xfeG7FlUKKuh2gNgQ2IXG5FTGdfqz7WOJPhCvxU8UDmD34vaBz/LBHUSu3Ktq0+9
 piiUjaMTYJnToj/NSM7HEFuhnu+ULF8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-ZEKaOB5JMVKmiL-XGO-ZDw-1; Mon, 11 Apr 2022 02:59:18 -0400
X-MC-Unique: ZEKaOB5JMVKmiL-XGO-ZDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB6EA3801EC6;
 Mon, 11 Apr 2022 06:59:17 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27FA84029AD;
 Mon, 11 Apr 2022 06:59:10 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 4/5] target/arm: Migrate coprocessor register indirect
 addressing information
Date: Mon, 11 Apr 2022 14:58:41 +0800
Message-Id: <20220411065842.63880-5-gshan@redhat.com>
In-Reply-To: <20220411065842.63880-1-gshan@redhat.com>
References: <20220411065842.63880-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This migrates @cpreg_value_array_len and @cpreg_value_indexes, which
are used to indirectly addressing the storage space for the corresponding
coprocessor register.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/machine.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 135d2420b5..ce6f2599d8 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -677,10 +677,13 @@ static int cpu_pre_save(void *opaque)
     }
 
     cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
+    cpu->cpreg_vmstate_value_array_len = cpu->cpreg_value_array_len;
     memcpy(cpu->cpreg_vmstate_indexes, cpu->cpreg_indexes,
            cpu->cpreg_array_len * sizeof(uint64_t));
     memcpy(cpu->cpreg_vmstate_values, cpu->cpreg_values,
-           cpu->cpreg_array_len * sizeof(uint64_t));
+           cpu->cpreg_value_array_len * sizeof(uint64_t));
+    memcpy(cpu->cpreg_vmstate_value_indexes, cpu->cpreg_value_indexes,
+           cpu->cpreg_array_len * sizeof(uint32_t));
 
     return 0;
 }
@@ -719,7 +722,7 @@ static int cpu_post_load(void *opaque, int version_id)
 {
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
-    int i, v;
+    int i, v, n;
 
     /*
      * Handle migration compatibility from old QEMU which didn't
@@ -757,8 +760,19 @@ static int cpu_post_load(void *opaque, int version_id)
             /* register in their list but not ours: fail migration */
             return -1;
         }
+
         /* matching register, copy the value over */
-        cpu->cpreg_values[i] = cpu->cpreg_vmstate_values[v];
+        if (v < cpu->cpreg_vmstate_array_len - 1) {
+            n = cpu->cpreg_vmstate_value_indexes[v + 1] -
+                cpu->cpreg_vmstate_value_indexes[v];
+        } else {
+            n = cpu->cpreg_vmstate_value_array_len -
+                cpu->cpreg_vmstate_value_indexes[v];
+        }
+
+        memcpy(&cpu->cpreg_values[cpu->cpreg_value_indexes[i]],
+               &cpu->cpreg_vmstate_values[cpu->cpreg_vmstate_value_indexes[v]],
+               n * sizeof(uint64_t));
         v++;
     }
 
@@ -814,8 +828,8 @@ static int cpu_post_load(void *opaque, int version_id)
 
 const VMStateDescription vmstate_arm_cpu = {
     .name = "cpu",
-    .version_id = 22,
-    .minimum_version_id = 22,
+    .version_id = 23,
+    .minimum_version_id = 23,
     .pre_save = cpu_pre_save,
     .post_save = cpu_post_save,
     .pre_load = cpu_pre_load,
@@ -844,12 +858,16 @@ const VMStateDescription vmstate_arm_cpu = {
          * incoming data possibly overflowing the array.
          */
         VMSTATE_INT32_POSITIVE_LE(cpreg_vmstate_array_len, ARMCPU),
+        VMSTATE_INT32_POSITIVE_LE(cpreg_vmstate_value_array_len, ARMCPU),
         VMSTATE_VARRAY_INT32(cpreg_vmstate_indexes, ARMCPU,
                              cpreg_vmstate_array_len,
                              0, vmstate_info_uint64, uint64_t),
         VMSTATE_VARRAY_INT32(cpreg_vmstate_values, ARMCPU,
-                             cpreg_vmstate_array_len,
+                             cpreg_vmstate_value_array_len,
                              0, vmstate_info_uint64, uint64_t),
+        VMSTATE_VARRAY_INT32(cpreg_vmstate_value_indexes, ARMCPU,
+                             cpreg_vmstate_array_len,
+                             0, vmstate_info_uint32, uint32_t),
         VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
-- 
2.23.0


