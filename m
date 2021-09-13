Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D76408ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:35:58 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPm7p-00064R-Aq
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mPldf-00037W-SU; Mon, 13 Sep 2021 09:04:50 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:47175 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mPldb-0000Zb-J4; Mon, 13 Sep 2021 09:04:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNRoEN95cBvOxBwFUFy0Nf5O3RS54hH1hPqjBcdeAb4tcS+Htnt/znzdW6EcqPeKkLNz+BWUSNATkCbFrDPsAWtakf3iKybMo0UhsZp8pVeycW6dB8uXj09/0hDEn5cXeW26o2E+q9lXa7HqWwGsV5eGAtdXDPOyiCpX8iO9FSPU+n2RcaVrZovmw3QqFKn34jkZdiH80WVW/TFG7WK11Pjev5Qeir2C7TLtOsLODpdwnndDuGg7BlsYysxj8HPgZvH3X/ZbaX8jjDaJ8J2BcekE53H3KkSBjYqWHVCxUdqUcxEIrZK4UIw3/9VdwPjwl9e92PJkWqoLi/67QNDLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IuPbd47+fSBTLRzL7+MrpfDoiwd1/XGKtWA8TR8W1qg=;
 b=nzCOMgnnERmlt5Rtijt2UKG9ljGWN40uBKHLS0biBsROQb6RANesjU++D78C/hziJHhvuOiwR3zwUruxBxJrqZKAjxZ5gMh8N/h9IKcaYaV0/yNamfkN5ek+stessUeJeIdvkvcTEuFfp/UAmgqru9SN0PjxSr/qnSu0TXaGxdDd2fu/QFyPn2XQX39AZl4HS7KZEobv3S0Digo1ckoMbPuNWluBTNIaiC1bIm//maeAI5FtKQ7vI2wpVDwCFyYKuyBRr7TnjiLXnw0OROmvdHoloKtvP+16x+xMod5Ogy/K7McSpKN0NXHpURW47gga+ikmEYO+5os+TbTZMc+yLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zeiss.onmicrosoft.com; 
 s=selector2-zeiss-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuPbd47+fSBTLRzL7+MrpfDoiwd1/XGKtWA8TR8W1qg=;
 b=qRqhrR0LXL9lRXoVHQuYN3lLC89SiBNHCw3o8Dh40lJqsj3kccqXWNB1nko5do/8p3Sy8b/aD6b/5Ummh6DFuB33SviIiNb9iTP3JAyrtqYuH5dVNcoGPpcMKoqtPGq6mu5xSVgI1ZxdFNlaxRf4t4MSS8HtHW9A4u9Yl4f8g8M=
Received: from FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10)
 by AM9P190MB1585.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:3b6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 13:04:34 +0000
Received: from VE1EUR01FT041.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::2e) by FR0P281CA0071.outlook.office365.com
 (2603:10a6:d10:49::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9 via Frontend
 Transport; Mon, 13 Sep 2021 13:04:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.6.20)
 smtp.mailfrom=zeiss.com; euphon.net; dkim=none (message not signed)
 header.d=none;euphon.net; dmarc=bestguesspass action=none
 header.from=zeiss.com;
