Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ABE2F9516
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:20:02 +0100 (CET)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1EWn-0007xs-AW
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETZ-0005PP-Ss
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:42 -0500
Received: from mail-bn8nam11on2111.outbound.protection.outlook.com
 ([40.107.236.111]:47904 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETY-0005QN-EQ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZxRU1Z1rGGpsdEfe33fgXvyiUzh2McE0kbAl+JN2mXhjuF+0nKalFLpOMxGQCyfm8V9iBKw+ijjd8shn91MW9ANHHbMKRIse3jgIedRHEM0PyKbhTMlUP06u4BsiSU10UIVfxznoTPaWcSY9ZytiqLHkj6Vrtb6L4zkzc7Y73OyUxT4JIWx1sbIj96JqRhw07r+EJ4QXDCAuP3uSF3ORNT+LYvwGbZpgrI877qezxuPXvVksE+AoMRysYIA+jXRxyN+L+SYUNzYP9iWbMLy4VqeDd1SiVyoGw3zQJ+/jeArFWNotKFguw1Sbzn9JV0tqLVk1AqdAmY6gXPP+OGKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5ioGiInnNBgt1imAUI9ecWXGCzDfLKnZkvyysjLQLU=;
 b=NuadXOH5eKvnrIH7+zHNDaYi+VqxNDpHYWv0LnMwvrGuF5lmC7WqqcXFJEQl+xyHS6iENUPIPnRnyLzIoQr6HhmWYYyzuIjhKm4GtIeD6bp48gVfPiwSRzQAM744fuupoOM28yVKxFS02Rc07dD18TDIOfmYUF/3q+xRVc0ysTMOn0e6BZSylLrOHfoKnC1Oj3zihk69oYifaBWsgskXE6FuwpD45xOkq+3DBq1qqnEGkITJe8ppr2AtlrHrZ1KGHbuMcP2wL4gud4civndmu52tzQ0XjeUQqDiLlFA+JPu92PCk1QvMyXwXtf3OhvUd3r1Hel3SoRgH6lwqOdjmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5ioGiInnNBgt1imAUI9ecWXGCzDfLKnZkvyysjLQLU=;
 b=MRD4JDtIwrcM/GMGW+TKTUt+HnAbDJ03NZR7X5ADlzGcWstAJql+WNQaUKCZ+GTj1DzuEc8gEdG2m+ObgJf/6N6ZaV0WiDXsfBdI2ZtJ39rBV2LMPZhSmND6P5/kI/QLsjJYtoXx9e+sDuscWhe/GPQ1mZK1kq5vOzYDPvHj9Lc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:16:16 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:16:16 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] fuzz: add virtio-9p configurations for fuzzing
