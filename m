Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F23D9555
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:35:26 +0200 (CEST)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oOr-0001oV-EY
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLg-0005sp-Vg
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLc-00074q-Un
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnurmMofQyRZNu14FFqXtCfqMjzhNHVTjd0gZ+853yw=;
 b=Xos9/UgoVWLRYDAPOcGCq5Z8FP13pjy1a9eXGYtSbdTvLIqA/Dcr0alZcNJ46g835VFhnD
 IDO4H0tpBz9q+jK5QwJ7kfn/U/KZmBU+eJ4NHc8RpcoBk9oHy6lzn+LryDwkX1aWizP6TJ
 3/3d7kITlQOHFEgnGuUP+AnOg+NlInc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-faFzZJVvNfGWDLA-mM0iSQ-1; Wed, 28 Jul 2021 14:32:02 -0400
X-MC-Unique: faFzZJVvNfGWDLA-mM0iSQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 18-20020a05620a0792b02903b8e915ccceso2130557qka.18
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BnurmMofQyRZNu14FFqXtCfqMjzhNHVTjd0gZ+853yw=;
 b=hpraokv5FLNgheWOcuLOOk4oexafVJZQUDlIedSDQp0ieRkGWq33NZLve4aT0C1VGy
 lzcj+03cbig0ppwn8hk3nPcDNETVzX98n1Ar5m3mJ1H1BbaI8W8NmT1+LVnSYP8vJoks
 eslNv6pmzo9781ufjN8H8XQ2bt6z+s5fq2tvJMpZhK3/AHBCwlswjyFfAlXLF3RRDBtk
 oCCWiGdyx4Vs0f5Kzs1P7wqRrAWJ/TPZinGepoafA1AezCOXt4/8fqynrjZwKjzmlNP7
 PniIcvj9O9zkSxoJqDjYRIQ6eoi091YsZcrBIzZMjUvGT6nGnKA0T5zTyh8r8yg6HZgo
 Vafg==
X-Gm-Message-State: AOAM531NGrA9egK+SmurQyecjycSQqO9A1dIFJGsdtNC+NlEzWBU+QDG
 8n8jsAbkA9KqLQMaD6j+837SBGo0YAkBmiQImyzATNv9aCdGx1G0Udmn9cS0b8xklxhOltBSntV
 aEfftoY5kqjk+2zUBy1DkAFC7SuqT4BH9n12Y7CFHkGnRwgE8KLxztus+G1JiKpOu
X-Received: by 2002:a37:a8d3:: with SMTP id r202mr1059759qke.216.1627497118782; 
 Wed, 28 Jul 2021 11:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFSZrLLzcNQAimKCszO+vO5fYfQGD92Z0QKhwVg1n1nZ1IpsNLzIpBh88oDBm8uXCBR9BSzQ==
X-Received: by 2002:a37:a8d3:: with SMTP id r202mr1059726qke.216.1627497118508; 
 Wed, 28 Jul 2021 11:31:58 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:31:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] cpus: Move do_run_on_cpu into softmmu/cpus.c
Date: Wed, 28 Jul 2021 14:31:45 -0400
Message-Id: <20210728183151.195139-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's only used by softmmu binaries not linux-user ones.  Make it static and
drop the definition in the header too.

Since at it, initialize variable "wi" with less loc.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c         | 25 -------------------------
 include/hw/core/cpu.h | 12 ------------
 softmmu/cpus.c        | 23 +++++++++++++++++++++++
 3 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index d814b2439a..670826363f 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -124,31 +124,6 @@ void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
     qemu_cpu_kick(cpu);
 }
 
-void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-                   QemuMutex *mutex)
-{
-    struct qemu_work_item wi;
-
-    if (qemu_cpu_is_self(cpu)) {
-        func(cpu, data);
-        return;
-    }
-
-    wi.func = func;
-    wi.data = data;
-    wi.done = false;
-    wi.free = false;
-    wi.exclusive = false;
-
-    queue_work_on_cpu(cpu, &wi);
-    while (!qatomic_mb_read(&wi.done)) {
-        CPUState *self_cpu = current_cpu;
-
-        qemu_cond_wait(&qemu_work_cond, mutex);
-        current_cpu = self_cpu;
-    }
-}
-
 void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     struct qemu_work_item *wi;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f62ae88524..711ecad62f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -689,18 +689,6 @@ void qemu_cpu_kick(CPUState *cpu);
  */
 bool cpu_is_stopped(CPUState *cpu);
 
-/**
- * do_run_on_cpu:
- * @cpu: The vCPU to run on.
- * @func: The function to be executed.
- * @data: Data to pass to the function.
- * @mutex: Mutex to release while waiting for @func to run.
- *
- * Used internally in the implementation of run_on_cpu.
- */
-void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-                   QemuMutex *mutex);
-
 /**
  * run_on_cpu:
  * @cpu: The vCPU to run on.
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..49e0368438 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -382,6 +382,29 @@ void qemu_init_cpu_loop(void)
     qemu_thread_get_self(&io_thread);
 }
 
+static void
+do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
+              QemuMutex *mutex)
+{
+    struct qemu_work_item wi = {
+        .func = func,
+        .data = data,
+    };
+
+    if (qemu_cpu_is_self(cpu)) {
+        func(cpu, data);
+        return;
+    }
+
+    queue_work_on_cpu(cpu, &wi);
+    while (!qatomic_mb_read(&wi.done)) {
+        CPUState *self_cpu = current_cpu;
+
+        qemu_cond_wait(&qemu_work_cond, mutex);
+        current_cpu = self_cpu;
+    }
+}
+
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
-- 
2.31.1


