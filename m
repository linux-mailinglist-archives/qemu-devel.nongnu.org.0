Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20DF336BB2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 06:38:44 +0100 (CET)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKE1z-0007aa-AW
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 00:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzt-0006Sh-RH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:33 -0500
Received: from mail-co1nam11on2133.outbound.protection.outlook.com
 ([40.107.220.133]:22657 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzs-0003ph-0W
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEFDteSjZgZXC7bfmmUFJ7QvbBxPm8XtLyIfjUzY1ODqixObY9ckCUK6qCFKrgnK9Gma5gK89kjldzqVmofEfIKVlhp2uBrIKIYopfmU6TPGRWanaYnaGGzEqfen5W4diahiDQtLRhgxGhy/DZ2pZNdWiI4zXKk6R9oq3/0y45c5EZLEk6BJ0NJ12BuOcMO0/PbS+xkBtH61GOX6jq/Q3QYbiau6XIyVq6sOc0uTydZxxyOSR7flEuHRSDn26tw5ozZwcxGqmX2fmdOnC4bZfvkm3lcz+9ie9WBg45JNlWwyTc3mBCEgagEORMEh5hYt3Tienx41Nqtqmj+LJlW0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfcoPE65MdzG5Eh5m+X6j5RuI9Lm0SYfbS/XNgdHQOQ=;
 b=gg6gWf/yrPyTMTzqjuYyf2SuwXOktfN2pi3Bx18zyG5lWwDP3VtXicLOSjN5kfjBQcu4dlArmCvA/3cTCWdwUleKrbYiBPtJ5LdiiUYofISvRh+clvE06Ic6wxxWLo/qeyez1pG2/BKIVm6FQDhwruJTsuBKkr9A4NQoAVpVLPnJetY3a1hYUNf0rPeNCI4H1dJ7cV8o+lBbUeEGQeKVAYkK1qUISk7ANRQALp3tdYTs0aYGDxTVtsKWDuRT5d+3MAJmN8syf41IbrXDwOl4BY/DzE5QByxb43AWRDrtpknVkNR987wUThctNyVIt2cdlkYaONgHA8UC+l1SZR1eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfcoPE65MdzG5Eh5m+X6j5RuI9Lm0SYfbS/XNgdHQOQ=;
 b=C2sYdieXwaLmb16lP2EpFGSopyLMKUEzd9hBV5t3IbM9uyUCAVPnMQ1mCV8n+9kH1E0KYIbS2h7CeVOK+IGvtcPjN/XoJYK5Nbuxiq+bKb0twP6/pbjqqZzz2CnJWRXNDTZNYRSKDTqT8DZ9+kJwIVm93Tsl3PqYiRI1VDfXbKc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3869.namprd03.prod.outlook.com (2603:10b6:805:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 05:36:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 05:36:27 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] fuzz: Add a sparse-memory device to accelerate fuzzing
Date: Thu, 11 Mar 2021 00:36:11 -0500
Message-Id: <20210311053614.940352-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR14CA0021.namprd14.prod.outlook.com (2603:10b6:208:23e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 05:36:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3715a60d-ddb0-4695-a91f-08d8e44f9d6f
X-MS-TrafficTypeDiagnostic: SN6PR03MB3869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB38694BB3DFDF53C624150519BA909@SN6PR03MB3869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFD9B3kmWrpiVOKDCfzQhXscYoYddD9voGlh/1EGh1LfDvJ3fTA5gbQ7E4tTbiTHpbAwARqYRoG6hzhFL8RYF4KnlWC5KxGx7Yf22IHuzPn2tSkoUjM3+uw0SlIGoKVDA4hq+QL/wf15+D9qMluZ90jyh1doKh0viZjQVUqIlGras+oT5DSpw+iGGK9rgm29/PGDBK49Sdu3FSfgRc1LUqdIEnia1f+55sXB15oNQDP5rCGBh2q6ZyYRlqnKKyBEl/7gJh4HlNKeXObKHxS9ec4kNGdUPZz1RC+7jiQk5CL72MA0P36UsPe3VQF24OUXKaU/5MrqW1NMNhwwO7do7ialmFmnrTZFxHVXwS6P5gYypJyQneI6+WOL9Pxu97t0ZnienTtjxuxMsmbuEMrsmTT8Dpg4bl1Mo39L5zVLzMHuZK5iu2o8BMqU+BUsZ9T/8sB7lbSR141U8p5aTmsyPzXIY8FHi5ywk4dPOqo/6JZBb8rBHHSPPgzOl71r9WhVyoGg/r+2wWhDOBykhVpX6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(2906002)(786003)(6916009)(6512007)(83380400001)(36756003)(26005)(86362001)(6486002)(186003)(16526019)(1076003)(66946007)(66556008)(4326008)(66476007)(52116002)(6666004)(5660300002)(8936002)(75432002)(6506007)(8676002)(478600001)(316002)(956004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bna8TbX+p+wq2qy3y2BKNb1QVRQnOAgcE0ZBksMZPXVgvwbf8CbXfZi8d7YT?=
 =?us-ascii?Q?KyniqaIXk9zL8w508cGgYmXpxUP88sPv/EBHsx5BHIMC34oGYl6YQf3ZuwpO?=
 =?us-ascii?Q?/11FGQXHgaIloLKr08l1FmGRrWlV82EW/mZcGXsYPr8oonpQ4K655B5QCEcu?=
 =?us-ascii?Q?blFeM55i5j/1UDTweXzujgCRByClDL8xhO6t1rZKcmWGqtO7YF2nWez1vHek?=
 =?us-ascii?Q?zjjUiHaAZd0IK4dDB2qnY/tSMEAqRlfp1aIx4EzGpVhKux8ZIVEreJo0eJsc?=
 =?us-ascii?Q?gJZapGdtZZp0FM8XhFYMFKJ3Kn+nYTRG0Y25aR/5kS7V7v2GJAkFPQq/7CrK?=
 =?us-ascii?Q?iQjNOXSAneHJ4q/V1ACKqAMihw/eNjRs0t9Gptr/QrpfsucUsQADHlnNVIje?=
 =?us-ascii?Q?s6IFTI10lOi6ly1IrBqN/WkuYHwy1+YPHaKxZRXUaAz1vEt+pzuLXZzI0iUM?=
 =?us-ascii?Q?8XvVytAzYBMsAu0bmb3B9zrbRsniv3iMLpsySiYWp3jFbrR4cX/NppSkrKJ2?=
 =?us-ascii?Q?YLETaWd7acXGQMvYzYkis/dBLtc9kAMF7A/3eFtJla+xmOXWiMsv6mC9BvWM?=
 =?us-ascii?Q?LtboqdevVwnszVrqXts2AoJkgBZtCb5rHkw4808xTCC/YOvi5ulj9EoLL1ln?=
 =?us-ascii?Q?ccGJupIq8hlHihzYaxSNri4zeQd1D3vP8BQdL4dA/kcetEN/tXQMkwqIGtTA?=
 =?us-ascii?Q?nxGmkI+zLuysmotPZ1agHT/sSgGVF0NNujY0vDm084xEvGH9f3K1vttMIVFa?=
 =?us-ascii?Q?xQ5C/RyLiGsnTe7AkhWjAV+TBo0MCGGmHrxQEZnGyvfI7OoE5101Iq7WBX3u?=
 =?us-ascii?Q?SQjRSc5NthOB7iP8jRyWkFe71qOOE5zAPJMdP+eK06BJW3ThToO9kxrs3wfL?=
 =?us-ascii?Q?Q8mGaYOeVZJDQgHMT77+WBbwLipUiSmysh04sKBS3v4x9lSytXjr/QaFqyTg?=
 =?us-ascii?Q?Il2KVoFeBoZ9Ckc1HyIhjdP0HCXfn+OBsNv6T5AYtIhH5cG46SG3DiERN8Tu?=
 =?us-ascii?Q?seyiKE5VX6iUwtqy+H78zHUceOtDa6x9H8agsyc2746HXnQpo4fT0t2OTOYj?=
 =?us-ascii?Q?Ho+hWZHRH2Devcudz4ijYYvVVDQOTYV7TCWsrXHigrSo5kDSXoeTsA080ypy?=
 =?us-ascii?Q?HjwWrhteoUjR55uhfinafa/pFyMLr/knBWkI80sZeZndu14YDIvZmJ/xoEyd?=
 =?us-ascii?Q?lrP9zqohdMtVADm2nT0McpnqHFbMh4QHlFhwYo0kjCGzKvTYIu2s3sdeKiUB?=
 =?us-ascii?Q?/KxkUZLExG23nD0bYcbi5d6ASXzEhvsangkYj2+ycYfscST5XrGUay4QNC8V?=
 =?us-ascii?Q?yD2Mx/TZOc51zM7GMMFRSLop?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3715a60d-ddb0-4695-a91f-08d8e44f9d6f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 05:36:26.9571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MC3K96uLXfpDUWXa1WLxsNX6q4PyFIzs5JITpYFLcZ8MI0Bg8KtmOjJeFkwkPxH3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3869
Received-SPF: pass client-ip=40.107.220.133; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, lidong.chen@oracle.com,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The generic-fuzzer often provides virtual-devices with bogus DMA
addresses (e.g. 0x4141414141414141). The probability that these fuzzed
addresses actually land within RAM is quite small. The fuzzer eventually
finds valid addresses, however, this takes some time, and this problem is
compounded when the device accesses multiple DMA regions. This series
adds a "sparse" memory device, and configures it for the generic-fuzzer.
This allows us to simulate 16 EB ram (only a tiny portion actually
populated). Thus, almost any randomly generated 64-bit address will land
in memory that the fuzzer can populate with data.

Patch 1 adds the sparse-mem device
Patch 2 adds tests for the device
Patch 3 configures the generic-fuzzer to use the sparse-mem device

-Alex

Alexander Bulekov (3):
  memory: add a sparse memory device
  memory: add tests for the sparse-mem device
  fuzz: configure a sparse-mem device, by default

 MAINTAINERS                     |   2 +
 hw/mem/meson.build              |   1 +
 hw/mem/sparse-mem.c             | 154 ++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c |   2 +-
 tests/qtest/meson.build         |   3 +-
 tests/qtest/sparse-mem-test.c   |  88 ++++++++++++++++++
 6 files changed, 248 insertions(+), 2 deletions(-)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 tests/qtest/sparse-mem-test.c

-- 
2.28.0


