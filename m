Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB706D061D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:12:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phs3l-0003c4-G7; Thu, 30 Mar 2023 09:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phs3j-0003br-9p
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phs3g-0000pu-FH
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680181874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GFU9gNXqwv3B7kWQcAHttWZVvsZ4Whn/lvOJHgkqThA=;
 b=JZ4YeeP5aOXdHeXt1UG7iA5LkNWqsqpGS3GwYhGySxFoJTYnlDpZCmop5SLurf0UrPTz+v
 k5OBAR/LsClAnHN6kaJYP0X8+BhxuPqUf02+fk//RyMwJoLIOTm5k+O8z78qJx31eatZ3F
 2vTQD11nzKcFvqDe5lFL7JYzM6PrluU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-13P__VQyPkWlqQLI_S3YGQ-1; Thu, 30 Mar 2023 09:11:13 -0400
X-MC-Unique: 13P__VQyPkWlqQLI_S3YGQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i19-20020adfa513000000b002dc1cdac53fso1953217wrb.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181871; x=1682773871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFU9gNXqwv3B7kWQcAHttWZVvsZ4Whn/lvOJHgkqThA=;
 b=EY+zabMWpVPXDQIsrKxh+Z81CdPFt5r8uV0ihWiAtKxJ1Zti/NFHpDGx/xqBCoaLQa
 cusvcaHrAffsMgbORhwwRjXjUKQG+pfP6xfNnhGrx+Ykq6jH1kebmfg8ThTHq+74S8xn
 EyzYc4KRdCy4YgUBBmKSUfzouYqJH3Kewt17t+R3odRenjefLSf+dUJIAvn8E1cWOOeW
 iFkitzBO/g/1WZT7nGnxdRZwduEpimzrnlxibuX5lRho9rYKiHoreFmWHXJwFqpJfk2N
 zH/WtJif5uQN0Sm1Oh94yKtU91ULRsfcYw/1V05tDmF58Kajpk5EifPVE5+oMRNZF7id
 nPoA==
X-Gm-Message-State: AO0yUKV1/fFILnkev3Juh2vSJjkPMCOveE0HhMNFoqFwNUzeXv3M5eZE
 RthmTdY4fWBZse2kHbLPZ8rDUcg0eiQIvyVMilX2SCd34CjAQGujqxE3eIf5tccLQ9UkYDfNMBr
 V46PHI7Y+8RHCmHwJkfMzEslVIiRHQAqPjT0VsfclCds3ecgACkwCI0EMFo5OJcGMg5HcSlKcXh
 EZ+w==
X-Received: by 2002:a1c:790b:0:b0:3ed:9ed7:d676 with SMTP id
 l11-20020a1c790b000000b003ed9ed7d676mr17700898wme.13.1680181871516; 
 Thu, 30 Mar 2023 06:11:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set/4Ke+DuobKtQRuY+r+ND/TYM/eOjhP4HZOgfVlEmT+tIBEn5N1GrzJL/DtF7HPKeIagYEPfA==
X-Received: by 2002:a1c:790b:0:b0:3ed:9ed7:d676 with SMTP id
 l11-20020a1c790b000000b003ed9ed7d676mr17700878wme.13.1680181871120; 
 Thu, 30 Mar 2023 06:11:11 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a7bcd95000000b003edc11c2ecbsm5927617wmj.4.2023.03.30.06.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 06:11:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] tests: bios-tables-test: replace memset with initializer
Date: Thu, 30 Mar 2023 15:11:09 +0200
Message-Id: <20230330131109.47856-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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

