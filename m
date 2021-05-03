Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8343713C8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:50:12 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW9T-0000Io-Ud
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4a-0003fH-Hf
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4Y-0003MH-61
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTgrmVJ7TdO8X5uWM/1Wiki4sUr+Mf9nmk/lku0ePeM=;
 b=d48j+8WJS2WXOyUUjhZHsJZOaMdtgUTBF+3mGJ6x9O0wdYxxRmZ/VLYU/lkoMOt/gsItKw
 N/CVNFl7qTrW7y/f/vFQP0F8KnUl5XqdzizQKPCYmYlDcDDem7xVOLx3cEwE+Z5CLfb+xp
 wLi50RQmgKlazzl+19ZL+BUeuwX/ROk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-nWo_K0-6PoSmAU9u42zxEQ-1; Mon, 03 May 2021 06:45:03 -0400
X-MC-Unique: nWo_K0-6PoSmAU9u42zxEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D481020C20;
 Mon,  3 May 2021 10:45:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F105D9DD;
 Mon,  3 May 2021 10:45:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/10] include/sysemu: Poison all accelerator CONFIG switches
 in common code
Date: Mon,  3 May 2021 12:44:49 +0200
Message-Id: <20210503104456.1036472-4-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are already poisoning CONFIG_KVM since this switch is not working
in common code. Do the same with the other accelerator switches, too
(except for CONFIG_TCG, which is special, since it is also defined in
config-host.h).

Message-Id: <20210414112004.943383-2-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/poison.h | 4 ++++
 include/sysemu/hax.h  | 4 ++++
 include/sysemu/hvf.h  | 4 ++++
 include/sysemu/whpx.h | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index de972bfd8e..f769dcc781 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -86,8 +86,12 @@
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


