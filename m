Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C833EDA3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:58:08 +0100 (CET)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSwK-0008Or-0B
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMSuv-00075z-CY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMSus-0001ab-7S
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615974997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVDtkg/MPejVzfLHgNeJhF/YugElN+iiwvS8cpBUGQA=;
 b=EVtmzmXxUIT2gh/G5KvsMi8j//DU3WEkvGlE/0mzGtop9ZV1T+wTGiftnHxvLobmMVbDgm
 T8IDJrsNlRakee8a6XEcigV8ZDXONNNkKdSUQYl5WpP6P+TL1yyvb7q5sT5Cj+5BBPPqD7
 NOIcHMdtep1pmpHvx+9HBNbFAcqau1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-MJginximMVi7BNFJnd8Olg-1; Wed, 17 Mar 2021 05:56:35 -0400
X-MC-Unique: MJginximMVi7BNFJnd8Olg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 246989CDB2;
 Wed, 17 Mar 2021 09:56:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9249A6294D;
 Wed, 17 Mar 2021 09:56:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ABACA18003B6; Wed, 17 Mar 2021 10:56:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] s390x: move S390_ADAPTER_SUPPRESSIBLE
Date: Wed, 17 Mar 2021 10:56:20 +0100
Message-Id: <20210317095622.2839895-2-kraxel@redhat.com>
In-Reply-To: <20210317095622.2839895-1-kraxel@redhat.com>
References: <20210317095622.2839895-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
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
index 60d434d5edd5..b434b905c0ae 100644
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
@@ -806,9 +812,6 @@ int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
 
 
 /* interrupt.c */
-void s390_crw_mchk(void);
-void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
-                       uint32_t io_int_parm, uint32_t io_int_word);
 #define RA_IGNORED                  0
 void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
 /* service interrupts are floating therefore we must not pass an cpustate */
-- 
2.30.2


