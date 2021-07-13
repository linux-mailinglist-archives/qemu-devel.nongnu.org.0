Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4603C767C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:32:47 +0200 (CEST)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ND4-0005X8-3c
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m3NCA-0004ry-5X
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:31:50 -0400
Received: from mail-dm6nam12hn20305.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::305]:3552
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m3NC8-00007T-8I
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:31:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5PXEqa1DPkrwQA1JNlZIfgW33num+5P2UgtX3a2kPXt5rb1AhPdobas+9lPu/99CAU65TYnus8WKHPjBdQ96h9KuKxMxdBPsumQdY36zLGvziJkCAUSdpITGKMUQgwplL1pYDjpaDs2vXTbpMsvxwKY3ERCshZ+lqaHvZtwjZhO7a/ScsSIY286EatX8cjTZ6a/lgXwBkjADJ/uWhNkVT85KD+fWN1zDl6H1gZB1xrJzDNds8n94dZW0oXFee2ExM/HnGXiatBc7JNL9FpdcFJReevvMkx9soULZOcQtNs0Wrd2rkS1hMjgL8YpW5lEAMx97qBxBzUTBt7OKWGGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR6k9WcYReQWrPeeJNY3Zd4q3ESom0afUjQCtiYE8NI=;
 b=BAat8tNur3QyhNdjihWXV7LmlHWNkfCDU6IqZAelLnzk4CAgS/UqMe6qdt8AmSu/3oMUdGgtS3auShRxVvqMqLryxnxFpJtsCfR891dYofm56OaneyS9mBbMe+jc7P/IgNdsRR2Dqczl+CXCHRMeNJ3Cn0cMjBPcTvCt5qUyb4SvzcxVcTXsIl85aDCu03f+XCUHAFwej6n4d/72ZUVOpwOs6oW+VLqwAIE6r7uZks3D95S1b5oBwp1fsYuOGPPVkQWZ5/5xjKWkuxNV+MbZE4ol8qrZByftmO/yyUwxu/JVhkulrb9cOdwRO9OI8uiq+rvFyIT5XGUugqy/a8iDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR6k9WcYReQWrPeeJNY3Zd4q3ESom0afUjQCtiYE8NI=;
 b=x8BbhbylJ1aEE6LvT0khTFBTr0bB1qNTUw3SRf1UiICLp7j/NQLSoKW28gpgXoGkjMABtRvKgQbkQcLTvgxP4fA3AyUT7yKx3aWrDdCgzZfdf8KzMvl2qHMgypiZ8y4IlCYU6T3vkNiLO5qOtrqf3HsYxlb/zTllaJNnTfvVFOk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 18:26:43 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 18:26:43 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/1] qemu-ga patch queue for soft-freeze
