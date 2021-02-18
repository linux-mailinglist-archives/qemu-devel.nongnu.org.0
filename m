Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884B31F197
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:20:06 +0100 (CET)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqiT-00071c-IP
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqc2-0004F1-C7
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:13:26 -0500
Received: from mail-eopbgr700103.outbound.protection.outlook.com
 ([40.107.70.103]:36705 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqc0-0004Dv-0m
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:13:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjN0vAdni3Bigl7FfS+syHj+Jc2Cw3qgSbrRkFoFpFPVXLU9ftu7aDOAmA9KilYghraJeBU3C5DCnKrdBd/X8SIZhj1TUpFfg4pNladk+WTAtss7Qsx5BxS+xeb27JHOaFwXDm3nSmU30Pb/Q+aHHcspoXIALu76tLB4sbdVJznC3JCFpl+6ievu9aHh0+nM8MZSoc6Bc6SFRTh+/lOWrf3QCvJ66Or7l3wbxW7LlLMDKzgn1kfumRttNgJo/NZE26XhCgePfmo2QN4vujdBpGgRl6OBcwos9sAtbQpV/amdYUyJAHskhXUOv+DUUeFdP8w5PZMaV+2w7vwSJtT1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alcAraIdsXFjnHNOVKw0DDGR5sBEWzDdVq0BRIMrAiE=;
 b=HcRqJoX92NLA0xzkUJSqktBetj3KJ5bZd1ypN2l1gnLrapNrSo0YHG4/CuITclNupTCkA60/pqkx2Pz3EaSD7HMS0oQJ/V4WSfUxpiSeLItcplEMdsz/r7N+aOzUlKWa8RHmevImgbciDN66b472jztUVzzVvoz9QQ8k3ttYkUrUDQFxseGE5TfH0dJcB02c3djJMxHdJ6m5J9E5ype6u6cxF6/zM6KHhM6bHYoawpPZwTf9BAQptsCwWp61dOkSOyvIdocNzhccEHd3/D2/ic4R4/jAFNXE+52lj7Eh68Qlv2sG8mKbLhC/PehsPHNLLHjCrmUe+p9ce4K1yeRYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alcAraIdsXFjnHNOVKw0DDGR5sBEWzDdVq0BRIMrAiE=;
 b=NMiIIIZBJmJPz4hZPncUd2S+h2t1Qf/XDuH5b/jXeOFS99+n0PDAqcDvpgAXSOGSNu/NT5KfFswo8s0dEPCoowjYZAW27/m8J75beFc5qB3ath0RXJtNHCtJbVpa74oU3XbXAyFbFj4sSg/owwTVH0jo3oe3osnx+jNm4exJPdY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 21:12:41 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 21:12:41 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] tests: add another sdhci reproducer
