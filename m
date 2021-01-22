Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FC2FF982
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 01:35:38 +0100 (CET)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2kQL-0007gP-VG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 19:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kOs-0006pT-6P
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:34:06 -0500
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com
 ([40.107.92.82]:58230 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kOo-0007oP-T1
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:34:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMDhDxfCOewetUWHliXwBBUAh+NHsIr+5KsOztHV+UOv3boE0jiz3WLGJrUu6DBz6pXeEieELuP+2rKgJkWCDE8F7g14dG/UIieBusNC8JvHE8rQFKsy2OYhhVQbW5loisEQvx2+20ytuFVVU9BFBXEX9PMxhBYHccDJa10dTDIrqQyFf4yJR0w2hk9wNbKInA0lYRJ018ZIEJPMTAtdcgp+AU1FLgdbUO+ctirlaXUgx2HbbENeyGWBtNooR6k2HukxHVWsUkXlcdAINEwT53XxwpLEv/ntD779PLENtOw8Foz/9dQyhCCNTpW93vNkFLVd809riZw0IMq5r9X29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4ozdW8ksfqNUFtV9QhUiLIVNqJVXdfNXgs+8xrp8bY=;
 b=BonnmSbWVKGgxcyuc+CqJV9BBkl7SwwmnGslPeTXjKyzDySSaV05xF/DcgfhKoi4TKAoarnHEoK87OlQO2L7KNYrixb+/mbUB2D87r8S4E4W+8g5QD4mpP23xGwf9j+oiBZ0kJrkw/mmsaX0SJ3nn8GanydLpd0Q2V/tTsZ6ojeTJDd7bA4NP98Fc8cmJjFHFQu5BPJS7ZDqEcM9QD8HojI2z/5JfjVjiHsgu9cW1R99jsK0sLC/2snDYLPDHPkni2X1hJUsmByYtpoiMjLBoOijW1dc5MY6G9PSS4Oovunt76l1o8on1f/1//progaXB4mcXFD0saJeNlAny1qEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4ozdW8ksfqNUFtV9QhUiLIVNqJVXdfNXgs+8xrp8bY=;
 b=JKMtGXicNNLg+NDiStrnOkR/BIKVopgGYQaeYi+QVyBl+axkDfwRa8YPqwcQ3a5b6Co57NBc+idfb71arXZdq0hfkK/x2YApgqS1pMQmkpqdnJ51nTS7wjhAHbhhpTG880o++NyIBostrwnUGnm/3wK+mNvyY/wDH778liTm7K4=
Received: from BL1PR13CA0175.namprd13.prod.outlook.com (2603:10b6:208:2bd::30)
 by BYAPR02MB4056.namprd02.prod.outlook.com (2603:10b6:a02:fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 00:18:57 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bd:cafe::71) by BL1PR13CA0175.outlook.office365.com
 (2603:10b6:208:2bd::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend
 Transport; Fri, 22 Jan 2021 00:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 00:18:56 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 16:18:55 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 16:18:55 -0800
Received: from [172.19.2.32] (port=58488 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1l2kAB-0001Bj-IG; Thu, 21 Jan 2021 16:18:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 1/3] target/microblaze: Add use-non-secure property
Date: Thu, 21 Jan 2021 16:18:53 -0800
Message-ID: <1611274735-303873-2-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf73cf19-24a3-4611-6b30-08d8be6b4eea
X-MS-TrafficTypeDiagnostic: BYAPR02MB4056:
X-Microsoft-Antispam-PRVS: <BYAPR02MB40567F1965145A94063D0DBAD0A09@BYAPR02MB4056.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoUYZPG/1BzkSzmtTrMQTNY2LFdAlBJvDWXCT1Zq6h6ohiINy/phZirqU9osIf9nQchORNt75hGw5kMxDx1A8sgdBRL3re/L0cXinC83M56q3Np5Rv4YZgtzjGoczkx0EXAkUQFCJxg29kXWMbycCg1s8vnG/A79bjj3349V0XVhLzqqwMOemZlXBHSYik5C+kIf6n6KG6KhthaHs3o3Ozjtc4yhNjJ4y4lof5t3PhRytU+ihTkbt3TlfKGplnuRJQJOlVv9+QaGvALrKc6zqjgi3XX0evmJ2CiaWRB/Wd8AzUNIhIyZlyR2W8QSvAGyOf/iTrJPGOq09ZQzuS0tnMtj4skySnjiHcaR3nUGn0UheGVdwvsnZCF0ItCKn2jTnlKaXwdNc9/VqTW61FfNvx00sfZsXEsyBGMsvoUoXER2gQPEH2DuYGddOKWKEjqayKrNzdaBBQuxr1vuKesCSy3FGoLosFiVvxS2fsIyDbzkvmStH2uoKEdjVQbE+Ays1UOlo+IAfWBailptj71N32KIqjQQ3pwZmlJ/8xWdvOIQW7FKtH4M6vTd5JtqTrFk
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36756003)(2906002)(8676002)(83380400001)(7696005)(9786002)(82740400003)(82310400003)(966005)(8936002)(7636003)(356005)(316002)(36906005)(6916009)(107886003)(5660300002)(426003)(86362001)(478600001)(44832011)(70206006)(336012)(186003)(4326008)(47076005)(70586007)(2616005)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 00:18:56.6259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf73cf19-24a3-4611-6b30-08d8be6b4eea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4056
Received-SPF: pass client-ip=40.107.92.82; envelope-from=komlodi@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgari@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property is used to control the security of the following interfaces
on MicroBlaze:
M_AXI_DP - data interface
M_AXI_IP - instruction interface
M_AXI_DC - dcache interface
M_AXI_IC - icache interface

It works by enabling or disabling the use of the non_secure[3:0] signals.

Interfaces and their corresponding values are taken from:
https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug984-vivado-microblaze-ref.pdf
page 153.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 target/microblaze/cpu.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 target/microblaze/cpu.h | 11 +++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index c8e754c..accfb23 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -98,6 +98,38 @@ static bool mb_cpu_has_work(CPUState *cs)
 }
 
 #ifndef CONFIG_USER_ONLY
