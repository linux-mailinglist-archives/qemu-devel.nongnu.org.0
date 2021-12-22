Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D247D743
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:59:27 +0100 (CET)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06pi-00008N-Kl
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jl-0008Nb-EM; Wed, 22 Dec 2021 13:53:17 -0500
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:12544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jj-0004aJ-S2; Wed, 22 Dec 2021 13:53:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbgzAPIJLQXp5EkBpBZ2UsOrnbOyaY/MU1cQK3CFEdDT3r8z7J7viSX1AkzrMUxEKV4NCbxONeljlYdFSuoqS72PlrJubdUe/2kRZw9Rp4aVFYL2vuqayCKmuLIS/ndUvOIXjyWH3lWxE+XRWzOhfD+gLMJtwcKJDEZuHM5Ah9I4BXIXbFJZs8SwGjtLcgKirqCPrbfvwGnH6Xr/LQV8M0Xq0kTb7edwSthDWo4Kc5rB7t3Pk2IYYsweKqUoS2yQvKZiLQvqvkEKrPCSKfWLjioRnJv8H8i+U2KvjvhpLQgfr981Hhh0oTe0jzyCQlIj3BOe4cn5lU9vuq71QkejSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHc8z4/P4SbapUhnft2QBalQ8QaZZCMZ4CbkKmxHqgw=;
 b=gmBoWCmeij406NrVJHqgTNbsu2nf2GSLbuYTU2sZV424+A6yB3TUEqhwG8L5M8CFw/WnuDi4BaYf/YfiCXqTVU8Mg9nG5RaRAVbCHegua2HZLsX1CyFmthOHM+5w+q8QIVNL4BmW91Lly0uZKQY80KJDDUlW5+ikNPxVQgCWErmJm7qBXkb8AWd8tJT8mTangTjseUBfOFyfJI9Qwiqrr+eMzKBiT1rFFxsgzWOo/ClQEMM18V2AqwACjMBE+Yy1HiXUdn5GLKm26+7xabpu6Yqqk0o7s+cMgXvKE2Xg6chxNINOIhepgpkGwDNjX6Z1QTetIEtPkN5kBx0r+zhs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHc8z4/P4SbapUhnft2QBalQ8QaZZCMZ4CbkKmxHqgw=;
 b=lLyjJEVGmuwSRwUAjd4LLI1WgTarb+JrUzqIlWHQYnTdKbSwPzh1J2JWQP00N4iJW5PkI/hw5ZX5P+KYjRVKH4iwsE+yAy8LQsE0XEY5mbl85Zh61YaMMy9RWxZv7Yf3+KIWiJ09gtnL6qB480Upx3VoSpaA/2fOj1DiqJ6zk7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 6/7] iotests.py: add qemu_io_popen()