Coverity complains that memset() writes over a const field.  Use
an initializer instead, so that the const field is left to zero.
Tests that have to write the const field already use an initializer
for the whole struct, here I am choosing the smallest possible
patch (which is not that small already).

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/bios-tables-test.c | 123 ++++++++++++---------------------
 1 file changed, 43 insertions(+), 80 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 873358943784..464f87382e23 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -438,10 +438,9 @@ static void test_acpi_asl(test_data *data)
 {
     int i;
     AcpiSdtTable *sdt, *exp_sdt;
-    test_data exp_data;
+    test_data exp_data = {};
     gboolean exp_err, err, all_tables_match = true;
 
-    memset(&exp_data, 0, sizeof(exp_data));
     exp_data.tables = load_expected_aml(data);
     dump_aml_files(data, false);
     for (i = 0; i < data->tables->len; ++i) {
@@ -853,12 +852,11 @@ static uint8_t base_required_struct_types[] = {
 
 static void test_acpi_piix4_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
     /* Supplying -machine accel argument overrides the default (qtest).
      * This is to make guest actually run.
      */
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
@@ -868,9 +866,8 @@ static void test_acpi_piix4_tcg(void)
 
 static void test_acpi_piix4_tcg_bridge(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
@@ -906,9 +903,8 @@ static void test_acpi_piix4_tcg_bridge(void)
 
 static void test_acpi_piix4_no_root_hotplug(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".roothp";
     data.required_struct_types = base_required_struct_types;
@@ -923,9 +919,8 @@ static void test_acpi_piix4_no_root_hotplug(void)
 
 static void test_acpi_piix4_no_bridge_hotplug(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".hpbridge";
     data.required_struct_types = base_required_struct_types;
@@ -940,9 +935,8 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
 
 static void test_acpi_piix4_no_acpi_pci_hotplug(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".hpbrroot";
     data.required_struct_types = base_required_struct_types;
@@ -962,9 +956,8 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
 
 static void test_acpi_q35_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
@@ -994,9 +987,8 @@ static void test_acpi_q35_tcg_core_count2(void)
 
 static void test_acpi_q35_tcg_bridge(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
@@ -1009,9 +1001,8 @@ static void test_acpi_q35_tcg_bridge(void)
 
 static void test_acpi_q35_tcg_no_acpi_hotplug(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".noacpihp";
     data.required_struct_types = base_required_struct_types;
@@ -1105,9 +1096,8 @@ static void test_acpi_q35_tcg_mmio64(void)
 
 static void test_acpi_piix4_tcg_cphp(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".cphp";
     test_acpi_one("-smp 2,cores=3,sockets=2,maxcpus=6"
@@ -1121,9 +1111,8 @@ static void test_acpi_piix4_tcg_cphp(void)
 
 static void test_acpi_q35_tcg_cphp(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".cphp";
     test_acpi_one(" -smp 2,cores=3,sockets=2,maxcpus=6"
@@ -1141,9 +1130,8 @@ static uint8_t ipmi_required_struct_types[] = {
 
 static void test_acpi_q35_tcg_ipmi(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".ipmibt";
     data.required_struct_types = ipmi_required_struct_types;
@@ -1156,9 +1144,8 @@ static void test_acpi_q35_tcg_ipmi(void)
 
 static void test_acpi_q35_tcg_smbus_ipmi(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".ipmismbus";
     data.required_struct_types = ipmi_required_struct_types;
@@ -1171,12 +1158,11 @@ static void test_acpi_q35_tcg_smbus_ipmi(void)
 
 static void test_acpi_piix4_tcg_ipmi(void)
 {
-    test_data data;
+    test_data data = {};
 
     /* Supplying -machine accel argument overrides the default (qtest).
      * This is to make guest actually run.
      */
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".ipmikcs";
     data.required_struct_types = ipmi_required_struct_types;
@@ -1189,9 +1175,8 @@ static void test_acpi_piix4_tcg_ipmi(void)
 
 static void test_acpi_q35_tcg_memhp(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".memhp";
     test_acpi_one(" -m 128,slots=3,maxmem=1G"
@@ -1205,9 +1190,8 @@ static void test_acpi_q35_tcg_memhp(void)
 
 static void test_acpi_piix4_tcg_memhp(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".memhp";
     test_acpi_one(" -m 128,slots=3,maxmem=1G"
@@ -1221,9 +1205,8 @@ static void test_acpi_piix4_tcg_memhp(void)
 
 static void test_acpi_piix4_tcg_nosmm(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".nosmm";
     test_acpi_one("-machine smm=off", &data);
@@ -1232,9 +1215,8 @@ static void test_acpi_piix4_tcg_nosmm(void)
 
 static void test_acpi_piix4_tcg_smm_compat(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".smm-compat";
     test_acpi_one("-global PIIX4_PM.smm-compat=on", &data);
@@ -1243,9 +1225,8 @@ static void test_acpi_piix4_tcg_smm_compat(void)
 
 static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".smm-compat-nosmm";
     test_acpi_one("-global PIIX4_PM.smm-compat=on -machine smm=off", &data);
@@ -1254,9 +1235,8 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
 
 static void test_acpi_piix4_tcg_nohpet(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.machine_param = ",hpet=off";
     data.variant = ".nohpet";
@@ -1266,9 +1246,8 @@ static void test_acpi_piix4_tcg_nohpet(void)
 
 static void test_acpi_q35_tcg_numamem(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".numamem";
     test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
@@ -1278,9 +1257,8 @@ static void test_acpi_q35_tcg_numamem(void)
 
 static void test_acpi_q35_kvm_xapic(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".xapic";
     test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
@@ -1291,9 +1269,8 @@ static void test_acpi_q35_kvm_xapic(void)
 
 static void test_acpi_q35_tcg_nosmm(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".nosmm";
     test_acpi_one("-machine smm=off", &data);
@@ -1302,9 +1279,8 @@ static void test_acpi_q35_tcg_nosmm(void)
 
 static void test_acpi_q35_tcg_smm_compat(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".smm-compat";
     test_acpi_one("-global ICH9-LPC.smm-compat=on", &data);
@@ -1313,9 +1289,8 @@ static void test_acpi_q35_tcg_smm_compat(void)
 
 static void test_acpi_q35_tcg_smm_compat_nosmm(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".smm-compat-nosmm";
     test_acpi_one("-global ICH9-LPC.smm-compat=on -machine smm=off", &data);
@@ -1324,9 +1299,8 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void)
 
 static void test_acpi_q35_tcg_nohpet(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.machine_param = ",hpet=off";
     data.variant = ".nohpet";
@@ -1336,9 +1310,8 @@ static void test_acpi_q35_tcg_nohpet(void)
 
 static void test_acpi_q35_kvm_dmar(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".dmar";
     test_acpi_one("-machine kernel-irqchip=split -accel kvm"
@@ -1348,9 +1321,8 @@ static void test_acpi_q35_kvm_dmar(void)
 
 static void test_acpi_q35_tcg_ivrs(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".ivrs";
     data.tcg_only = true,
@@ -1360,9 +1332,8 @@ static void test_acpi_q35_tcg_ivrs(void)
 
 static void test_acpi_piix4_tcg_numamem(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.variant = ".numamem";
     test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
@@ -1379,7 +1350,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
                                           machine, tpm_if);
     char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
     TPMTestState test;
-    test_data data;
+    test_data data = {};
     GThread *thread;
     const char *suffix = tpm_version == TPM_VERSION_2_0 ? "tpm2" : "tpm12";
     char *args, *variant = g_strdup_printf(".%s.%s", tpm_if, suffix);
@@ -1399,7 +1370,6 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
     tpm_emu_test_wait_cond(&test);
 
-    memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = variant;
 
@@ -1434,9 +1404,8 @@ static void test_acpi_q35_tcg_tpm12_tis(void)
 
 static void test_acpi_tcg_dimm_pxm(const char *machine)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = ".dimmpxm";
     test_acpi_one(" -machine nvdimm=on,nvdimm-persistence=cpu"
@@ -1504,7 +1473,6 @@ static void test_acpi_virt_tcg_memhp(void)
 
 static void test_acpi_microvm_prepare(test_data *data)
 {
-    memset(data, 0, sizeof(*data));
     data->machine = "microvm";
     data->required_struct_types = NULL; /* no smbios */
     data->required_struct_types_len = 0;
@@ -1513,7 +1481,7 @@ static void test_acpi_microvm_prepare(test_data *data)
 
 static void test_acpi_microvm_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
     test_acpi_microvm_prepare(&data);
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
@@ -1523,7 +1491,7 @@ static void test_acpi_microvm_tcg(void)
 
 static void test_acpi_microvm_usb_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".usb";
@@ -1534,7 +1502,7 @@ static void test_acpi_microvm_usb_tcg(void)
 
 static void test_acpi_microvm_rtc_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".rtc";
@@ -1545,7 +1513,7 @@ static void test_acpi_microvm_rtc_tcg(void)
 
 static void test_acpi_microvm_pcie_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
@@ -1557,7 +1525,7 @@ static void test_acpi_microvm_pcie_tcg(void)
 
 static void test_acpi_microvm_ioapic2_tcg(void)
 {
-    test_data data;
+    test_data data = {};
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".ioapic2";
@@ -1622,9 +1590,8 @@ static void test_acpi_virt_tcg_pxb(void)
 
 static void test_acpi_tcg_acpi_hmat(const char *machine)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = ".acpihmat";
     test_acpi_one(" -machine hmat=on"
@@ -1721,9 +1688,8 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
 
 static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
 {
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.variant = ".acpihmat-noinitiator";
     test_acpi_one(" -machine hmat=on"
@@ -1772,9 +1738,8 @@ static void test_acpi_erst(const char *machine)
 {
     gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
     gchar *params;
-    test_data data;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = ".acpierst";
     params = g_strdup_printf(
@@ -1802,7 +1767,7 @@ static void test_acpi_microvm_acpi_erst(void)
 {
     gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
     gchar *params;
-    test_data data;
+    test_data data = {};
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
@@ -2003,10 +1968,9 @@ static void test_oem_fields(test_data *data)
 
 static void test_acpi_piix4_oem_fields(void)
 {
-    test_data data;
     char *args;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
@@ -2022,10 +1986,9 @@ static void test_acpi_piix4_oem_fields(void)
 
 static void test_acpi_q35_oem_fields(void)
 {
-    test_data data;
     char *args;
+    test_data data = {};
 
-    memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
@@ -2041,7 +2004,7 @@ static void test_acpi_q35_oem_fields(void)
 
 static void test_acpi_microvm_oem_fields(void)
 {
-    test_data data;
+    test_data data = {};
     char *args;
 
     test_acpi_microvm_prepare(&data);
-- 
2.39.2


