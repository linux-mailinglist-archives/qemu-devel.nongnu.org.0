Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC77613744
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:00:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUKC-0008Gx-0q; Mon, 31 Oct 2022 08:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJL-0005zB-V5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJK-0003e1-2w
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jz5ovlW/1oitaGAz2w5Wi5S7a1QwFMmykgtS0BFMGew=;
 b=HlZvt31MgLANpthiSFaM1DzXMcamBgPJVYgF8tL8cTDdUzW4BZB2o9ct63Y3Hm/1QdZDlm
 E64fmyitS9kjalqNATrAteYsdn5jDmdFqoSdwfjOP4jVrXzRI42nctcq/MPKDqDFi/j7Uf
 fnen68yuaLT2zNGMjv3CR9bpZEsPNDk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-_UhcneZ3P_CXzwH3K25kxQ-1; Mon, 31 Oct 2022 08:54:36 -0400
X-MC-Unique: _UhcneZ3P_CXzwH3K25kxQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so3034582wrb.20
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jz5ovlW/1oitaGAz2w5Wi5S7a1QwFMmykgtS0BFMGew=;
 b=G/j8d2HiHeNlsMtOUWwJ4xF+s6MXv5xwa6n3t5+oPH9uWijCDtDXrnKmkJeHu77l9t
 Hl1ezgZohK/B/IWYwgUTw3XU3vTW4YeN0R+L0Q00KPxcMiIWGDmm5kCk/TvrnSWlCR6U
 iQm9zva6utV0iCoYna7HucyT3bgYhOPHa3mULWW6pe/Lu3lAPMrWRHkAFiTcrTJ0h9GA
 2cQHbrRx58ZN+2zS/NzkbDKVi0MDSr62LBUqhDNC6CppZlo4acfvdfZa1vRWjbG5c0US
 9TZpjewQE0OLBKeNRTTYF3+mH6hzDQ+fMRJgrfgPlE0lh/oRJKYRhTqzC532Ya8gRoti
 PMtA==
X-Gm-Message-State: ACrzQf2EIDUNO6h4/HYUGqTFzgBayHZw+GbjNbVRKXpDohqEZVCPp0qI
 rmhxd6c+ABxj+VsAYQY9dI+9sG2lvxo5StylsMgZIxUJnEpwAZF2a+6KZB0AuBNbvCtsqsYJhqW
 Yogxc6cmuR3tveSHyVcIjAzyvTt1sLRFazgyXBNGCVSZfJvHV+NCmhxH5AHEb
X-Received: by 2002:a05:600c:3550:b0:3cf:4c20:5856 with SMTP id
 i16-20020a05600c355000b003cf4c205856mr8070905wmq.188.1667220874960; 
 Mon, 31 Oct 2022 05:54:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nPpL+h0R+X2LQLYKJKb9yqSVfEZHxqTpE48qm9zGC4ScBPX+AQBoRzopwDlP48ZOiYd1kgA==
X-Received: by 2002:a05:600c:3550:b0:3cf:4c20:5856 with SMTP id
 i16-20020a05600c355000b003cf4c205856mr8070884wmq.188.1667220874658; 
 Mon, 31 Oct 2022 05:54:34 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 e9-20020adffd09000000b00236488f62d6sm7112911wrr.79.2022.10.31.05.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:34 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 80/86] tests: acpi: aarch64/virt: add a test for hmat nodes
 with no initiators
Message-ID: <20221031124928.128475-81-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
index 320b828af5..4cc1da1467 100644
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


