Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D775333D45B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:54:38 +0100 (CET)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9DW-0005Of-LB
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM9C5-0004dM-50
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM9C3-0006Su-CU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615899182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z48HDQ/OopD2PDmpaP/PlGmELvMk04zaLeIL1YmgyYM=;
 b=RNTpu1DsWQcu4YQs7YIeDWkJvEE8DVhQ5JOPY0de7NvTg7303ZRetKbpqrFe4dH8NcfkCg
 GXz/lGtCqmBnr7gePZFcWnOisp4Qcrh2tfeSbhPWz53npzSOAEiXNjxwtZutLJU4h2ih2i
 PsN16AYhDDKpJBSzo87gXMU+jo+R2fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-6FBobktOP7660a3pC41DGw-1; Tue, 16 Mar 2021 08:53:00 -0400
X-MC-Unique: 6FBobktOP7660a3pC41DGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18766801817;
 Tue, 16 Mar 2021 12:52:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49BE410023B5;
 Tue, 16 Mar 2021 12:52:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] include/sysemu: Poison all accelerator CONFIG switches in
 common code
Date: Tue, 16 Mar 2021 13:52:54 +0100
Message-Id: <20210316125254.461525-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Markus Armbruster <armbru@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, haxm-team@intel.com,
 Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are already poisoning CONFIG_KVM since this switch is not working
in common code. Do the same with the other accelerator switches, too
(except for CONFIG_TCG, which is special, since it is also defined in
config-host.h).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/poison.h | 4 ++++
 include/sysemu/hax.h  | 4 ++++
 include/sysemu/hvf.h  | 4 ++++
 include/sysemu/whpx.h | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 4cd3f8abb4..3250fc1d52 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -88,8 +88,12 @@
 #pragma GCC poison CONFIG_SPARC_DIS
 #pragma GCC poison CONFIG_XTENSA_DIS
 
+#pragma GCC poison CONFIG_HAX
+#pragma GCC poison CONFIG_HVF
 #pragma GCC poison CONFIG_LINUX_USER
 #pragma GCC poison CONFIG_KVM
 #pragma GCC poison CONFIG_SOFTMMU
+#pragma GCC poison CONFIG_WHPX
+#pragma GCC poison CONFIG_XEN
 
 #endif
diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 12fb54f990..247f0661d1 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -24,6 +24,8 @@
 
 int hax_sync_vcpus(void);
 
+#ifdef NEED_CPU_H
+
 #ifdef CONFIG_HAX
 
 int hax_enabled(void);
@@ -34,4 +36,6 @@ int hax_enabled(void);
 
 #endif /* CONFIG_HAX */
 
+#endif /* NEED_CPU_H */
+
 #endif /* QEMU_HAX_H */
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index c98636bc81..bb70082e45 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -16,6 +16,8 @@
 #include "qemu/accel.h"
 #include "qom/object.h"
 
+#ifdef NEED_CPU_H
+
 #ifdef CONFIG_HVF
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                                  int reg);
@@ -26,6 +28,8 @@ extern bool hvf_allowed;
 #define hvf_get_supported_cpuid(func, idx, reg) 0
 #endif /* !CONFIG_HVF */
 
+#endif /* NEED_CPU_H */
+
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
 typedef struct HVFState HVFState;
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 8ca1c1c4ac..2889fa2278 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_WHPX_H
 #define QEMU_WHPX_H
 
+#ifdef NEED_CPU_H
+
 #ifdef CONFIG_WHPX
 
 int whpx_enabled(void);
@@ -25,4 +27,6 @@ bool whpx_apic_in_platform(void);
 
 #endif /* CONFIG_WHPX */
 
+#endif /* NEED_CPU_H */
+
 #endif /* QEMU_WHPX_H */
-- 
2.27.0