Date: Sun, 17 Jan 2021 15:15:53 -0500
Message-Id: <20210117201553.279266-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117201553.279266-1-alxndr@bu.edu>
References: <20210117201553.279266-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR19CA0011.namprd19.prod.outlook.com
 (2603:10b6:208:178::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR19CA0011.namprd19.prod.outlook.com (2603:10b6:208:178::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Sun, 17 Jan 2021 20:16:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb49aab-a7cf-42f9-eeed-08d8bb24be38
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB585231519C7E499AA1EC7AC1BAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlgzXhoJhu0gTYGSjgI/x8WQD8/ZyvYpsRwL2dBP5SAAPaSZY14k/nl8CN+Kozvn92lpJgKEsT4ggSsBbnTicYiorGmUzal3sIbeOYHEr75daN1ULyL6HAHP/uT2ojgacqHCKT6SDB7563zVlvrjJ+1D63cpvFVap/WJAFLgTz0CEXY1Zi4Xg+jHBaD39I2pjZFbGu3LdjcdDRXVGDkYphPmhnlM5NTBfDNfNPhH9syXAVEbyCW/ML+tUNEvCbZdy20+B580QAc+gYXOCCyZ+2TM6/T5e08AdrARA+7d3kDDfwh3t9WDu6kbjnS6LkdErFac5HN3vZQXIavTXxnZ7Gnk65NlBuRHsGFMnM6vqW+244/8A4huSI39ujK4QgqVNqlW6EUYf+kr+J1qKV7CfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(86362001)(54906003)(36756003)(478600001)(66476007)(6916009)(6512007)(66556008)(66946007)(2616005)(4326008)(8676002)(83380400001)(956004)(6666004)(186003)(316002)(16526019)(26005)(52116002)(786003)(6486002)(8936002)(6506007)(5660300002)(2906002)(75432002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aB/kLJ2TUbXhjLMNGgANFe4yEJZxdx3ICioAQakT0U3fCRc/584CmNFloUQs?=
 =?us-ascii?Q?TXVSB30nKvVhi7INwP1742vmHdtneNYVi/doBxQI2irwEH/iqbmv77jXMdIa?=
 =?us-ascii?Q?vBUQSP64Yy+16DOolsNKoCnodp2+mmPIj32138mTN/eR1goY1mFNGKCiGQGP?=
 =?us-ascii?Q?96EEor9So8687TAx5jf09RRX4ykTQk+KDlHu4F0sEQ6lfUrKx955W3AQy9i0?=
 =?us-ascii?Q?n80EdJBBa/tdeuLb1uZb7zXnGSnB4fDQeR0AEgK3a3Wgd05Crjj1qAEORsEV?=
 =?us-ascii?Q?jL6F/v7L/uiocOCkiCTD/b6ksu2WgVXJCWjY3AE8OSEfNrtNZYDJOguEKnQs?=
 =?us-ascii?Q?2w0LDRzOzV94mnNmmn7upNpNVvmm3kBqySYZ0JHbXFu5df6NY5INh3ke5vAH?=
 =?us-ascii?Q?4GpRJRE/3BcCs0krMgo+VRMQgiA+pAkmoeGf1HYjdNh1xApbUfJdWFLrQAAs?=
 =?us-ascii?Q?ShkL/On/rU/e6OfV8gtR3b5B0V/1mLmzAqJ56mkVyNrO50eYWtjDiuVOyh/e?=
 =?us-ascii?Q?Cb39HtpmsI99rYPl12drguQ+NJKtuPid8mk3huQ28g/8l+NhwSEQsS1wa9AA?=
 =?us-ascii?Q?7YVGpb/npvnwQHu4qpmfbMj1aLt1AmMXa8jhQZhMf5l9Lmd8asfGEOQdIKDK?=
 =?us-ascii?Q?KL42/1bfZ8JgK5IXIjq07YUdBJgVMQ3lIA5U3FdBfJU5vcUywFnLolxB+Dli?=
 =?us-ascii?Q?jOAoE34aJzbzUci1lfzzzoCqGujN9AN/C7VerX7ID4IHA4m7IHnk0nirW8L4?=
 =?us-ascii?Q?pufG1a9VGJyRP/8SabxGifgw2WzdaFicVowvzfB4nAb/YQ1WTlqfA9HqBSMp?=
 =?us-ascii?Q?f3nNa2T3GKp5/6eYtJ9LfdYMT/WpSsyXDq/HD8HZXitKuN1+M2WnrnpSJDbG?=
 =?us-ascii?Q?bVxbH4GeNpI8mmMxeW4WrXBRBH6TD0xFnoIzou9gqDUza6FmJINKp5hlDArw?=
 =?us-ascii?Q?TvU1J1tO32QQja5SIDi1/oIyKrbiGjWEhrXhb04QJUe7jrEuf3BvbUft40PW?=
 =?us-ascii?Q?A+Qq?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb49aab-a7cf-42f9-eeed-08d8bb24be38
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:16:16.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9VjoC4iKbPa62LnpVRlNEC6MIF+hHlKKRb0AsXwiaQlE6w7RC66vOD+JeS8Rq+k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5852
Received-SPF: pass client-ip=40.107.236.111; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While its not used in the real world, this
   driver won't leak wont leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
CC: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: Greg Kurz <groug@kaod.org>

I considered adding an atexit handler to remove the temp directory,
however I am worried that there might be some error that results in a
call to exit(), rather than abort(), which will cause problems for
future fork()-ed fuzzers. I don't think there are such calls in the 9p
code, however there might be something in the APIs used by 9p. As this
code is primarily for ephemeral OSS-Fuzz conainers, this shouldn't be
too much of an issue.

 tests/qtest/fuzz/generic_fuzz_configs.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 1a133655ee..27352c470c 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,15 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=none", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +69,16 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .argfunc = generic_fuzzer_virtio_9p_args,
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.28.0


