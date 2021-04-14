Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99D35F223
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:22:52 +0200 (CEST)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWdbf-0001pj-EJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZF-0000DG-Rw
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZE-0001Ym-8S
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618399219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z48HDQ/OopD2PDmpaP/PlGmELvMk04zaLeIL1YmgyYM=;
 b=HhDbRhv2ErQbBuRo92oyCAkHETte4RcrYPQBNymUTOPtwS4sBSD5tMrdC/sPTANDr6Ro17
 YBaXBwwNOgpjPfSM6/xxfB/IxR01iWViN1p9u215V0gLc5OdjEdvt7zAYQEm/2hhn1PiyQ
 oIyDNumQyWr1SiNypdg09MPxKVO96Ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-YT5G9QkhM4mP2XVg_eEh8w-1; Wed, 14 Apr 2021 07:20:17 -0400
X-MC-Unique: YT5G9QkhM4mP2XVg_eEh8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1047D10054F6;
 Wed, 14 Apr 2021 11:20:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F421048117;
 Wed, 14 Apr 2021 11:20:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1 1/4] include/sysemu: Poison all accelerator CONFIG
 switches in common code
Date: Wed, 14 Apr 2021 13:20:01 +0200
Message-Id: <20210414112004.943383-2-thuth@redhat.com>
In-Reply-To: <20210414112004.943383-1-thuth@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
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


