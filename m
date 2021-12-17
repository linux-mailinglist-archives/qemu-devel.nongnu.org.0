Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8134791DF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:51:08 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGRn-00073Y-Ba
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myGNy-0002ce-7r; Fri, 17 Dec 2021 11:47:10 -0500
Received: from [2a01:111:f400:7d00::707] (port=6433
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myGNw-0008DM-2P; Fri, 17 Dec 2021 11:47:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8m8wMyXV6TkjKAiY3zXMvI1OluERPhnp5XPkl+uA7XZo8BSnIEg8a6s2Ai7n/ZQCzL6kAMhNEq+bMiIm7g4vaDypwRMl85xm/4FJ5A1JjZqHRJrZ+BZbi8AfqRuZWPUyII08D+qaUfggxxpemuXwR6eaIZPlsNpReHdGN1LW6tzv2wWbAEXW8LXC5asFoPSHOKEcxaboWv25nsWy1vR17++UkD12jmwZ3bz5q+MZi4/eajLTDCfUd0jXCkAbyh881lDcYmeexXFd0ee++ql29xpXs7Ub4SeI2rvljkSMnBr46jCzh4n30i4b3ICPw65BQnkjpGkGrReBpXcOSNfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GC3ujR8CaRD5QcL5ttPpoGR4aJGQ0OQcbrAIH2dMimY=;
 b=HaD3/TGrTDkk1nC8gQKzEb5ITh5yrEmwFN2Ag6IaR799z7XPa9bsyc5er+bEPjWbejfZZqalxtZ45cd1zRRX+fEHG0o9aooH5eC8BtWWyolsupshAvj7N43zu51SfJEAJA/T+NIO2QN+/Prz0cEafKRaP8cvv5WB6xuMvzb3h5EPDTEdgiTnY5LOew4oNGdaQ+5Db/wL5ZVkd9KIFIukC2+wkAmOZ+7LDUg8FsxzFKn1Md3JeI8pIMNQrOEBqKQzEeLroUjhetZmwZ+3QDQ65JzEP6RfeIbp6yzXZKNz6qMHZU3AYEUHwZTNLa+7f0tTgSM/kmgqgFo/F6x3pqbP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GC3ujR8CaRD5QcL5ttPpoGR4aJGQ0OQcbrAIH2dMimY=;
 b=iZs9iJ3E8yPSxwKGit1hM7411S8uuAGHpcM0veio5McR6FNVEbgYWsggwkLsZGqhwurGGZ9LHAjJ1920Hk2Mp97j2rgAj/uJATXxHWG7syX+fv/Vp4EaOwROeEvGUGuNAXQxslxaSYmxOFzPneODU1Sq4hTRlepEkRWrnS31Awk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3362.eurprd08.prod.outlook.com (2603:10a6:208:dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 16:47:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 17 Dec 2021
 16:47:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, pl@kamp.de
Subject: [PATCH v2 0/2] qemu-img convert: Fix sparseness detection
Date: Fri, 17 Dec 2021 17:46:52 +0100
Message-Id: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0192.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS8PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::17) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 17 Dec 2021 16:47:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e901fdd-2de3-4fa9-c483-08d9c17cda24
X-MS-TrafficTypeDiagnostic: AM0PR08MB3362:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3362004AC234C4EAC24D26F9C1789@AM0PR08MB3362.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDI9KnQCJHXhSkDuG+1tYK2WZ0zXWjAEdahavfYg/hTRphsfRKfYvkAuFMhe50QUrqQQxsHXFHzVaoJqBhe8BHWV3c74JsVxuNFSCgzt4GqJ5iGQXEd7ZwpV5z7GPpij6QtxkJwlm0qJ9ZWSMLUH+WM+EwyxI/AblAF3GP8F7+viH5I824lt4PeTLrWfiIenLOTFKmTZhz97d1XFKg0Jd9wXnCmru5E6XXTY/3i9oZg4ylnfYhLGvXaBQ2K0ROFQtzfMtYKpKZx9a6psTFF6hUIHtk8iDbnb3H3yuGaUbhbkweoFdCoaYAXXKP57Bps0v9oQLu/3YXwhAfKKZNd16qgULyeuYGH2usgXl5vUoFjXnRhv/UpWzeAlE0X/sCQZF10SenALtF8xqRBFdvwLJn54nZatZIHPmMxTtYGVbJJcICiHJOLYeEhmpmiE5kuLD4gqYD2e2K9B9erEJEIukmNxG125+MtNmGld0lq/jgk4cjUQeFE6eWC0xy5YIMkwQsXISFsVKiRBcdWlX4X9+NY93W0cd1J0rLjvlsA0fbwS5QeM48PC13GsYSAhagsu0aC0j0HtJOVO78cSu10iTiCmPv1xmPPUbxWafS7ezEO7NRYxUltNSPN2bLu+unQG4Tdq7WRkPkLNMD8db7Trpm6Do9h4sUvusON+6VsRe6Rh46zHuJOLWCpuGgLYqqnrg/pI1paDtZb6HDgPofrQhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38100700002)(956004)(38350700002)(508600001)(2616005)(6486002)(6666004)(36756003)(8676002)(26005)(5660300002)(6506007)(186003)(8936002)(4326008)(52116002)(6916009)(1076003)(6512007)(2906002)(316002)(66556008)(4744005)(83380400001)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5eVZ5skqKZIGyVo5A1A+mw0Z2tyiQYs9uE5nJh9fvfgbwqe6dQWl08nidk1P?=
 =?us-ascii?Q?5hyrxxDDuO9OZYcSSHpcBxgwBRrq9qPjbdkYMOReY491pya/z665qpXwMAui?=
 =?us-ascii?Q?HAcYudT5Zm89cRNzpy4GbeWpF25WQq5mSI3XrUipNIt4bOGm5ROxJ/0KJQgz?=
 =?us-ascii?Q?Kghv1Idpo76WtNeyKPv5npxav1lNnrrnKICroG2id4GgKiDH+RckoTLm9ygN?=
 =?us-ascii?Q?5r8qjKotQrSW9biZfEtrxRt7gcTCvS19FEv2sOvn/fIaluSMFoW9QUEcCnMi?=
 =?us-ascii?Q?ewaYO350YscahEOS5kMKVSAwtt5KT4iyY0x0gx281cQcT4LHLbmRKCxXF8H4?=
 =?us-ascii?Q?5rVE8hCn5GVfLrjX7xRq4BMvQSc1yPCP0JarnI7ZrNAg6l+y0DMFiWORlKnS?=
 =?us-ascii?Q?IsPnnJzEWHYSmo9Lw1SCL2ydArGfHYFlh/p40PeHX2Tf/rmMNC4XUEIVJUzx?=
 =?us-ascii?Q?tZ/vbSoa78pTwkPg6C4EoduAxlgYtOUTDFprSz3gD6N4rtsmqAB1+UiYT8x1?=
 =?us-ascii?Q?0vTys6SFjkAvqLBwMgwoYCQJFj7Z58Cl5rxB6m18+B3SZlo1p5JwOZTD5v0a?=
 =?us-ascii?Q?erEAdddOeBjA7hiyPzWcz9junKkrKPcNewgAX7Xc7hAhul53lvDXhLP2l3K5?=
 =?us-ascii?Q?DmF2Dj5hqxJEWtYjvwbEkJMgwu2AfVgtpni+Z3RSndK2oLjkoF61khkanbBR?=
 =?us-ascii?Q?kaUBnUCvYnYAAveJ0AjqKIdzD5xsrxdK2IomiedTP8hk+I7XhysJgWfMyUyQ?=
 =?us-ascii?Q?OKuxLVHtggIt30xsO620SxDusWzdoLTHOZ2k8MSPSJbdCge+j9GZ9pqrfm61?=
 =?us-ascii?Q?2wxahZIAsbB/cXqRh9BaaJH3tymQF89suyJSboqZVi8EGJzY48CutZoYFY9K?=
 =?us-ascii?Q?/j0TVIHOzDT60xIZvkfbZQs3qEHHP6Bd0EELG5r95WNsKnpnDYynaZG0orlP?=
 =?us-ascii?Q?FdZBKzK8yfyH88t8SUc4Qa/45FeaR4KZJyz/C3FhORApOn7mVP3lxSe5k9KB?=
 =?us-ascii?Q?b+DSs6v0Gb1BI2grT2lrWZ4aLCI1m19X1seG+7ZTf3hBIEeS3KoK7ySCUji6?=
 =?us-ascii?Q?AYbliLfDvK2ghiBTeNO6hz0ckp/lWpjm+WiUjr4eg634jm0OYkWzNUl1CRs+?=
 =?us-ascii?Q?+bl3QrOYI98VFoPiwfIcdCa24GT+WJdaK6jNHmqy19Tf0vYVQneKK4UOiXkT?=
 =?us-ascii?Q?RwERlG9cD3TtEdsJ7VFVkkYhLJgkTYokZpmKl55vyrACmeRdAlverj/Or7CG?=
 =?us-ascii?Q?pZklKTD/T5EuyRMgw/3GBVCm3yJzXe3Ml5eDSZ4BqwB9depe3rZ5Alka/KzI?=
 =?us-ascii?Q?IW/s3O9RIwGxU/kAlIw6LA/RjilmNVV+a4RanZL3F+lDruV+Qft9p3R7Dt4D?=
 =?us-ascii?Q?Xbw7oBUldE1177gBRafq6Li5kI/h4XeGxmcZRowf6I/brIBYVNHvstNa2oyG?=
 =?us-ascii?Q?BuR7eSjFo0zYJJisanf113xWwtwnbxiwtXalPxpNKcZn5DDXUx/xrkR5y7Bo?=
 =?us-ascii?Q?hptJyxglA+Lyv0sq/X/HDk5XnT3GikflZLJWO5X5m6a3HvMQbCtHCV+Fmg3i?=
 =?us-ascii?Q?vJlPAPXdHMsWOyi2Y8ra03r/yE+Gp1+nqh8Z0kRBzCIa3fUKT2Sb1GgZZXCZ?=
 =?us-ascii?Q?8cVwGW7zBO2RIvuqoDmhWF1tPHWrXItTG+3zgBusn6RUIkRk9P1yo+ySfZiC?=
 =?us-ascii?Q?FdfcIw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e901fdd-2de3-4fa9-c483-08d9c17cda24
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 16:47:03.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGy/ae1GNeYbBWryb8TF7emy9vagqRgrVUCak+qG32pdnqlDBhqzZQRdR+ApM1YGGnrj6e74BFqsArwTW5gKnimiIIKMHhdoQPg+pc/aKMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3362
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi all!

01: only update test output rebasing on master
02: replaced with my proposed solution.

Kevin Wolf (1):
  iotests: Test qemu-img convert of zeroed data cluster

Vladimir Sementsov-Ogievskiy (1):
  qemu-img: make is_allocated_sectors() more efficient

 qemu-img.c                 | 23 +++++++++++++++++++----
 tests/qemu-iotests/122     |  1 +
 tests/qemu-iotests/122.out |  2 ++
 3 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.31.1


