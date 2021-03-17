Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC733E79B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:26:50 +0100 (CET)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMMpd-00012N-7o
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMln-0005O3-Aq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:51 -0400
Received: from mail-eopbgr750053.outbound.protection.outlook.com
 ([40.107.75.53]:4470 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMll-00011A-LE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4WREGwPwNnScweP7rBfNl6yPWTM2cvRRgP1nb4cU9rCi1rE4zJ2k5ihv1SPa1cMTpGey5mSQWAG2bfE9CXPtYqLX9L0WvbJXRPMDQSRTgerGiI2mBptY1G4ZUn2e3wdoI4SPJImAFmxNyOZMEc8+1cAJN64PefvR/erciNfH6jzg2u1eym/L2hdt9jqN5LpQF1K4iFAURShX/i4ZCpe94wH318oMQPtiIYc44vb5vHGdlwMQp2iXjkfWuxcXSePNQ8y4wtDIlAeMdO78/WVrsQkoD/2GJSYqXjiMi073pz7UBS6aW0I2c8wlZSMyFyixwgg1QnGiIqfZvCPHnGmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ni11o5P+K1UJycK+Snv4s8qZGFxZ6Z5ZyeEmtuvSy4=;
 b=k70iHwbhjYL7g95GKL6lCjHYjJ7CNP2/5kah+rn/pNyMU6DBYJ4bgQkjpDDkoLAOSojVyO15pVWiIGtv8h6AJ4xSaIk+H3EAsGrC4ZZVcWSFOG0QBxkdEKZBmptYwyQLAFIT5YC6h5/3hkTHBN/dTBBA5e6/9ttjPdj0vJYzpTwIPpax5SBA0yUBqPSKeZ+NLoXMjYx4NcqC9GsclKRBjeJg1J5C2wkoax1NsIyoY35s9AWVwtoRQjmy1cseww/caYYAaSEmELlfp9JfswxT/t223sCq3bsvzptrg0s2gaA52UvCmduEHJdsWcaB8CK2iI9aOd72+3HFhwa81ev78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ni11o5P+K1UJycK+Snv4s8qZGFxZ6Z5ZyeEmtuvSy4=;
 b=B/EM02UEepyDRAJ9jThVlGgXuf0w2YpfHWhjRXj3sWLkiYAymdc+sVR2SnaeaofmxxKjioTySS5rAn5hscZLg2eMRwOAnSgijJ55+U9xOuu1godUj8F+OanDMhD3SHXTg89nMAP8yjpA4x+UF11pUCpet7YGLh0zVqL3nIIUQXE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:46 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:46 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 4/6] qga: Open brace '{' following struct go on the same
