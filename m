Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0F2F6E0A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 23:19:27 +0100 (CET)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Axh-0003IZ-I3
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 17:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0AwQ-0002PY-Mw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 17:18:06 -0500
Received: from mail-dm6nam12on2107.outbound.protection.outlook.com
 ([40.107.243.107]:1714 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0AwO-0003lE-CG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 17:18:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNoUk3P0jAJm/py2j8/PcM8fWEEJGW1tNWH/looKZl1lHl+8l3Se1kptX8X+udxSTUaxgWb7jBcRwAQriALKBr45vJZSO1nf+zkMyCVqIC/Jjut7+ZSiVk/xHk2+5fssHVX82Dkvek4pDB4BGTEiA2HrpLtGqcvx3fa/vE5L1Mzjl/RNvaa96s7P8CBhzwjGb7HjFcXAByxTFIGrAYueMWvOPlItoHO4vLo4Am72v2h1BWHT4mPAAJAdFeWwn7nj/K5lMWZS7n8cQc3FCz8Z5WQgrj3IZSGq+f/cg5QxADRf0hUjThCazMr0A98Syp+TSAgTfyNufljXFo0scgCmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrVrbTL/CVQ8VLjHtnqXiOGHqjjX3zaaYCclEY1Vtw8=;
 b=QvxGJlJrv6jhnN3vCBWuJ0+ymv1hIxnSGEaatXfC/m2JsX518GtSNFheSkKJM1/Z3u8y8WYBl2SRBtyYWnvZziSz0P7ukIViAJXyO3bWFW2/PCP7FogN7SOhqSM8Ep0dEqMBl28/EfcDtU8HuCnWUQPbz1Go4fDX+4D5l8TrbnenkOEIGPFkaFpO0mTcgGVmY4FekE/RP6/A1v4HZh46VbEMkrexy3rRn/xCwtu/2WwyoHiYuj4Z8s4MUx7foTQtjRacugv1x/fvz9wHOUGc+yjVH/GY1jv4mpZ5KaUZoEm29l0/cZDA7iLhRdTylwF7dncaROXnEGP/YaJY4zPFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrVrbTL/CVQ8VLjHtnqXiOGHqjjX3zaaYCclEY1Vtw8=;
 b=LBGOycbp9PgtXjq1PfFw1wbGmpk9VEof1P9/Mj6tyqDEkdTXF3TMlUurcax3TjnMUmQJH/qX11UJV5YBTZhQoPY9BuOeMDZ1FKfAre8Dgi23Oy2XwwYMS99Tzu2tRCCyqpX5zKI1M/5/+8Trf0wEvkr8BKZkuCE6+YVQGAgJ4EA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5484.namprd03.prod.outlook.com (2603:10b6:806:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 22:18:01 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 22:18:01 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
Date: Thu, 14 Jan 2021 17:17:48 -0500
Message-Id: <20210114221748.503565-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR19CA0069.namprd19.prod.outlook.com
 (2603:10b6:208:19b::46) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR19CA0069.namprd19.prod.outlook.com (2603:10b6:208:19b::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Thu, 14 Jan 2021 22:17:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e3f8820-cacc-4bd9-acea-08d8b8da4193
X-MS-TrafficTypeDiagnostic: SA0PR03MB5484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5484367AD4E168D2763CE74CBAA80@SA0PR03MB5484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCFONYNIgvG/mXJnyjIpReLNdfW88J//OmzETxnuSedorVQbC5x7mKbbHzgB7TCWBnXFQFHEhvJxFC79Km9juAZPMErAEDUx/V54z/g1Hi2u/HKM6rZywsV1D82+VvYH1HtQR/7mShmkMB4C6oBRoLGFwGfhvWBU1JScuhNXl7+wC5EXkjqPcYPUOhDsjUvW7kMDn1x1ETUAL5x+zyFdTsf6O+qaINjptMUClHxyn12NAda7+jQKg/QyOnGrfrBYb6FZ3rEr7gtOqgtpelOiLfM8hhS75uqsB67Q2QaxqX3j26aS9YpILYtIeKVFFTfmwm9oAtCXMDJJbZPK7Q1689Tuo5QqJFkl7Q7ufgQLiL2Mw0dqbWmfwkUaa8x/1WLHLF2rq/xMk6kyyLBSHojCKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(316002)(786003)(66556008)(6916009)(6486002)(66476007)(86362001)(8936002)(52116002)(6512007)(66946007)(83380400001)(478600001)(8676002)(956004)(1076003)(6506007)(4326008)(75432002)(26005)(4744005)(2616005)(54906003)(36756003)(5660300002)(2906002)(16526019)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OwamORVfPnYTVt4xA5GSauQPQczcfINvQhXiVFRCnW0m+Jh9K04/6Zi2z1yK?=
 =?us-ascii?Q?Zqq3YJgFJ/vk4ADn9d4mhjaPRX2KlvdGeHh0eSupXC6ka6q5pXh8QVVWZsva?=
 =?us-ascii?Q?2Atk79anoUXeq75eiEtGzuGJhoUqnhJZDhy/jHXBcRlKpiPVUUF91YqaKZ1P?=
 =?us-ascii?Q?qkhdVS5W+4CYn5guX64fkiakXru7+Nrtkd8WUOu2RSHVrEWr0Mh8Rwb5WHxf?=
 =?us-ascii?Q?JRbQisVn28FAmiJU5CoUrJzvZd56rpiU9IgQrayYMg40JQRsqjfdw1EpgrAa?=
 =?us-ascii?Q?UwKhf6BAMnlCqStIwChkBJdjtsiuLVmnaZf85caY9crCoQz3vdNaChl/kBvt?=
 =?us-ascii?Q?lB6WgoxrG0FiWLByztRl+VFBiniNHttu5PgBLtkYfanam2OgAmgTlMLHwVhC?=
 =?us-ascii?Q?xkqggEYchhCswai46pCeDBXUSn4MBGcqfHm56He88NrRZx4fhzHWUcsxEjl4?=
 =?us-ascii?Q?VmSD3HXFl53muPSJTiOwCpvWQ7XK0dZ2D292vKD/boIUVaSY4TwOcaeUHZ/b?=
 =?us-ascii?Q?dMqneZN09JAMypt00FhWjV70Y71jO/9d9PJA8z6lcI6PAXYe53quLZO96C0k?=
 =?us-ascii?Q?f8t5zFqNCnQCI4/qYKs1fGE5Ss2E8pZ+lImnoYxOGbyMBf1ucsQ0Dw4lJIz0?=
 =?us-ascii?Q?AK/kFGVJN3oXDuzdnlK5Sgjx6vulbIHuBCbxTnWofvsXzf5VE95TyjqCUd6K?=
 =?us-ascii?Q?sh9DsadgNPOAe63sOZii7VD6omDkcvthPAmh0smfp8qq9/fWtL7njTKBa2Fl?=
 =?us-ascii?Q?hy5ym7LoyF5iQpcXeSL7GjzIjxqYKSRt125suPAcGn3WNbAuzs25h+Naz74q?=
 =?us-ascii?Q?zKsdI7gIisiJ1JiYWVQN3DiGprnHqv5PzhHa0XIiFn8LdJdWtTjn8C0Qo5i8?=
 =?us-ascii?Q?A8QvFN2rlIk6ZVqqmauU7sWIqMoIKiPezpuXYAE6b6FYf5B6gxjMndhQQ9xV?=
 =?us-ascii?Q?0vwyZQ7e5TwfIc8oK7BfSYzKeNTEpgvE1pUU3b66EYkN5W26SimZl2lUo8tQ?=
 =?us-ascii?Q?BvQs?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 22:18:01.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3f8820-cacc-4bd9-acea-08d8b8da4193
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PukUIeDLmpFaU99cWt+M+CZO7qDJYszmgGMKxirGdMtYkSYFXyaJ9gLzNU0+MVN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5484
Received-SPF: pass client-ip=40.107.243.107; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..ffdb590c58 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -59,6 +59,18 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev local,id=hshare,path=/tmp/,security_model=none",
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.28.0


