Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB3577D74
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:27:30 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDM6C-0003fX-Uk
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <NikunjAmritlal.Dadhania@amd.com>)
 id 1oDM2r-00021w-HH
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:24:01 -0400
Received: from mail-mw2nam12on20620.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::620]:43113
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <NikunjAmritlal.Dadhania@amd.com>)
 id 1oDM2o-0006vd-RO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:24:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+K0He9qrVdm/I4thSxw6JrmI7XTLLEBYLBQrymtjuciYE6XJtGxw6qZvElohRA2ASz2QwXDtj5/nUs/4QI3kfddqjnB+74RV+qeH9eFT0ms/krLVbiYtg3NcdoHE4rpth3qGx8v8i0oqYqfxkJxfP0IsC2hr6bigj6PydMuWADiRaJK1Xz5qx4q/c0g+vZJC0ZH4+13ILrKwn5xdYSY08N5vi96zKRmmm3JM5uiEUqCrjbG7WFg3h6uA6siGRBUMJy88PU+KdH4d4hAIhMYHmrJcoiVuFkVBPNc+NlT4TYSsb3o0YWxjjH8uC/amjRPd5TZbiMCIMFS91JNhW9Y/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLdbsEXDhfr+6EDkkDgz28RPEMmgjvJcGFvScxtLU9Y=;
 b=W8S8DZGR7JpxX3mdbm1Q12JScywJSnrNNG+nfqSHX3jy0ANprYHPCo8ACPFQn9c+Fd2Ic7PcPDlUevp7vn68UQhApN203O1GUNMiuqXbC0mRkF7nfysdEg2MaxATRZnBhP6doFRk4d7RU0pwWgQVCDQmj0xYX78cBkvjBHFKW1zzHiyAcgM61UkSQUdo6ANw3F+izowto5cfdhePFHGmms2EafubpDc2mXaHlXswSEJrR28goupzfQ5scuuiK65FfOfoSR9C6L4r26TQGneSS9KGUUhK04dT/mXS+Kq09p2a5KXWydlfG8/Ny5blbfcdwvAm/b8xY3JgmMLvvmAbvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLdbsEXDhfr+6EDkkDgz28RPEMmgjvJcGFvScxtLU9Y=;
 b=dNH3bvSXGHWIFjiKd/H3uTn5b4TwzNpwq1rEgEh4guiZ+xwHhl5Ui0P7mp/epGD5lX75E6J7p9+qprcEGDfS3kAncXxJl+vnBOxRBq3mnve/T4lzOv3P4xS/R7y/ukYlclfQpNOE6rs/CocCLvmL6D+/+12GManeaH9T/xhYYmA=
Received: from DM5PR07CA0107.namprd07.prod.outlook.com (2603:10b6:4:ae::36) by
 DM6PR12MB2842.namprd12.prod.outlook.com (2603:10b6:5:4c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.19; Mon, 18 Jul 2022 08:18:52 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::87) by DM5PR07CA0107.outlook.office365.com
 (2603:10b6:4:ae::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Mon, 18 Jul 2022 08:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 08:18:51 +0000
Received: from gomati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 18 Jul
 2022 03:18:20 -0500
From: Nikunj A Dadhania <nikunj@amd.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson
 <sean.j.christopherson@intel.com>, <f4bug@amsat.org>,
 <Abraham.Shaju@amd.com>, <bharata@amd.com>, <nikunj@amd.com>
Subject: [PATCH] x86: cpu: Error out if memory exceeds addressable range
Date: Mon, 18 Jul 2022 13:47:34 +0530
Message-ID: <20220718081734.135598-1-nikunj@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5be95755-897f-44cd-3240-08da6896261f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2842:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOlP3QHc3q/jbehsu6RkOHsgZGUXqmOTkIHJUsPOirOJFhP3lODfc7bZk3wjdOwc6IHyRuzbv7HRXJwfwSsAtRsPQNA0K2TDHKy33etLUcJZC3WYuggTzPXDXsoeuBj0FCrnrBt5t1njUh+eNEkLcMH3x6Y4WP6MIQ/++Z9Uz1+AfuATBlWkkvyeE/DNYbRdakH2PaP/sK8eiLW3PL39Gt1hAQw7hbBLUd66ttSnME3p7Pto5ujjB5GcdaHQ9tk5GQpy4lCPnjI9i3hg6Sr0H7DU3E0DlcnNdTVa2q/vBUs6seiwi4MNH6KXopGQ38QwpG9fdeajU4dlhRdRWJhciAb50wQWb1pJIMwmAV+LClHS2ITa7kUxUA11jKyfheDWhqTtBKTJSnk1sI5HoGeGY7ubw1KLFAMrN3CeCWSD0Mg753JEqyuf3v26D45Cv/RdU5rsXFWpk3F4C8fsQQpGfzVS03tnBBjbb25b4bxAb547GLEZmDIoZ35atMezmefRXo+6LKKxj7J85TFKontNG0f2Z2dGyGoWHERfDVNhuKmP61XHbHGmZ9X0E1O43D0Mm2l5axrvye55iMYIjiBVhCEs+fS8AoX+YdUYUh6E2ywfkzCUbNi1TWLl3KrE6aIxwYsix4m6Wma7zUy/Y0igQ73N0e8fmlES5ynXhWn1fFEJA/KrVf5UtE50suUKiQY2wBorrONu8av90w3I5Jydx+DXajaOHz+++NLR86JdJfKqncHFLH/J/1Nb5zVC2XhIIpV/wXvtfWcuP5tawH2SFe4kFZqYi/Sm96oV8wB3j5ejOQ4GR1D+nU4g/XFuDTKCnSKllu4MlgZYCfVhzsXZRRyH0gyxRpMKSsZ2xLdeilc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(356005)(40480700001)(82310400005)(36860700001)(82740400003)(36756003)(316002)(83380400001)(16526019)(186003)(426003)(47076005)(336012)(478600001)(5660300002)(6666004)(2616005)(70586007)(2906002)(41300700001)(70206006)(1076003)(8676002)(4326008)(26005)(40460700003)(7696005)(8936002)(81166007)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:18:51.9214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be95755-897f-44cd-3240-08da6896261f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2842
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::620;
 envelope-from=NikunjAmritlal.Dadhania@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently it is possible to start a guest with memory that is beyond
the addressable range of CPU and QEMU does not even warn about it.
The default phys_bits is 40 and can address 1TB. However it allows to
start a guest with greater than 1TB memory.

Prevent this by erroring out in such a scenario.

Reported-by: Shaju Abraham <Abraham.Shaju@amd.com>
Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
---
 target/i386/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af..1afbdbac7d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6376,6 +6376,7 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     CPUState *cs = CPU(dev);
     X86CPU *cpu = X86_CPU(dev);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
@@ -6541,6 +6542,15 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+    if (BIT_ULL(cpu->phys_bits) < machine->maxram_size) {
+        error_setg(&local_err, "cannot setup guest memory: "
+                   "%s memory(%lu MiB) exceeds addressable limit(%llu MiB)",
+                   machine->maxram_size == machine->ram_size ? "" : "max",
+                   machine->maxram_size / MiB,
+                   BIT_ULL(cpu->phys_bits) / MiB);
+        goto out;
+    }
+
     /* Cache information initialization */
     if (!cpu->legacy_cache) {
         if (!xcc->model || !xcc->model->cpudef->cache_info) {
-- 
2.32.0


