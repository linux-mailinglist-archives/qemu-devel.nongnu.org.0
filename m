Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33402DB013
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:30:19 +0100 (CET)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCHK-0003Oi-Pd
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC92-0008Qg-Az
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8x-0002RQ-7F
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=idrWqyH1Q3xKOmnC0+XX0NF19MM1nadzG/zDXlCfeno=;
 b=SGZLFGjJaWS8rh0dZw84zTME0cNp6Sc3HaD3wVk128U+wXNWQAaryxY+olWPTfi4P6rsNZ
 Z6xZEok7GcZn9HM7sxWSa4RjltUmx5dV34D4OpBX2rk3QKBuNzGkooXz91+MmAPlholkq1
 y2m3CynwT7YH4aU8+sp+RoNf9Ck5B4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-1LibHVY3OIeLpk3ObYXiGA-1; Tue, 15 Dec 2020 10:21:30 -0500
X-MC-Unique: 1LibHVY3OIeLpk3ObYXiGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB499190B2CD;
 Tue, 15 Dec 2020 15:20:07 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28CEE100239A;
 Tue, 15 Dec 2020 15:20:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/25] cpu: Move cpu_common_props to hw/core/cpu.c
Date: Tue, 15 Dec 2020 10:19:29 -0500
Message-Id: <20201215151942.3125089-13-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no reason to keep the property list separate from the CPU
class code.  Move the variable to hw/core/cpu.c and make it
static.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201211220529.2290218-3-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/cpu.c         | 15 +++++++++++++++
 include/hw/core/cpu.h |  1 -
 cpu.c                 | 15 ---------------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 576fa1d7ba..5c89c858aa 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -393,6 +393,21 @@ static vaddr cpu_adjust_watchpoint_address(CPUState *cpu, vaddr addr, int len)
     return addr;
 }
 
+static Property cpu_common_props[] = {
+#ifndef CONFIG_USER_ONLY
+    /* Create a memory property for softmmu CPU object,
+     * so users can wire up its memory. (This can't go in hw/core/cpu.c
+     * because that file is compiled only once for both user-mode
+     * and system builds.) The default if no link is set up is to use
+     * the system address space.
+     */
+    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+#endif
+    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3d92c967ff..8e7552910d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1111,7 +1111,6 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
-extern Property cpu_common_props[];
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
diff --git a/cpu.c b/cpu.c
index 0be5dcb6f3..0c485cdf2d 100644
--- a/cpu.c
+++ b/cpu.c
@@ -144,21 +144,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
 #endif
 }
 
-Property cpu_common_props[] = {
-#ifndef CONFIG_USER_ONLY
-    /* Create a memory property for softmmu CPU object,
-     * so users can wire up its memory. (This can't go in hw/core/cpu.c
-     * because that file is compiled only once for both user-mode
-     * and system builds.) The default if no link is set up is to use
-     * the system address space.
-     */
-    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-#endif
-    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 void cpu_exec_initfn(CPUState *cpu)
 {
     cpu->as = NULL;
-- 
2.28.0


