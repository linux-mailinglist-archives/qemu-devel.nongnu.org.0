Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950E36C876
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:14:08 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPPb-0008E8-GW
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suyuheng@bytedance.com>)
 id 1lbOsh-0004Md-Gs
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:40:07 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suyuheng@bytedance.com>)
 id 1lbOsc-0001TR-NZ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:40:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id t13so4966019pji.4
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zsCTlQiBLf2DM31rU6FksdvN1DBmBvK6Rsa4w+orFHM=;
 b=P5WqXF59kiEeyPguUbzlS3AmNlJ5TvOo2/lGh2Vckp7ATP6B5ONLCbVHHJyxTihusj
 7MqosiR6ZFjW2Zlj2meAa7gL6Mj9GfCNKKut76q3GSrj0k4QTdOomPyyHGFzOAGziT5m
 XlhI2igX6W7XLgGDwsp5KfJzbteiIwYcTbeQ5xOyli8/IMlG1YqJRQYBMxMVfVwfwYQT
 OquB7nLrr9zkl1/7gi3Q/Q4kcD6BFn+y+THBWj2/bkyxVriOy08J+BvTtLFgzGztORHL
 ZoMCZSKMkoulYjyUtPVeGCV9v4rf43vuV2q2P1cXwMQa+ASb7nx2hPj8T/qHTkr+/Oi2
 KOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zsCTlQiBLf2DM31rU6FksdvN1DBmBvK6Rsa4w+orFHM=;
 b=tGzcUe/7+u0uPbAEEhzyu/o10JMucQGK8bEXIKtRvf+hZFPjMv/yrTsruhJII0b1i6
 WXNfyhAqjJPn4JMFIrcXl6HwkljgUC3R00mEu/E6NCxwkWJsfWQjTxhsG1jh1O1GdDx7
 P2b607VaE01BiEKqDZE1bPPCDCRUUJPx/r5HSG016W+xLn6cSAuuz4/yhZhkvEbQTJT9
 CZGLy+H4vtZeaVW5boE/Bz2o6S1pf7DM4Du9/38Nx/fUY5gaR9i+U06A6hNtpACQB3Ub
 o57kYrZdG7yiKumw+uUfFGyiATsjBoAkahhTr9VQRouh0aJpwTpzEbLCkUTxo82oUQiV
 7clw==
X-Gm-Message-State: AOAM530yYtOTQl+eEOwQnYQgiGJJa7JCad+miBoB+5q/enGkeq4C33d6
 +7qCvhonKmog5YuSs1rV0GEJ2Q==
X-Google-Smtp-Source: ABdhPJy9660Ni6dbAipY4Jwy0gqDRinpU0qZFOmAVY061j9Vn89g8JAYCEU7dsMS60J+hwqfO0lOiQ==
X-Received: by 2002:a17:90b:184:: with SMTP id
 t4mr3310642pjs.223.1619534397661; 
 Tue, 27 Apr 2021 07:39:57 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.241])
 by smtp.gmail.com with ESMTPSA id m2sm69033pgv.87.2021.04.27.07.39.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Apr 2021 07:39:57 -0700 (PDT)
From: GipsyU <suyuheng@bytedance.com>
X-Google-Original-From: GipsyU <su_yuheng@foxmail.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: [PATCH] microvm: Enable hotplug of pcie
Date: Tue, 27 Apr 2021 22:39:37 +0800
Message-Id: <20210427143937.80604-1-su_yuheng@foxmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=suyuheng@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Apr 2021 11:08:51 -0400
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
Cc: Yuheng Su <suyuheng@bytedance.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuheng Su <suyuheng@bytedance.com>

Signed-off-by: Yuheng Su <suyuheng@bytedance.com>
---
 hw/i386/acpi-microvm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index ccd3303aac..4f32bf512f 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -26,6 +26,7 @@
 
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pci.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
@@ -209,6 +210,16 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    acpi_add_table(table_offsets, tables_blob);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = mms->gpex.ecam.base,
+           .size = mms->gpex.ecam.size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
+                   x86ms->oem_table_id);
+    }
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
-- 
2.11.0


