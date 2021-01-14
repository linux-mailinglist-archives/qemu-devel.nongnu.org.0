Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A432F5D22
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:18:19 +0100 (CET)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzylm-0001q7-FR
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Changqing.Li@windriver.com>)
 id 1kzxRn-0004wk-Sr
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:53:35 -0500
Received: from mail-dm6nam10on2053.outbound.protection.outlook.com
 ([40.107.93.53]:50048 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Changqing.Li@windriver.com>)
 id 1kzxRk-0007JE-Ee
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:53:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7BhF4hZNB4oWIgNKzZzzbjZITL7eNsI2tnmKaQZQKODbpm/3PBgmd2huOArFmkdLzZn2rmBoyJnRV+eCpg3aicAt3YHte0tXwaxfs4N2qaCd+j914UWNiFROxsjgYRQ+WSlAxtyLdgPyF4bnxn9z1/k51f5sNttgFSX4rcurljk5ehI8UXc05oJim52s5OK2ZoIdOKLCEpIhEsBLd33LoS0F465exINNd8FisO5h5ZOOkCu3ZMR9CDun4+GY/GRzckupdPyjekN4qGeOkVk2U01p7v1NY7UMvAip8FKF5MYa0A4uvfI9SKIWRh09l92r19eIF0gXQPMpdYC4+qbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AebNmLGRBZvXJzRSbprzWoLAhEObL3Tgy/K1CCN6Vnk=;
 b=PfjTy9e1Kert3YNAretKR0QoYzvdrKPR02xHhDctrld68EpN3dShsaqJBGX33qYB/O9MACLFsuDIoFe39nYNetCsEWFWbRQ1KPZ/E0d0iskKZV+TrLAiULpOg2dpS6a3dkNxau7vW9lCQ+/03LJQWmS4oparN8CCGbkmTrEewFPJ7ZFXUWqMRLIV6l9opovPuSWRXDVpv2BcqSQkOP1NWNR9mhiDwxMjOVULBwy4ERaOGsyJGkE4mzFNeIVCH3pzlHtWmM6L//kMV8Z9gMIzU6VREM09oay4XjEzKvamxhxQwT37wtuGsjCtuDnzWrXRFEU7+6wgnc2f7pUWHVeIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AebNmLGRBZvXJzRSbprzWoLAhEObL3Tgy/K1CCN6Vnk=;
 b=VVgSBs4e3qiYi3ao6Io347M1iDQDGwUOEW2P0IQn9hnzHskKCasp/oWQVkJh/bNt+tHPkzj8nkh+TGTzJ/KI2GoAp0EvpnQnHYu8R+3mwtqpTzmQdCdmglR/bCTQ93P9mOSkiJq5tx4BXuzucfcytlCfnXsjKkRTOBcS3gkcb5U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 07:38:24 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 07:38:24 +0000
From: Changqing Li <changqing.li@windriver.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/meson.build: use relative path to refer to files
Date: Thu, 14 Jan 2021 15:38:07 +0800
Message-Id: <20210114073807.6720-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::17) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by
 HK0PR01CA0053.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Thu, 14 Jan 2021 07:38:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63fa6dcf-0ea4-41cb-c25c-08d8b85f5fed
