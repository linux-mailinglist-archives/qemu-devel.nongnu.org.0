Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DF40403F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:45:43 +0200 (CEST)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO4Rx-00006p-SS
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mO1bV-00029z-Fg; Wed, 08 Sep 2021 13:43:22 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:1541 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mO1bQ-0003s4-Gd; Wed, 08 Sep 2021 13:43:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9Zfv5L5ufDLnXQQUsSVjzojTQcfqjdM0ckUgPH3Njf/hVAd6z6rHqx75hs0UW27RsnxbAryYUmEM4B2Y9SUK5T6Ef/iKl051XCNYNEm4yclNUlQ8LKed7kfUHVraJiIQCo15tL9IP7vtmrO+pcBUKnT8n+Lcv4jC77j8925ps1OGcrjTPmh/+C0Jtj6xdi3abS9GEV80S826EjjAKAADNzmsqZg0LD02UeszzggBmZ+yVc6aOV6/ms/WSQvUi6euvTtE32dan2SIYBwbt5nQrzinhTdI515FymkdM1yV7MraOpgX/Q1IGTHqRs7bQhms57ND6S+uieqS0PWNpSb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=aTfWFPAlgK1LbcQwLLCXR9jUiVRZ5x0XgItACT1+F0k=;
 b=lmqOYwjAhqqMnf55dpbUeIRN56JDwl+DFZjNMEgFaHlPpxoY5G6zuxXYZFWUkR8QnxIhgaePZ/SyeSwFni7oPI6AVbM8u2c+X7v/nIK1Z3PDyieuqZBDmyqx0gmMrREYHM8BYy5s1I5gEPqZ4d160uB3QUh/pZPL/y7zTrwwsTQ/pp9fqOlPg+OVv9UT31IFoPP4C9UppqjAB3YZM3/cDMeB7y9m2elzN0rR6X3n/7PD/DZrbr5xwHeRbkyUUo+4aVW7rYODV/18RSu7efxA9ja5wDwlheFrxmk/4mBCZREdRc+JaHGMBrqx/G5gWDMJM9nhZmiW/8BNKCj2rbG/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zeiss.onmicrosoft.com; 
 s=selector2-zeiss-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTfWFPAlgK1LbcQwLLCXR9jUiVRZ5x0XgItACT1+F0k=;
 b=TbI17dFPhHqxMii6fUNx5Ym91MK5mVNu64KCXwxtIcwzHIJ1K6EPGfBoJQMNRCbUCdHsSWb+dNcTMCKJtzFRkgxbFfuGKWKjjJ5d7i5+ZoR3uRCjsLybXKqZ8gpEDABalxFolV/EHjqJudmA2vkAMoTbBKksEJMSGPrV+//peOI=
Received: from AS8PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:20b:310::27)
 by VI1P190MB0159.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 17:43:08 +0000
Received: from VE1EUR01FT036.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::73) by AS8PR04CA0022.outlook.office365.com
 (2603:10a6:20b:310::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 17:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.6.20)
 smtp.mailfrom=zeiss.com; euphon.net; dkim=none (message not signed)
 header.d=none;euphon.net; dmarc=bestguesspass action=none
 header.from=zeiss.com;
