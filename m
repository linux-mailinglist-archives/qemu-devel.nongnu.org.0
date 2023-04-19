Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE356E7A01
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 14:51:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp7F0-00040K-1U; Wed, 19 Apr 2023 08:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp7Ev-0003vD-S6
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 08:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp7Er-0002il-PA
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 08:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681908520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0ztBOPXIsJ2OzJmZMSPyWmohTk7x6DuSBuJc+5Ai2tw=;
 b=SRNmPxj81OP+HIU4axoe+tiJSesvZazsdJOGIwNL8fDH+Y302g0nvFee8x8rcWMz/Xo3hV
 naQxhP1IkyPrbY/BMLmFRCat/BXRv1xrajv5jIxGOMsqiY+2kVgA5HK8yTszsCoatcxQab
 2KdCQhrOHxDEgIDD1TTF93M2Sg4JCkY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-te5GhpNTPg6oa9SFvr1mEA-1; Wed, 19 Apr 2023 08:48:36 -0400
X-MC-Unique: te5GhpNTPg6oa9SFvr1mEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD9D185A78B;
 Wed, 19 Apr 2023 12:48:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF3FD2026D16;
 Wed, 19 Apr 2023 12:48:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH] cpu: Remove parameter of list_cpus()
Date: Wed, 19 Apr 2023 14:48:31 +0200
Message-Id: <20230419124831.678079-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The "optarg" parameter is completely unused, so let's drop it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/cpu-common.h | 2 +-
 cpu.c                     | 2 +-
 softmmu/vl.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7..565c2030c1 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -165,6 +165,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 /* vl.c */
 extern int singlestep;
 
-void list_cpus(const char *optarg);
+void list_cpus(void);
 
 #endif /* CPU_COMMON_H */
diff --git a/cpu.c b/cpu.c
index 849bac062c..9105c85404 100644
--- a/cpu.c
+++ b/cpu.c
@@ -284,7 +284,7 @@ const char *parse_cpu_option(const char *cpu_option)
     return cpu_type;
 }
 
-void list_cpus(const char *optarg)
+void list_cpus(void)
 {
     /* XXX: implement xxx_cpu_list for targets that still miss it */
 #if defined(cpu_list)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea20b23e4c..5cb72a56fc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2432,7 +2432,7 @@ static void qemu_process_help_options(void)
      * to say '-cpu help -machine something'.
      */
     if (cpu_option && is_help_option(cpu_option)) {
-        list_cpus(cpu_option);
+        list_cpus();
         exit(0);
     }
 
-- 
2.31.1