Date: Wed, 22 Dec 2021 19:52:47 +0100
Message-Id: <20211222185248.466010-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96a29b4b-c1c7-47ad-de12-08d9c57c48a2
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB585717A98C10853B20D45856C17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSctenFqURKRIlTQE+OCaEt171Nzme5eCB1mKSATkgVROAscnjBUg/NXlA18Wk2eFLuAuCAMOANI+3tR/Orna9YIyL3cXiSqJHXUvBy3rn4jBBQGRFDSi2efvCgz7dhgp9iGmznyLjxYXpjfmQeP+tVgFuARlUAjgH9OnjXIdEa5y4+o8NuOyU6drsvHZOckBpkrU5jZCMzZ2pe/9gGGZAaD7/U4veIApVQiQIALcT0360hwqUp4DOignDtIBCChG6BF3KZQdZqXLyT1ZX4eashNBUQNPY86asxtjUcMEf08ePihr5Uj+BdHZ2pGMTWjpfGRkbOc+UToXMbGI/8dWqc/Fog1fRL2mLxGjt1vucPKOkzLd3tZMIaeYXyEFF2ucC05DDJKd8wfd74rRDsylen2GW0tM/KcinmxORFyGT/8PCVPdOhSuLYqlEPUcNLiqgkD7bTqTGAJ2kOWlza7k0l+kcj1FUAEv1IYlLMQ/w2xdCN78f0CcotXiUKpOHoahPbngEBHou+Px5zgoLVcfExZevUGVWh+4PGTePE9AWJ0iEkJDHgfB9KRNeepnX5mJcy6jiK7e5ojnalhrKMEsJ0CkQHvPDCE2bz9Km9F+2xp0ljykv25jHYDsiKMs9Nf6TiZS+Ub4jvlM0B0ULdq+WB89wVXTLplWks0W+P7jOMt7N+AKX3OPxdLA9kPOw0pbhN3j2DU21kzfYZ/4TimpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(66556008)(4744005)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0n7hme9kPISsh1YNg85YBVeehluzgYZvTD6nwhbdNAuHAhrUUniMS3gkmk+g?=
 =?us-ascii?Q?aWE9ScK7EzVkixVyLZRe/29RozR5ASgoyhFGEYT84HBqAHk83MzPA7JcaWLN?=
 =?us-ascii?Q?42gquUiYRcsa73+BLf9bThqPhKHKx9UES/A1hej0q23JF7SXKPxweBoqCW8l?=
 =?us-ascii?Q?QG/e23CrnKqd+IkOUXgpY7BTNAAI1s9do7NZjlMQNK0p4TdaqrgrHF1aju7J?=
 =?us-ascii?Q?39Q94YHs89JDUkIJqdoQHkX8w7y2N9pXTGW5sw1G0o2O44E18WIlevrXhG8p?=
 =?us-ascii?Q?DsXIasgrNbpWpJi+A1pOAhghCD1coTKrEJrUMGlKsA1iKGA8cTNN/7Fh00ar?=
 =?us-ascii?Q?hiu/xMgC4iJQU/aAby1kpv2gw5hPqTvRIgjGGxXCyvNOWga567uC5o7ntLHf?=
 =?us-ascii?Q?txbXyqLxowQ9NoNjY7Z5vr9cwwLICNbQ2/JROa+uwWYny2isN2dOJ7dCJHbo?=
 =?us-ascii?Q?1Xq2iV8BS4U6F//pIs15Gm5SRz6vrehMZp02OBdWTHxnlLK4xopX5w+NzuuR?=
 =?us-ascii?Q?CkrcFshkxbI35hakSHtfjyORnOAIt0rA5QZ/26HT4d1zkJWWKCGg/cQD4lIo?=
 =?us-ascii?Q?v2s9qPpAt4Fan+UloKtTBIhPrJryFwv8vCD0MNmB/HNivcHMwMbprZCyr5a6?=
 =?us-ascii?Q?M3Q9dfgfVlmG/6E0uB1gz9/JksQ6gNxMLsaBGSnjr8bGTphsrd6yMQQKluat?=
 =?us-ascii?Q?pCNp+b9K8qJfoPQrcSmjpoOHPCVKezfnAXtO16QvJQGtG80mHppWVNnY0rGR?=
 =?us-ascii?Q?nduq184UyrAlBzIJegTus/5M8T1X6ry5FAwk5DeB8NBrS/MqiZE2MR/bQRtp?=
 =?us-ascii?Q?3wwcY7S8ejCF7k33+tiKS92Tt3GDpLP8vEVA2uQMK3r4ux0rM6eYq9PuRygR?=
 =?us-ascii?Q?CHOlh/+OZMeXFjxZkhtr/g6RCYnvIZp8Ab8d9mXfjVfDOUgnTBhsGfx3TZIF?=
 =?us-ascii?Q?VucPTftNVYsGDPkPWS8CGAJIlf5RH4gSaRwnb+bCQVLwbkRDasbk322LEvBC?=
 =?us-ascii?Q?Dq0m0EZUx24ZOr586XJ6G9IqOQR/lBg/GvTWy8sevufCbZnIYYUH85uY3hrg?=
 =?us-ascii?Q?ZH6l0p9rVw49YoYhvcavn/nu1EW8etgJbe1VxmMBiAwHn/AIuGzcLOIBDwAu?=
 =?us-ascii?Q?XKEj6DvoKdMz9l3LWN6j9qeutSu1LFTBM5tPMpUw2QryKTBam0JERS/fT5i4?=
 =?us-ascii?Q?WYf655aEoZJaCwyM68RYZiEeh5OwN3st2AVqPYDV+6MsVWRNzpcjZ+nKvAWn?=
 =?us-ascii?Q?9vGUhOtr0jA/IiF0NhEuz4GVkJONa5jWd/rsvTp1cz/V+VI/EtTKB067K3CU?=
 =?us-ascii?Q?6q018nF8GN8asT6gsj3JMo9hjoyRhhox7sc/Lms4+VkKUWbSroCkcxqsbSXr?=
 =?us-ascii?Q?lY+/9q9tafZd6Ko2jLMuFw/C7PK5hk0nKOvn9RmEeBbsqE2f+co6iYXeIdDt?=
 =?us-ascii?Q?bTWmLtD7itZ9c7eNh3IyhBoUm7aCe5F/Kcbvvm/3yj6RElaeHCzZJWG7jQSa?=
 =?us-ascii?Q?LE7+Zsj9K66fSbSS3LKRy/R1rOzi0ijqm6dEFuflGaptWluOq/x7MPaKpPqE?=
 =?us-ascii?Q?7y83rPlgu8zOCQjMI0fDrnAllYXYwRVy8FBUkmpbZ0JK2PXeTiIe2FpM5Leb?=
 =?us-ascii?Q?MoYDSbxRl0iuyYn/gCBeepUohIQK++e2Uzzm0IN0OgAb4Hu7Se0V5Py0d97P?=
 =?us-ascii?Q?hOE75tGz8i8ZnifSNWXPqNlFIYw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a29b4b-c1c7-47ad-de12-08d9c57c48a2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:03.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AakZL84kvAqIGGIhPS+8TL+fXuSoTABNHBoyVJ745MKCMrAOEsWr09dCv99KzFCDdTHuEb6YcUTtl9s5YbhiaP118cY9b3LN71LWcOf3SRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Add qemu-io Popen constructor wrapper. To be used in the following new
test commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
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


