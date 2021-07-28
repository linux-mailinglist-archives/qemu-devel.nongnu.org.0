Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143373D9553
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:34:20 +0200 (CEST)
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oNm-0000Bg-Ne
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLf-0005qh-WB
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLc-0006zp-63
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PToPelZrDy393gYxKc24vHrF2ftEKJxS7b4elQKZrGw=;
 b=TzgPsl5G60Xe0NDEXal8ePcHchSQDHN94YVD4oXtYa6pM0n9VfCAEnnqKaE84DcZYdgjMM
 F4wxB4yf/le7brixIKoUoD5zFQV12oq7xU+4Ii2B/e622sXA34WLQqDA6uFxotG7yH7xzU
 vnwiZPc4jLSeyB5ZfUN9wNlrkGnZV44=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-jy3wCNUrNEOccmUYJzBpKw-1; Wed, 28 Jul 2021 14:31:58 -0400
X-MC-Unique: jy3wCNUrNEOccmUYJzBpKw-1
Received: by mail-qk1-f200.google.com with SMTP id
 13-20020a370e0d0000b02903a5eee61155so2166145qko.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PToPelZrDy393gYxKc24vHrF2ftEKJxS7b4elQKZrGw=;
 b=WqPHeljzRWhEcPKWgs/BtBImgAnJzosKTZt8XaDecKJgNXuR/dRaPyv5GceOHbdeL+
 iB0dWCqBDB56/DleVTVMnBvYfzWGyVzMc6TMLTsXmu/BaEHi4fvakAPkrKT2NwksU1Ap
 pmeS/FtZgyODK0o+utzrG5De/QWIuFqGim9y5Sa3KkTgkj2P7YDv2bsNcBUDn5wREO3G
 CDppY37RG6A7w4b6EtaX5OxsHDQvPeDzQFP3+Byo53u/HmT8USguMZJoAqWnWLXhWGMa
 npAuOo15nlCpk60PwCfw7HkSHy/AzsHkXx7adFFZn6FglC1Ztjr36NfaCWntwr13GZq2
 lvKg==
X-Gm-Message-State: AOAM533r9LILF+bx9BGF/eN8Du6wWOXxtzSpyHsZXbicCSiuJwLD+mTu
 ywNw5ixFCj32TqrecpRUUNkTvavkbG1Z6KI2J+WC7GGe6dfhMmGsB1lNKiQXvGjmY/6OY5lDFrr
 Nhe5gheGV3r/nZmEXNo27CofTCBntYd+4N858Jvlh8lTfRZFqNrcwQ3KAY/0ik90Y
X-Received: by 2002:a05:622a:283:: with SMTP id
 z3mr848286qtw.312.1627497117392; 
 Wed, 28 Jul 2021 11:31:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRYZ1PzRkY+wrj568q7uy5hPCl2ndE7Rkhek9jtRYc5CTKoeHIYGHB4bOLgegb9WnxNSm0rg==
X-Received: by 2002:a05:622a:283:: with SMTP id
 z3mr848260qtw.312.1627497117100; 
 Wed, 28 Jul 2021 11:31:57 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:31:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] cpus: Export queue work related fields to cpu.h
Date: Wed, 28 Jul 2021 14:31:44 -0400
Message-Id: <20210728183151.195139-2-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch has no functional change, but prepares for moving the function
do_run_on_cpu() into softmmu/cpus.c.  It does:

  1. Move qemu_work_item into hw/core/cpu.h.
  2. Export queue_work_on_cpu()/qemu_work_cond.

All of them will be used by softmmu/cpus.c later.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c         | 11 ++---------
 include/hw/core/cpu.h | 10 +++++++++-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e58d..d814b2439a 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -27,7 +27,7 @@
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
 static QemuCond exclusive_resume;
-static QemuCond qemu_work_cond;
+QemuCond qemu_work_cond;
 
 /* >= 1 if a thread is inside start_exclusive/end_exclusive.  Written
  * under qemu_cpu_list_lock, read with atomic operations.
@@ -114,14 +114,7 @@ CPUState *qemu_get_cpu(int index)
 /* current CPU in the current thread. It is only valid inside cpu_exec() */
 __thread CPUState *current_cpu;
 
-struct qemu_work_item {
-    QSIMPLEQ_ENTRY(qemu_work_item) node;
-    run_on_cpu_func func;
-    run_on_cpu_data data;
-    bool free, exclusive, done;
-};
-
-static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
+void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
 {
     qemu_mutex_lock(&cpu->work_mutex);
     QSIMPLEQ_INSERT_TAIL(&cpu->work_list, wi, node);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564ce..f62ae88524 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -243,7 +243,15 @@ typedef union {
 
 typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
 
-struct qemu_work_item;
+struct qemu_work_item {
+    QSIMPLEQ_ENTRY(qemu_work_item) node;
+    run_on_cpu_func func;
+    run_on_cpu_data data;
+    bool free, exclusive, done;
+};
+
+void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi);
+extern QemuCond qemu_work_cond;
 
 #define CPU_UNSET_NUMA_NODE_ID -1
 #define CPU_TRACE_DSTATE_MAX_EVENTS 32
-- 
2.31.1


