Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8D6E8FCE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:16:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHs-00016S-4z; Thu, 20 Apr 2023 06:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHb-0000sh-LJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHY-000839-JU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXr7/ExsI2eUEq6849+1QiMoWQ7wNOEc99U1QaUuttI=;
 b=YJ9YxKSYgpeEN7jzd4FzcPD/Ttv1CLroC3t35rcBqlnJ9XZezzDU4uIUxmAhslfMuVrmIE
 Y6BiLpQhQ4XvjkVUrJXG5E66B7jhZ2/OfI7ZMufLJlvqBXUiIxHC1+OgvInZ2Eh4H1U3Ze
 Xs8sVlN+RuRtQijfH5w89J1Khwb1meg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-1kLMtcNxN7SsKt4sUYxLYw-1; Thu, 20 Apr 2023 06:12:43 -0400
X-MC-Unique: 1kLMtcNxN7SsKt4sUYxLYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C95F43822DEB;
 Thu, 20 Apr 2023 10:12:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C679A5AB7A;
 Thu, 20 Apr 2023 10:12:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/23] cpu: Remove parameter of list_cpus()
Date: Thu, 20 Apr 2023 12:12:11 +0200
Message-Id: <20230420101216.786304-19-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Message-Id: <20230419124831.678079-1-thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


