Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993D302AB7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:51:32 +0100 (CET)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46xW-00063P-Kf
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uX-0004Ey-4W
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:25 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uV-0004xv-M2
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW1CFU/EDMngXNFQ+kpNSzSGz7dFEkvwu9eGz7U7T/FeMVUS5TfWF6fA5AzTOIs/b4LfVVg1yXjo+OQNlVF6ep1UPzOUHGtR0ISfZkBSyk+ixw67Mh/2JIklGB+aLAKi5y486863XaFY2030prXaMOhP+X0X+iL2jqaz2mKcjka2SNHr8SYJeOWJxf+okYQ79WZIwdVhq67eTgq8ggWIQq0GpdI+6FHlKG6vd5oXpUbxYmOR7cvu4FvMzOnDyjl2/hGf8gV6kN4/OOyfcj1362s9XUgsR99Vchp1iv+eDrCB11cEqLA8BvDiEs/QijRvbN912jb06qv74RrsoawQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq2p/RNTQpSd3P8NmqBUsX7G9fUXjFpdSo91qJtUlkE=;
 b=g+Ha15k8oZQp/gvcFXjAVq9qudUerxnxQp3yVHCVT0AxF6YXwRQrWGtH9J7DMnMm3cncGdCSwDe3b2z9KKFZuVYAZqH0t3n1qkxo1be4ip+0J3XkJsexJ4SuNbIkkV+uwyqP+Z9NKv1ahesZ+yd2VlhnYrxvz/MGqJtiisBgIrwAXolEJ5TGr0ynl21k5Sj73MJGSFnAYDDOuoJHejgvsByjnerjp/vsx2SyohhDkp8zQiUbf6Kr0+1G0WPdlsRyf+ebQrUP7d7CCBN+XtVokKZFhQFpWVME0fT//PVEyDR33lqpZEZvp6/3Iut9nyLJSV7FhJ9sBGwuEV4bEFXUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq2p/RNTQpSd3P8NmqBUsX7G9fUXjFpdSo91qJtUlkE=;
 b=V/wt/x5j5wA3ecbYOiGpmArEeSD/jujxL29k4B6LpCSw2iWXI4p7UUKySSk59OZ+WVlSEv4LBhktroCk7yUaUn32WIguAgrDLItoTGHwEF6xqgHajUxvZxBqKkAwizgh21aVkGR2vpskH6SDAZmNUgiEoev1gaWEQ6Cqcf1MLAM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:10 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:10 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 2/7] fuzz: refine the ide/ahci fuzzer configs
