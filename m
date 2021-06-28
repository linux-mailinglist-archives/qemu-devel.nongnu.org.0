Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CB3B589F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:30:58 +0200 (CEST)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjrF-0006GZ-GB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjpZ-000554-7L
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:29:13 -0400
Received: from mail-bn8nam11on20713.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::713]:62432
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjpU-0007vi-Li
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:29:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MN0s1e8PVL3RicjBbbUnJo37SKTp2Dxc98ic8bnhUbDemGMvnlD/JwfRQ5KH8LlNTtulqUnYe8rj5Yb7F5oAkLEmIhHqdEpTZJMtjOjeH4TyCzgQQxBkPMcVpgEV75PlL1D/0aPDJA6cxahf9OoVRmIYRuXVNJaRZwztou147nneF8Uj/oYoygmPmHZLcwpQfOihnkwdLv/nT7/6RlwDRJg5nYsLFFAvUkZuYMDiauHzQwk+1GbbdVv2zhzvqVH+O7wazheJQSjPXrAmy41cAY7o39vdMAb+ChjSFLL22MqQSsGaPhCHglvgDgcC/gAy+laYTQqR4Cpi8+KyE4TVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9K2yUAkj433ZjQln7S6fMxGOSRT/KpLxZYd/jaabb8=;
 b=M6+QxeqJo39KFV2GrwBJ7j1Mi+o3DBspJnyXDzJiFNbpKfdRpW7jAL2IeTOuhuAu8Kb9B1T0Fvbq0DSbLuGYy7o/bKQvZVXF9vS5TGwedQaPWbtZIGSkedNrT22QBENCZWd/K3X2OB7+Y+Ib4Rjfii5CSnTQn2cu8fD1nTXTZ6qVeAHjQCBhrWVxla1hNngLOfoVTN0o90UIiMb9ioOnJlEJK5WOZn7ck53k1qZAJgo39nsFyjz1BPLWOEb4FxgC7KjKm32IgagBpuTagz7HPY9YcyEMVCglrWqWhUa08awrkBMslWJ1HWXg1qjB5EpRCheZtz38Nuw5aVg5h/y+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9K2yUAkj433ZjQln7S6fMxGOSRT/KpLxZYd/jaabb8=;
 b=EvhWyCSsNawoc5Be4QCvgqjN2IZNhJ5HGNn6AIApyw86XlKCaHUVEuDqgpB3bUFzwwJuxrlejL8YGPYJfsfMe+gIXam76nL8EvoVCV5PyDD+B6aIi43PoOJQpq5pwtn1TqUcq9b33+qpA+5LcO38gdnQcLubsN0FzLPXd138o2Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 05:24:03 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:24:02 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] Fuzzer pattern-matching, timeouts,
 and instrumentation-filtering