+static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_DP_MASK;
+
+    cpu->ns_axi_dp = level & en;
+}
+
+static void mb_cpu_ns_axi_ip(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_IP_MASK;
+
+    cpu->ns_axi_ip = level & en;
+}
+
+static void mb_cpu_ns_axi_dc(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_DC_MASK;
+
+    cpu->ns_axi_dc = level & en;
+}
+
+static void mb_cpu_ns_axi_ic(void *opaque, int irq, int level)
+{
+    MicroBlazeCPU *cpu = opaque;
+    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_IC_MASK;
+
+    cpu->ns_axi_ic = level & en;
+}
+
 static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -248,6 +280,10 @@ static void mb_cpu_initfn(Object *obj)
 #ifndef CONFIG_USER_ONLY
     /* Inbound IRQ and FIR lines */
     qdev_init_gpio_in(DEVICE(cpu), microblaze_cpu_set_irq, 2);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dp, "ns_axi_dp", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ip, "ns_axi_ip", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dc, "ns_axi_dc", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ic, "ns_axi_ic", 1);
 #endif
 }
 
@@ -277,6 +313,16 @@ static Property mb_properties[] = {
     DEFINE_PROP_BOOL("use-msr-instr", MicroBlazeCPU, cfg.use_msr_instr, true),
     DEFINE_PROP_BOOL("use-pcmp-instr", MicroBlazeCPU, cfg.use_pcmp_instr, true),
     DEFINE_PROP_BOOL("use-mmu", MicroBlazeCPU, cfg.use_mmu, true),
+    /*
+     * use-non-secure enables/disables the use of the non_secure[3:0] signals.
+     * It is a bitfield where 1 = non-secure for the following bits and their
+     * corresponding interfaces:
+     * 0x1 - M_AXI_DP
+     * 0x2 - M_AXI_IP
+     * 0x4 - M_AXI_DC
+     * 0x8 - M_AXI_IC
+     */
+    DEFINE_PROP_UINT8("use-non-secure", MicroBlazeCPU, cfg.use_non_secure, 0),
     DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_writeback,
                      false),
     DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index c1c2641..199cfb0 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -233,6 +233,12 @@ typedef struct CPUMBState CPUMBState;
 
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
+/* use-non-secure property masks */
+#define USE_NON_SECURE_M_AXI_DP_MASK 0x1
+#define USE_NON_SECURE_M_AXI_IP_MASK 0x2
+#define USE_NON_SECURE_M_AXI_DC_MASK 0x4
+#define USE_NON_SECURE_M_AXI_IC_MASK 0x8
+
 struct CPUMBState {
     uint32_t bvalue;   /* TCG temporary, only valid during a TB */
     uint32_t btarget;  /* Full resolved branch destination */
@@ -316,6 +322,7 @@ typedef struct {
     bool use_msr_instr;
     bool use_pcmp_instr;
     bool use_mmu;
+    uint8_t use_non_secure;
     bool dcache_writeback;
     bool endi;
     bool dopb_bus_exception;
@@ -337,6 +344,10 @@ struct MicroBlazeCPU {
     CPUState parent_obj;
 
     /*< public >*/
+    bool ns_axi_dp;
+    bool ns_axi_ip;
+    bool ns_axi_dc;
+    bool ns_axi_ic;
 
     CPUNegativeOffsetState neg;
     CPUMBState env;
-- 
2.7.4


