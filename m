Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DD2DC7F6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:52:12 +0100 (CET)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpdmN-0004SN-UP
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kpdj9-0003LF-4B
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:48:51 -0500
Received: from mail-dm6nam11on2093.outbound.protection.outlook.com
 ([40.107.223.93]:64621 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kpdj6-0004Oc-Kk
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:48:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdMi+pCKMJqPg/xjrs72aMUJsyWwHY+QrpXxSresi3Xtt9mIyC1BvTEkmRBFfew4auqV7ixqbt4eUpygzm5gPdCQuZVK4olL2fEbPhObqvU9LBlANlXQGU2GpQMwjFv6w8gUPA+YY7rF766jYSdGpNtur0spuoTkL6iudHfrjfEQqyHnrIc3g6iLGy28AFcsLzvWOwVP/zf8WSl7yUTmKFE5XKTMIxXjLFj2ygLSyZbUJsEP8mukGOwJXp+XDpYT0n+dNdffzsCcnx2BPSU0Vh6aCZd58Eb9czVRifVzb7STcxQnwyIcp4e031FNXw2AQkthOBcNr8z+BFF1SUS6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ie1+GcZlk9sO16KZ7y0PGvxj9hyVpvFdQ1XXi1mZu/I=;
 b=Dyva2VbdNj2YOJaAzYdOKY7SlPdsPLeZHIq2zvpGt+LfmzuVq8QuaFP/WD6Y5ZjGBlbbNVj0Ik/GnEVHxObkBWrTdfPyv4+rbEBzFpCcuCuim7S7koz1wIdED9qcwFKFBsMKvHc3ohCRsBUYLefoKLuvb9l8xZf3oPKeomo3ocsXbIe9OhcW12XxT4d/XEWgOmZHxdY9IyS5lrw20MVG+Ksvg71YXu/FKYfMxfkChb/vJlrea9VANYxPXs0pEmXKu6adL8+aDIwm6hVOdNQBVaedH7NPd/JZIvVXvfbmdHypcFPjq9/uiYhpTLk6UzTKT8QEvWOtGGXaEWSa5i7b8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ie1+GcZlk9sO16KZ7y0PGvxj9hyVpvFdQ1XXi1mZu/I=;
 b=EKoX6p4TfZzq9S1HoWlPWXEL4UcCQ3JpFKahl3JJo3uMpv17waFIFP4RKsmbFBnJ0M0f4Z9XTSQrqdg8U2EUr4sjzHAETfKN+fmbJJYL9vzfJ99WI2QOjXSlRrZoZQYCr9Rkkdt+DQQDkwh0WKad8LxlsDT1VcVmA4HOSsz7oG4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5785.namprd03.prod.outlook.com (2603:10b6:806:119::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 16 Dec
 2020 20:33:44 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2%2]) with mapi id 15.20.3632.033; Wed, 16 Dec 2020
 20:33:43 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: fix the generic-fuzz-floppy config