Date: Tue, 13 Jul 2021 13:26:20 -0500
Message-Id: <20210713182621.258065-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0050.namprd02.prod.outlook.com
 (2603:10b6:803:20::12) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN4PR0201CA0050.namprd02.prod.outlook.com (2603:10b6:803:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Tue, 13 Jul 2021 18:26:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92588fa6-2f7c-492a-f70b-08d9462bc409
X-MS-TrafficTypeDiagnostic: CH2PR12MB4230:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42309C2D20ACD97E3AA58A5D95149@CH2PR12MB4230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zJuCZDW/85DN+dWA2d/YxLY3P6ujY9jSB6j38s7b3UE2aqKPLwgwF6D2BK5i?=
 =?us-ascii?Q?Hg9rCicX2P0C9Yyvu3JJRQBNkVzEYkW+PBm1QyYQun/UiRLJNq63vdj3DGY3?=
 =?us-ascii?Q?tlzdwCMv4fMWlzWVH9QwhTN4vCHHrNbd2wsRwV5Ir4wgFQCOP5UjvYUuQocY?=
 =?us-ascii?Q?Vz4ymbtVIwBupIujUOKqFG2osAecgnOq8HaU4qX9mAw5MkQeYIL0wjLn+4yk?=
 =?us-ascii?Q?5gcj85gFWrn8IE0C8gwl6kKSmx+odmLGdJpZ5VM1pAG0cITWCuDcqNwDwvCn?=
 =?us-ascii?Q?HsmOJOLtcz9siso+vOJCDVSlVSe8aAi/5kUcKLwz/ynSB51twMrMx0sGe/OT?=
 =?us-ascii?Q?NNsBTnHuwjy89xcXEgh5kU6UYcvjdtLDiUSJZQpf7OdgdrVWCMqzJL0IWcgJ?=
 =?us-ascii?Q?nH/rlJJey47UMJj+znSsZ3dYePFlKdVj4kztQfPkgwZsksKj/VR4MaowOQTF?=
 =?us-ascii?Q?q5xXAE26YZY8bDKvagmdEgOVnHTs+yJswj/8TgRSnn12BsPoSkaLg68HrHV9?=
 =?us-ascii?Q?7sWURrzeaCL2sPP+JDhSyFGWsbN4mu+1z0vGBCc5FpmfGHDykr79SXhR29FS?=
 =?us-ascii?Q?TDGYPGzwlDoPU9dMdvQZf4/dwpcdQZX4lSz6sSeR9rUtmUCrqGAkmrjzkZwn?=
 =?us-ascii?Q?7MJFnnk1Ug43vUExVkPl/d8BvNLzMkNvzSt7GqY36aaB0ankB24vLRb9ZtId?=
 =?us-ascii?Q?ptDhgx9jizZ928yzfMDUg7+DdeSWBriy8PZ1of7iyG+0SPUkt1XA4Q+0u4NF?=
 =?us-ascii?Q?liaM/ollD3vcfW3W2/zdKc92MfyPuQdJZbcTWvctBgfk5xNBJF2EBrMRiVKR?=
 =?us-ascii?Q?INkw6FAu+7g97wNEo7KPQFzIKKU4P2XEu87LsRD/1LDJE5XWTn0I/RGgrKDO?=
 =?us-ascii?Q?QS0CfF+bNLrLCiy31AH3h9p+VAl3XV3XU4/K5C2DKFgt9RwlkyqFfZmy1Keo?=
 =?us-ascii?Q?tzxSXJgYnNfh6yfKoeDljYucVgQ0APw7ZtHNjuDB5u28uY0KMTwU72FFY1ZA?=
 =?us-ascii?Q?byPh0eZgODztv2Ec1YBmCoPJL1EsTeAoE81+oTRyGajhJag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(1076003)(66556008)(8936002)(316002)(86362001)(5660300002)(36756003)(186003)(44832011)(26005)(6486002)(6666004)(6916009)(6496006)(38100700002)(83380400001)(478600001)(2616005)(2906002)(66476007)(956004)(4326008)(66946007)(4744005)(38350700002)(52116002)(8676002)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cOHprR9Wfo5vg77pgZRhjsJVtWVTipFwFyKvP2yH7WLIef3MkGHkl2wgoSom?=
 =?us-ascii?Q?AmwjS8/jZdV9sNSUNTB91MO6Wb0RlxdyQQ+VCXwlzDJ3sT706XOk5oq/DD+l?=
 =?us-ascii?Q?T0dcvnMkng92MS/6kpAfqoJnFM01HDytJBbSqONpswYKt/C7XcJ7RIwKj4VN?=
 =?us-ascii?Q?WTLdWuZ+nPg3KioSEoqCiDYf+YxGNi+IRWH0F83f2EOwTQRkjITVC0lJS/Xg?=
 =?us-ascii?Q?GZ94Yd/73+Lxg2LaVblm2l9aU+tNKRWp03fzcfx/T+G/cZJ0riNHWMyG4PUI?=
 =?us-ascii?Q?qWpIfg4dIhMvXhh/GNpoiFeFalJEVcuJ4KLy0xXIuXSelpaT1Xy6hXYuBG3g?=
 =?us-ascii?Q?0lPmcGnF2dpRt2ZH7SbRc9gFGS+ZRMOjSccy3GAYt2vFncRNe1f8gnJxGnMd?=
 =?us-ascii?Q?xvZJeiIza4tFpSjFxQDGIigtk1A3fC8oA+5uvknyzCYGLqvNp+H3JkHhyZf3?=
 =?us-ascii?Q?58NxhQ0Dm3PFPQCC3Y3mJcCNgdcQ/GVYDpdEUHuTDZA+RckjuMSRRywNsFVb?=
 =?us-ascii?Q?mQqMbpgIe5JrVtiGL/zfXfModoHw7hIyNvfYTnz/PESKHoWwk9MAa1YAug+R?=
 =?us-ascii?Q?p8UrJdEN3ph9+9ovx/iU9z5WklQNqXGfvji8129aqJgfFRusB0gMehi6N9wm?=
 =?us-ascii?Q?laxkc0efH+MhTXjk3uSwqQmBBPSLrMDwRCFBtaTpUubgplzwORfGlMJpHoTF?=
 =?us-ascii?Q?ZYjoA/E4I7OnMhmRcAJ8+hfWJ058k4Ms2DsRZhjU/pTlGfnIes+EDObLHZC9?=
 =?us-ascii?Q?MOyifxzZ/S0T6HCzfscGv2npkeasGmr7d/HggIKPyCFM8W5CwVMa1vjrexqf?=
 =?us-ascii?Q?67kE1H7f718+xXHdipSEDz8lqTj6b8Aw96M7dgB+xciYGxoBl/Myky3wUI0U?=
 =?us-ascii?Q?U8JhCH7T9OauJ4B0w39mVXcY+b9HTkyvi4bItBdEMbQN+jJkmnpeSvZYgVG9?=
 =?us-ascii?Q?EvPqcPmzbT0QZfcN4x1PGDOlgOffzY6vF+uVdbb6nNsFFwtDgmFB2t+anaCD?=
 =?us-ascii?Q?R9x4sAI4Sb8RBDmJsXZkyytNmGY5K0/R3WBTQ4RDVxy5v0BPZiyhSJVpQ/wN?=
 =?us-ascii?Q?DqKo4AjDfwra044XNoqoPEeDWUDADAu50vm3nAzAi4x5y9ECnvxlBTvWVCHU?=
 =?us-ascii?Q?j9T4Pf+Ry+vhHcrEGeBc7J8/za8RdrXidX06zO8MIf1r/ZzUe3eQvC96cxsE?=
 =?us-ascii?Q?tv/TqHT/9M4wUrqaFpHnJ7nOlL8PP8YIfT6XZxw50XOTE0CRf+MSfkqaOQUZ?=
 =?us-ascii?Q?4BysY+uPqSdxCCfkhiim8lhoh+/IWwn51EKC+RJ1myUaxtF7rYPpifffGDww?=
 =?us-ascii?Q?n159SQsr1HTs3uhsBySQRi76?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92588fa6-2f7c-492a-f70b-08d9462bc409
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 18:26:43.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nJvMU3WBiXg2FE6KFjKmq4o4HgjG9sjr1fkbkIRaD0yjPRn7pmWkLLRgvGJUxEQl7hv0BIJSsLAvFwvt1WNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
Received-SPF: softfail client-ip=2a01:111:f400:fe59::305;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)

are available in the Git repository at:

  git://github.com/mdroth/qemu.git tags/qga-pull-2021-07-13-tag

for you to fetch changes up to c141814d4f495bd9efdabb1229ce0a5b5a239bf3:

  qga-win: Add support of Windows Server 2022 in get-osinfo command (2021-07-12 11:26:47 -0500)

----------------------------------------------------------------
qemu-ga patch queue for soft-freeze

* add support for Windows Server 2022 in get-osinfo command

----------------------------------------------------------------
Kostiantyn Kostiuk (1):
      qga-win: Add support of Windows Server 2022 in get-osinfo command

 qga/commands-win32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)



