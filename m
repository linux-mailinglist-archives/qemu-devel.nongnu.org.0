Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED83ACF6E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:51:33 +0200 (CEST)
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGmK-0003gK-E2
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkA-000119-AB
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:18 -0400
Received: from mail-bn8nam11on2115.outbound.protection.outlook.com
 ([40.107.236.115]:23557 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGk8-0004iY-Ti
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/PZjS94K//kOrgDkGr5nCePJH/VZerELoHJvoCGfEKmglbkX86KQP4eUp0qWLYDWt5vhWk3ch8S091o0aQi/gDxbZs8BZKnt6aruTlEfFVRVNC1ojK/h21hM3/+RhiLzQE3Y5ZnTuvsGsK9XAdZQfjUXZiFt/HtSqNufEaA+aP169HtgYVGvnwoB9vGJZNJh2hlzbHX88luD9V0iGlcxBMrdrDtlEu0+yhGJuaqR9LQ54KFTHRIaKqUV/R0I2E832aJ94EdKIoR77FNXwXbUBUyizDcD1W4OSskeGIHMlfdRXo4SHHt8XmuZ+TBf/+tfNMxa7Z6nfXqZ1HGKpeXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0q1++Z0ojld9ldaar94AFdds8ftdsPHD9ch82w5EcI=;
 b=EFSNvNe/GtVNcoRo8gvRNHrAgvB4pRNnu13REezQBdOvQ+NcZo4jyFbCIPYrTEWaDoV8oK4OvUkR0ZGu9itGy3D5agwFwtRktoYcGTq6RecKeKJrYDy+GHyOqfRurCDDTPJvcsRXZZMdJtOg3LW5h5BkCuOcS9fngCLujy/6XYeow2rw5Q5Txm1jCxriyfAwzrgLHSvaE8SIi9bLxzhWQCS6qGiNsh4kqrAT8uzfUiVGBHrd26jcajE9femUzZEySkqp1/dyDfDaTzFy2SOOi30KAWXRG0vA82q5IKH7sx3iI6s3v69DGmRYWtyB2bInQZTa2oluHtvrXAVaeQ+SYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0q1++Z0ojld9ldaar94AFdds8ftdsPHD9ch82w5EcI=;
 b=2snRXB/TzwzI09wbyELhHg2RrtinztkOVmMbUhtsVmyGXVbvm2we3qctHYdeGCEkPzV5yzEW/GLOraWG42Kq3eSZiG5aXnJIhyCNsM4z1k/0Kmv2/Zj8cEO5x58Ob6mQlKTfSPWDpnm2q0J1vB535xs1KzbG6MiF/Pcu77saay0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 15:49:03 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:49:03 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] Miscellaneous fuzzer changes
