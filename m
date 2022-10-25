Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B860C6DB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:48:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFSw-0007jC-D8; Tue, 25 Oct 2022 04:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1onEiR-0003RJ-BU
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1onEiF-0005hP-O5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666684263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSyNDNyP588Efkhc/If9+u59f4TkyEPg4UO3cris5og=;
 b=NEVZqlnoC+/IWkUNYlC51oJN8ff/AwMIfsnve/64NKh6RO9ZVWkZBzBOkIzCsBmI6fgvMP
 kaUQvE4I5WUZsmNR7aoEljBhJbyq9Mbn4/c0tk9g/H2cN9tm7eA1VPjx4rMSERD/XStZXL
 eJ5QdlCosjneVNezbbS+thGav24F6Mc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-YHhWjwYiMPKxeBGXsE7EWA-1; Tue, 25 Oct 2022 03:50:59 -0400
X-MC-Unique: YHhWjwYiMPKxeBGXsE7EWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D947800B30;
 Tue, 25 Oct 2022 07:50:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A2635429;
 Tue, 25 Oct 2022 07:50:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL v2 09/11] s390x: Add KVM PV dump interface
Date: Tue, 25 Oct 2022 11:50:01 +0400
Message-Id: <20221025075003.18161-10-marcandre.lureau@redhat.com>
In-Reply-To: <20221025075003.18161-1-marcandre.lureau@redhat.com>
References: <20221025075003.18161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Janosch Frank <frankja@linux.ibm.com>

Let's add a few bits of code which hide the new KVM PV dump API from
us via new functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
[ Marc-André: fix up for compilation issue ]
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221017083822.43118-10-frankja@linux.ibm.com>
---
 include/hw/s390x/pv.h |  9 ++++++++
 hw/s390x/pv.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index e5ea0eca16..9360aa1091 100644
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
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff) { return 0; }
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


