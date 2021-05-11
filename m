Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019BF37A245
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:36:57 +0200 (CEST)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNsu-0002qA-1c
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXA-000241-WB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWp-0000oh-MS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9BJ88bErOyI/AnPi2X0JhKHyaWAPjHRJdZW9tPdnGM=;
 b=IP3Ms4nptqaQjBt5NGiS9y2QBHSVPDJagmNHTmOW6O+H5/nUo7bPgsFMyH4kvOcptmyy5K
 z/kRkvsrfHoFE0v+8okEUKdIFZmswDdxro22+DGIC3WvEkRdVIIUU4s7ApwOLtRkY46De3
 7XDfzhQ1WN3vxNYPsNFrfaLX5+mfGWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-e6BvHSvUMUa1u9ayy10ziQ-1; Tue, 11 May 2021 04:14:03 -0400
X-MC-Unique: e6BvHSvUMUa1u9ayy10ziQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 236E76D24A;
 Tue, 11 May 2021 08:14:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6B2D6B8DF;
 Tue, 11 May 2021 08:14:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] accel: add init_accel_cpu for adapting accel behavior to
 CPU type
Date: Tue, 11 May 2021 04:13:38 -0400
Message-Id: <20210511081350.419428-22-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

while on x86 all CPU classes can use the same set of TCGCPUOps,
on ARM the right accel behavior depends on the type of the CPU.

So we need a way to specialize the accel behavior according to
the CPU. Therefore, add a second initialization, after the
accel_cpu->cpu_class_init, that allows to do this.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210322132800.7470-24-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel-common.c      | 13 +++++++++++++
 include/hw/core/cpu.h     |  6 ++++++
 target/i386/tcg/tcg-cpu.c |  8 +++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index d77c09d7b5..cf07f78421 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -54,10 +54,23 @@ static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
     CPUClass *cc = CPU_CLASS(klass);
     AccelCPUClass *accel_cpu = opaque;
 
+    /*
+     * The first callback allows accel-cpu to run initializations
+     * for the CPU, customizing CPU behavior according to the accelerator.
+     *
+     * The second one allows the CPU to customize the accel-cpu
+     * behavior according to the CPU.
+     *
+     * The second is currently only used by TCG, to specialize the
+     * TCGCPUOps depending on the CPU type.
+     */
     cc->accel_cpu = accel_cpu;
     if (accel_cpu->cpu_class_init) {
         accel_cpu->cpu_class_init(cc);
     }
+    if (cc->init_accel_cpu) {
+        cc->init_accel_cpu(accel_cpu, cc);
+    }
 }
 
 /* initialize the arch-specific accel CpuClass interfaces */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c68bc3ba8a..d45f78290e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -192,6 +192,12 @@ struct CPUClass {
 
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
+
+    /*
+     * if not NULL, this is called in order for the CPUClass to initialize
+     * class data that depends on the accelerator, see accel/accel-common.c.
+     */
+    void (*init_accel_cpu)(struct AccelCPUClass *accel_cpu, CPUClass *cc);
 };
 
 /*
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index e311f52855..ba39531aa5 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -69,11 +69,17 @@ static struct TCGCPUOps x86_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static void tcg_cpu_class_init(CPUClass *cc)
+static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
+    /* for x86, all cpus use the same set of operations */
     cc->tcg_ops = &x86_tcg_ops;
 }
 
+static void tcg_cpu_class_init(CPUClass *cc)
+{
+    cc->init_accel_cpu = tcg_cpu_init_ops;
+}
+
 /*
  * TCG-specific defaults that override all CPU models when using TCG
  */
-- 
2.26.2



