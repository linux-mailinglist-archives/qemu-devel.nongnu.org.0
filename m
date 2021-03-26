Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DD34A794
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:53:39 +0100 (CET)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPly6-0007SY-CA
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluw-0005Y5-UZ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlup-0003vb-BX
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616763011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbkbY9PGqnicrv9zSk0waCN8nAno4hlrHiPULYWCr0U=;
 b=WbI+Dk8yLJsUm7Nbt5u2A5v2hLXtbv78Du05NWJBJDaC8911rB1S1UmhWRAza3W4KyT5ZD
 +2bks39IwtLRM5sXsWLtu9/AWjJRSjJm2zmLjkQQsG7iF5QaM6QOZqsq3J14gcWL6mMUXC
 Dp2uu/qPrmqYBVFNdEkBHyJHjr0NY1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-DB6ibyh2PtmBW3860Ik8eQ-1; Fri, 26 Mar 2021 08:50:09 -0400
X-MC-Unique: DB6ibyh2PtmBW3860Ik8eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E4DC83DEE8;
 Fri, 26 Mar 2021 12:50:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EF57138E8;
 Fri, 26 Mar 2021 12:50:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EF566180038E; Fri, 26 Mar 2021 13:49:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] s390x: move S390_ADAPTER_SUPPRESSIBLE
Date: Fri, 26 Mar 2021 13:49:29 +0100
Message-Id: <20210326124932.481942-7-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
References: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
suggestion of Thomas Huth. From interface design perspective, IMHO, not
a good thing as it belongs to the public interface of
css_register_io_adapters(). We did this because CONFIG_KVM requeires
NEED_CPU_H and Thomas, and other commenters did not like the
consequences of that.

Moving the interrupt related declarations to s390_flic.h was suggested
by Cornelia Huck.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Tested-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <20210317095622.2839895-2-kraxel@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/s390x/css.h       | 7 -------
 include/hw/s390x/s390_flic.h | 3 +++
 target/s390x/cpu.h           | 9 ++++++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 7901ab276ce9..bba7593d2eaa 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -12,7 +12,6 @@
 #ifndef CSS_H
 #define CSS_H
 
-#include "cpu.h"
 #include "hw/s390x/adapter.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/ioinst.h"
@@ -233,12 +232,6 @@ uint32_t css_get_adapter_id(CssIoAdapterType type, uint8_t isc);
 void css_register_io_adapters(CssIoAdapterType type, bool swap, bool maskable,
                               uint8_t flags, Error **errp);
 
-#ifndef CONFIG_KVM
-#define S390_ADAPTER_SUPPRESSIBLE 0x01
-#else
-#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
-#endif
-
 #ifndef CONFIG_USER_ONLY
 SubchDev *css_find_subch(uint8_t m, uint8_t cssid, uint8_t ssid,
                          uint16_t schid);
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index e91b15d2d6af..3907a13d0766 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -134,6 +134,9 @@ void s390_flic_init(void);
 S390FLICState *s390_get_flic(void);
 QEMUS390FLICState *s390_get_qemu_flic(S390FLICState *fs);
 S390FLICStateClass *s390_get_flic_class(S390FLICState *fs);
+void s390_crw_mchk(void);
+void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
+                       uint32_t io_int_parm, uint32_t io_int_word);
 bool ais_needed(void *opaque);
 
 #endif /* HW_S390_FLIC_H */
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 468b4430f339..2464d4076c0a 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -40,6 +40,12 @@
 
 #define S390_MAX_CPUS 248
 
+#ifndef CONFIG_KVM
+#define S390_ADAPTER_SUPPRESSIBLE 0x01
+#else
+#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
+#endif
+
 typedef struct PSW {
     uint64_t mask;
     uint64_t addr;
@@ -811,9 +817,6 @@ int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
 
 
 /* interrupt.c */
-void s390_crw_mchk(void);
-void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
-                       uint32_t io_int_parm, uint32_t io_int_word);
 #define RA_IGNORED                  0
 void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
 /* service interrupts are floating therefore we must not pass an cpustate */
-- 
2.30.2