Date: Mon, 28 Jun 2021 01:23:46 -0400
Message-Id: <20210628052349.113262-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:91::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:91::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 05:24:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da778845-274a-4a6b-afe2-08d939f4f0c9
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB444673E0E00E5E1AE30CB844BA039@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rsEXbIInssxMwj7HaPtGqn5jwsxlBHjHsJ+dZ428Hi8FDJxg4qnWHJrUjR8gB6zOoHkBByzcAGSfZFlTX8jGkuz6tIMgt+XcVyiErtXCnGApwF5NHl1nW2NsxkvVjtoP102IsrghFA90nYyWaEHXH+3rYZBtCzE0wuNM1T8LxqBgNORHECd2c8PGcg29uj9H/HiwCP6jGyNzzQlaDVnzUORP7J8IJLE5nhPrkClQsPyjL9fH2uOnpgzW56dRk9M3ars+I8LNHdeLEvpmBLMikVEVzIptGZirEH5xG70umet3Idyg7tQ45y8nYFLELagGNMLVwOedocBxL63vExDPaWjbk3HEnq+I3iRjlSzkYXG2324Vov2HXyBdhhSOS7x2mcPrcABfAOQPqFiYeQyhXzxooKgOcib79NtIBOIk0iO9MKgQYRtnpm0uV+da/S7sG3WBOdFPFwAZ9kIC9HZstiiNFwP78z+gdaqyC57py0Z2eCXHWtGsS8TX8uLXW/euiqZdM/B5Ch8gPOKLioo6QqwT2m+fC8spLWlWr89uR0Y31W5hzx++Pan5gWu/mdyFLtHsJO35GAenKfm6iQ5qloi99rvOvBsXOlm5BtV0AkIgdnuKIGL2iu/1n6cQP2nEE/h02gz20Als/il76mWv5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(86362001)(16526019)(26005)(6916009)(52116002)(8676002)(786003)(2906002)(186003)(6512007)(4326008)(2616005)(36756003)(83380400001)(38100700002)(1076003)(956004)(316002)(6666004)(478600001)(8936002)(6506007)(38350700002)(6486002)(66556008)(66476007)(5660300002)(75432002)(66946007)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qhAXtCoRJAYSM9ERtWBj1Fi6wYSWm5Zw+4qdnGTtZydwMJwxuieuZ2xvv+wu?=
 =?us-ascii?Q?OP0UU205NSI3euU2CgLM8uNt6FsWZAA5fMMtHZ+8uVIrn+A7T68fyT53sc5V?=
 =?us-ascii?Q?Z5ShBtwolsEhgxVOzpB540nPhbbu4szZYTzwSek/veTe2GDEdv70bvHgtM8O?=
 =?us-ascii?Q?4SrbItmLMOsDcJofkV4/46GuBHrkhfkIrF+yQhV7VkYKvo4c3vTUkCwD599l?=
 =?us-ascii?Q?NnDmBH3nAjQa+AJHe2lEkjzkJZy3eYuj/KnP2ZpdzWKXQpemKtfM20N3fcFS?=
 =?us-ascii?Q?Djx89eZOubqNna8omRAeUe+KOyZLCbMzxv4fRiYeSzFLtm/dH/PqrdY7AED5?=
 =?us-ascii?Q?8WTdq4hjA0FRL+uPyQ1y9tNSFnQlm5r/AihpV56HQyPvis8dfVHF6Q9HBTVZ?=
 =?us-ascii?Q?YwQgItyskBru77pL8yVeRpBaDLLXreZaUKMU/wvGiM1eLljNQ8U9gI4mTtmq?=
 =?us-ascii?Q?x3DgPjr21XAWa7yOt07SrDmgBHOlxie/na+Xmo+29/IlBBOmc2P233f+poG4?=
 =?us-ascii?Q?APhprLxxPYI7YIBPJ5vBhKXD1iMX/kAck5YjI3AYZ46Tf04RgcjNaIHWrtPF?=
 =?us-ascii?Q?oLX6gN39Ra894MET+niuhFTGNE9nuflubbS2RUT4n0W+2VokygxNFeJF23ON?=
 =?us-ascii?Q?OZPQ2dg909xbc8CyS4+zTnJv8hDDX0YtZA/E6Fl47R3+15sJB0Wcq+aboC+y?=
 =?us-ascii?Q?W8o0fcRGWlhD489uHeyqn5/yn5fsZVnnY3HacuIXEbd7IpNy9FkoKzpf8BWT?=
 =?us-ascii?Q?f2rZFSyny4crQiB20YDPhuRzvOm29zockw87P+I4Ol9roKoZgwMD1Cpv6Ndm?=
 =?us-ascii?Q?YhZGc/IkkKdwJlJFb9fZ6SNp0AcEfZ9Hz2Q/Ydn88l6dTKssKqscOErHHBl8?=
 =?us-ascii?Q?lwDfG3aHb77RMeq7S0PCOG68EubvdRKZWdUDw19K0e3PhM3CxCOf5kvOyWeQ?=
 =?us-ascii?Q?7T79XvXjoy+GFWbfQkvOo4mkWk9AaTQAURztslInU6hCyq/He9Ep0n0T2lzQ?=
 =?us-ascii?Q?V5gCQv16fltMlw35JLgyeaipNQLFauOLj7gwLFRNsAGwBue/FdFpDt7e58jr?=
 =?us-ascii?Q?dPDWb+rgt0IyUMp3vB8CmqqjeKY6kMQuy8tbYyEmBEzvbwGejI74OaqXUcXA?=
 =?us-ascii?Q?Jr+CJn9c5l73BQa24esobyDBh7oMUXTcS0gXvQoSlt+3+X1Tm0mv3x+INkEw?=
 =?us-ascii?Q?VztNotnDOWUNhtu7yLVlgqlUPwPjPCJAUlzTloPx0y6lYAZQZxI3FXLGXH0K?=
 =?us-ascii?Q?58xV0cNHX4Zs+so7bTfnTWYkK3ydF46vUStxmS+WV5C0iGorf5u7qXvxHMxt?=
 =?us-ascii?Q?7IW5+V6fnJpX0FUBkoR/e8Ee?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: da778845-274a-4a6b-afe2-08d939f4f0c9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 05:24:02.6907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Px28+A6Tq10CByJ8caDnrBbQnadZALsWrbBOkWWFNhe7K2kL80ywXOMgzCWx5Wt9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=2a01:111:f400:7eae::713;
 envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: darren.kenny@oracle.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4:
    - Instead of changing the patterns in the AC97 and ES1370 configs,
      make the type/name pattern matching case-insensitive.
    - Copy the instrumentation filter into the build-dir, so it can be
      adapted on-the-fly.
v3:
    - Check in ./configure whether clang supports -fsanitize-coverage-allowlist
v2:
    - Add the instrumentation filter to the instrumentation filter patch

These patches
1.) Change generic-fuzzer timeouts so they are reconfigured prior to
each individual IO command, to allow for longer-running inputs
2.) Add an instrumentation filter to prevent libfuzzer from tracking
noisy/irrelevant parts of the code.
3.) Make pattern-matching against types/names case-insensitive.


Alexander Bulekov (3):
  fuzz: adjust timeout to allow for longer inputs
  fuzz: add an instrumentation filter
  fuzz: make object-name matching case-insensitive

 configure                                     | 13 +++++++
 .../oss-fuzz/instrumentation-filter-template  | 14 +++++++
 tests/qtest/fuzz/generic_fuzz.c               | 37 +++++++++++++++----
 3 files changed, 56 insertions(+), 8 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

-- 
2.28.0


