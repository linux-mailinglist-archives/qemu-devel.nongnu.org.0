Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CD33ED18
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:36:02 +0100 (CET)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSav-0007Lf-T9
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU9-00028G-Lz
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:29:01 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU8-0001Bo-0o
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:29:01 -0400
Received: by mail-pl1-x629.google.com with SMTP id a13so478641pln.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eS//NP/1GkUCHJv2GcftGE8oA/OfSV4PaKf375lLiF8=;
 b=I6feyUlgnb9c3fpRGeqLy5N01vjSOq/aoPvzhXFZtBz0dFGEO+a3/tAa3ca2LrnGF+
 AKJr+28703SXsOL28w/962+EvZpk3ISAZ2ETCrZEEzkgHRDQB9je9lQRFBvCdiFv6Oy7
 ukwIgo8wBF2zNwzQqD0wj7agX8/LMGbMSC0haKn9P6D1nhgPSE1KY0T7pMWQkjVFHagD
 wpnMchF8PlpRuDLWWkxpMjNZv3RJZOxibEHYNhWJjdP0bd4VlsaoozaYQ0vbwTMie9oq
 tKmioHcyIUGirBJJiTIrzzCg/jIzYob3TwBIhk5V8LMyxCgR8x/ooKOoThG7qOrJt8Pr
 Hysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eS//NP/1GkUCHJv2GcftGE8oA/OfSV4PaKf375lLiF8=;
 b=PjKNT/GIa/02HE2ILvjBDkwDVF6riaZA+Ner/1rNIkEnKcnL72p8IybfVbRLk+jGs3
 oSv8MtXZRHWelUZjhsm//dDZBnEfSZZrmmxJqQBPNewtWZaeholM1wNYJ7Egepv9p9sJ
 zcEr67mBV4QxNbPJET3gRen+T50ont1AcS4w+7+Tzw7jPmITLO8QyNOBTRQmjO7vM5PN
 nLzsPxhB3ZCX6guJD+VHFzUvwH1bla9ZVWxBbyIXldBTrrJ8xHb2I3zgREpxl3P5fk8V
 3mW10NxGlITvaKUQTR2isjemGWXz1GwTrtBfPB9DjXXX00Etxm9JXt04J7CNMgCLsJp/
 0pYg==
X-Gm-Message-State: AOAM530Ii5yFJzGhgaZecSm0CaU5w433mZaYA5PScLIxhhmFclbar7UI
 6mr7Ypn4cyTbf6znD5JaqKLV
X-Google-Smtp-Source: ABdhPJxUld8DFYbV9g9z9hBoccITcnr1cywtaztjhDDiqYJuXy70s61owq2vf0wEh1JkRI5zWNkUiA==
X-Received: by 2002:a17:90a:840a:: with SMTP id
 j10mr3475362pjn.97.1615973338789; 
 Wed, 17 Mar 2021 02:28:58 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:54 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 5/5] Enable the MTE support for KVM guest
Date: Wed, 17 Mar 2021 09:28:24 +0000
Message-Id: <5ed81ba84e44100798009cee95c3dc2d993602f0.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=haibo.xu@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 76658b93a3..36cfdb29e9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -79,6 +79,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "migration/misc.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -828,6 +829,21 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
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
 static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
@@ -1912,9 +1928,9 @@ static void machvirt_init(MachineState *machine)
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


