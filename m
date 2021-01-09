Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E742EFF63
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:28:59 +0100 (CET)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDMY-0001VI-2K
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL2-00080j-QF; Sat, 09 Jan 2021 07:27:24 -0500
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:49601 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDKy-00065E-L5; Sat, 09 Jan 2021 07:27:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJevtPYtz75tCwEny6PK8jIAVCRg2HpMaMIoxEC9boat/QbiY2h0fgwdJGky4d4LoHN9ZWY1BxDPcFlFvaXJZ5ECbDNjCHisoVQIxnXipvoQ6kTX7kqhc2TvxfKcxmGfF7yuqFT2Qj/4PdHNtO+OedrWfxuiCA+dAvmg74sxxpcudOgWebp7MAoU0xtl0PIiiVreUyRdmBW37D/mdQqhWmJ7+3z7g7OftREpVEMBly+MWkEIY5veEGc+6gceZjSNp/CUpWaAvD4sLo0IU0aMbSyl0aPKKZ13dVoAXKOK3lI19BePD741nnQod3nzMa9FoI+/Q6xv7l5otZUBJd3MDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm83Cbx9iiYF/fPA/dWJ+BVsgpd14jMkMwVDDqoMhPw=;
 b=jv/pUmxbkg+wwBovCQ3El/v+LdQJ2fjPDHEDPEdBsJn/eO+ZXlxY/DhqL9DixNheq2K22uzSfQ0ixqXIOkJk2sTYFZ+uB08YYdamcGIIOBTmrjDKBwHtgiISZgwE90Ub2lgm1isWvx2xHzkWTQ8Hw67hV1/jXvHCA7D++xdw+VZpDcE2PFhIj9nsWa59r8pkdtkuZMzDIqqji/z8Napcbnbfva8qCAT1bT5gZqGvN+jHDb69vfFwBWdG0baLH6IHO5C5HCo1pntlrdxJlMuzQOsPorBW1NTrlArOnFPVHpAtqKY9Jb6IVq+2MB7/tAkRL2INOwBKOL/ahodQHEZnbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm83Cbx9iiYF/fPA/dWJ+BVsgpd14jMkMwVDDqoMhPw=;
 b=sFz8WvpmDq/Q2tgWEMbClO3REb58txjZYWvdYaGMk2zD+iCDweTLtSjh8jfKTTJPlKwl9Z7DpTNUriEQZ19+crvSvGIjdcvmwJLnoGr6Wc+A08XPCHcJW0JMJ0E8g51P1MkJnLdKHwujjiImzt/JSnXpiQ7k8N5s/kpmQ8K8xeo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 02/11] iotests/303: use dot slash for qcow2.py running