Received-SPF: Pass (protection.outlook.com: domain of zeiss.com designates
 13.93.6.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.6.20; helo=gag02r02vm101.zeiss.org;
Received: from gag02r02vm101.zeiss.org (13.93.6.20) by
 VE1EUR01FT036.mail.protection.outlook.com (10.152.3.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 17:43:08 +0000
Received: from gag02r02vm079.cznet.zeiss.org (10.27.68.68) by
 gag02r02vm101.zeiss.org (10.27.70.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 8 Sep 2021 19:43:07 +0200
Received: from localhost (10.190.40.145) by gag02r02vm079.cznet.zeiss.org
 (10.27.68.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 19:43:06 +0200
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh.ext@zeiss.com>
To: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 <famz@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, <qemu-block@nongnu.org>
Subject: [PATCH] vmdk: allow specification of tools version
Date: Wed, 8 Sep 2021 19:42:50 +0200
Message-ID: <20210908174250.12946-1-thomas.weissschuh.ext@zeiss.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9ce2737c-f242-4645-7514-08d972f01ed6
X-MS-TrafficTypeDiagnostic: VI1P190MB0159:
X-Microsoft-Antispam-PRVS: <VI1P190MB01593E22712E8ACAC64913BAB8D49@VI1P190MB0159.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbrZazpCdUSXNs1NVyNueaxUbOjTWyiFD224vmWN11LcPzkYg3ww70mxqBd7D/WQkz+JF2QHYco7rJcTLkkAb4UC4wepBwNKGZFqIAaU6TdID5nwujEDFjcp8qvEUuhHJcbpYYIEQn4SmIH7JXZnVjRwsQqXCMwRgXLIi2G8t4h84TrYUue61cmufWGBvBjTWg3rtMbHm2aNXrZ5nKhF9RIXx2NFNh0EU112jV5reKSdLgP6UyyYCXV9MSI+YXKnt96SEMM1b9PWqU+p2OBWR4uUswiNjrxtDuyD0hAYs/Za7zShP84ZAF1qoNDCnbWux6+zP/C0VX4E3FPt7eRR7LzLhY6KgQLPELXF431un/OPtTFdqsSiC2LGq7+5wC1i5XrdhVPi8IrNnuIqT94+kqUV5H6RsXpsrixT2mKlyxfu8hAt0RcGM1GbCMOzQHBs9hsK8uKxQ0KedGYGjERhzqdG8t80zNeBgHg2EjP2fcu8ZAiGL9mNfAttuB1jfK3F5OCEQXnAhHPwzikDt+pT8J5y8xYdn2kE5uUz2zAFKNubOzqccKQTzTwxcJ1aXLQNm82ca0RMlv01ppWYPzo2GsL8w0XjG16UTEmoSiQJYbir5eLeuxVKbiWiBVaxYJqRUjbxX9JPcb9SpuUdSfehgrKxL8kOtd6xNj/hsTKSSTRyeUj27Nxmm7lfFanOjmQqif0N5CquG1DYAj+bT6o+hq8wYuHbur5+T+TmZGc5r4I+e6SvCiOK/HsdrYSEz8hmyt6darNkLtS9aW8GAgctilPflLnpplNl8Q3feNueocI=
X-Forefront-Antispam-Report: CIP:13.93.6.20; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:gag02r02vm101.zeiss.org; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(82740400003)(8676002)(47076005)(54906003)(316002)(26005)(83380400001)(103116003)(66574015)(356005)(6666004)(2616005)(86362001)(5660300002)(110136005)(2906002)(82310400003)(8936002)(81166007)(16526019)(70586007)(36756003)(336012)(186003)(1076003)(36860700001)(70206006)(478600001)(4326008)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: zeiss.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 17:43:08.3655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce2737c-f242-4645-7514-08d972f01ed6
X-MS-Exchange-CrossTenant-Id: 28042244-bb51-4cd6-8034-7776fa3703e8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=28042244-bb51-4cd6-8034-7776fa3703e8; Ip=[13.93.6.20];
 Helo=[gag02r02vm101.zeiss.org]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT036.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0159
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=thomas.weissschuh.ext@zeiss.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) AC_FROM_MANY_DOTS=2.866, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Sep 2021 16:44:14 -0400
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
 block/vmdk.c         | 24 ++++++++++++++++++++----
 qapi/block-core.json |  2 ++
 2 files changed, 22 insertions(+), 4 deletions(-)

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
index c8ce1d9d5d..b530d4a333 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4597,6 +4597,7 @@
 # @adapter-type: The adapter type used to fill in the descriptor. Default: ide.
 # @hwversion: Hardware version. The meaningful options are "4" or "6".
 #             Default: "4".
+# @toolsversion: VMware guest tools version.
 # @zeroed-grain: Whether to enable zeroed-grain feature for sparse subformats.
 #                Default: false.
 #
@@ -4610,6 +4611,7 @@
             '*backing-file':    'str',
             '*adapter-type':    'BlockdevVmdkAdapterType',
             '*hwversion':       'str',
+            '*toolsversion':    'str',
             '*zeroed-grain':    'bool' } }
 
 
-- 
2.17.1


