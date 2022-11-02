Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC461683B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:17:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGMF-0005Ue-95; Wed, 02 Nov 2022 12:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLZ-0003bF-PY
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLY-0004DI-0a
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tA+2455gPNyP5/5MKwmHIiHi/kwAR29i4bdE/Vk8+as=;
 b=benKFsj34vYwEDkN9cRP1NzdqnZAigdYgDLK03YxSYvcxlJWCsXOHhCvoW1edxUID4Bejy
 g6x9CO6JHKeLCwui96fvOJZAuYD6ensfFFReIAm7VBspoCnnHNBB4WSoSLI+tD4hL1fEaU
 5oJ/+EVQG66I48QSFomY+5ZSoCF8JXo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-o7yy1WrTOJ6_1MHZdqRLmw-1; Wed, 02 Nov 2022 12:12:06 -0400
X-MC-Unique: o7yy1WrTOJ6_1MHZdqRLmw-1
Received: by mail-wm1-f70.google.com with SMTP id
 9-20020a1c0209000000b003cf6fce8005so521749wmc.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tA+2455gPNyP5/5MKwmHIiHi/kwAR29i4bdE/Vk8+as=;
 b=XkcFtSgF7djLkgNvgrhRQCvEatazRPB/EYShYcTUsZJHx0h2HeyIaFevIkUh8iP9D+
 PrnTaB4fn7JluXGw6ao3tXc8JGYMmKiaGoEnt9QmXxw6xVsYlJ0n25z9HlJPRSXPjKrA
 XG+UGB87LPXZxNfGJ5QJGyy93ET/dYqtHrgvrDv1Ql3xtq7Nh/NDHc9kCs7Yor+0lOE0
 vdNKiqFqvV+/YsfhUwynDeYUGDzjLza79DXq+P/1S/IKORgf/kwJ0/KYJw9W+vbGEFnu
 +GW+Tn0h/DaPLbMjrSV0fJxOsZRgnBoVgJS90e0D9Tgu4Q7aEXTr0l9mmpHFcl783D70
 mTTQ==
X-Gm-Message-State: ACrzQf2rLrsLRwNdLdi/T0PZ6JDPhQp0mrB/DEfnTxBxafriD35gg9Av
 nZACWM3GTv8IEqy/rSp+U1c7w1nQg71oOKbhrm4q2cNZqIacg7QpWRJCTZAbM8qsks3kobK7gV5
 XEGxVPZOYMu1QWB3TMtqpYps2rMUUAyGWoONMm3XzjPGcQInkwLE9I7g7ETnx
X-Received: by 2002:a05:600c:4f05:b0:3cf:87c6:88d4 with SMTP id
 l5-20020a05600c4f0500b003cf87c688d4mr2404208wmq.34.1667405524848; 
 Wed, 02 Nov 2022 09:12:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EgjgYFnRYJuU1xLyLJ0y7WITr3n4o9rRylLSzNAiLOdfDDYFdimkqeYSk6fxR9XQ90/0LAQ==
X-Received: by 2002:a05:600c:4f05:b0:3cf:87c6:88d4 with SMTP id
 l5-20020a05600c4f0500b003cf87c688d4mr2404167wmq.34.1667405524505; 
 Wed, 02 Nov 2022 09:12:04 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 cc6-20020a5d5c06000000b002364835caacsm13670017wrb.112.2022.11.02.09.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:12:04 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:12:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 76/82] tests: acpi: aarch64/virt: add a test for hmat nodes
 with no initiators
Message-ID: <20221102160336.616599-77-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hesham Almatary <hesham.almatary@huawei.com>

This patch imitates the "tests: acpi: q35: add test for hmat nodes
without initiators" commit to test numa nodes with different HMAT
attributes, but on AArch64/virt.

Tested with:
qemu-system-aarch64 -accel tcg \
-machine virt,hmat=on,gic-version=3  -cpu cortex-a57 \
-bios qemu-efi-aarch64/QEMU_EFI.fd \
-kernel Image -append "root=/dev/vda2 console=ttyAMA0" \
-drive if=virtio,file=aarch64.qcow2,format=qcow2,id=hd \
-device virtio-rng-pci \
-net user,hostfwd=tcp::10022-:22 -net nic \
-device intel-hda -device hda-duplex -nographic \
-smp 4 \
-m 3G \
-object memory-backend-ram,size=1G,id=ram0 \
-object memory-backend-ram,size=1G,id=ram1 \
-object memory-backend-ram,size=1G,id=ram2 \
-numa node,nodeid=0,memdev=ram0,cpus=0-1 \
-numa node,nodeid=1,memdev=ram1,cpus=2-3 \
-numa node,nodeid=2,memdev=ram2 \
-numa
hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-8-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 669432585b..395d441212 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1543,6 +1543,63 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_virt_tcg_acpi_hmat(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    data.variant = ".acpihmatvirt";
+
+    test_acpi_one(" -machine hmat=on"
+                  " -cpu cortex-a57"
+                  " -smp 4,sockets=2"
+                  " -m 256M"
+                  " -object memory-backend-ram,size=64M,id=ram0"
+                  " -object memory-backend-ram,size=64M,id=ram1"
+                  " -object memory-backend-ram,size=128M,id=ram2"
+                  " -numa node,nodeid=0,memdev=ram0"
+                  " -numa node,nodeid=1,memdev=ram1"
+                  " -numa node,nodeid=2,memdev=ram2"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576",
+                  &data);
+
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
 {
     test_data data;
@@ -1998,6 +2055,8 @@ int main(int argc, char *argv[])
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/acpihmatvirt",
+                            test_acpi_virt_tcg_acpi_hmat);
             qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-- 
MST


