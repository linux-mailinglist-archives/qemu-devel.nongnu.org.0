Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC93DB787
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:03:21 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QIS-00030V-Qd
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF9-0008SQ-JZ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF7-0002Ur-28
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id n12so10807830wrr.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=grrH4yZDT83NlMAFyF6VZHzq6DhTbZi1iqbpXWdsyig=;
 b=h3DysLmhKRgDni3tfJGA2E7gQdK8+caQVKW98P9d4Z2ve24J2IxnpsOc7nBJCyn97C
 hS3jGQoV2qliLBLPlio4MbYkIqRhKzpyxlwl3yv4/ZNQGXMGuTkgr2cJfFElnNyV7OSZ
 hC3mpadqVOZGaezUIy+u8NALfEKVs1wXR23H5uMJjDiFEMI9QUuopNdT6nCaRoBI8Hmo
 3j2/NSE93iAto+np9Cg2XeKJts5n8mOKP4XFAyXEFa1oEsz0hl1v36RUGSZuFbmXMDUZ
 NMyaczDlynZdPZ35YSAIAbZ8n99bEkEyzxcEZ1JRBaT+jYs1h/k2vDpcv8Q1o1wxfq7s
 wTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grrH4yZDT83NlMAFyF6VZHzq6DhTbZi1iqbpXWdsyig=;
 b=Er3T8SWGDl3ah8VN9V7351Ov1utVtAAtk27rqx6qMMQSo77pmPcW14OtYTm/BqScrj
 s5b3CG8DZbUyjPFlnMuE3+TPbL6eZHJlmYtf3HUGw2rdrP3mIok/3zP3UTAhio623aaT
 2CeUULrtq6//if0n0HH6iWfBKtijteCdZbH3Zx+GJfRUMeTwoBdMD1rwImeZF38u6fIf
 1pF+qsfnOjhOyCTRclvV+dift9Iz7s+80f/INqr0cwuoctg8eI4gRjESnNAkctAdMTVA
 /5vFRm5lh5AbixTmCMyzAMQrKxPRu9dV5GBfPKWexgwjuhlwPNYqh74T/StVZdSVo4bV
 4KmQ==
X-Gm-Message-State: AOAM531mlvcCAe+Vt3se4hP8ArGkCC0bVpYQUkIlmxJQD7mCQkkYzO+L
 rcoVKOb9a1+3J2lpAKi0R5V2tqLAnbo0Pw==
X-Google-Smtp-Source: ABdhPJz8HEE0vDvO5Yuft00jRT/uSVPxXbIdpAaiKZbP8eHTkddhNzUH72N6ukU81nTkBgVNaW1C3A==
X-Received: by 2002:a05:6000:232:: with SMTP id
 l18mr2426923wrz.24.1627642791608; 
 Fri, 30 Jul 2021 03:59:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 2/8] monitor: Use accel_find("kvm") instead of
 kvm_available()
Date: Fri, 30 Jul 2021 11:59:41 +0100
Message-Id: <20210730105947.28215-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kvm_available() function reports whether KVM support was
compiled into the QEMU binary; it returns the value of the
CONFIG_KVM define.

The only place in the codebase where we use this function is
in qmp_query_kvm(). Now that accelerators are based on QOM
classes we can instead use accel_find("kvm") and remove the
kvm_available() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/arch_init.h | 2 --
 monitor/qmp-cmds.c         | 2 +-
 softmmu/arch_init.c        | 9 ---------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 7acfc62418f..57caad1c675 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -29,8 +29,6 @@ enum {
 
 extern const uint32_t arch_type;
 
-int kvm_available(void);
-
 /* default virtio transport per architecture */
 #define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
                               QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a64577..9ddb9352e65 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -58,7 +58,7 @@ KvmInfo *qmp_query_kvm(Error **errp)
     KvmInfo *info = g_malloc0(sizeof(*info));
 
     info->enabled = kvm_enabled();
-    info->present = kvm_available();
+    info->present = accel_find("kvm");
 
     return info;
 }
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 3f4d7c1b1cd..9011af74e4a 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -87,12 +87,3 @@ int graphic_depth = 32;
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
-
-int kvm_available(void)
-{
-#ifdef CONFIG_KVM
-    return 1;
-#else
-    return 0;
-#endif
-}
-- 
2.20.1