Received-SPF: Pass (protection.outlook.com: domain of zeiss.com designates
 13.93.6.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.6.20; helo=gag02r02vm101.zeiss.org;
Received: from gag02r02vm101.zeiss.org (13.93.6.20) by
 VE1EUR01FT041.mail.protection.outlook.com (10.152.3.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 13:04:33 +0000
Received: from gag02r02vm079.cznet.zeiss.org (10.27.68.68) by
 gag02r02vm101.zeiss.org (10.27.70.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 13 Sep 2021 15:04:25 +0200
Received: from localhost (10.190.40.145) by gag02r02vm079.cznet.zeiss.org
 (10.27.68.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 15:04:24 +0200
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh.ext@zeiss.com>
To: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 <qemu-block@nongnu.org>
Subject: [PATCH v2] vmdk: allow specification of tools version
Date: Mon, 13 Sep 2021 15:04:19 +0200
Message-ID: <20210913130419.13241-1-thomas.weissschuh.ext@zeiss.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.190.40.145]
X-ClientProxiedBy: gag02r02vm080.cznet.zeiss.org (10.27.68.69) To
 gag02r02vm079.cznet.zeiss.org (10.27.68.68)
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[13.93.6.20];
 domain=gag02r02vm101.zeiss.org
X-MS-Exchange-ExternalOriginalInternetSender: ip=[13.93.6.20];
 domain=gag02r02vm101.zeiss.org
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cda67ac-6b2e-4ac9-aaf0-08d976b70850
X-MS-TrafficTypeDiagnostic: AM9P190MB1585:
X-Microsoft-Antispam-PRVS: <AM9P190MB15852D41A2D76A9FE996AFE9B8D99@AM9P190MB1585.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKOwoQGRkamdSN4kKlUD9+iK34dAIXuTzCi28XGjOP+UQxOQugISFzhYPzuR6AyVTZx9rbCpwQM1fC9/jFHOecKffpzJKwF69ORS0ya5Dd/9E2A2pQxGxhN5HeUWCSG/3ggJmeoOWkms/Rq33/s+7DHIjuNnBdBG0aPnTzjV0c7HmLLHaMcNviA3BWMwuaWpGy2gVEZuZkke6SIZVO0o3lef3+L5F4HMSr5Sx/zV9GgsfyKvNggYrI/hRObprgo7wFUJLFxFa2DJNjD8DkzzrNDF8o5xxZLLwc7VhOLWcewAfI5AnZeH+U5Am0huIeUBO9GjU3ppdXwkjjtlvlwEYhEOSRhQUhJ2aucp59P5QkKCIO5jjf6/3UmYfRzV+dKo/Q1J6sUN4H9XspBwNBSqeBO84K/FlIz7CgumTd/dA241J8FP3co5RdTh3/MLXlr2ZkcE7EebY4QC1EY7fCmKzyic/7Mh7B1yZaqPNblOd5UH0JqWXYkEuOTJiJH9ru/esJIZNkXVHyAt8+cM7jZX5s3c/PfdyUPLwRlw8+FCT/doI1DqljpxDvWq+O2lepjZmzzkjVXcrDG3op2r1sHaFh3fdIJyu/RJshhCqtsH2KYeYY7Yxvg7RSY1DVhvHBJl8WhiNZmicGl+RmPxh+jRjADKz7WkXjpWzfa1sZbvicgjzc+FB+n+p0SWb1wfS6q5iWj/t2N7MyoZ9G6dIQuRFTTOEnfl9Ag0qpUMpsT1aziQA3tiSEosqC7l7+AMzMr2W9XeO1cL5jm73/E+tSegzTkUxAvJ3btz3AhwcPuteYItUhQ1m5oHqiCfKX0ApM0BBY70NmowfGiKvsvn9o6p+bLXT9ux2y4hxCMniEP1CMp2klVN14ljYY3UXu9c0hCu
X-Forefront-Antispam-Report: CIP:13.93.6.20; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:gag02r02vm101.zeiss.org; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(16526019)(8676002)(186003)(70586007)(70206006)(336012)(26005)(66574015)(2616005)(6666004)(81166007)(2906002)(36860700001)(103116003)(36756003)(5660300002)(316002)(966005)(110136005)(54906003)(4326008)(508600001)(8936002)(1076003)(356005)(86362001)(47076005)(82310400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: zeiss.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 13:04:33.9223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cda67ac-6b2e-4ac9-aaf0-08d976b70850
X-MS-Exchange-CrossTenant-Id: 28042244-bb51-4cd6-8034-7776fa3703e8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=28042244-bb51-4cd6-8034-7776fa3703e8; Ip=[13.93.6.20];
 Helo=[gag02r02vm101.zeiss.org]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1585
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=thomas.weissschuh.ext@zeiss.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh.ext@zeiss.com>,
 thomas@t-8ch.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VMDK files support an attribute that represents the version of the guest
tools that are installed on the disk.
This attribute is used by vSphere before a machine has been started to
determine if the VM has the guest tools installed.
This is important when configuring "Operating system customizations" in
vSphere, as it checks for the presence of the guest tools before
allowing those customizations.
Thus when the VM has not yet booted normally it would be impossible to
customize it, therefore preventing a customized first-boot.

The attribute should not hurt on disks that do not have the guest tools
installed and indeed the VMware tools also unconditionally add this
attribute.
(Defaulting to the value "2147483647", as is done in this patch)

Signed-off-by: Thomas Weißschuh <thomas.weissschuh.ext@zeiss.com>
---

v1: https://lore.kernel.org/qemu-devel/20210908174250.12946-1-thomas.weissschuh.ext@zeiss.com/

v1 -> v2:
* Expand QAPI docs (Eric Blake)

 block/vmdk.c         | 24 ++++++++++++++++++++----
 qapi/block-core.json |  3 +++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 4499f136bd..93ef6426b0 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -60,6 +60,7 @@
 #define VMDK_ZEROED  (-3)
 
 #define BLOCK_OPT_ZEROED_GRAIN "zeroed_grain"
+#define BLOCK_OPT_TOOLSVERSION "toolsversion"
 
 typedef struct {
     uint32_t version;
@@ -2344,6 +2345,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
                                           BlockdevVmdkAdapterType adapter_type,
                                           const char *backing_file,
                                           const char *hw_version,
+                                          const char *toolsversion,
                                           bool compat6,
                                           bool zeroed_grain,
                                           vmdk_create_extent_fn extent_fn,
@@ -2384,7 +2386,8 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
         "ddb.geometry.cylinders = \"%" PRId64 "\"\n"
         "ddb.geometry.heads = \"%" PRIu32 "\"\n"
         "ddb.geometry.sectors = \"63\"\n"
-        "ddb.adapterType = \"%s\"\n";
+        "ddb.adapterType = \"%s\"\n"
+        "ddb.toolsVersion = \"%s\"\n";
 
     ext_desc_lines = g_string_new(NULL);
 
@@ -2401,6 +2404,9 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
     if (!hw_version) {
         hw_version = "4";
     }
+    if (!toolsversion) {
+        toolsversion = "2147483647";
+    }
 
     if (adapter_type != BLOCKDEV_VMDK_ADAPTER_TYPE_IDE) {
         /* that's the number of heads with which vmware operates when
@@ -2525,7 +2531,8 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
                            size /
                                (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE),
                            number_heads,
-                           BlockdevVmdkAdapterType_str(adapter_type));
+                           BlockdevVmdkAdapterType_str(adapter_type),
+                           toolsversion);
     desc_len = strlen(desc);
     /* the descriptor offset = 0x200 */
     if (!split && !flat) {
@@ -2617,6 +2624,7 @@ static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
     BlockdevVmdkAdapterType adapter_type_enum;
     char *backing_file = NULL;
     char *hw_version = NULL;
+    char *toolsversion = NULL;
     char *fmt = NULL;
     BlockdevVmdkSubformat subformat;
     int ret = 0;
@@ -2649,6 +2657,7 @@ static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
     adapter_type = qemu_opt_get_del(opts, BLOCK_OPT_ADAPTER_TYPE);
     backing_file = qemu_opt_get_del(opts, BLOCK_OPT_BACKING_FILE);
     hw_version = qemu_opt_get_del(opts, BLOCK_OPT_HWVERSION);
+    toolsversion = qemu_opt_get_del(opts, BLOCK_OPT_TOOLSVERSION);
     compat6 = qemu_opt_get_bool_del(opts, BLOCK_OPT_COMPAT6, false);
     if (strcmp(hw_version, "undefined") == 0) {
         g_free(hw_version);
@@ -2692,14 +2701,15 @@ static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
         .opts = opts,
     };
     ret = vmdk_co_do_create(total_size, subformat, adapter_type_enum,
-                            backing_file, hw_version, compat6, zeroed_grain,
-                            vmdk_co_create_opts_cb, &data, errp);
+                            backing_file, hw_version, toolsversion, compat6,
+                            zeroed_grain, vmdk_co_create_opts_cb, &data, errp);
 
 exit:
     g_free(backing_fmt);
     g_free(adapter_type);
     g_free(backing_file);
     g_free(hw_version);
+    g_free(toolsversion);
     g_free(fmt);
     g_free(desc);
     g_free(path);
@@ -2782,6 +2792,7 @@ static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
                             opts->adapter_type,
                             opts->backing_file,
                             opts->hwversion,
+                            opts->toolsversion,
                             false,
                             opts->zeroed_grain,
                             vmdk_co_create_cb,
@@ -3031,6 +3042,11 @@ static QemuOptsList vmdk_create_opts = {
             .help = "VMDK hardware version",
             .def_value_str = "undefined"
         },
+        {
+            .name = BLOCK_OPT_TOOLSVERSION,
+            .type = QEMU_OPT_STRING,
+            .help = "VMware guest tools version",
+        },
         {
             .name = BLOCK_OPT_SUBFMT,
             .type = QEMU_OPT_STRING,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index c8ce1d9d5d..42431f52d0 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4597,6 +4597,8 @@
 # @adapter-type: The adapter type used to fill in the descriptor. Default: ide.
 # @hwversion: Hardware version. The meaningful options are "4" or "6".
 #             Default: "4".
+# @toolsversion: VMware guest tools version.
+                 Default: "2147483647" (Since 6.2)
 # @zeroed-grain: Whether to enable zeroed-grain feature for sparse subformats.
 #                Default: false.
 #
@@ -4610,6 +4612,7 @@
             '*backing-file':    'str',
             '*adapter-type':    'BlockdevVmdkAdapterType',
             '*hwversion':       'str',
+            '*toolsversion':    'str',
             '*zeroed-grain':    'bool' } }
 
 
-- 
2.17.1


