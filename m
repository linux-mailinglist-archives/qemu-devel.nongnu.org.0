Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA76A8278
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:41:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi9K-0004m3-MI; Thu, 02 Mar 2023 07:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7I-0002uk-63
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7F-0003ma-On
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hH244Qu41oKuKyDsP+EiNLMkm/2HECHqfgZ/Z+vDc1w=;
 b=iTnMo2kOOwXKR8ipFmrx3nmVzNNLLeV8c06ulORZoGPAd7jy4qLlaZlC3dcrxPli20QB/4
 z5ViKQrybmYWCidpayjY6w5rvL2DOE7cC6hGVKRn9O0NasXpBaJy7JUx4cXM/Po8MZwoI9
 1AlVRBnlyBYZE46Lyt6qd7Rob9hdU+Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-yTUr9x09NFG0u9BURkCu2A-1; Thu, 02 Mar 2023 07:32:55 -0500
X-MC-Unique: yTUr9x09NFG0u9BURkCu2A-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so1015697wmb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hH244Qu41oKuKyDsP+EiNLMkm/2HECHqfgZ/Z+vDc1w=;
 b=rzptlCQMiueG6eLHU5g8KynPkRextXMdLtp7LewsSwF0g2XQf23njoY0venqOC6k5y
 xOhX7NUoYecVl7XVohk3VFT01AsamqA6RDOG87OMuobKN8FQdgrAFXuctfwa31QLcz9g
 Vub+4wZajm4oSwZc/Cq77cIVWods1ophefS3DmQeTktKt/4WVheffoa6EpcBMVFGrfRi
 mtHdFJhHKS/pb4HMT3tmnruLEyX1oS0xgNli+xjQ8LMlbFIemRsoZZ5n8+bWG7pk9ecI
 e83+C8Ce1Gm2gxMGMEPIlrLEGN6UuuhObGq6u0tsNhlCnka9bCtwwpaypxq7fQCpljxD
 rXBg==
X-Gm-Message-State: AO0yUKVn781c1l2l8RtceTtETrq5UVnuQG0D4GUbaccie/TMCdIHfvDi
 n51Ii3j3f/82uBM/5wV5PdU6Vd+UDatwviewymTWdy+vciTnHAhlIhd6vCNweB7+jWERAPy5dux
 7TReQtslcerQMZlkU1qI4mI7bVlhEa2TgKpRWpxAGbO2puYn53vbkyyl4WJZ9iBd1IUc/1+B08m
 0=
X-Received: by 2002:a5d:6604:0:b0:2c8:60de:c849 with SMTP id
 n4-20020a5d6604000000b002c860dec849mr7907524wru.22.1677760373577; 
 Thu, 02 Mar 2023 04:32:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+LWfoHRdjP9UfZuaAS7uS1R4DSooWu0nmGGmrOcDkvYJk+RPDE70JggOQtKv0ygwi5ciphbA==
X-Received: by 2002:a5d:6604:0:b0:2c8:60de:c849 with SMTP id
 n4-20020a5d6604000000b002c860dec849mr7907506wru.22.1677760373258; 
 Thu, 02 Mar 2023 04:32:53 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q5-20020adff505000000b002c70a0e2cd0sm15413957wro.101.2023.03.02.04.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 48/62] i386/xen: Reserve Xen special pages for console,
 xenstore rings
Date: Thu,  2 Mar 2023 13:30:15 +0100
Message-Id: <20230302123029.153265-49-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

Xen has eight frames at 0xfeff8000 for this; we only really need two for
now and KVM puts the identity map at 0xfeffc000, so limit ourselves to
four.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/sysemu/kvm_xen.h  |  9 +++++++++
 target/i386/kvm/xen-emu.c | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 49afa0eb9e43..b2aafaf7abdd 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -30,4 +30,13 @@ uint16_t kvm_xen_get_gnttab_max_frames(void);
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
 
+#define XEN_SPECIAL_AREA_ADDR 0xfeff8000UL
+#define XEN_SPECIAL_AREA_SIZE 0x4000UL
+
+#define XEN_SPECIALPAGE_CONSOLE     0
+#define XEN_SPECIALPAGE_XENSTORE    1
+
+#define XEN_SPECIAL_PFN(x) ((XEN_SPECIAL_AREA_ADDR >> TARGET_PAGE_BITS) + \
+                            XEN_SPECIALPAGE_##x)
+
 #endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c210ff9d91be..75bcf7b6306f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -23,6 +23,7 @@
 
 #include "hw/pci/msi.h"
 #include "hw/i386/apic-msidef.h"
+#include "hw/i386/e820_memory_layout.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
@@ -169,6 +170,15 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
     }
 
     s->xen_caps = xen_caps;
+
+    /* Tell fw_cfg to notify the BIOS to reserve the range. */
+    ret = e820_add_entry(XEN_SPECIAL_AREA_ADDR, XEN_SPECIAL_AREA_SIZE,
+                         E820_RESERVED);
+    if (ret < 0) {
+        fprintf(stderr, "e820_add_entry() table is full\n");
+        return ret;
+    }
+
     return 0;
 }
 
-- 
2.39.1


