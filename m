Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED37302AEA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:58:20 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4747-00054W-7f
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uf-0004R9-WA
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:34 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46ue-0004xv-IC
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wwo5uX3wTs4PJeOAABuyDYa7yvybTtGYDSbok9H1VUQGqlVavdzSdKybmPnSvxN9TeIKicNUq3q+fe33LSU2/DtxaXUblYx9VFQ3Rp71GsFgIAGyBxPGeg1U3XjPLAoM9EccK0c/qUPVVO2Cw9uYtV+znQkqMn2k7wCFNAywiKZL+5GXrWOID0tly5MWOR/NpDD+2moW+8LJ5o6b5fxM8pwYr3IMo1xmwHtV3REDDPaYK4OKN9PIN1CzYKqynxa2Y8p0jicEHjQbZ+2ET30yNgNPbQLiVRybUawkwkQccDqnlV1vPfeGRe6MTAyYei97dB03PebajyFr0Og3CvnIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYxpmhMwfYrRCykPgMQMBMHyt/4lYV22U7Bt7JAlckw=;
 b=O4U/TVvzN0+a1nbDHzOFc8p+20k7B6FN6RidnE2djgqfdUCxt0KWfeywVEXDbgaD6pOxb/x4pc0AEFBxkQi1XEXNhmUfVQ+GnFjjHNY9uAWc+b/QAssXRWtylDLOVjagt4UVmTkzpKs4ef2u0uz39DcMPnQBaWZGDu2h/40v3BktSDtlPiJ1R7YlMF8fjsVxPDWSpxKcV2qGu77O2p9FKaRJxbOd8xjZy22MUxMov2ZS8drp6JCr5ZqBvlNYgVcLWmpinEzxpK0o+NmY2KDm310fOB6QOiyPcNK7rs5fiiYHY1Cs7HNff2n2W5vpxuMKWTPDscPVgXdN17TpmVyaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYxpmhMwfYrRCykPgMQMBMHyt/4lYV22U7Bt7JAlckw=;
 b=D5oIFYgNrp+YVwW0bu8PIHBE87Z1jYTx1hiDiCk9K3qOUjvdGdgsYTfgpf+Gb4qm74z83jMl+Ov1mlL9DRVUav017bnedUXdXNzbRNKxW+FW0KFvSVG2bRFSvYvlKLDdxo/TiIp0XvdJLEP0OvdJK47TbnXTh28DE9g0sybSIKI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:15 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:15 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 7/7] fuzz: add virtio-9p configurations for fuzzing
Date: Mon, 25 Jan 2021 13:47:56 -0500
Message-Id: <20210125184756.319453-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125184756.319453-1-alxndr@bu.edu>
References: <20210125184756.319453-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:48:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8610f7-a879-4d4c-175a-08d8c161c62d
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5563825F827C1C6ABA5DC72CBABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWZ5K6/FE3ToiBsDXoRNWWjh9Wn7q8g4Gt53Tv3/Elo2cS+7UDjn/RAtqlziLBOZu1tE2zciXFe4lR7p3APMDNqy5d9BfLApIvwkNDj39TmvVfLn3oHeiwivR7n4NpGP4C7zlDQP1NJQp+F+8igvbWxFIynPT7Gb6AxacJ0ov1ZOp2TLzcIX0pYS6bXOsxyzeediG8s5mhgaDMZgqcDZH1++mzWeHP4DzYQD3GZKyW8wHxcsS+2ZQwAyJjxPIBG8gAhwTxdecx79y9bcflvW+rW1PJ49RqDbX4ISt4XQtgDVaC2NYwIuiOxpD8sGFDsHwluRr86pkLMiq7hCrB32v2si2WI+KY8vo8UIIKJKslYe0jVLvKmgYD017BKfYpuZhNCXt+UdX0ybogI8L4WhdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UTbnImQNEIxvt4JBs8iMLEbjxi057ks6WbDWhBbkiYd9W+h0s3NkvbQjtwVA?=
 =?us-ascii?Q?MBxkvNG92gQ31A7B912wEkfJ63JEMwCpKtphYt6Cn3Z9x/Hj/JbRkoJm39m0?=
 =?us-ascii?Q?vY+yoINP27YuMJedkp+jRfUla2VxJYKpq9nny1GWZtASFP2ldI4N/Ei6S+B3?=
 =?us-ascii?Q?PkzmvkbBAI9VNm8F0YxA3CijoNxuk3wKTzpwNXkZWLJp22BgnkAiHjmjurtP?=
 =?us-ascii?Q?r9RDJI9/H6dxBeVkDST3h1bI6MunKwC8U0bWeNCAu5tlmYmdTzvrFcBkfUBk?=
 =?us-ascii?Q?OWXfFEw0acdcp87qykhfGEKOH0rgxMjTdXHap0NuX6cbcOuHRqGp7GkorS+P?=
 =?us-ascii?Q?DJCADkRiX49HO6KXXmIJiHTnXTml/ICLKrCKD0AAGyE08/nTHaySRTp6PqRn?=
 =?us-ascii?Q?IHXur4+Oj4AwOzuSWSle6ZBv2BNXijLuSVchxJ2hq6KNmRmpUZEHqkm4VFan?=
 =?us-ascii?Q?z95DsZaQaECe2EOf1XN5PD2JulklBDLmlPlslUDBw6Cj/kJM+lJInWSHTK7S?=
 =?us-ascii?Q?YLcW/JJBhlGWYoXoWhXmU9OdhAFS6BFiDE76MQ50NV61iCRbkqaW8G09l5Un?=
 =?us-ascii?Q?b06z7Qj3SeGt6w1oApb+QF7uWFZuy/fntQjRIc34WrAHT0jVAewaeUwhPZcl?=
 =?us-ascii?Q?/Pr9jzeJzMPLWLwQP9OrpeYsYa7wkrSfKvUIxMSQKwRqPftNG44GBLb4UWZt?=
 =?us-ascii?Q?Nsfd2krAq4Rtz3noHziB7v64qpihrB3TORRHRZq9TrQ87T+mKLtpZS6fyMc/?=
 =?us-ascii?Q?JHOj+iLF+sNViXliAV4+Yrrqyzymy/Rcn+SviJzzwwXGxLNlGSm3dlqH3o8K?=
 =?us-ascii?Q?jGlv/DzRHUmzDjjJB/ZffbIDJPEg2vdxeXy5Sl5GvV1UU/jQLySRGSitMxuT?=
 =?us-ascii?Q?MTxLJB8JuSghsNOifra2L3Xxj/3g2VE/NvSedUfKQEoCVgXyMiEYQqQ64+Nr?=
 =?us-ascii?Q?mtlF0XzsDPVK9g1K8PqyHWZiPetIfVJOT71dgoSRMcMLCeu4T9pTts7Kv7O5?=
 =?us-ascii?Q?wKUdpBFuj/J1Zzj09RaDBRfsFt/F490F1M/ypbdX05FpBIgEHF/Cd/DDOEyZ?=
 =?us-ascii?Q?UCZU0QQs?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8610f7-a879-4d4c-175a-08d8c161c62d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:15.6016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9IuS3vVDT29qD9epZ1vMYNs5wzG9YdMeAUvoO9/ZllaEAfS7Dcf2jvAZp56v6CJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.237.112; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 philmd@redhat.com, Darren Kenny <darren.kenny@oracle.com>,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210117230924.449676-4-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 51e69c6e42..5d599765c4 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
+    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
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