X-MS-TrafficTypeDiagnostic: SA0PR11MB4672:
X-Microsoft-Antispam-PRVS: <SA0PR11MB467289136A83E5B4CE3D28C582A80@SA0PR11MB4672.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnrZiIwbZ9R4cm4qjEeMiM3A7kWpJI7JT4eKsxIcqTmONu2MEgKkEjtJw6fdcbto1ffmnUnShYeT0KljJtJv5d7VrrvLk8mgbVIH/n55RtQfeEG1sDH1rPDKobzI4JG7kOwc69qd1kiYOdogWqsUhrXmHLnaJqAAUCCMW5wiZl1Lw0Hi/WWrofunRzxQwzf7E2cmo71tcSNfSwuQ2BX5ZII8u2lVOFaOJubxpnQcrx/hJizJNmIF0vrbHm/4NvXGLGXW9wFx+Nf29ZstFXTUtWNwxz4g0PaesvDHpBE7NPZekKcFOrCi4VfCH/FPhDmtKilZGpkpPb9So0UX5WiKOnqqnIXuAzxd96GigwSM4FiB5VFdYWjKsf9niKRIAyhxRczbRtM7GXWxaqjVDu/TyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2557.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39850400004)(66946007)(478600001)(956004)(2616005)(6666004)(44832011)(6512007)(2906002)(66556008)(8936002)(66476007)(1076003)(52116002)(6506007)(36756003)(8676002)(83380400001)(6916009)(26005)(86362001)(16526019)(186003)(4744005)(6486002)(316002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QZXZefKKgyAN3Fxy9zwOk++fUJSH8/2ndWUuE+1OmkpRsLdSeEh/aPdz9jCz?=
 =?us-ascii?Q?+dUifHxrXBR42xdHgB1xvK7bzuqO+e1AVrOKc40RfEQCBfOuJSsbb0/whbko?=
 =?us-ascii?Q?1sTc86VzCzy1J7qMZq5wUawCLpUf2s78g0XB9ChwAoMZfo4713HPIgYUEsAp?=
 =?us-ascii?Q?jFCw9vRTjQQP34LQYAHPDFgnYM0g2xBSJtKV9+z8F+Ha2HS1X33c47jcwdv3?=
 =?us-ascii?Q?RDtnSddH/FN3MCXtaJ5Q2wOuCykk39wnRUs9RwTk18G5efWe286h+VxVlBwC?=
 =?us-ascii?Q?+V28bQ/mJhbrLB74C6axe1IPcHaFaqbh6PnwI4BwNkiMcIQcYJYUIjNR+hLu?=
 =?us-ascii?Q?/7GMWvB72G7lQWpIrnZLu544Kin+/wactrSZ60qvCnFWfuz31DHIw48CZUih?=
 =?us-ascii?Q?oq0Kc21PLOpn4qiQ1+q2mxgeRp93EynDfcmQMgLBo+MTaL46OI/J+RcS7O5y?=
 =?us-ascii?Q?ea69i9j69mPHqyXpkAcYSdMmdLxl5gReFg2nL/vI72laYd3LjtiGBupflWLG?=
 =?us-ascii?Q?g1dEeIv4Tx1hfQiPntDySfh4XSkP4EOl3XspNay2sxYw9MWEawZCjist3Aiq?=
 =?us-ascii?Q?V0CRzcGpfmNv1BnTu90XLK7Xpe5Vpi9bwQ/Y2RjvfE1qDAtFeKqE0lkfXTR/?=
 =?us-ascii?Q?HEp3kpoizrNtWy52dq+w/czltduG4SwGFBAzcwDGi2ziUwElgm5Q2i+t09Mc?=
 =?us-ascii?Q?8sROZczWTB9MmU2iZGO53w8EyY40yIIgvpeC1mlDsFkwb+5IMhch/0aKgHPM?=
 =?us-ascii?Q?e3eYEuS3ZW9kouRp6v/wG52rbcDdH3Mu6HWd7krFVpcDdWhOToxIKegiAmyV?=
 =?us-ascii?Q?dMCs9UY2GVkLz2ffiEy0X2RNZAHG7HishvaXDBPO5/aJQW9EUzrap8pgPaS4?=
 =?us-ascii?Q?RkWrBdjNnQWc/kx2e7nccEDdnHOCfRYXjW3h3dkz8sIUA0ORZ0MxwIdzDISw?=
 =?us-ascii?Q?mb2PFUdcRX7PLZKvQ+eOpEooBU8j9GybBoHt5/dBPoM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 07:38:24.2427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fa6dcf-0ea4-41cb-c25c-08d8b85f5fed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5c5ZoE5oZ2h1cieeDWPx4TyREfXbHIEslurpPIrKC9elBIGLp18kZQM3sY94DbigHadP/Mt7dgI8XvgEGYAUbJa4JXX/bZ8sNsmFsphxw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
Received-SPF: pass client-ip=40.107.93.53;
 envelope-from=Changqing.Li@windriver.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jan 2021 04:14:51 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix error like:
Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long

when build path is too long, use meson.source_root() will make this
filename too long. Fixed by using relative path to refer to files

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 tests/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 29ebaba48d..3b03c46c1e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -113,7 +113,7 @@ tests = {
   'test-keyval': [testqapi],
   'test-logging': [],
   'test-uuid': [],
-  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
+  'ptimer-test': ['ptimer-test-stubs.c', '../hw/core/ptimer.c'],
   'test-qapi-util': [],
 }
 
-- 
2.17.1