Date: Wed, 16 Dec 2020 15:33:27 -0500
Message-Id: <20201216203328.41112-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: MN2PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:208:fc::17) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fibula.vrmnet (72.93.72.163) by
 MN2PR02CA0004.namprd02.prod.outlook.com (2603:10b6:208:fc::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 20:33:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b2c908f-13aa-4274-c83c-08d8a201e1bb
X-MS-TrafficTypeDiagnostic: SA2PR03MB5785:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57850DC652D72A82F474795EBAC50@SA2PR03MB5785.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lOpvVRbdTpwoz9QlDfQeuut3R5wLIQZBzCzSN1wJy4a4vyGVT8tF2yb0mZhrsTUVAV41OjVaqNY45C4z18+NVXR7a6zVo052GHqxdbyBVfHOOEuOVbSRn8nBteFRBmQEw9LCNkIo1pvDP8OsCNBcSZ3OJYW2Gcti3wT32NYjQfYxYVcR4VXEOwgLOHjxyY97zDopXlIAb1nZIWsqsAaCDHtIko1umV+k3rs48Hz0tbeSmkLKBvT79/7wQ76sNkxQXB8yi7pH54gER7hueVeDyN546t3jXQJPVZEcC1giWkA1R65k7qhDxaQ8tlm98wSFkyzKVdmoBMhR18akxoKdaMFjjmFUBCpE4c0p85/soSX2jFYDk7DWrXbumgymqlta
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(956004)(54906003)(75432002)(5660300002)(8936002)(6486002)(86362001)(66476007)(316002)(6666004)(186003)(8676002)(1076003)(2906002)(4326008)(66946007)(2616005)(786003)(478600001)(26005)(6512007)(6916009)(16526019)(6506007)(66556008)(36756003)(83380400001)(52116002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Vc/O/ACDgrrcPpdI8YOcS+Lb489hGNXh2zA+C0Ru9HWr4vimi1gfTnqCBTZE?=
 =?us-ascii?Q?iVwTADWjZeXDWKu5hPw7dcy7eiRe0R2wxmwrl20pK/nzRM9kSxxU9h92Qgs+?=
 =?us-ascii?Q?pEz6faxpVIZQH7UZYUQVyAaXTyWC7tIslPBB37TjSr0S7VrG+7q6ogJbaf89?=
 =?us-ascii?Q?Iojqs6tKrtPG0DfIpjGNQyCyvjDOxGQi44BXm/hZWEKweLESTfHCZMilf2JF?=
 =?us-ascii?Q?LdnSJMti01Im5BQ3W2AUvMJjoTfmvelZwMlyXvjaJK9Qx/ziL8gOYYNweuSf?=
 =?us-ascii?Q?R4pJgxi+0ehpDlW54kMJXyd5oH7fLVjUOCLWgni+VbAhbjqVgPHJdkyf8hWm?=
 =?us-ascii?Q?4AjJwtVtXbkAIyd6UK19TTF9owFREIqh/UNECP5xB2CykcMje75jH8MJMjAO?=
 =?us-ascii?Q?g6bTJ6Q8W+gQID7ABsrR1kamUKizN5jIvhAIRe/u8G4KaRqchY4/hNYdSJaM?=
 =?us-ascii?Q?YH/aHCYBCIel1kfZbhCNWHasx/+TTeEjsSwZTaF96rx42LEKPrtyBqgSRiAi?=
 =?us-ascii?Q?s7Rd9o5iUhA2n/r+G1oZ0WxwOgpF1+fSCnklsbrLQiETXexw5e4X8f1Ic5Hs?=
 =?us-ascii?Q?jg0IZ3Ld62vozEWGpfFAbD5Is+StAe7B1+p7Juw/1TLYHVhB/2zFukx55FuY?=
 =?us-ascii?Q?IiLnacMqeE1uDlozG2f+4p1ncq3XIFX9nypTTywyno18uOu8PxITYzg9/HwO?=
 =?us-ascii?Q?o61Y8X4y/ivyNZB+3LG37K3lIOB9mmZy0t8kcJSvSaoveYIdxmlB7UkZIouP?=
 =?us-ascii?Q?Of8ueagvF31Ecjd7nBSU/NS9Y4gap5lMU+q006vOOtC8vei7/AwJxIhDQvhg?=
 =?us-ascii?Q?3jgaFXrM13u24SGG0+s2P+QXSu8ljc6hpSMaD+XK0GQWsKa+cj5DJswnNK26?=
 =?us-ascii?Q?Yb57NfJ0/qmnmOYDN3xckJXKgYeSFKhTs6e3Fpzic0x/mU+KUUuX8hilTYYD?=
 =?us-ascii?Q?TVpFS57T/q8f/U5JQ6SFU7QrL5q8FeHlF2qyRtbJx0A=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 20:33:43.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2c908f-13aa-4274-c83c-08d8a201e1bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2DsgTLImdneGyriBaLtRo/YkjrHFwzHUn5Cg9tURZJO2DDkvBxMORDrGcNjS48E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5785
Received-SPF: pass client-ip=40.107.223.93; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001,
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the pc-i440fx machine, the floppy drive relies on the i8257 DMA
controller. Add this device to the floppy fuzzer config, and silence the
warning about a missing format specifier for the null-co:// drive.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index b4c5fefeca..0848c11308 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -92,9 +92,9 @@ const generic_fuzz_config predefined_configs[] = {
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-        "-drive id=disk0,file=null-co://,file.read-zeroes=on,if=none "
+        "-drive id=disk0,file=null-co://,file.read-zeroes=on,if=none,format=raw "
         "-device floppy,drive=disk0,drive-type=288",
-        .objects = "fd* floppy*",
+        .objects = "fd* floppy* i8257",
     },{
         .name = "xhci",
         .args = "-machine q35 -nodefaults "
-- 
2.29.2


