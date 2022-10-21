Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2760785C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:26:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ols2I-0004VC-VH
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:26:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrjp-0005eo-K5
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrjT-0005VG-GR
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrjR-00087o-RB
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666357597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxPbX/KWcPbSFqfad1xu0UPVB+p9QkltrOyi0QE6kJw=;
 b=Zo8wGR12BJMi8+ckBPmIAepue1LcouOHryfLRW6pknH6oROUS4rmd3si5Fi7yYHq5p1rtY
 FU1eu2d7y11//m+QFFG5S+9ZQq5xNNjc5+f+QJ9sbSowqBnB7u3b5UMlQwAlpUzMmGY06R
 VP9QXk31Mv2yT9JX8T2jo4MZhHjkvNo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-7G5MgwuUP3CEflN-vAEgsg-1; Fri, 21 Oct 2022 09:06:33 -0400
X-MC-Unique: 7G5MgwuUP3CEflN-vAEgsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5F613C10ECD;
 Fri, 21 Oct 2022 13:06:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDAC1121330;
 Fri, 21 Oct 2022 13:06:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL 09/11] s390x: Add KVM PV dump interface
Date: Fri, 21 Oct 2022 17:05:47 +0400
Message-Id: <20221021130549.111864-10-marcandre.lureau@redhat.com>
In-Reply-To: <20221021130549.111864-1-marcandre.lureau@redhat.com>
References: <20221021130549.111864-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

Let's add a few bits of code which hide the new KVM PV dump API from
us via new functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Message-Id: <20221017083822.43118-10-frankja@linux.ibm.com>
---
 include/hw/s390x/pv.h |  9 ++++++++
 hw/s390x/pv.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index e5ea0eca16..3164006674 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
 uint64_t kvm_s390_pv_dmp_get_size_mem_state(void);
 uint64_t kvm_s390_pv_dmp_get_size_completion_data(void);
 bool kvm_s390_pv_info_basic_valid(void);
+int kvm_s390_dump_init(void);
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
+int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);
+int kvm_s390_dump_completion_data(void *buff);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
@@ -66,6 +70,11 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_mem_state(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(void) { return 0; }
 static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
+static inline int kvm_s390_dump_init(void) { return 0; }
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) { return 0; }
+static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
+                                          void *dest) { return 0; }
+static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 4c012f2eeb..728ba24547 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -175,6 +175,57 @@ bool kvm_s390_pv_info_basic_valid(void)
     return info_valid;
 }
 
+static int s390_pv_dump_cmd(uint64_t subcmd, uint64_t uaddr, uint64_t gaddr,
+                            uint64_t len)
+{
+    struct kvm_s390_pv_dmp dmp = {
+        .subcmd = subcmd,
+        .buff_addr = uaddr,
+        .buff_len = len,
+        .gaddr = gaddr,
+    };
+    int ret;
+
+    ret = s390_pv_cmd(KVM_PV_DUMP, (void *)&dmp);
+    if (ret) {
+        error_report("KVM DUMP command %ld failed", subcmd);
+    }
+    return ret;
+}
+
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff)
+{
+    struct kvm_s390_pv_dmp dmp = {
+        .subcmd = KVM_PV_DUMP_CPU,
+        .buff_addr = (uint64_t)buff,
+        .gaddr = 0,
+        .buff_len = info_dump.dump_cpu_buffer_len,
+    };
+    struct kvm_pv_cmd pv = {
+        .cmd = KVM_PV_DUMP,
+        .data = (uint64_t)&dmp,
+    };
+
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_S390_PV_CPU_COMMAND, &pv);
+}
+
+int kvm_s390_dump_init(void)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_INIT, 0, 0, 0);
+}
+
+int kvm_s390_dump_mem_state(uint64_t gaddr, size_t len, void *dest)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STOR_STATE, (uint64_t)dest,
+                            gaddr, len);
+}
+
+int kvm_s390_dump_completion_data(void *buff)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
+                            info_dump.dump_config_finalize_len);
+}
+
 #define TYPE_S390_PV_GUEST "s390-pv-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
 
-- 
2.37.3