Date: Thu, 18 Feb 2021 16:12:22 -0500
Message-Id: <20210218211224.2513413-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210218211224.2513413-1-alxndr@bu.edu>
References: <20210218211224.2513413-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:207:3d::43) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR02CA0066.namprd02.prod.outlook.com (2603:10b6:207:3d::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Thu, 18 Feb 2021 21:12:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37ef59a5-1662-4c60-b26a-08d8d451ed47
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57243D3680C38C21A9193833BA859@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cb8TO55jxCVuytOX6zERzjJAZns6DutlO1A/yja2a01vDEQuK2V5OyszxF5IEJjIrjXjDSebgK2aq5UyZqVrha9tx8CEXmVXeLLxl7xCDtK1sLAbMlIkhCnDLLXBldNMyEy3Ql9lO3OPKzOdX6kpSoRkxlX2nnBQR5tHidOcttbPPyAzyPCHGDw/usIkUHbBbK7xBgSqc69bIxdh82swiOT7/ecIj8l8NHgwGV/ZTppkWIp54gh2AciFBu5hlyxR707Qp/sLXIZ+50D1NaUTAPjg4lHx5tHjqDckJO4HeG1fo4jvgNerrHbgclc7rZLjjTp+9mcqzGAXQV9k0V/bLAbV2IR2jl7jEXS2CB5Zkp/3zJ6Nfd8anNxQ+AXyKq0nz7xtFa/Bq0fThXdAEO7WS18GwHHAGCjqm3BOdwEjCVWeLkfp0bicxdIFe9ZeH+z/wQP/NOGhlGW44tNbQIDYwFGtW/dkw+WT26OrP358jO6A1GtLwOwkBlyU6oak9K5tiLinBQPMokhtlI8iomHpq00autbPH3UT/j9qXa1RcZ3t1slp0OM3qZpv6qbSnzch
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(6916009)(54906003)(2906002)(316002)(66476007)(52116002)(86362001)(16526019)(83380400001)(6486002)(1076003)(956004)(966005)(6506007)(186003)(66946007)(478600001)(786003)(75432002)(30864003)(6512007)(2616005)(6666004)(8676002)(8936002)(5660300002)(66556008)(4326008)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W6r8/xTBjVlbPoH8J/6eRHfaaF2AX0koYQANCOXrUX8vsxjFYpkkpDcqz0jQ?=
 =?us-ascii?Q?y+pXKWkabfBuPQciKSyh5rxDnSBOe3iBrZWmxw+lNQ0EWUl4kiaumW6lNn9x?=
 =?us-ascii?Q?OytC+SpVaBkstnxChE2A0fUq00uv7pEbMaunh4SG0uyzbKMZioeFQlCmO0fx?=
 =?us-ascii?Q?5/xSzRqUqXXvSEXV9JZZ2MTYpzXwC/eqqG8BGB08aiP8mr930J5k9m6HerU9?=
 =?us-ascii?Q?wgu/LvjJ63YlPoEbLuKRwNFoRZwB37sbkn/x9IXf/Hdffdn/GEZKAWH8guWM?=
 =?us-ascii?Q?axh6pxZUnWmqwRC/Yn8sihaLJI+dd56HI8RZsRBNyMdfvciBhHHEnyeV+gQ2?=
 =?us-ascii?Q?LwohIRlB2aw/eRctu2DyoxVEBPv6UE6KojrGHSOTsQbMU6tox7rU3rrmfvRr?=
 =?us-ascii?Q?mbkzL3i+wq57EKPjhn4cdux3su8/h3H0hJGxul5DfiYFdx4lcf9AunEAttdE?=
 =?us-ascii?Q?dRG4J+dqSQSRCm2dPttQYv2yvsTRyS/ToXTHl4x7KAV2kSTNY/qImh93OV8H?=
 =?us-ascii?Q?ClioRT3tcHLfgY/ADYaBIcyQTba7SYdCtNxC15JXR9+E2cyGa8USX9QnyLj/?=
 =?us-ascii?Q?hmumk4rJ8CdrqI12xuuDGXWNhn4peHAEL0AWUxj6BvbvRZ5fmttWQdzZutaE?=
 =?us-ascii?Q?3nw9YQql9rzgHJVI4Cv0d+I5CLwpHGA9V8uc4QmS3q7ydxkCq4wuDclOJqj5?=
 =?us-ascii?Q?5JrhpInTByb3ec5n21oiXXE8HytCtQ98QKX5UeFxs9mGtzZdQ6W03jWYjQ/Z?=
 =?us-ascii?Q?iyLOwOlJIB5MoXtk8RrHiJhQakMGVsH3P/uo6pgTNVIB6yY5pFJcLBK/Z4Rh?=
 =?us-ascii?Q?IKLW3LEbJhrRLf+dvKspEmEN24QHpPb3bWG3mE2suE7UFq4sGSmkgA2CIky3?=
 =?us-ascii?Q?aoXFmxUShzrt/KI8iAQnVjdhqLhDL4DQIY1v8Af7xSq+jsYsEpBXGZ9huLV8?=
 =?us-ascii?Q?Gjm5r3exFb/Gi5NQ01ZfIX8iePRBRyqm6v8avI8aYFtmEQaD40lVaewFrYuh?=
 =?us-ascii?Q?5uD/ANDRdA+Os2qanLnfK8Sj9FSvRRf194o226dQB+FDTSNUCeHOzOX6wEzp?=
 =?us-ascii?Q?i4EphpFcx9ZUVZKVjMS453aJHTvAMA1U5Q6yV9CuFrd1A56HaDdc0Um3O2pj?=
 =?us-ascii?Q?Ipx3QRlMSS0rMs1OMEuF6QzlaRcNbVNX2NqbZduSfguoRcD1jHUSYhYlyMQ3?=
 =?us-ascii?Q?KsRu7lAUxyjihTtMvICeyyTY0SU/YF1p0yLfXLjWBXe7trBhrMVLr/gPX2UO?=
 =?us-ascii?Q?KqKEGGKPVUFkSYi/kIhz8Fpk67oZKv5VJF5Rsux+67j0NLuWVmy1woVd+S/n?=
 =?us-ascii?Q?4Xx8RHf1dRZWoT7b6nSDSoMx?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ef59a5-1662-4c60-b26a-08d8d451ed47
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 21:12:41.2982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgPmWDO4RJXz6Y+490iUN1O9JrXxXhxJH2wO8N/PK5JrLjRwGaO7LIJipGwUMtN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.70.103; envelope-from=alxndr@bu.edu;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch serves as an example of a file generated with the
./scripts/oss-fuzz/output_reproducer.py script:
The source file in this patch was generated like this:

$ wget https://paste.debian.net/plain/1185141 -O /tmp/trace
$ export QEMU_ARGS="-nographic -machine accel=qtest -m 512M \
-nodefaults -device sdhci-pci,sd-spec-version=3 -drive \
if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-device sd-card,drive=mydrive -qtest stdio"
$ export QEMU_PATH=./qemu-system-i386
$ ./scripts/oss-fuzz/output_reproducer.py -c \
-owner "Alexander Bulekov <alxndr@bu.edu>" -name "fixed_crash" /tmp/trace |
clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4, \
ColumnLimit: 90, BreakBeforeBraces: Linux}"