Date: Fri, 18 Jun 2021 11:48:48 -0400
Message-Id: <20210618154852.5673-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:208:e8::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR20CA0006.namprd20.prod.outlook.com (2603:10b6:208:e8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 15:49:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df1eaeb-9ff2-40bb-0f49-08d9327098fe
X-MS-TrafficTypeDiagnostic: SA2PR03MB5769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57696137F75AE77B994FAAD1BA0D9@SA2PR03MB5769.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHKV5MvRF8lnC24QTjnWETnqA/VDG6FiwwXjb++uE34Z/gfkMUdZ3PTVdgGaqSGfqq8rZqoPtqPCWuAU/NMXkyjBCTbo/03UQvc8nL1PxsZXtNtM+Pg+txr15/9ghw6RQqW7mfKiXa1fL66nCIzMe/MWyf6FIHWbZ4tH+/b/6leHGd4bMejwiJEOVlkUBWca1KUJeBQJk0GjMp3meQw+GI9nZEoeKT37a1Kh139ekbwP7NusmPutKuAx5UhJJRME2oOk11Zv/fD3CI3ECnDrGcGrjnQC6Zp9K5JRWxLOYxkDWOgerdbztMhNo85vrV861F2ONfkHyAHyhyuhvkpX+vyZ1NktZTE6kAWPDAFw3fj3COqed5wKTstlxi+SzKMtds53zY+iHSh9MYoykeK+V1HT25TkOthBj7t4RyvV/k4Nxjf9ykdvTdzJlFhXokm+LDzDBFO32uGzkf7M/hHE7GE2xwh2T+9B8ss/opomc2/IA3+Z9TaObH4fzXspDlGrLXDlToddjewN3umxzq2jvvCRdu1i4mv1wwwdXcFFZq2ybIarchzP62EDJZVK41CbvHgFsZykxkqcsHdwSaGHFlLzR44P2S6UUcyc7prMX7yrNDE/nx3V2TYCt+e0nPlqZewMhWA/qZbF1QDDBnECLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(478600001)(66946007)(66476007)(8676002)(2906002)(786003)(5660300002)(26005)(6666004)(1076003)(8936002)(6512007)(316002)(4326008)(75432002)(186003)(956004)(38350700002)(38100700002)(16526019)(2616005)(66556008)(4744005)(36756003)(83380400001)(6486002)(86362001)(6506007)(52116002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H4pfsHx2D08mYQSCgV7YoNyG2n+3pX1gvwXhlPICqjRpU6iW0X6wTIquyaif?=
 =?us-ascii?Q?JIm+rjSXHKVDF722OFk/vPM0u0ar6f5+sKKW+NkZifxdWKKJocWHSGV2Nsag?=
 =?us-ascii?Q?sw0il3qN47ZVIDLfcQL84Vew6JNvjKWObLcLxXVP5ufPWJcR1KzJZLG9/buw?=
 =?us-ascii?Q?mDFM0FMKrAnBtMooZLwx9LImoHn/oKS81B8NzOoTwadJbLDILgzg3DMkQVJm?=
 =?us-ascii?Q?9V9NIQIhWjum+/SUt55Lnm3BxkyXNrbII87lifdS6kJkTSA1R3YO7Q46KR26?=
 =?us-ascii?Q?j9NHn54j7z/pCfTOxGF/OaYjsqxAhSS/yESJzQyTHFPmsr8C+nff+xTq/Bw6?=
 =?us-ascii?Q?dDUOH/o9RGSyvhmr2DPHxILP3DcK/sWNObwPHX2zGWOrTwF8dEIw7eBgP7G7?=
 =?us-ascii?Q?MwxjsyLAzineNBx8u4azHBGGOE3YF0I0YT119AsPMA8GlhtPjjwM3GGXyC1B?=
 =?us-ascii?Q?E36CHdwR8ahxJkX8MyzewrYNOzjKa0I6RFdn2XpltwlnOv5eFDlUINCRw46N?=
 =?us-ascii?Q?s3HAWSRthNJU3acSD1KgQ4DUpm7QcH+StFAnLMAdwdEopbdZpRIA+Ppbdn4H?=
 =?us-ascii?Q?WCRHhgxomLsUVdMoLp++9/ACFeFuVFZDvnIiSkjLAw0YzBmyJJf0KWsYdHbf?=
 =?us-ascii?Q?LJerkoZyCu4bvDvHdIfWE3e0EIK9wT48bPHRtFkwbuPqaP3kKfPoZ5F07vOf?=
 =?us-ascii?Q?l8qDiAEdtXY8nxpYmuwrzms1hy2SArKDsGga+Vbg+soZxzBJ6rU6FFxAdtmx?=
 =?us-ascii?Q?NxYl2R1iHH/CtIndx+culCDQ/ygtaOL2elM7xNmwEQv0+mO8aAzyq2uunvss?=
 =?us-ascii?Q?HLu+tGTwD/MDLejojxOuydYJbJIaWLgOwVW8F9LcC+CoTBcmLt2FCOS6UAbk?=
 =?us-ascii?Q?tNojNoxorjnAVfgYP3OtyIxv+rOlp9sXfZoWxTzb5ONCOiJNKYqUBlvNjw6k?=
 =?us-ascii?Q?kCCzM4P6/oSPpOf87hiErIJPsXj5lVjEJdngiCkcMsTneIVjEcPg46Rpkc8Q?=
 =?us-ascii?Q?eS3YQJONrRpZj+5+b1Jx9vEr0/9sIpxY9bskTBMAUlsEVLNt7+I24Q8t/omp?=
 =?us-ascii?Q?2C0z4quKkgSMPpg9j0I5JMRPbopCQ5j56KC5HzAiEzPOHWFOfrigXQEOdzIJ?=
 =?us-ascii?Q?F9QucxSsAvv3YzqO/rDxC8ue3i5qLpX8+NehRvE3VeNSsKDrFh9WrHRoXGua?=
 =?us-ascii?Q?u3EwCzDzbsBbhGJTAPlYn9T4SCKTdOdHOMVOJjIDpJ9LlT/49wr1EimZvX69?=
 =?us-ascii?Q?dQBsyIPTopdiap+4XsoMp6MIty23EU+JEn9gieBUR2HzlkPKrAGbu7vtsXQw?=
 =?us-ascii?Q?DJ9+Js9Pd5CnNpa6mg8t4FxF?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df1eaeb-9ff2-40bb-0f49-08d9327098fe
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:49:03.6967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DzbLiM9OeQad4DN39tQMxyJM6iasOsueuy3qsKxSWHLnULBfcW+wicYIupngf+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
Received-SPF: pass client-ip=40.107.236.115; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
    - Add the instrumentation filter to the instrumentation filter patch

These patches
1.) Change generic-fuzzer timeouts so they are reconfigured prior to
each individual IO command, to allow for longer-running inputs
2.) Add an instrumentation filter to prevent libfuzzer from tracking
noisy/irrelevant parts of the code.
3.) Fix the AC97 and ES1370 fuzzer configs

Alexander Bulekov (4):
  fuzz: adjust timeout to allow for longer inputs
  fuzz: add an instrumentation filter
  fuzz: fix the AC97 generic-fuzzer config.
  fuzz: fix the ES1370 generic-fuzzer config.

 configure                               |  4 ++++
 scripts/oss-fuzz/instrumentation-filter | 14 ++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c         | 13 +++++++++----
 tests/qtest/fuzz/generic_fuzz_configs.h |  4 ++--
 4 files changed, 29 insertions(+), 6 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter

-- 
2.28.0


