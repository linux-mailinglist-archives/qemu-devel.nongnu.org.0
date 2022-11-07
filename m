Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F362037B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:12:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzn-0005In-Vf; Mon, 07 Nov 2022 17:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzZ-00059C-4c
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzX-00013C-E5
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jZ3VB6A1xTkWicDOO0J317Z8x6HSLJyhXgRb3XeFwbE=;
 b=edtRghQ62DBV7+CI9IVbKfringDFpWa8qD5Z9iO7XaJrBefieHU75O7HZN2WRucJDEhET4
 YHDU1fa6eiwHTGa5P9sX2/4XWd9ZR+wE13+qB9eZQQ+7MXX9Sq96iQ0dAs8K3roSY5t6lA
 eHmq3IsnSsVLYwCVZiRp6VHRX7ubd3s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-FVHzWNYCOwmtxQzYwZR1Aw-1; Mon, 07 Nov 2022 17:53:16 -0500
X-MC-Unique: FVHzWNYCOwmtxQzYwZR1Aw-1
Received: by mail-qt1-f197.google.com with SMTP id
 y19-20020a05622a121300b003a526e0ff9bso9122968qtx.15
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZ3VB6A1xTkWicDOO0J317Z8x6HSLJyhXgRb3XeFwbE=;
 b=lcrEbtU/tW3IswdgO96T9pLHw3A1zCqbR5N1sihl5OxJO5ZfhYtZsD/7qNG8T3JoQd
 iBeQyHMTy8bLp6Gdhnc+pTPrK2t7VEGmkm7tNYYOlYf5Q/kheKHDWhAPLPWlWMY4BusM
 OjKUMBgfmJwimgx6gJGBIWXCCOiHdevZ3EkfjeECp80zPUpzJH35o+l/lUrOP3KPa2ZW
 mXpI6BhBxaeEywrSTyn1BDb2apNvVUazGc3JfEpbeNwGpVtq+ZdCrr3dgabXrBYU8Lzs
 v5vzaHDly5yawmTBDV6EUnqutZ+X29ZlBQ7GnBCEZX2/0dBjPmurmZXrIKeRJx7MrMF7
 af7Q==
X-Gm-Message-State: ACrzQf1/EjliIDT2k1rL3Uac21GaXaTS7CFzoIFd023iyltshoUVVc3o
 /6Uko3IXgCX1FL8sFi/jdk8WYHoOFAbwMEmQT8iYdZz66nMFi8U2dO8zKGmVTE7y6qLCRa9qicB
 SohKZnhy8gSjxkz1IF1KZnfyqsKhSAi6+XYgWJEK9uY7R6tPEE/r9QtIurRaa
X-Received: by 2002:a05:6214:21ea:b0:4bb:ecf0:bc5 with SMTP id
 p10-20020a05621421ea00b004bbecf00bc5mr41370932qvj.86.1667861596161; 
 Mon, 07 Nov 2022 14:53:16 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4qBJnw3mkJ+IfHAiZGRb/L0OZcv95E5P9iVhwJmJP6ilHMnniBy/RgJTyt+GPKbWA4mhOTow==
X-Received: by 2002:a05:6214:21ea:b0:4bb:ecf0:bc5 with SMTP id
 p10-20020a05621421ea00b004bbecf00bc5mr41370903qvj.86.1667861595820; 
 Mon, 07 Nov 2022 14:53:15 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 d1-20020a05620a240100b006fa00941e9dsm7946704qkn.136.2022.11.07.14.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:15 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 68/83] tests: acpi: aarch64/virt: add a test for hmat nodes
 with no initiators
Message-ID: <20221107224600.934080-69-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
index 02fe59fbf8..e805b3efec 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1461,6 +1461,63 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
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
@@ -1914,6 +1971,8 @@ int main(int argc, char *argv[])
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


