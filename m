Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47292F9508
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:13:09 +0100 (CET)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1EQ8-000432-E6
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1EO4-00034x-SY
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:11:01 -0500
Received: from mail-bn8nam11on2114.outbound.protection.outlook.com
 ([40.107.236.114]:56801 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1EO3-0003aU-2P
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:11:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHtfCEyDDCEvmgXq3chEUoVyOKPz/VN8JnNz9G/g60b5Nq1rfrnUXAiYDc7dWaTXz79a9q7ech9CEBR4JYgqqc6Mu1UiCYzf6bb8qGiFAdrfE5qZ2uVmYdVwdeqiuHYrMgE2PUztrPpXtloX7HNxmf9hBwUyocIA9AnsHNndjwhQ51EwaWMIu/KnLCsA93dPS8pIBBLW17d71FPhWsuDmX1OVJ+oEGM51BmDOWUMgmId50fxuNeEsL328ZTV1VPHneVDTSEqFN0MkognjPTM9Vb3X+7eH93gPzvFhs9uInHJjmEsurORJ0TW2WIhb5T6vipjdF/Eb4Ou0NNaJwcc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWKL+Q42lR+TCnElUbCZntD2OA8yDproKc7yO/giV+M=;
 b=ZGj3s4h4mvGp26KKl83iVV6etXUMvyBM4rf0CHnHSu4c9ZYe5phPZrEJwsPvzkTMYVS10WCam1ZHwgxKMUDkyBWZth/IBe2+IQ9GwkfsBgt3uZOu3tuqH+6n9PLN23rXWzf7AvnQsWc48eZo/fwFxwqXNfA0jeUszYlwOCGeBq0FZZNtwRcmv4QuKf7LVEg/uAVXlElpR6g6vBMy2H5oqHtCdmTpthCNOI/CUNAL2sUiD5RIjrnNEMHCOPYmddxEAzOlEMZXjobV40KGmcEnf1cWJ2OrwHg+468ehrGiUosQksMh077R2EZ0hG8lwia0bNt7AwDRJEldDfEjmnrH3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWKL+Q42lR+TCnElUbCZntD2OA8yDproKc7yO/giV+M=;
 b=hyTQMXQ1nd15uoqzJ4P40Vct2hj176lBcifl0HP+8SZ1on4j7zxiGn2ZdVMOSGvdnfJcClHA1Sw8mP/S2B9e15AGwPOnwcExenRqpAk0ETLQj5C61kXjFXfD3qsR53j5+qTmlMIBo8lOO9ir+FUx/l5K44/Evn29g2Y96EY3kGQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:10:26 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:10:26 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] docs/fuzz: fix pre-meson path