Date: Sat,  9 Jan 2021 15:26:22 +0300
Message-Id: <20210109122631.167314-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2e98c3c-9a9e-456d-0834-08d8b499dfd6
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25295585A38F72EFECB3FC85C1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMOCqWEWQ6rixKv1p84eiMiNx7qf+a08xujccsdGkP3s7NuKU3kBv0coc8vkF7XMDgeANrujqJOQk2m1Z/k3SYsbTEOnLDk++6UMJoORY+f/D6ExzCNrULTXLvF3uRETnZP/d8Ff1np1k7UQaPRNdKs+bYDrh/OqT5KMcpO58o3z+lky8FO5YZvCvWM5ioxFf3UMj69mrQB43Z71bkvWwBwfr4tG4AJxpVzPces/Uc4c0ByiHefE2DakwxezNptF07+VcPzVVQXs00C8rEai4vDXsRJO/+GC2myfJVOrl1cAHdOi7AAYr7mNOWG2/k+YToFDS1LgGYDwxs/zAzzJjzBvcfvzlvhb8kQYRgYUhaeewRB5K55lQTl1berh2mEIbWQSDc+MzPGha0CFYhDQmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(4744005)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DwIATP1ieIPLl0dR4gUgzFhfp5T+RNz3rSm9T44TSvdp+IaRF3jXJTIik8WK?=
 =?us-ascii?Q?/3e4MgoMIK61TFEpt/vHWnqXXEk+0Uljl3mQRGUX9ZAdbD/ONjXgbYkq7mei?=
 =?us-ascii?Q?BiGlUlaa1pvD69ZjQLsMgRC+KcBld0Nl7stp49fX3xtvQWPhU851Ftszcrp9?=
 =?us-ascii?Q?q5wgmjpyqMeFm18QE3/JHX2CPj7KZSU9TGZuq+6PdEw+0M+T+6muBlk+Linz?=
 =?us-ascii?Q?PYitwef9H/cSjRoUSjZOIr3D+UALJMpTMShH2JIak7a9ngA0w8bBzH5/GN0H?=
 =?us-ascii?Q?hakjtRxVbCWvl+P+fDQBYoOBUpvn7SfGWvc6Z2p283Cw0OMbGx0uIjnEDWy9?=
 =?us-ascii?Q?NUJiXHYT3SKX+cra+QzAW6QEQklRbrxPdgP5K8rs2tZtJeSZR5U/Jsqmoe1w?=
 =?us-ascii?Q?Olyk5/KoCY6rVYj+BLUGtEYsjex6UQlW7L8V8Isbvy66ricg6FclpYh2GkWQ?=
 =?us-ascii?Q?bpawJU90NfejdPk3MURiLTMjl1ko6+jbanquQ2CC4jAM9xaZCuoKCevfPP3y?=
 =?us-ascii?Q?+Cz1jqkeTQSGyacyVm6APHNgfZQx8Xg7Y0KpmeS7d8z8jj2hx1YB37wel/9C?=
 =?us-ascii?Q?keNKzxyru3Gs/4EFuQfXb/FTBUugZ1CdQDvB69LWNDiEfJ/yK3NvE3OYxkEJ?=
 =?us-ascii?Q?YRxj9UXTNp60WlX5li1LTpUi4DcFZV6zlhgewrSSmZCVg2Qj+K0AqE587hdl?=
 =?us-ascii?Q?LnXuVLiYaeXJv2/EiJOPRGKPK1jkX67KJSu5NcuC6hWN6ddHE6khQ3S/Ws7r?=
 =?us-ascii?Q?/L/xdO2NQtnFFyRLivK6gNcm4vhY1jZRax26vpK2jK1P3OG5SdBkAnzwxjT3?=
 =?us-ascii?Q?Xc+AFWMtIrmnYaAh9J+yYwJDPoiWLIaEXZ5+pNZ5TctFnwkb4/xzjDPASZSw?=
 =?us-ascii?Q?F/hyd8fL2qZekGSC2a2t4baSDcnpF5yiTgOZWxqYnlNCeHMpo2LBkduIvceh?=
 =?us-ascii?Q?tpm3Gwk4T+I1yzu4g5K61gF6g2OFQxh5tIZXAxMnjyUzV/CG+S/92BjwDd/O?=
 =?us-ascii?Q?m6tu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:05.1018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e98c3c-9a9e-456d-0834-08d8b499dfd6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XTo8XFeeh8vpQ7M78koUrdi/KP9LVCny3aol/5L3wTwnyjb9Ft6wDb6AJNkhuYn9GBqBsKv7CcvgaAIBxzbLwQmC3fCIBowjGGT0pD94jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you run './check 303', check includes common.config which adjusts
$PATH to include '.' first, and therefore finds qcow2.py on PATH.  But
if you run './303' directly, there is nothing to adjust PATH, and if
'.' is not already on your PATH by other means, the test fails because
the executable is not found.  Adjust how we invoke the helper
executable to avoid needing a PATH search in the first place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/303 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 6c21774483..11cd9eeb26 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -56,7 +56,7 @@ qemu_img_create('-f', iotests.imgfmt, disk, '10M')
 
 add_bitmap(1, 0, 6, False)
 add_bitmap(2, 6, 8, True)
-dump = ['qcow2.py', disk, 'dump-header']
+dump = ['./qcow2.py', disk, 'dump-header']
 subprocess.run(dump)
 # Dump the metadata in JSON format
 dump.append('-j')
-- 
2.29.2