Date: Mon, 25 Jan 2021 13:47:51 -0500
Message-Id: <20210125184756.319453-3-alxndr@bu.edu>
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
 Transport; Mon, 25 Jan 2021 18:48:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b1056c5-cef7-4650-5ead-08d8c161c31f
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5563BF31E66788FE37B1372CBABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6KWaT5k9E8FFbHq+tIUAniCWsBj9ShsNQujcCPNF5/I/ZpgFBplnlZrLPYLuaDLJr0sK8Kne/wOz1Ai3fXk4x1HzlX+z/3f/5c94hLnhPm233oRNWGU9cuseKdAWrtGCZ+7hynW8fDqfMLfjIa9jgA8i4n/oDzw4tNmbf+w9W4OWX0gC7bI5nWv3mqV5N+x5H4H6FbrhxWouOpaSTmPqC/6WEykVB+ZZEm0u+gOPSe8Dte0EIG4F6XFxlohwqutN76ortLq0PS5P1tVMZLG+Z2CaDMjz0sh9UxjlNb4l+JStKotgfyxXHvzDRWzCq0KVBizQQj7+0JU/+oMjfSMXBgaifokXrufBmD44CVrle7Wnx0LIPapPESC4RlF06CC5SyrZjX1nN64pvxbpTUF/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rJl96MZttCGUcjgIJFjyRXFkTu7W1vbOXESR2fzOXTeC6LMSuJ7IcpTjHpgd?=
 =?us-ascii?Q?HA1g5Kc3/7FzkjoJa8roEl7HLtHIcrK3+8WxvCI0CpRQeLtVKvO6+UMW6IYG?=
 =?us-ascii?Q?5xi+S7GsgilPXGzbJTttDnIrM8hBPmHEev75vkjm3NYwSLghvKXeYU2ZNSGR?=
 =?us-ascii?Q?aPMyIH/NrY+5xLmv4Ppi79PSCl8okG5gc9EmfnuSa79BFoHIsTIhEc97B3eb?=
 =?us-ascii?Q?nhTTX27+nTPT/7m6wmOwjOdT16gaLOucMFTTRUZqzQaqGG/dj5fdwAbEiUVX?=
 =?us-ascii?Q?+5cwlYTiowS2FSJkBCAUnGgEe2yUugQrARVL8oZlG76UEIIGGJWnya9eYJhY?=
 =?us-ascii?Q?LDb168TGAVm1bh48dPeiXD06qhmVUVKmLkIn+pRTXAHrA5P6tcZ9YkE8iP/9?=
 =?us-ascii?Q?XCF3uhuKN466jpYsRWDDSpptlh8J7SqQhzL1UprwwQp2kWWz+Npo5EQN8oic?=
 =?us-ascii?Q?G1C6OVgsgsLp0Qx19s5TLtwz2qm0mO4INyBj/PH4NmgBEiWAslAWnI30tdjs?=
 =?us-ascii?Q?MaR4wkaHXDtUkSQLG+fjJGKbwf5fPHdNzsCk418DHz6MdSNQGuimxyARUoxd?=
 =?us-ascii?Q?+DIhGx61+spe857Jgbnd9bezrtTZqfy4a4L70rOz4gyN3yNiBJUY6glqQm3X?=
 =?us-ascii?Q?P3XyDyRLZhi/qSdY/XFFpFS+M8DYNCSN1cxob1Boe6YdZUJhHfsM3GjdDcgH?=
 =?us-ascii?Q?S+blxLG8wrbWkROoSptK2f+mg5paW2X8ZJf/58VnLCihLcWURp7//Pd1NPSY?=
 =?us-ascii?Q?WtnPALK5OfqPGqI64Yn39YMIFBqB4xmeZKCebkJ2khL0AvT/oBm9qh29omLV?=
 =?us-ascii?Q?5v4j87Eg32CDbBVGU0DWiUe6ULeMx8W9B7oDGP4bnvdC65G2MQYWzbYdtM4l?=
 =?us-ascii?Q?q+rcoJ3MQrugk1bMLrU1NemSGEueERuFXwBAmWB0zwLQQxlXZ497dn0EaOr4?=
 =?us-ascii?Q?iuKrbw35CSeyO7oThYul88RCfazVtXLYPbdlRSwHXZEX1dbCY3QMdcK8yVfd?=
 =?us-ascii?Q?xwuvM0MxCfDsMUPvONfrn7NVW9MZDmyE3SdY0aXcqWlvJp/UzO8CuaUVqJPP?=
 =?us-ascii?Q?KzGYhvla?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1056c5-cef7-4650-5ead-08d8c161c31f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:10.3715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3st867CuSFN46jQbqvHfHEk4Sjq8s16XmarmFTTlOSkHvhfm3n2YdiAWwO1CwPT
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

Disks work differently depending on the x86 machine type (SATA vs PATA).
Additionally, we should fuzz the atapi code paths, which might contain
vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
machine types.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210120152211.109782-1-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..aa4c03f1ae 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
         .objects = "intel-hda",
     },{
         .name = "ide-hd",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-hd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ide-atapi",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ahci-hd",
         .args = "-machine q35 -nodefaults "
         "-drive file=null-co://,if=none,format=raw,id=disk0 "
         "-device ide-hd,drive=disk0",
-        .objects = "ahci*",
+        .objects = "*ahci*",
+    },{
+        .name = "ahci-atapi",
+        .args = "-machine q35 -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ahci*",
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-- 
2.28.0


