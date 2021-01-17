Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74AD2F962B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 00:14:08 +0100 (CET)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1HFI-0000NO-1Z
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 18:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB7-0005dL-AZ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:50 -0500
Received: from mail-eopbgr760103.outbound.protection.outlook.com
 ([40.107.76.103]:12485 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB4-0006XA-W5
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzAcQl3+D++dCmKXKmZaQzxBU72ptUrt3uNeyegcS4ePRSxN+00Y6dXHw8QGNDm5m99QB3ZZgY7yZsE9ajKN2Z3MlU+6wjd+XPyONmed5ZXNraz9AuAZMUm+v9h7eQsvEf6xclL7mxVC9GH4XCiJPepVC8oIWOMZcby/NLS/RP3/ZmU61dL1ts8V+xEmsuaZ/uxhbglAXvLGgsD4n4qCHK6PdKDjKBMZ1f/L5NGkIvWNFRt5ljVXdXBEf+Elu1jEuZ8vLAzrU4xw7TdCmUk+9lNy0foIxdSkqzU31bVzm1sRfj8Ao2Fb2CA8ZUGehAnoEzg85y3/fiih/KUFt08aRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOFt2e/UKzpOrLEo34OfHlZAptfi8NHhLckGsX+l5VQ=;
 b=WtEL6eJ9rpUKDj3cMAHZHmfD4KO5dCtCwPm/B8FtfIH6EImH5IRqnjXKd1Hd/22NrwQsthTC7AJMe48zjyEDoMfmPS65GyT2VrqHLJNToQaTFqXDtNXXiZXSMwXnmxLfLTYswsUNnsnC1V7ybvyye/9sm6izSCVPSlxmWSdgyjNBFbiE0EAZglc68MBOLg3eoNdbxy3uedqyJU3PnngAjTkoxohOk8nv9EZ+kyYOMkGk91I8YronjiiIh8Gh3KO39/tuPACPhS2g8RegF0j6nmorUEyMVNatftxA8iKrkYDS1Gr1qSxQSouIXbFT2a+yRe5NcPjzaTsQdoKyvyNz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOFt2e/UKzpOrLEo34OfHlZAptfi8NHhLckGsX+l5VQ=;
 b=X4kvLGNuVQ1ZEyJcg8WocwE3/fV1Jd5+7ZrAutRngpxs8y8239if3vb8pmU1SIrZntO3yhIOHjXnHsysB3Yf8cAmbIggZHWoVKOiFgtFib/h65tZplEHQoWnULwQHCyca/ckZiawH0PuNxNLWRHFOyHHCKJ4SAKiSw7fuAh3eHk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2208.namprd03.prod.outlook.com (2603:10b6:804:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Sun, 17 Jan
 2021 23:09:38 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 23:09:38 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
Date: Sun, 17 Jan 2021 18:09:24 -0500
Message-Id: <20210117230924.449676-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117230924.449676-1-alxndr@bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:c0::31) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.7 via Frontend Transport; Sun, 17 Jan 2021 23:09:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44ef5e2b-8871-4709-dbd8-08d8bb3cf692
X-MS-TrafficTypeDiagnostic: SN2PR03MB2208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2208DF2AB00794D2DE4B29D4BAA50@SN2PR03MB2208.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXpjYLU17m/YqUmDmzuI1xjvdLaANyrJ/E8az9cgRkY7eSv1DZD4bZm7gA2EqzYwXiO5Fzt0TXJIBigyC+ATevEo70jJqBq0xWnFHvq+ipM4dXWx2yN1SGaCsmCmkTQ2bgatWd8rNCFbIAcG93EKiTLE+w+DVgPd4LlfNoMh04TSnzvyCj50d9Qf4aSPfhkdJKVFSAXHDo2rYut5FKAa8ZX4qKpqkbUssgCjbaGddxQorQxsLqB0yml6WJis8SlKbPdhK5FR4fSgCZKxbtF60V8F/qnRmmh+F2fl3Dm7307nuQBxQisnfrQKymueokNtyvQTefNIMIXA2VO2qP/wqmINeh2PalxI7L89xocuzQC8eKWIrYE4IvZOPHgPyb3rnTsPvqbVLKRa/Z7yXV2svg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6916009)(8676002)(54906003)(86362001)(8936002)(1076003)(2906002)(6506007)(16526019)(786003)(6486002)(36756003)(316002)(83380400001)(52116002)(478600001)(186003)(75432002)(26005)(6512007)(66946007)(66476007)(6666004)(5660300002)(956004)(4326008)(2616005)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OPPNLLHt++B3tNv93W6YDa8r7cWXpNFTJpIGuxm5qawv6fAoDRkQyFLT/xt2?=
 =?us-ascii?Q?Ib7D748mRmLuJ31MEHZ6P8TXZuyTJ1cHhzw1a7Dcqz/+s0rSE233KfsXqJm3?=
 =?us-ascii?Q?FyJt+FCUYTkjolVOXRVi8eWIHz57fkuLJdl+pea7UsaTMW+DvY7VoeeQ/aKN?=
 =?us-ascii?Q?nygEGtplV8Uhn/nNaFmE31vG8pn6HZnmvBgBNMiE2fnTzF8gV5bQ3piF2AIa?=
 =?us-ascii?Q?WxHjZroRLbK7L7NKGqwcBFEhvzyDn7RwKRpTKEa+GU2c7SuXpFRivWjLBIuU?=
 =?us-ascii?Q?TDch6EW35GACa2BbHQlNqF+XSJrZrJajDZdk7RT7pzYxV+mNRB7ICcyMvCtZ?=
 =?us-ascii?Q?IKG4czx4PAe5nBBYXRs1GAyvBR7QBEhfKgbM1dwh/h2oCW/t3bRPfYscU4UC?=
 =?us-ascii?Q?5Ucdi1vzBiJfg9Us5cN6j3a7UpC4zhDh0AtE2vCuTvKTsGfgqjdQaVuuEZjz?=
 =?us-ascii?Q?SMywioFAj9lRmAUetNqp512TcCSf3sSVSFm4F7qEaJFBy5ceHIoqgl9bDYYr?=
 =?us-ascii?Q?X62FY6L8YmzmwbwQIqZFZHLe8WbWsrCN6yyS6ItDaceVGl70XS2VgPshAYIv?=
 =?us-ascii?Q?kzZDave9BImtbo7o2KlBb2IQYYXNxMPqnFyHDiHJHGeLXeLCBZKqg7ZLOqWv?=
 =?us-ascii?Q?Xj7y+8fiCSiRR74/01C8vB6hlmro6gIXU5yrtEbGQolV1Td3ICGq1OU0hjre?=
 =?us-ascii?Q?Iutlk2ijSmpRQndMtfc60darPxXLKwhv3f/pucg7kvwfL/sh6fjH3V/8Hs0f?=
 =?us-ascii?Q?UQimlSDyrg4Y8wFnzYxzJ1PfVzXss4bBeDHzX1xxrCPOSnVWzWinxBhU3dU3?=
 =?us-ascii?Q?nmDPTtzIpqI/bW44SQYLn54s8Bdvdc4SoRqH1sJGTxGmqmYv6PYZu/R8tkwP?=
 =?us-ascii?Q?5+Jng6F/xT248O07bg6GaVNJWhneJKkpF0V8ZAU9JvUc7rckdSQ2bZsRiljQ?=
 =?us-ascii?Q?B8Tzehe1C4iBFlPOdg3J09W4ngdQClq4MGklSAsV06KtBm0dKm59keiqmsSf?=
 =?us-ascii?Q?UPAO?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ef5e2b-8871-4709-dbd8-08d8bb3cf692
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 23:09:38.3678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aDZ8WtmGK6llirnyXt0QJBn0C6j0RU8eQQg+n1SOAA1q25UGzXXpQpZX0rmV0Ij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2208
Received-SPF: pass client-ip=40.107.76.103; envelope-from=alxndr@bu.edu;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

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

 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 1a133655ee..f99657cdbc 100644
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


