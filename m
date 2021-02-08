Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA13129B7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:21:43 +0100 (CET)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8y3S-0004mj-6w
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6J-0007l8-Bx
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:35 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:34669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6G-0001k2-5S
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:35 -0500
Received: by mail-il1-x134.google.com with SMTP id q9so11496723ilo.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wfrxe2AEinW34K0GuFsTKfhMgJ70NeWcmQ/m1I/W4tU=;
 b=MGOteG1tAXL7clmx6mozj3kJm8zN1mKOSl5adIZe31SqVf5ZePTq0s33hjMzU/e/Ar
 rUcGCuHuHTAhLi6iKxJ95AkX9jQBcn/7Bd4pfuyTq2oxisbMtm0FJJbz4yCshAlFuKja
 br1sGPCmsGZ85cjxUrTpFddoKDdd2pQKVdEwCawU4RZintNzMJhMIaQZQMwEzKxEKMXg
 HXMUu9Sj0qRzitTZ//7L6A6h+5RJmnO/gzDxfPUYcfAAyagDQ0/2vQ/NZTnzbLtogeEW
 MmeKuFtOlpfGZ4nKLVyrFo6QaiKFjv7EiH33KkD8CK4V97M7JkHpo3ojBhJBMRqVM64+
 1kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wfrxe2AEinW34K0GuFsTKfhMgJ70NeWcmQ/m1I/W4tU=;
 b=kapX0KdLdVtbGE4UR/escOXeVH6Sv8Hlh3mewgza+e5DO7jKQKRto2iEbBLCO4iQde
 acxfEKu5ZmBBGU3TkqDg4HTF1sX1SyiSuDsvlgg78sopajGs4VKOBjmQsiC94M8Tw19/
 cEMhta5f1XSu/nrs8R99G4/HEOzurJuhEZMIn0ufs6sLXvAgZHb3hbuFUm26noSdQa0e
 wVGx4s2Bmi+f35W1rAu8demvNxNehhNGslvhvAcQGXy8blaHBsUGedNBZNefti/zHCYM
 QBC12WYoBc+voDjpbOU7wTYM9mvsRDB9sMaeL4o+wWJAIs5do0yPqdBgZMjGpUQR2z6E
 bx8Q==
X-Gm-Message-State: AOAM532p4eeK5VTMbZfzWIXVSt6Fq/0g2tYxZwKJaHw48GWvdMbpCojB
 XQ5vYG9H8wSaJiNYIc7Y9ccV
X-Google-Smtp-Source: ABdhPJwshGYQarP2despzD5pWSrj35Zq/LmDz+iwCxnbSUX7cYkM3zlMcz/VBCD81fwqfY4GbbZIGw==
X-Received: by 2002:a05:6e02:e51:: with SMTP id
 l17mr12795315ilk.199.1612754430274; 
 Sun, 07 Feb 2021 19:20:30 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:29 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 5/5] Enable the MTE support for KVM guest
Date: Mon,  8 Feb 2021 03:20:06 +0000
Message-Id: <a42721fa503d6d26995f451a8ca6d59ae7f3b138.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 623d5e9397..c2358cf4c5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -79,6 +79,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "migration/misc.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -821,6 +822,21 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
+static int virt_precopy_notify(NotifierWithReturn *n, void *data)
+{
+    PrecopyNotifyData *pnd = data;
+
+    switch (pnd->reason) {
+    case PRECOPY_NOTIFY_SETUP:
+        precopy_enable_metadata_migration();
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
 static void create_gpio_keys(const VirtMachineState *vms,
                              DeviceState *pl061_dev,
                              uint32_t phandle)
@@ -1898,9 +1914,9 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->mte && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "MTE to the guest CPU");
-        exit(1);
+        /* connect migration precopy request */
+        vms->precopy_notifier.notify = virt_precopy_notify;
+        precopy_add_notifier(&vms->precopy_notifier);
     }
 
     create_fdt(vms);
-- 
2.17.1


