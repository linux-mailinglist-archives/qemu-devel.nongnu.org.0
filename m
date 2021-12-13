Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F94730B1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:39:04 +0100 (CET)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnPr-0005KN-SH
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK7-00040I-8e; Mon, 13 Dec 2021 10:33:07 -0500
Received: from mail-eopbgr70120.outbound.protection.outlook.com
 ([40.107.7.120]:48667 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK4-0000k5-Ue; Mon, 13 Dec 2021 10:33:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvCfRfdIIwRX4d5MPt8Iuv5G8B2hv/lfJFMarzB4PH1cVVkrQntl+goTTNUs2YMBpfZ7eKRFli9VLrpXMIKUClV33Wi9cbjInMg+1HsoHQYQhme7ecWhpCs1YHqJ3/6oRDHI8LxjcgqNnZIBkhLMP6jqCijPA94hLOWW40zer26k6Dqtk1ElnTVC0c/uMjZc7EE3SnwQpIJodr2IhLmu5irbBM1qHbbtO37qwKE5u9DQ8x/hiJ1neSH3KJMXIClpnOzmiTPoDoGYlQGrNAwOfVBgdQhm6jxNvh+o8HGBRdBaTAR2pc8FGSHh5fCTL0Vq7RwvEad4p4nLJBRaOsg+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A+YTHe6zqjH9B9wOUGT6V2iqT1JrWgBg/j8U34/O6Q=;
 b=BLJqFR4ZGwM0IjZGIKx+4b17JeuqvTRKNetHYaTgTRM083cURGRbGaPLJ1avrwvDrn2KIPdSpeWz7PC7kFnhmX8HacdW58oj5h8d3+lmc50xXFgQMSVl8zWsvGTfv4/+DHDV35Et5PVtwNYga6FgSxrLRWlVN4VEJ3PhIAuBeI99bo+iF/2dQ+bzj8Yoy2T70fkjgpEYRNe60Tk7xnEYYOJ9J4bdepW7UI+4WCJBCI4exrUkesLMsTKV01e5o5LBxfc4qu86mg8V4puCFG6mY+b3ecZleOnpJThf7Rrm/J3i2u05SYbx3Iz+BwNZm6RRgNzTg+hwFhUmIyj3MoePCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A+YTHe6zqjH9B9wOUGT6V2iqT1JrWgBg/j8U34/O6Q=;
 b=EYf4a8JYhpc3zPWyt9FL8hyVYCq/iEkKIh2PkNwsHM2fy5zKfaB6hxpCPZuk+6LcOy8maPs/MRIZi2e/YiJ0/6y1EVuRa/pA2K3MI3OA9ZaiAm4SwEG5t3Zy0KTSOu6mvZ7WWYZFt+YfasKLXBEaRHg97hJeDpfVvr5M7nB2ecc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM6PR08MB5094.eurprd08.prod.outlook.com (2603:10a6:20b:e4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:53 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 6/7] Add qemu-io Popen constructor wrapper. To be used in
 the following new test commit.
Date: Mon, 13 Dec 2021 16:32:39 +0100
Message-Id: <20211213153240.480103-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e9a5bea-8a0c-495f-c9f0-08d9be4dd45f
X-MS-TrafficTypeDiagnostic: AM6PR08MB5094:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB509419F6011916BA21C53B62C1749@AM6PR08MB5094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACrajAnFzzpVT3E1iBCtwitHCRmjkNbLBoAs8Lc5Z1W0f7D0BldMBO28Y/UjZ1z+aX713GrpWtsJ3asHPhT+yEI+ZiFEZ8u7Fb2exYPje55xr3XsOT99DzzpPiS/zRPfZyULp2knJZeWleubNl3CIce09F3BZi+zEr5Dx6WfwBkdnYJfHVkde8WIbcXDgINPz4EADkehq8SiRUJxl1urip547HOENUyEq+qZMQIyM5+wP/PkQcEQldCIQOInRMXJY9REkAPSRDaN2H84KQAuDGYlM6H742b1pz91BnbX8D+HNzLiGvwkee6fdhrgxprOSd8VYa61oXeJF+xIRL/alI88++wyqZR+TiJLNr84PceMwZto6Hy9bYDLGHPnNHRd9/9Z+Dh3tkzY8YAxg7NMPztWEksz0cec1E8C5qsOPm/O9nb9+L+getxSeuAvhkpO7ny5SiTKm+Xx6lMgLg9WyxatCB3FTAmkVht0LTf3oHS0KSJXyb+d9Wjvv3UY+M28gJ63Xn3fFIxx44veREPl3gV5hLd8A1ogJrgRVAs5YHuIi+v9Iv57KYqsf6utqER4Q0HhuANB9dz/qDxzamD/XPAL0sO/sQhryAtvpQhh+e9DpONMAT1g4QsYDrB2+gSjsVo25QNhKq8UhsLIBYf0m/XqRcL2gwEjjCcVthx3+Nd2/KFBfS5cNTu6HUcsrQhfCQHmtMBNXd+ga2jfIxQkdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(8676002)(6666004)(2906002)(6916009)(8936002)(6512007)(36756003)(5660300002)(38350700002)(52116002)(26005)(1076003)(508600001)(316002)(2616005)(4744005)(66476007)(66946007)(86362001)(6506007)(66556008)(4326008)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V5Kv9hmX+eBItospLHDJjnCajXnxrBFku3qnUjpK0nXeiarJHe5QhWbbUtcw?=
 =?us-ascii?Q?uLf2mKsCmH9vpS6LWR83SiP0hPSwNTtWYKNEOHnZpZOFTjRLK4nTu3+ZP3ZR?=
 =?us-ascii?Q?I/Ze9kGeqrJ9LGVzT6/cSPdPrmV7O4bLxh05uwwBBBXcrUJg0s6+hf52jNiS?=
 =?us-ascii?Q?kxyeJZ6j6TWKgHI9iImk3Cc3hZcII7UlmnySK50ZkpLrAugHj0u1nOggACs7?=
 =?us-ascii?Q?/yznGOAfObH7IKg8eFn8EhrIq9Z8yD6cdFNVCfj9W5pcMZXjKhd7mwgqTz9s?=
 =?us-ascii?Q?pWuIwDm6kmVjjt1TJzTc08363o5vMFvTa9hpJ2LQya50WynoWUV8YeS6LGvN?=
 =?us-ascii?Q?CtDGha/OdTFnB220JX/QF9qaa1xXRUsxJtn+MhXx3V12/hs9IX7xeTWqWePb?=
 =?us-ascii?Q?jwqnvlywd/QhK64YnUoTyb6HataQ4Y9R57/35ynW7suZwBkgnfmXHdM2jaqC?=
 =?us-ascii?Q?CDdYppb4irRtBI/FAg7LHhycSEePdIemCyeW6hY+3UsEoI15TMJSwkRWdXWq?=
 =?us-ascii?Q?F7MXMII5ns/ZlgHIIkh0VIWrLXB2sPMUSY+N6Z/Z2LugT5KSeZ5vnxGYfhlm?=
 =?us-ascii?Q?m+46jqL+57BNdPcNA/j4pec1A+2vlDT8R+lEN9ZFeJMSYUVUtgWEACdPumYo?=
 =?us-ascii?Q?YPOWTiNC68yNJGtZrERMD1bPikoBm8CwYUpMgCZeHBdAvr+/Svui0PwjNt2N?=
 =?us-ascii?Q?axIXT8yaE8pSdX8TxjPF/i1WT21duD/8+zkSSXiYyydiLNZQg9ne76vjfEML?=
 =?us-ascii?Q?3fd9rULzkoFeKKzpENWU1/YaPGkjLUQftMRsV3JlBf/HlErCu46Y3qaxKHfo?=
 =?us-ascii?Q?s4UdhDsLvYURzByaAz2/B505JkAu7onwEwJrUlkYZ9U30yO818nSvXnSOhqC?=
 =?us-ascii?Q?kabIBTXdk1yevwOoSbmQGcypA27icNvxIx94ywLooIMf11Bx9+1afgtsXkwv?=
 =?us-ascii?Q?ckXESgyCG57DdX7iVdM0G+afTtx3Hjg4AjIhmHhySk+bwpLZ/W0gRuEzllZR?=
 =?us-ascii?Q?JxcsFqFGeXTLa2jspYHy3X7hVBNRzT+jT+ro4wz8MrB69mOdUZNuBb/pHWJC?=
 =?us-ascii?Q?/8jfGP0Zzt9PUTJRD0UUBlipQTpOTpOw/0+1abNr7uIO883o0rOjmK89xCD/?=
 =?us-ascii?Q?jqflrdK//hWZOWDKCHaWMykb2B8kc0bmAGD4G7S798uu27viYmKjnS+WwuaG?=
 =?us-ascii?Q?fj89ZsN0I++5RCFvwpDAyqHhDZovRVmRSCBIyjQH2vJqOlgMd1VNOfHm5WFD?=
 =?us-ascii?Q?TacvnptndFxUYBlxt3HzqkrhiTWnHimY4BsOpmWmtCNNbYqyXVD33BkmuLZ4?=
 =?us-ascii?Q?r+FPebGcLPXdr7MY3JxqKplJ9POWruI8HAzwkTqxGFWtHjuj1iQeOWJtX/aY?=
 =?us-ascii?Q?AMnFMVKnbOr5Mm9K5vEhDKZnSbwBuVEZPWzWjGYJVOZCl5zS2vnPQBs1zVUL?=
 =?us-ascii?Q?HbHjPHPO2EQZyPbwvmOEEb7RV6Cvrf8/7xNryJ0rTy/XAG4XYVQTngGY6WXQ?=
 =?us-ascii?Q?WlF+edflkpyE/GZfz1SGAirEn0Z5nTbsEZYbvENPMddaAxhQHvpi28OPDz3P?=
 =?us-ascii?Q?CyLAvKtU9CZ7DFGL1UxLvOB1neyL2yl1ZdikbQNkNaXD+0/E0GYuBHuAWxbc?=
 =?us-ascii?Q?sFe7hKWzIBniwHrPje0jeBygGsJWfibD/u5DB92KAF+pUmJkmKc8Vlpsr5oR?=
 =?us-ascii?Q?lze8mw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9a5bea-8a0c-495f-c9f0-08d9be4dd45f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:53.7031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOImG/49EamZy/f7XND9gvbPlz3r3zzril8Qgo4zE/hLcwaE1VNyq0RnC+aKwAyynBhqkTOT+LjEeUR88YYMaXCZbdmj1WjqHsq0QEsZ5KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5094
Received-SPF: pass client-ip=40.107.7.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1ed3eb1058..69d380e137 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -246,6 +246,9 @@ def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
     else:
         return qemu_io_args + list(args)
 
+def qemu_io_popen(*args):
+    return qemu_tool_popen(qemu_io_wrap_args(args))
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
-- 
2.31.1


