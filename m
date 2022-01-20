Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930A495475
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:53:03 +0100 (CET)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcYO-0001KL-NO
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWga-0004Gp-1u
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:05 -0500
Received: from [2a00:1450:4864:20::32b] (port=55117
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgW-0003Hr-0W
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so11759391wmg.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wQQhbRNOuq5EaPEqpWKtX7+fD/qyMSKXrjdzQOFGoNM=;
 b=TEif4hNrJZdcz0PmpOoM9+zLW+izWCsiAROyo1FSBtexIugpPFkVKhuCGXZrQA+Wgg
 HjHVSRcAH5+yOxBYZz9sMnxvW67+QkMBAhcW56IabiNySKogn/lhpkUF46ZCuAenm0rM
 ePJLYKVzj92CcPyt41UFCNJ7ZIlUyRNxYCU/vhl8X/4Q15CeT5RekdyA0s//LRhIF7Fq
 RPewSnYq8zaxa5gpONBDUkXafdIIU57jlqnQOKjO1OGPvdlOsYLCrONsPJqSHiUPuEaj
 wH1Gej5beszJ12LvNCKTKxKMx88ltH9zx6bLZ1e+N+Lh8LMTNp4nsP++eF9XI6pB7w6M
 hvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQQhbRNOuq5EaPEqpWKtX7+fD/qyMSKXrjdzQOFGoNM=;
 b=AbuODViQBiK9gISE7x9zErTsgE8gpgfHv6bVHDbK18icKWJUiHS5SDrFlbZEuSWFCX
 Xxp/I1a9Dd87sY8InpnCZXc40wb9qkN+2DFXrnpk5v+WOImimgvEboSu/HxAUm1Fj2Ya
 U369QStEjmvntbUNM5+DT9urZ3ciCkWNjukU9fKb/s1i9Cj/X0z8jd403oEybKnzX0KN
 9eLJxo9LrHi7zzq0O7fgYW6pdyZ07ne+xxAeURqObbMeIuY9J6lMGsca2z8F0X+esbVY
 ea/wsOq5MWSMLDf+TNAqC8Z4wcK17uXUqpZNalKixRO62Z1Bd6UlHRqj77xIHrzsZEmL
 IVaA==
X-Gm-Message-State: AOAM531i4vZl//5wPm5ZdOlfV8EgsYMTPCWXa9xq8j+WqbNSh732rSwN
 2PWaHjVfo50hDTlx0Y8/3NqfgfVk58ZoPA==
X-Google-Smtp-Source: ABdhPJz/rgHnRAQu7a0obOUKN95v7KeP6s1CtIeH+K1zh0OMmMNLnob2nydVgrCSa9AmRGjrM9g80A==
X-Received: by 2002:a05:6000:545:: with SMTP id
 b5mr33465004wrf.452.1642682218921; 
 Thu, 20 Jan 2022 04:36:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/38] hw/arm/virt: Drop superfluous checks against highmem
Date: Thu, 20 Jan 2022 12:36:13 +0000
Message-Id: <20220120123630.267975-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc Zyngier <maz@kernel.org>

Now that the devices present in the extended memory map are checked
against the available PA space and disabled when they don't fit,
there is no need to keep the same checks against highmem, as
highmem really is a shortcut for the PA space being 32bit.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Message-id: 20220114140741.1358263-7-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 2 --
 hw/arm/virt.c            | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0757c28f69c..449fab00805 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -947,8 +947,6 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
-    vms->highmem_redists &= vms->highmem;
-
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8d02c2267d0..141350bf215 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2178,9 +2178,6 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    vms->highmem_mmio &= vms->highmem;
-    vms->highmem_redists &= vms->highmem;
-
     create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
@@ -2199,7 +2196,7 @@ static void machvirt_init(MachineState *machine)
                        machine->ram_size, "mach-virt.tag");
     }
 
-    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
+    vms->highmem_ecam &= (!firmware_loaded || aarch64);
 
     create_rtc(vms);
 
-- 
2.25.1


