Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B007212178
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 12:42:09 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqwfQ-0004qz-Dj
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 06:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqwdk-0002p5-Ta
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 06:40:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52386
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqwdj-0006PH-8l
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 06:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593686422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5vJfRwga55DB/5YTzhAT68eV5pPVAMCpPo7KYsVfnYU=;
 b=OuRX4ZjOWput9Ve8X0BL4B1Wv7puuPF2gITEZeiU9ZU2bidEi3iNIiRPvCSO9AlFcPXtuQ
 yP0+mXFLbBHKHL7O958dshTLBjqRkofAAgi+6utOkDq1gROX0QiG8a2C+Bu1O5EoRNaAAn
 U9sncrZjrkWf3/2pttROBl75sb9ptXM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-Y8MZ6emkNo-YixVqS2Y1zQ-1; Thu, 02 Jul 2020 06:40:20 -0400
X-MC-Unique: Y8MZ6emkNo-YixVqS2Y1zQ-1
Received: by mail-ed1-f70.google.com with SMTP id h5so26526118edl.7
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 03:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vJfRwga55DB/5YTzhAT68eV5pPVAMCpPo7KYsVfnYU=;
 b=aXOGPts6bpiMNAJIrXyC6rrpIN9yl4sMEQhM0q4IOnal3aHTSbRj0byQFSmB5Hg6a6
 DNX7rYj8JPjhRV+SwGTeadOCQEah/22KLIuOh2QW4kr9hVwj4aCCa6c3ZeuGXDJ+Rwkp
 v90CYETpTpPkTkxBCkBCCQE/MsEK4qHMAH5hJvYyZsvtV5oXcAl5rN6NgU9RmQfAuUGX
 KMoc7reIUS+u3237FJeZ/PBiJPLB/Q9puqpQf/m+WZT1zkHx0akMJ5swfLnCqCE7MhYj
 hBz1i0iedzu2EJxWX3HWlEkyWdwyOhUBCrp0q/PN2oQhP5SkQLN7VfNcGjVihmQKLVLn
 63uw==
X-Gm-Message-State: AOAM533SnEwxQNkw/o/9FRk6LppQvMV9h3/tBH07gxBZJ+uBc7AyyeJP
 Vr1oPUL51cokElk5s1wKjGUR3LEQ820frAIYn6ASUBrHCeE7V8DnHQ5nKW0MNPVitk3r+0CeLVV
 gXIR+iD0dZ3p3TYk=
X-Received: by 2002:a50:f149:: with SMTP id z9mr34591196edl.167.1593686419380; 
 Thu, 02 Jul 2020 03:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsf/ZBfW3SV8eCH9dagbQgud4WZWtkvJtP3m14ZDPX0fxu1Z5/BEcmRrzt4dSWpuNdH5vO8w==
X-Received: by 2002:a50:f149:: with SMTP id z9mr34591175edl.167.1593686419183; 
 Thu, 02 Jul 2020 03:40:19 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l12sm10187559edj.6.2020.07.02.03.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:40:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] cpus: Move CPU code from exec.c to cpus-common.c
Date: Thu,  2 Jul 2020 12:40:17 +0200
Message-Id: <20200702104017.14057-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code was introduced with SMP support in commit 6a00d60127,
later commit 267f685b8b moved CPU list management to common code
but forgot this code. Move now and simplify ifdef'ry.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 cpus-common.c | 18 ++++++++++++++++++
 exec.c        | 22 ----------------------
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 8f5512b3d7..34044f4e4c 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -72,6 +72,8 @@ static int cpu_get_free_index(void)
     return max_cpu_index;
 }
 
+CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
+
 void cpu_list_add(CPUState *cpu)
 {
     QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
@@ -96,6 +98,22 @@ void cpu_list_remove(CPUState *cpu)
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
 }
 
+CPUState *qemu_get_cpu(int index)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        if (cpu->cpu_index == index) {
+            return cpu;
+        }
+    }
+
+    return NULL;
+}
+
+/* current CPU in the current thread. It is only valid inside cpu_exec() */
+__thread CPUState *current_cpu;
+
 struct qemu_work_item {
     QSIMPLEQ_ENTRY(qemu_work_item) node;
     run_on_cpu_func func;
diff --git a/exec.c b/exec.c
index 21926dc9c7..997b7db15f 100644
--- a/exec.c
+++ b/exec.c
@@ -98,12 +98,6 @@ AddressSpace address_space_memory;
 static MemoryRegion io_mem_unassigned;
 #endif
 
-CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
-
-/* current CPU in the current thread. It is only valid inside
-   cpu_exec() */
-__thread CPUState *current_cpu;
-
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
@@ -832,22 +826,6 @@ const VMStateDescription vmstate_cpu_common = {
     }
 };
 
-#endif
-
-CPUState *qemu_get_cpu(int index)
-{
-    CPUState *cpu;
-
-    CPU_FOREACH(cpu) {
-        if (cpu->cpu_index == index) {
-            return cpu;
-        }
-    }
-
-    return NULL;
-}
-
-#if !defined(CONFIG_USER_ONLY)
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr)
 {
-- 
2.21.3