Date: Tue, 16 Mar 2021 22:22:15 -0500
Message-Id: <20210317032217.1460684-5-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
References: <20210317032217.1460684-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:408:e6::25) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:e6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:22:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa6fadd5-a5ca-41f3-e2e7-08d8e8f3ef78
X-MS-TrafficTypeDiagnostic: CH2PR12MB4954:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49542B0B68E8A2ECFA5F187B956A9@CH2PR12MB4954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NxKPIi/MU+7v17suUKxsNboV0ChGLB9UfmTnJvNpMz9mLfGERQ1zEV4k1HaD0gdJLxwbN91Z0yzYxwzfjD0LQEGeZwItUK5TvfskjJsV2eCLmUfpcauje4f9CVkACjZgnBeS/WXVY/+DOCWie5RFzrXyDySCZFspGzeMPvVeehmrNi4l4i5byYdmdYZbHKV51hh2HNJDVe9DMKPdVD6UObmLnHDMDmrsqJS0M3m+5ALqBrhQB1O3QdhVyKmazL4qUHAh4jEHnA80qA0MCd4a8k1wFBYDgjWsY9uRAkQHnb1DRyeSADN+dbC2vtF+p9iFN+nSlh5ZeXU95w+f5nxMuD4Ji1s6TEVsTHNt/I/sCD2ySvf4FySykjhhFqudkXmarrLs67xbEfa/9Aq+R18M96MmMIZ4P+5YTOtsMcKhimd7Mn30YJtBxJ8dtICQwtAKOVrRWIinztk2nlrJSytCqDeVqhmdcGr0QYoeamZ+NqqHhgHL/LEDjOnRBAjuLqf5jlXOaB29WU2193BJ8E1LoEo7zI20Y0RWkE3pouUOwEHzYkGJnEuZWlEwSEqORiM6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(8676002)(8936002)(4326008)(478600001)(316002)(26005)(66946007)(54906003)(83380400001)(1076003)(2616005)(66476007)(956004)(66556008)(86362001)(6916009)(36756003)(44832011)(6666004)(6486002)(52116002)(16526019)(6496006)(5660300002)(2906002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmtCRUtxU0RJcDdlV1VLR0JVbmFKK2RjUzd2cm8wT1hLZGVITTJSdmR6aWdF?=
 =?utf-8?B?ekV2NDZ6Wm5EaGcwK0Y0MGRtRk16VFZBZUtnR0ljYnBQRlZ6aXFqRk9SOEpJ?=
 =?utf-8?B?ZDlEZnVrQmM3Q3AyYkZtQVEzNUNMekgwTi9zT29SUkQyem5CTUNteGpmTXUw?=
 =?utf-8?B?YjJKWEVTQ0w4c0VtdlcwU3pBVFpWUXFUVFdVK1RZK21HeXRQbE5BTjA1N3Qy?=
 =?utf-8?B?bjdGUWlOQXF3ejY4ZlVMb2JJNzlsS29ZV3NqSmhvYkprSDFJZHd4WmVGTDZD?=
 =?utf-8?B?MFVTNG0vWkhJK082WTYydWgvalFiMm1ZWFJiVEJuL3JReDNNREdlcjdvZEEr?=
 =?utf-8?B?UWFVRGFLd3NTdEJQemhXSEh5NEFXVGlwcXNxUDg3VlF3TlN0MUlqMWp0NVV3?=
 =?utf-8?B?NmF4Nm45a0JKc2Z1dFBheEdUS1ord0pNMC9oclJNYTdxMlIwVy9wQk8vOWhj?=
 =?utf-8?B?NmI0RGxlT0E3YUJDZFVNTWlweFBXeGMybWl0NldkVFh3THdiSXNwZjhScFQw?=
 =?utf-8?B?ZVZwZ2tGTjk5amdlV01HNHJXM2JlcW9nbXhVV3BvaFNGaUp6RVFHRCtFc0d5?=
 =?utf-8?B?eXFrNWg5ZldwVGVGZzNkNzZkYUFMR1B6bzZ1Q3didm5VRVYxNU43QTRZWHA5?=
 =?utf-8?B?Wkp4cFdocDN5dHBlT0dCQ1k2Wnc2UkdiRzF6UnkyQW1jMW1xNnFKNGFzOU95?=
 =?utf-8?B?QmNQMzBTRHNMMG1ick53TFNjL2FwbVdoL1dpQys0ZUpRY3RTdnZvNXZoMEZP?=
 =?utf-8?B?LzdJSzJVb1JUZmtFRk1kRUV2Ylp5NWFJSFJRaWFSL2l5WXNlR1crTmFlL1R0?=
 =?utf-8?B?VFp0UHptQS9WK3ZhTUtsakRJenJaY2NWdkNpSkZzS0FTSUgwbGFqT2dSbk90?=
 =?utf-8?B?bHRySjlWZUFuT1FRM2lacmJPRG5WSG54a3JDTzhrVE1yUjlRR2MyZXdIOXA3?=
 =?utf-8?B?Z3dnOG1MTVZrTC9RZzlNK2JyWXhHR2luaVdvVWYxM0Fac0tXRnJQZTNKWTFC?=
 =?utf-8?B?UWwvUWtjUkxxdDFIM21aUThzakNQVStoS1MyOHhQS1BWWkN0dlFVWGhNNHZu?=
 =?utf-8?B?enh0MkdiNlZQaDhhL0FVdlpyNUljQjMxQWtmb29TQzQwZkZjSDF0Nzdic0M5?=
 =?utf-8?B?bkJBRWRDZURnOG84bkpkc0ZnREVUVkpTK2loM015eDBHWlJickxMbGVUT2ZL?=
 =?utf-8?B?VGQrUVducCtkSmVUQ1FxK2k5QmVNeGJaWkpKTWYza2swVXRzQnh3dkVWdnFI?=
 =?utf-8?B?YVdsSXlGc21ZOC9ZeUlhczZBaVo0ZFAxdzB1REFLMlZXWGxJS3AyaDlnNmhx?=
 =?utf-8?B?NCt6ZVk5SzhReUcwZmtRQk5sS0VlSUFrS0l5ejRiQjVMTm0zaVNUMUlaTkFl?=
 =?utf-8?B?c0FPZ0YvekUrVGE1aG9QNnNxQ1RnZUdDb3N3SVREK05aL0ttSmRqU3o0Ylh4?=
 =?utf-8?B?OUU2bkJ6ditSOXhCNndVNWlvZFJJajBBUVFVMVFhd0dSYXlLVG0yK2E4YlBE?=
 =?utf-8?B?Uk5NZGlWYXErZEhIMTlZd1FETjRtd1hoSTdneEhtUzJuSWMzV1h2WUYzR2ZR?=
 =?utf-8?B?Y2xjZVArb3d1dWlkQlpzcVVrVHYyUjlIdHhLU1Z3eDk5aVMxTk82aEZPWUti?=
 =?utf-8?B?bHZoMldRQStIdFBlWW5GSXB3K24yLzhsSThiaGNOZkFSTFRaSFpGZ0lwQ0RN?=
 =?utf-8?B?Y2JDSlBIdXBjdXk4djBjWVRKQTZGZkRMcTdhbTV3eko0U0hBeERUZDZPV1dj?=
 =?utf-8?Q?cBOwyelpVaJRwX4v99SE+c4g3UOm3SXKz9i1Nv3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6fadd5-a5ca-41f3-e2e7-08d8e8f3ef78
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:46.6971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E/ubV4gn2F/cYNuZDJAQrNHovJuXsRymKRY40NAo64BXMiJHA8gaB4UWW6T5dusxLcc752TzZY78IsB2++s+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954
Received-SPF: softfail client-ip=40.107.75.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: AlexChen <alex.chen@huawei.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 560490467b..20db0058db 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -686,8 +686,7 @@ DWORD WINAPI service_ctrl_handler(DWORD ctrl, DWORD type, LPVOID data,
     DWORD ret = NO_ERROR;
     GAService *service = &ga_state->service;
 
-    switch (ctrl)
-    {
+    switch (ctrl) {
         case SERVICE_CONTROL_STOP:
         case SERVICE_CONTROL_SHUTDOWN:
             quit_handler(SIGTERM);
-- 
2.25.1