Since there is already an fuzz-sdhci.c (added in the previous commit), I
passed -c to the script and manually copied the output function into
fuzz-sdhci.c.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz-sdhci.c | 332 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)

diff --git a/tests/qtest/fuzz-sdhci.c b/tests/qtest/fuzz-sdhci.c
index 0ce7378c69..b529c2bfe9 100644
--- a/tests/qtest/fuzz-sdhci.c
+++ b/tests/qtest/fuzz-sdhci.c
@@ -76,6 +76,337 @@ static void test_fuzz(void)
     qtest_bufwrite(s, 0xfbefff03, "\x01", 0x1);
     qtest_quit(s);
 }
+
+/*
+ * cat << EOF | ./qemu-system-i386 -nographic -machine accel=qtest -m 512M \
+ * -nodefaults -device sdhci-pci,sd-spec-version=3 -drive \
+ * if=sd,index=0,file=null-co://,format=raw,id=mydrive -device \
+ * sd-card,drive=mydrive -qtest stdio
+ * outl 0xcf8 0x80001013
+ * outl 0xcfc 0x91
+ * outl 0xcf8 0x80001001
+ * outl 0xcfc 0x06000000
+ * write 0x9100002c 0x1 0x05
+ * write 0x9100000f 0x1 0x37
+ * write 0x9100000a 0x1 0x01
+ * write 0x9100000f 0x1 0x29
+ * write 0x9100000f 0x1 0x02
+ * write 0x9100000f 0x1 0x03
+ * write 0x0 0x1 0x01
+ * write 0x8 0x1 0x01
+ * write 0x10 0x1 0x01
+ * write 0x18 0x1 0x01
+ * write 0x20 0x1 0x01
+ * write 0x28 0x1 0x01
+ * write 0x30 0x1 0x01
+ * write 0x38 0x1 0x01
+ * write 0x40 0x1 0x01
+ * write 0x48 0x1 0x01
+ * write 0x50 0x1 0x01
+ * write 0x58 0x1 0x01
+ * write 0x60 0x1 0x01
+ * write 0x68 0x1 0x01
+ * write 0x70 0x1 0x01
+ * write 0x91000005 0x1 0x02
+ * write 0x91000007 0x1 0x20
+ * write 0x78 0x1 0x01
+ * write 0x80 0x1 0x01
+ * write 0x88 0x1 0x01
+ * write 0x90 0x1 0x01
+ * write 0x98 0x1 0x01
+ * write 0xa0 0x1 0x01
+ * write 0xa8 0x1 0x01
+ * write 0xb0 0x1 0x01
+ * write 0xb8 0x1 0x01
+ * write 0xc0 0x1 0x01
+ * write 0x9100000e 0x1 0x21
+ * write 0x91000028 0x1 0x10
+ * write 0x9100000c 0x1 0x01
+ * write 0x9100000f 0x1 0x06
+ * write 0xc8 0x1 0x01
+ * write 0xd0 0x1 0x01
+ * write 0xd8 0x1 0x01
+ * write 0xe0 0x1 0x01
+ * write 0xe8 0x1 0x01
+ * write 0xf0 0x1 0x01
+ * write 0xf8 0x1 0x01
+ * write 0x100 0x1 0x01
+ * write 0x108 0x1 0x01
+ * write 0x110 0x1 0x01
+ * write 0x118 0x1 0x01
+ * write 0x120 0x1 0x01
+ * write 0x128 0x1 0x01
+ * write 0x130 0x1 0x01
+ * write 0x138 0x1 0x01
+ * write 0x140 0x1 0x01
+ * write 0x148 0x1 0x01
+ * write 0x150 0x1 0x01
+ * write 0x158 0x1 0x01
+ * write 0x160 0x1 0x01
+ * write 0x168 0x1 0x01
+ * write 0x170 0x1 0x01
+ * write 0x178 0x1 0x01
+ * write 0x180 0x1 0x01
+ * write 0x188 0x1 0x01
+ * write 0x190 0x1 0x01
+ * write 0x198 0x1 0x01
+ * write 0x1a0 0x1 0x01
+ * write 0x1a8 0x1 0x01
+ * write 0x1b0 0x1 0x01
+ * write 0x91000037 0x1 0x00
+ * write 0x91000038 0x1 0x00
+ * write 0x1b8 0x1 0x01
+ * write 0x1c0 0x1 0x01
+ * write 0x1c8 0x1 0x01
+ * write 0x1d0 0x1 0x01
+ * write 0x1d8 0x1 0x01
+ * write 0x1e0 0x1 0x01
+ * write 0x1e8 0x1 0x01
+ * write 0x1f0 0x1 0x01
+ * write 0x1f8 0x1 0x01
+ * write 0x200 0x1 0x01
+ * write 0x208 0x1 0x01
+ * write 0x210 0x1 0x01
+ * write 0x218 0x1 0x01
+ * write 0x220 0x1 0x01
+ * write 0x228 0x1 0x01
+ * write 0x9100000d 0x1 0x00
+ * write 0x9100000f 0x1 0x10
+ * write 0x91000011 0x1 0x00
+ * write 0x230 0x1 0x01
+ * write 0x238 0x1 0x01
+ * write 0x240 0x1 0x01
+ * write 0x248 0x1 0x01
+ * write 0x250 0x1 0x01
+ * write 0x258 0x1 0x01
+ * write 0x260 0x1 0x01
+ * write 0x268 0x1 0x01
+ * write 0x270 0x1 0x01
+ * write 0x278 0x1 0x01
+ * write 0x280 0x1 0x01
+ * write 0x288 0x1 0x01
+ * write 0x290 0x1 0x01
+ * write 0x298 0x1 0x01
+ * write 0x2a0 0x1 0x01
+ * write 0x9100000a 0x2 0x0000
+ * write 0x9100000c 0x6 0x010000
+ * write 0x2a8 0x1 0x01
+ * write 0x2b0 0x1 0x01
+ * write 0x2b8 0x1 0x01
+ * write 0x2c0 0x1 0x01
+ * write 0x2c8 0x1 0x01
+ * write 0x2d0 0x1 0x01
+ * write 0x2d8 0x1 0x01
+ * write 0x2e0 0x1 0x01
+ * write 0x2e8 0x1 0x01
+ * write 0x2f0 0x1 0x01
+ * write 0x2f8 0x1 0x01
+ * write 0x300 0x1 0x01
+ * write 0x308 0x1 0x01
+ * write 0x310 0x1 0x01
+ * write 0x318 0x1 0x01
+ * write 0x320 0x1 0x01
+ * write 0x328 0x1 0x01
+ * write 0x330 0x1 0x01
+ * write 0x338 0x1 0x01
+ * write 0x340 0x1 0x01
+ * write 0x348 0x1 0x01
+ * write 0x350 0x1 0x01
+ * write 0x358 0x1 0x01
+ * write 0x360 0x1 0x01
+ * write 0x368 0x1 0x01
+ * write 0x370 0x1 0x01
+ * write 0x378 0x1 0x01
+ * write 0x380 0x1 0x01
+ * write 0x388 0x1 0x01
+ * write 0x390 0x1 0x01
+ * write 0x9100000f 0x1 0x00
+ * write 0x91000011 0x1 0x00
+ * write 0x398 0x1 0x01
+ * write 0x3a0 0x1 0x01
+ * write 0x3a8 0x1 0x01
+ * write 0x3b0 0x1 0x01
+ * write 0x3b8 0x1 0x21
+ * write 0x3bb 0x1 0x01
+ * write 0x3c0 0x1 0x21
+ * write 0x9100000a 0x2 0x0000
+ * write 0x9100000c 0x6 0x010000
+ * write 0x9100000a 0x2 0x00
+ * write 0x9100000c 0x6 0x01
+ * write 0x9100000a 0x2 0x0000
+ * write 0x9100000c 0x6 0x010000
+ * write 0x9100000a 0x2 0x00
+ * write 0x9100000c 0x6 0x010000
+ * write 0x91000005 0x1 0x00
+ * write 0x9100000c 0x1 0x00
+ * EOF
+ */
+static void fixed_crash(void)
+{
+    QTestState *s =
+        qtest_init("-nographic  -m 512M -nodefaults -device sdhci-pci,sd-spec-version=3 "
+                   "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -device "
+                   "sd-card,drive=mydrive ");
+    qtest_outl(s, 0xcf8, 0x80001013);
+    qtest_outl(s, 0xcfc, 0x91);
+    qtest_outl(s, 0xcf8, 0x80001001);
+    qtest_outl(s, 0xcfc, 0x06000000);
+    qtest_bufwrite(s, 0x9100002c, "\x05", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x37", 0x1);
+    qtest_bufwrite(s, 0x9100000a, "\x01", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x29", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x02", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x03", 0x1);
+    qtest_bufwrite(s, 0x0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x10, "\x01", 0x1);
+    qtest_bufwrite(s, 0x18, "\x01", 0x1);
+    qtest_bufwrite(s, 0x20, "\x01", 0x1);
+    qtest_bufwrite(s, 0x28, "\x01", 0x1);
+    qtest_bufwrite(s, 0x30, "\x01", 0x1);
+    qtest_bufwrite(s, 0x38, "\x01", 0x1);
+    qtest_bufwrite(s, 0x40, "\x01", 0x1);
+    qtest_bufwrite(s, 0x48, "\x01", 0x1);
+    qtest_bufwrite(s, 0x50, "\x01", 0x1);
+    qtest_bufwrite(s, 0x58, "\x01", 0x1);
+    qtest_bufwrite(s, 0x60, "\x01", 0x1);
+    qtest_bufwrite(s, 0x68, "\x01", 0x1);
+    qtest_bufwrite(s, 0x70, "\x01", 0x1);
+    qtest_bufwrite(s, 0x91000005, "\x02", 0x1);
+    qtest_bufwrite(s, 0x91000007, "\x20", 0x1);
+    qtest_bufwrite(s, 0x78, "\x01", 0x1);
+    qtest_bufwrite(s, 0x80, "\x01", 0x1);
+    qtest_bufwrite(s, 0x88, "\x01", 0x1);
+    qtest_bufwrite(s, 0x90, "\x01", 0x1);
+    qtest_bufwrite(s, 0x98, "\x01", 0x1);
+    qtest_bufwrite(s, 0xa0, "\x01", 0x1);
+    qtest_bufwrite(s, 0xa8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xb0, "\x01", 0x1);
+    qtest_bufwrite(s, 0xb8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xc0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x9100000e, "\x21", 0x1);
+    qtest_bufwrite(s, 0x91000028, "\x10", 0x1);
+    qtest_bufwrite(s, 0x9100000c, "\x01", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x06", 0x1);
+    qtest_bufwrite(s, 0xc8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xd0, "\x01", 0x1);
+    qtest_bufwrite(s, 0xd8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xe0, "\x01", 0x1);
+    qtest_bufwrite(s, 0xe8, "\x01", 0x1);
+    qtest_bufwrite(s, 0xf0, "\x01", 0x1);
+    qtest_bufwrite(s, 0xf8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x100, "\x01", 0x1);
+    qtest_bufwrite(s, 0x108, "\x01", 0x1);
+    qtest_bufwrite(s, 0x110, "\x01", 0x1);
+    qtest_bufwrite(s, 0x118, "\x01", 0x1);
+    qtest_bufwrite(s, 0x120, "\x01", 0x1);
+    qtest_bufwrite(s, 0x128, "\x01", 0x1);
+    qtest_bufwrite(s, 0x130, "\x01", 0x1);
+    qtest_bufwrite(s, 0x138, "\x01", 0x1);
+    qtest_bufwrite(s, 0x140, "\x01", 0x1);
+    qtest_bufwrite(s, 0x148, "\x01", 0x1);
+    qtest_bufwrite(s, 0x150, "\x01", 0x1);
+    qtest_bufwrite(s, 0x158, "\x01", 0x1);
+    qtest_bufwrite(s, 0x160, "\x01", 0x1);
+    qtest_bufwrite(s, 0x168, "\x01", 0x1);
+    qtest_bufwrite(s, 0x170, "\x01", 0x1);
+    qtest_bufwrite(s, 0x178, "\x01", 0x1);
+    qtest_bufwrite(s, 0x180, "\x01", 0x1);
+    qtest_bufwrite(s, 0x188, "\x01", 0x1);
+    qtest_bufwrite(s, 0x190, "\x01", 0x1);
+    qtest_bufwrite(s, 0x198, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1a0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1a8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1b0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x91000037, "\x00", 0x1);
+    qtest_bufwrite(s, 0x91000038, "\x00", 0x1);
+    qtest_bufwrite(s, 0x1b8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1c0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1c8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1d0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1d8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1e0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1e8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1f0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x1f8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x200, "\x01", 0x1);
+    qtest_bufwrite(s, 0x208, "\x01", 0x1);
+    qtest_bufwrite(s, 0x210, "\x01", 0x1);
+    qtest_bufwrite(s, 0x218, "\x01", 0x1);
+    qtest_bufwrite(s, 0x220, "\x01", 0x1);
+    qtest_bufwrite(s, 0x228, "\x01", 0x1);
+    qtest_bufwrite(s, 0x9100000d, "\x00", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x10", 0x1);
+    qtest_bufwrite(s, 0x91000011, "\x00", 0x1);
+    qtest_bufwrite(s, 0x230, "\x01", 0x1);
+    qtest_bufwrite(s, 0x238, "\x01", 0x1);
+    qtest_bufwrite(s, 0x240, "\x01", 0x1);
+    qtest_bufwrite(s, 0x248, "\x01", 0x1);
+    qtest_bufwrite(s, 0x250, "\x01", 0x1);
+    qtest_bufwrite(s, 0x258, "\x01", 0x1);
+    qtest_bufwrite(s, 0x260, "\x01", 0x1);
+    qtest_bufwrite(s, 0x268, "\x01", 0x1);
+    qtest_bufwrite(s, 0x270, "\x01", 0x1);
+    qtest_bufwrite(s, 0x278, "\x01", 0x1);
+    qtest_bufwrite(s, 0x280, "\x01", 0x1);
+    qtest_bufwrite(s, 0x288, "\x01", 0x1);
+    qtest_bufwrite(s, 0x290, "\x01", 0x1);
+    qtest_bufwrite(s, 0x298, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2a0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x9100000a, "\x00\x00", 0x2);
+    qtest_bufwrite(s, 0x9100000c, "\x01\x00\x00", 0x6);
+    qtest_bufwrite(s, 0x2a8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2b0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2b8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2c0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2c8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2d0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2d8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2e0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2e8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2f0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x2f8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x300, "\x01", 0x1);
+    qtest_bufwrite(s, 0x308, "\x01", 0x1);
+    qtest_bufwrite(s, 0x310, "\x01", 0x1);
+    qtest_bufwrite(s, 0x318, "\x01", 0x1);
+    qtest_bufwrite(s, 0x320, "\x01", 0x1);
+    qtest_bufwrite(s, 0x328, "\x01", 0x1);
+    qtest_bufwrite(s, 0x330, "\x01", 0x1);
+    qtest_bufwrite(s, 0x338, "\x01", 0x1);
+    qtest_bufwrite(s, 0x340, "\x01", 0x1);
+    qtest_bufwrite(s, 0x348, "\x01", 0x1);
+    qtest_bufwrite(s, 0x350, "\x01", 0x1);
+    qtest_bufwrite(s, 0x358, "\x01", 0x1);
+    qtest_bufwrite(s, 0x360, "\x01", 0x1);
+    qtest_bufwrite(s, 0x368, "\x01", 0x1);
+    qtest_bufwrite(s, 0x370, "\x01", 0x1);
+    qtest_bufwrite(s, 0x378, "\x01", 0x1);
+    qtest_bufwrite(s, 0x380, "\x01", 0x1);
+    qtest_bufwrite(s, 0x388, "\x01", 0x1);
+    qtest_bufwrite(s, 0x390, "\x01", 0x1);
+    qtest_bufwrite(s, 0x9100000f, "\x00", 0x1);
+    qtest_bufwrite(s, 0x91000011, "\x00", 0x1);
+    qtest_bufwrite(s, 0x398, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3a0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3a8, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3b0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3b8, "\x21", 0x1);
+    qtest_bufwrite(s, 0x3bb, "\x01", 0x1);
+    qtest_bufwrite(s, 0x3c0, "\x21", 0x1);
+    qtest_bufwrite(s, 0x9100000a, "\x00\x00", 0x2);
+    qtest_bufwrite(s, 0x9100000c, "\x01\x00\x00", 0x6);
+    qtest_bufwrite(s, 0x9100000a, "\x00", 0x2);
+    qtest_bufwrite(s, 0x9100000c, "\x01", 0x6);
+    qtest_bufwrite(s, 0x9100000a, "\x00\x00", 0x2);
+    qtest_bufwrite(s, 0x9100000c, "\x01\x00\x00", 0x6);
+    qtest_bufwrite(s, 0x9100000a, "\x00", 0x2);
+    qtest_bufwrite(s, 0x9100000c, "\x01\x00\x00", 0x6);
+    qtest_bufwrite(s, 0x91000005, "\x00", 0x1);
+    qtest_bufwrite(s, 0x9100000c, "\x00", 0x1);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -84,6 +415,7 @@ int main(int argc, char **argv)
 
     if (strcmp(arch, "i386") == 0) {
         qtest_add_func("fuzz/test_fuzz", test_fuzz);
+        qtest_add_func("fuzz/fixed_crash", fixed_crash);
     }
 
     return g_test_run();
-- 
2.28.0


