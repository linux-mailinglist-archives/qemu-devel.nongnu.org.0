Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FA33A336
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 06:59:00 +0100 (CET)
Received: from localhost ([::1]:57388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLJmE-0005dU-Vw
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 00:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLJkG-000558-G7
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 00:56:57 -0500
Received: from mail-bn8nam11on2103.outbound.protection.outlook.com
 ([40.107.236.103]:27104 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLJkE-0006d4-F6
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 00:56:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs8hptSUXuvLQCQV1mMrsjK0U+elcyilmGhkR9MyC3kgiFULV1r5GQGL1PfMF9+2Tf6VHWLe43XcViGb3mBuHDagV5KLr7B465tQLtSYzJQfhINuckLSBefAJFoCPB+FLvQEIWzJXnhaPnraAFPYVkVFqBR4Bp4+lozN4E+0EpNvYmzRy3rdyuc7XlO5eRYV4H46w0Z89PFHmPH6ysTqHaG5KfnBoSTks3IEN1RlJTy038adipDclQzpUMwoxnGRuFMdFuNihXhKm2udvyz75NI1zvA8yckL15ziPLBYkjV+/G4wNkCGJT2HRrHp6zU+KvIYFSFRX82YWApuliFDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvJjzR5KSRhUmuxXradmCxngIqNinKBwuJg9+ye9BLw=;
 b=eGvolqHv2VhdOiYT2OZdareTl86y6AiK55grAaXy5Acy6VfRHLsbEgu3/AIhHPr9+9zwKoe+lPKYBGvt/pOA+KTQUJzDL1DTpoTivWDIy7vfCLEzp7yrfvNyrLjFz7C0UrAIfbv0jfzfT2aX6INk9ykRPCD9XYTp1DLOZFpXoKpoW5MT2pLrrWtdElk7BcnkwBAWYOpzsA+u0vcRTdSea9GnxjupCgI+RnvuyS/+Nk82vhiNzDHwXfibwcT3Tdw52EuecY5tTXyl+n9lQVEcBqYi64tgQC6DJwPFxFc+3h6AyYffzFu356Ihl5MjG1cL1K1GM2qMEE0JLKtFp7wd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvJjzR5KSRhUmuxXradmCxngIqNinKBwuJg9+ye9BLw=;
 b=Vs7EA3KcdusOZVtdFGwYZMbWl1KhMcnxT3kKwcKyKhm+NfKjxrfLyPa2oC7Om8R7zY+eegpKdng3HsZw3Ih1r0Bwx3ljF02k3p4RnmALOlmGjZJcx2efaqIw9Z5nfP6B+r8LDPN6Psj71tWxQWbAty+i0y7jUKR8vFrcPTC3AIc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5625.namprd03.prod.outlook.com (2603:10b6:806:b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 05:56:50 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 05:56:50 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: add a am53c974 generic-fuzzer config
Date: Sun, 14 Mar 2021 00:56:37 -0500
Message-Id: <20210314055637.5239-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0281.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::16) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0281.namprd13.prod.outlook.com (2603:10b6:208:2bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Sun, 14 Mar 2021 05:56:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 747582c5-f71b-4c26-1c9e-08d8e6adf5aa
X-MS-TrafficTypeDiagnostic: SA0PR03MB5625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5625B17934B70544B22C4839BA6D9@SA0PR03MB5625.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Un6GYbVPPkuFTyzvJ6c428kxd7bfPxbql1ogd6SjBAGQfiEhfboLeItAJJAFLoftnBnXMioWUuB59V1ImZWJ84Nm7kgybqdM+FGB11SkF88Jk8D0QTc5qk1ZhhhwgAA0j2TmOWO8LHDrpVgVHPI5k5Ng6RXCoDOgr/6Cw+KBMVexDPJ8xBN1xJtcM1pdmaJsmaZpBA6m0XpEDIGIKOTYPwmLgLr5mvbp060HRZ1rkGOQwmOihg0WVlNn7mS8ZYENIrl1PuRxNhEqbph1974iDDa6wA4mIx0SgGFI8UPfn7EIJDY4b0/IIaNlp/WOR8wAd9medGREHPhIam9GU3QHsXEillzPtivUE70JRV7Nf8OxYkxsm4aCVag5xLX6AGCWwvLOQXXkbgttdvzXDcJthmZvEe1m8p0iES78N4nZU50yHxKtmkQ+wOozTxa1eZ93Tz4K5s1nk5IzhuygxtkwGJQliFVpNHyCaoTASC8f76Le64YISxhKyi9MV6RQA17OEhCqVF6bGTMgYrA1gFTmogLFEKOOCkdo31EvdtDIbPsT5APwOqw9zLHUdQ/Ipj5NxZogjUSCW+Qk4AU987FgW2J9MiaOiq2D2axsiw3gL98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(316002)(54906003)(956004)(8936002)(786003)(478600001)(2616005)(6666004)(8676002)(36756003)(16526019)(1076003)(86362001)(26005)(186003)(4744005)(66476007)(7696005)(66946007)(5660300002)(2906002)(6486002)(52116002)(75432002)(83380400001)(66556008)(6916009)(4326008)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?USJUKhZTYzr7IxbecCepQcVNT+MDREgcywn2CoLfJLtZosObtvz9ShflbKvx?=
 =?us-ascii?Q?QuXPLUzgCJnBhs+eUCD/DELDPQIs9bv5ATsYNwYS0Y1/gDMaMoAE64NdCubH?=
 =?us-ascii?Q?K3PU13ovWSCEPmZDwllN/ZAptnKSylKe0jtgdEwTQtWvJ83YUNJIWTxTn9gk?=
 =?us-ascii?Q?1CvJpDoX10HE7UNK4j2CFYUlAhVmR54/ogms0WL1wiARInGB+8yMOmO/0yVx?=
 =?us-ascii?Q?a2xUwZxnAf4xGGPUIwN0ySHoyEzPjggELFnG5C9uybnFOZrSI+6o5J1RygLd?=
 =?us-ascii?Q?YcFWmhId9jICFxmH8GH4RRKYN32tS4hHHim0DUhlheS0xgKZbq2goq3r6M8J?=
 =?us-ascii?Q?b72xvZKWBijncHocKv7E+mgNTXwowosUTo0NTRJEC4GMhQK8swiiQKKyIY2j?=
 =?us-ascii?Q?FqrhAWNlYhTrVQvAqYxtSl4aqvDoZrgaL6OUdo77ljDhrfO6ewyA/KnBZrLw?=
 =?us-ascii?Q?UXLweuZQT65/FaZTp+4nOg1P7YUbbuV00Cev5Y1oJBY/cZctxJJrMLdaUbl9?=
 =?us-ascii?Q?YiswqImNPoo34BoPfLhu5Kmn5d+hz+82LaxdKGcc1FUmlOrwxYO1EPwYBfYI?=
 =?us-ascii?Q?kGyCMp0JWuq61pVakOgbwg/UDAR3SWsAVjkR85+4NtIC2gTtMDP/NfV7nXTF?=
 =?us-ascii?Q?FRMDHzTWlWVcs2ta3BR5LpYC2nvZbc4pKBwMreDKNEasq2utB3awL5PbdI+p?=
 =?us-ascii?Q?0WY7nEm809wt25Iwhf7ixRYVctZ4bm+l8PLwI2gi1xzftuRJPtXL5r4k5LIp?=
 =?us-ascii?Q?6F86yQ0xs7Fq5vFkInStouV3RPTa6mEmKa64A0JgjsBb6DruBmj9Q+lE4TcA?=
 =?us-ascii?Q?8P5a8J3vUT7B4jRO1aNSHHcO7WgcnWW+16IvvRiuNdL/dBhy1A76GpSseQsm?=
 =?us-ascii?Q?z34dDb8f2hgIy9TiuzPCRkBouJ0gC5A8fik4P4/8MI5JU39UcJUZL15ZQYuJ?=
 =?us-ascii?Q?ox6/Cxbn8Mua/J3GwO5v0j8a71ZcGLi0WJVDziqKxmZUSQnwtNQN7OYGECXd?=
 =?us-ascii?Q?GNluojeUyXiB5/LP76Wxizfl7r6uwAJBrvteTiXADBqs8pni8nmNLBe6kfyV?=
 =?us-ascii?Q?8vCg5RuOo31CrkgsCvB5diUGwjS84ag29HK6jowOypHcN3hrYu7OqooZ03/0?=
 =?us-ascii?Q?rIPKtNDqVkiQ5+nysevjBSQoFu+SY/9uzTfWpBimAsLHDvW0QFVx2khtNA8O?=
 =?us-ascii?Q?M/oUqOmWrFJIO8bqeWGsoVwGeR3JnZ87lMCM0L6iYByBJSualLI932jwZOCn?=
 =?us-ascii?Q?49+Dkt75MSZwzZ7PhltzdNoZ3na7za8Pc7LrUSV9t+9xJBhHTohUhn8cF/Vc?=
 =?us-ascii?Q?tzWidqJQXQnO3K88/uumw3pC?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 747582c5-f71b-4c26-1c9e-08d8e6adf5aa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 05:56:50.0790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnyfljKtZ6wS3ADZpGZXhALQPCqJCrdBIZaPrF0cibtqdaRgoqUoKJQCoQkmys1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5625
Received-SPF: pass client-ip=40.107.236.103; envelope-from=alxndr@bu.edu;
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
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, darren.kenny@oracle.com,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Fuzzing this device might lead to better coverage over the general scsi
code.

 tests/qtest/fuzz/generic_fuzz_configs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 5d599765c4..3f4f4d0ec5 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -208,6 +208,12 @@ const generic_fuzz_config predefined_configs[] = {
         .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
         "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
         .objects = "megasas*",
+    },{
+        .name = "am53c974",
+        .args = "-device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+                 "-drive id=disk0,if=none,file=null-co://,format=raw "
+                 "-nodefaults",
+        .objects = "*esp* *scsi* *am53c974*",
     },{
         .name = "ac97",
         .args = "-machine q35 -nodefaults "
-- 
2.27.0


