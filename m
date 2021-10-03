Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D23420089
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:52:51 +0200 (CEST)
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwIk-0000iR-D5
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9H-0003Pq-UA
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:03 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9G-0000r6-6m
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z20so467024edc.13
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mM9K9NR20pwXDZhctbZ4eqVhCWyvVt/GAiaTV9nM3fg=;
 b=aXOE3zyrnD27zfNFrR4gXcPdnKP4KKJdBZ9nKAms/eLPLuJ8WSL6aK1kVvT3LNoz5a
 Pf/dN6T4iwEEbLpeMh/AvB5OQ2hW9Jh6jqMY7574Hrdz0153xoogsOdIkakS67ULa0W7
 GuqxY1vkaDtnC4ciS1O3jx1gAu5zBK81ThD/YjhcyNX0VvGESNZJv10FYEXkdWXZZEeh
 3JTZufg/FKsOygtmcg0wrpclCyY2oJKTu5MMga+kU3PfcJxsu6OOp6MbyGnIT1iJlQoL
 NfmZ5wawPrYV0irmW0cQU8QlqgR3KSroBn3pc0fMHP3vQJ4Y4zv6mDvYTxRO9K8ErGCy
 jgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mM9K9NR20pwXDZhctbZ4eqVhCWyvVt/GAiaTV9nM3fg=;
 b=s8rq9kwJfbm2hgxRQd5ysfKYAAvS4Iyk46x66AyMBo0sHa4DWiPr+vcaT7Fth1v4y7
 +f/vjKbVTRfIHrOVDFjYeEflKS5WeaXBKGz0felEuJ7mbe7D9pPoy4EQQaL1nV+F2OKb
 oD0jFhi4Gdgx3HZHw3SLImENk0kMhAXVEQKobwYWoSInY6vMGKMBy7tBYqmxQ6N1cMWU
 dVM7vDdz2yMyMw/0+5Gq315yrmDLr5vefQs+79Oza1NRRmaDlQ2LpBQvmM2bUpFVHUQa
 zExSo1CnvJ3QUV3KzqLl2WuyLQBzR30dbUqUl+6In5laIY1DIm2PY8V7OcjhNgn7gouv
 Ji9Q==
X-Gm-Message-State: AOAM530ZvZ2M1l4FUphFxhTCoaYs0FQBEORKSH7GNZQl0IMODocWvuq3
 Eb8RENKU1LOqjtT4i0Iq+vSw3R2f2qw=
X-Google-Smtp-Source: ABdhPJzSF5lgbu4HyqUeOwBwRFiK4jof0wohI4YCf8SxeE/4RHCkFkXXjyOaQ/sp834BsCUmdx0rrw==
X-Received: by 2002:a17:906:f2cd:: with SMTP id
 gz13mr1859676ejb.278.1633246980930; 
 Sun, 03 Oct 2021 00:43:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] machine: Tweak the order of topology members in struct
 CpuTopology
Date: Sun,  3 Oct 2021 09:42:31 +0200
Message-Id: <20211003074250.60869-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Now that all the possible topology parameters are integrated in struct
CpuTopology, tweak the order of topology members to be "cpus/sockets/
dies/cores/threads/maxcpus" for readability and consistency. We also
tweak the comment by adding explanation of dies parameter.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210929025816.21076-12-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 10 +++++-----
 include/hw/boards.h |  7 ++++---
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 12d7416053..83cbdcce47 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -829,11 +829,11 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 {
     MachineState *ms = MACHINE(obj);
     SMPConfiguration *config = &(SMPConfiguration){
-        .has_cores = true, .cores = ms->smp.cores,
+        .has_cpus = true, .cpus = ms->smp.cpus,
         .has_sockets = true, .sockets = ms->smp.sockets,
         .has_dies = true, .dies = ms->smp.dies,
+        .has_cores = true, .cores = ms->smp.cores,
         .has_threads = true, .threads = ms->smp.threads,
-        .has_cpus = true, .cpus = ms->smp.cpus,
         .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
     };
     if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
@@ -1060,10 +1060,10 @@ static void machine_initfn(Object *obj)
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-    ms->smp.cores = 1;
-    ms->smp.dies = 1;
-    ms->smp.threads = 1;
     ms->smp.sockets = 1;
+    ms->smp.dies = 1;
+    ms->smp.cores = 1;
+    ms->smp.threads = 1;
 }
 
 static void machine_finalize(Object *obj)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2ae039b74f..2a1bba86c0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -275,17 +275,18 @@ typedef struct DeviceMemoryState {
 /**
  * CpuTopology:
  * @cpus: the number of present logical processors on the machine
- * @cores: the number of cores in one package
- * @threads: the number of threads in one core
  * @sockets: the number of sockets on the machine
+ * @dies: the number of dies in one socket
+ * @cores: the number of cores in one die
+ * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
 typedef struct CpuTopology {
     unsigned int cpus;
+    unsigned int sockets;
     unsigned int dies;
     unsigned int cores;
     unsigned int threads;
-    unsigned int sockets;
     unsigned int max_cpus;
 } CpuTopology;
 
-- 
2.31.1



