Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87F346767
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:17:19 +0100 (CET)
Received: from localhost ([::1]:60718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlag-0004Xt-GA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkN5-0007Qr-W7
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMw-00060V-8z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id bf3so24302650edb.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qL/PVo/1XqiC3Jn7ch8pkFIeXOsa45U8xbPHc3nqf8=;
 b=LHJ0eH4siR0z/KeAlTfCsnskaWktLo+zMmiroAYxxQSHKZwyCyjOGj3LeJ7uNutuWw
 7M2bh6DwxAizMnkPwTXTH0U4rj0vEVUCJiykpq3VOwDrW/gyb0dElktJfSn+tUaux6TA
 Tu2Lmaw7cuW+Be5NKcZVaUI37753ptrdd2FsruhC21fW8qKgSI38Ty7NbYhW0EUEObmf
 P8vXQNaBsejhjTTw+tySL00nA9wB2gFcA6NWH/yrx+3SiWs5paWeVX8ylDlMnGodIZF7
 7W23Ni06HlPoLG+YTuHXmtulz1dDiZpjkQH8iuSjYHdTeNVv97ZXOIPrZgQMILbHq975
 UC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qL/PVo/1XqiC3Jn7ch8pkFIeXOsa45U8xbPHc3nqf8=;
 b=XMV/ACJE96/TseemEosd9BAqoJoJeg/+C5W13i0fGsiCvzTpB/HViPKAAOO0Go1RcX
 pOPKb8Ll4j0eh7yFUTiEvgOxLMrkJFbzOJqU9WZjP4j/YZJZQHDcnZIdZUdw+m11J0yD
 UdyoI4P656z9g9EzKQTezaT48sIinwJmBgV9mvHED78E7m6qfLKaLAA3zoqtkVuyvlZq
 dZedb1TyT/tIYQ0x5ul+dLiBZ7VsRzfVeHyJ+3F9ycpvF1WBWmbp3BsWQtwlyg3mfsow
 eFnYvqi5Qq3/HdNvt/9o6b5W39qM+td8ach5G3SoiWInwHFHLnZvwdcpZlirnSbsdJ9M
 a7sg==
X-Gm-Message-State: AOAM533ocvj22E1G55M3JRPKsKhG0Ik/l28mGyrBBHVSX7Ktza+qWA43
 FoihJNR2WTdEN7mgTjXTNJR6XHkNuT++k4I0
X-Google-Smtp-Source: ABdhPJwUfa3D585U4GmAtAPdYxqW8pD2FdsGyGWIRzzCs+bQlsGnSHMHnIt0C8klbQUOZss/dsS2nA==
X-Received: by 2002:a05:6402:4309:: with SMTP id
 m9mr5724560edc.25.1616518740446; 
 Tue, 23 Mar 2021 09:59:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ho19sm11084079ejc.57.2021.03.23.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC2061FF9D;
 Tue, 23 Mar 2021 16:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/22] qdev: define list of archs with virtio-pci or
 virtio-ccw
Date: Tue, 23 Mar 2021 16:53:02 +0000
Message-Id: <20210323165308.15244-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

This is used to define virtio-*-pci and virtio-*-ccw aliases
rather than substracting the CCW architecture from all the others.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-2-laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/sysemu/arch_init.h |  8 ++++++
 softmmu/qdev-monitor.c     | 53 ++++++++++++++++++--------------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d491..0c90706516 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -35,4 +35,12 @@ extern const uint32_t arch_type;
 int kvm_available(void);
 int xen_available(void);
 
+/* default virtio transport per architecture */
+#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
+                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
+                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
+                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becc..0b40c97c6e 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,34 +60,31 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
-    { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_S390X },
-    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
-    { "virtio-balloon-pci", "virtio-balloon",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
-    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
-    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
-    { "virtio-input-host-pci", "virtio-input-host",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
-    { "virtio-keyboard-pci", "virtio-keyboard",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_S390X },
-    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-net-ccw", "virtio-net", QEMU_ARCH_S390X },
-    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_S390X },
-    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
-    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
-    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
-    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-net-ccw", "virtio-net", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-net-pci", "virtio-net", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_VIRTIO_PCI},
+    { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
     { }
 };
 
-- 
2.20.1