Date: Sun, 17 Jan 2021 15:10:13 -0500
Message-Id: <20210117201014.271610-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117201014.271610-1-alxndr@bu.edu>
References: <20210117201014.271610-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BLAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:32b::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:32b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend
 Transport; Sun, 17 Jan 2021 20:10:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f72f1d85-e9ea-46e8-f721-08d8bb23edac
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5852E81461AA0B7641A91047BAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FO8FnW/JlNgxiQNrxtCLfPRMUldLkIGr9/zpoFRZ3PfaN9z4Eny2mOsvZwK0ZykpL5eFghUqqw0CIn4bxzpqbPhN9y/0+dMuQq38HMulAfHYxWowfotSxTW8dpsUgm+ToDxGOh0M36EngL2IH6O2YgxOuQIRZCjvXU0BZnVnusJD6BPB6s6YjU9J0nEnkeDVH//tGvDzp00YbbfR/FlYQCOzS7ZS7tuH/ta8UaZWYSD1jemNRsKBM/UsNnKDDQ7DQAINLifVmcKliII0Z6eJKkM8nZtR12dvn1TakU4HGWzZ8jUvd3kyPcWjf5V9DSzHUuOqkqNsbcVoH5rkiyQy5ZGtRSNHyUlXkgbTtBVvLDykYD9FnNTGx8ZbDZDdCvZveTxrS3KAloZNEhzY2vSDCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(52116002)(786003)(6506007)(6486002)(8936002)(186003)(26005)(16526019)(316002)(1076003)(75432002)(2906002)(5660300002)(6916009)(6512007)(66476007)(66556008)(66946007)(86362001)(54906003)(478600001)(36756003)(6666004)(956004)(4326008)(2616005)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?th4g3taTlF9R9AMBHxSsrA1wrHEipeRiIXHl+hNdvtiqXQDXi4F8pmemGBm1?=
 =?us-ascii?Q?gwsT3qeBwvHYT4A71f5vV4U54RWhv3My1QVWnPZYW/PRjIeFJ2u0wT9yG5pS?=
 =?us-ascii?Q?Y0mfM6b8mTUX8t/NDzflQqLx+ug3YEB/r/Yevl6eJreuDefxk0GuqG7pt0Jh?=
 =?us-ascii?Q?hx8b69M/nQsT0jTzHLAiQt8TBLB1aixyE8JHnF7HVlUsMB9xR3+fLDDIcVQ/?=
 =?us-ascii?Q?72i0IQh4qQvn/Uy1MrnpaH6zR4xxKq2BTIQXAo0adM9MS1qPa8BGxSnDD9uC?=
 =?us-ascii?Q?hxKAPaschwyQwDO0aXEk2mr+t+yDUttkhVQFmUCwQaBsn5H9Vo81KfJnuUe3?=
 =?us-ascii?Q?1SF+SiGFzbELhEV+LACYI8ECCKjyGrU4MFqCcoKOXSv3rSA0Cvpy1QSrRQCt?=
 =?us-ascii?Q?Tv/5RT8wThQcTJvb99X2Mubvfu9T3ZaO5+ueyAs/FUAIgeoNCsDf2/gYDEV4?=
 =?us-ascii?Q?N8gQfwGBVg2Sf7u1tptBMuQzh6J6zM1JuIQ5C6boyNT7yooREufZCW19BGCw?=
 =?us-ascii?Q?c9/3FORUVSv7hAbiuKrwWQ6U4GakGK1qCFWRwsk/Cf08C7sXy8kxv0PuazA4?=
 =?us-ascii?Q?APZD6+2ZVFDYaJSkTZf2C+5zyA1xXP1oPsNuzM7UWvNMTlH1U8Uy9YzpPqGN?=
 =?us-ascii?Q?aEB4TQwqg3h1R9cBh1IL7UEidtYLCaNXsUyt29C7SZGVbnN/rwLP7Eh058RQ?=
 =?us-ascii?Q?jUPpB/i+CkQMRmgHPdTLH/74DGuNPacGNvlGo6Ntl8/ocrMYY67hQ9z9EiWm?=
 =?us-ascii?Q?ii3fLT1YLDc0GRd1ah2LGEbTAnFoeMyrdARZSlO4kKTWkqRr2MdXbGIybZd8?=
 =?us-ascii?Q?YGFIQoSQvGvs2XjWY7VHqCZSgeXmuCx9VBiFsrgiDAM6ga2NwgreDnUbZ1aD?=
 =?us-ascii?Q?v3yNwmsbeiqz/zz/OeCJkibAvPh3S28RSYwWbnOOcq49Pml0lZ0RdDkiCDni?=
 =?us-ascii?Q?T9oDSyLB5+fLoYxuSybBgypwgaD0nt9bxWjQrN58hAg/W3m6j47qvcZej+/W?=
 =?us-ascii?Q?8Liw?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f72f1d85-e9ea-46e8-f721-08d8bb23edac
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:10:26.1031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Bbrm9RITONHSn/o5vc7IEqedxtNLAMCLsMMbAVwsZK2Y7EXVschVmkytJBSSOyN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5852
Received-SPF: pass client-ip=40.107.236.114; envelope-from=alxndr@bu.edu;
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 8792358854..b9bb07988b 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -119,7 +119,7 @@ Adding a new fuzzer
 
 Coverage over virtual devices can be improved by adding additional fuzzers.
 Fuzzers are kept in ``tests/qtest/fuzz/`` and should be added to
-``tests/qtest/fuzz/Makefile.include``
+``tests/qtest/fuzz/meson.build``
 
 Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 
@@ -128,8 +128,7 @@ Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 2. Write the fuzzing code using the libqtest/libqos API. See existing fuzzers
    for reference.
 
-3. Register the fuzzer in ``tests/fuzz/Makefile.include`` by appending the
-   corresponding object to fuzz-obj-y
+3. Add the fuzzer to ``tests/qtest/fuzz/meson.build``.
 
 Fuzzers can be more-or-less thought of as special qtest programs which can
 modify the qtest commands and/or qtest command arguments based on inputs
-- 
2.28.0


