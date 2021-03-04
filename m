Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C532D09E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:24:17 +0100 (CET)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl9U-0004Oq-Lu
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3d-0005Cv-9N; Thu, 04 Mar 2021 05:18:13 -0500
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:7297 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3b-0002Ie-Fl; Thu, 04 Mar 2021 05:18:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DV+xp4xetEZ3y6+DCd/UEQLUknwlNtCXQF2ki5CaKSAFbS/p7xy4ouqnrTZWHG++VRMAViXiHPIWg7B0pU1/2Ucyvjck68N+qKZtnXZNTypFgS06W1zDdHIu1UdkJDMEXhDxlZ6FinuWZAlIpvWzW39l7z2TEqkWRVXgAeB556noPwIDZ+J8wUdh4IScJWICv/w0dKWYdAXrbyv9MiX68od5YykX/fhIsU2p/zUoumOHOyf+6D0msVcfIfTmpdaa6asJiGUhhybsHSAT9LDuOSs6xccSWW2ze+WnXswYBkJ4pl06Nkbm9hRbTKTfG/KFlZ0+RNT3tY1Wy8KRf64nWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRoAXpmozg+pJNMUzTuZ/fUc3k1qYIA11Ax92uwhZhU=;
 b=nm+9pj6C/F0bIeUtsulVSPdM+Rp4AAKn+kaCsGEoDlC2PlTUit95SPSAzMwjNldFKotNlu2hLfiDJwVdzuKEQq+3A9+NFgP20px5u0Xzi84Tl+ACCCoPqz0D9q0bGLTeZWTKIdstzD9umShCMQD6JUGbgoP0DpTocFoahJSNFuh1ayUUWzKkUlxwIhJXaFT2RWumLqFyeo4+fCdmrd6ESbs/VV8k4INpxZ9uROmfIguan/hAOPnD1dEeDTnCNGVAYUe+4RdDKt6Wtf/eXN6oIO//gh6E+zDuNKYujgxSZQvvMF6u3ciFHmhnwjeo04Eq0GDRbax+r7TagiQO6HTpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRoAXpmozg+pJNMUzTuZ/fUc3k1qYIA11Ax92uwhZhU=;
 b=ZJtzgMU/lBX356GPn2ZMnYHH7cOMsEWX5wh/3zTav01G278sbHKJT+V7K5Wy6qIU4KAZlGB9Sdsh5xOydJ/yNOZ8KVCIeIgk/GJBy4BELUZ7E3KZPVzO4swJXCqH58VPqRHfAN35Fssmw2aB/E2eIkwNkdqtILXFp2ms01+65NA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 10:18:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:18:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 7/8] simplebench/bench-backup: add --count and
 --no-initial-run
Date: Thu,  4 Mar 2021 13:17:37 +0300
Message-Id: <20210304101738.20248-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304101738.20248-1-vsementsov@virtuozzo.com>
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:18:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6dfa969-dc25-49f7-4e07-08d8def6cb8d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38635711B587A291F8A04A66C1979@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rk/T4d7JJsuub7uTydFOQxo1GJMjz21Hg++AwCSaP+a0AFSRcsfWcgj0Td6sOxgGb2bojKiYKNx3aiCtT1zaaDk5rR1domHNiJtiPP4yTbi9AqEQ1TaaiEVQAkDVsPSk8jLRFN+Xu6ZwV/r5thmxNxc4ia3owgO33+uZSi5mXS9Qge1PIkAUCvuQ2hpksRzsf2C9IP03Y30LAY4M41/2B4LANRiG3+hD1Fl5vTPej2STF/gYjgChoH2RtvJCruUMF7I0MHndT+O2EvGBQC89OgMY4uespo8QK5TiOfExsLlkCab9demF/0RiTBppowwPY7zNDgxOFQxXsGSO84EJejriuQhAQKtq9ndcNqnhH9eeb1WmZreDQOdKWNMc0DqvNL5/GiWdZfIjo5zk0ODamly/um28fyGadXX2vhEvVMkyxsXm4Svhc5XHx9MV0dhmPBLlzkuu9XWmR76TSBMXxiriiwboEacaipgJqLLVjo7HvgYC5U5zHj8Arhwojkyogav8dCiGTrRUr1POiUNb9SJkixP87I3OUf+3ebeLs1CTw12orOyScP4FFDR3TKUXVNR+van3WqBl0AUJ22+pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(83380400001)(8676002)(6666004)(956004)(52116002)(186003)(1076003)(478600001)(2906002)(316002)(2616005)(6916009)(6512007)(4326008)(6506007)(36756003)(26005)(86362001)(5660300002)(66476007)(66946007)(6486002)(69590400012)(16526019)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9J1rabm88HkNzCtI1MhvAMzxBXF1VaQHAjhEhcuovgf5GdwUJgpdHMF0SNnN?=
 =?us-ascii?Q?I1LMrsNdeZ0hDwQusUwaNjQBhWwI6F/bGlarAKpJAwt2vStcbaP3DfxIubqe?=
 =?us-ascii?Q?DXXvntufpe6RtDKr0dQCBDrWjLjSqp/Nj93Ap1Ct+N0hpSkcj0g6roJ5nLPR?=
 =?us-ascii?Q?SAhqIA2jjO4CP1ZBlOD67r+9RWyCTNC0LR5i1GL4yX9Z3lUK519SMeDEj+1t?=
 =?us-ascii?Q?2hknfoDgIO+ObOmEJDLF+Dz891HJ8d4a4qwIOgPJ1AlxaNhJr+D+zRsA7bw2?=
 =?us-ascii?Q?uqutdQx75i9TpAmlyIBYV7osrKNe+ybjADFnB/ig/LcE4+iWZcdz70cjv6EN?=
 =?us-ascii?Q?ACV3WV1nJjNfLW3Dwc4VMkpWyhOtOetisxB3nXmHTGvZgLrhvxDY2Gc7s3QG?=
 =?us-ascii?Q?ASm/fes7BcXYeMV5mUbqCkjLXuNh9M7m4W7nTKotOHD70N/qlP2e0sZ4dWf6?=
 =?us-ascii?Q?ogQtnbq0KDB1KEIBctdFjQ2bTvJq2k60cDgHQzbD5/IXXV6UvpAcKKhk8hi1?=
 =?us-ascii?Q?gFKlAefhDsWCkV05QnQeO4mx5oTaG5zBAAe98i6TuIaUVt4uP64EtgJD6pJa?=
 =?us-ascii?Q?sYWkHe5ctu2KzOPMp88XvezqTWQa0PPpgHFOT0odT/y/DYP3lUVEDqc3cSxi?=
 =?us-ascii?Q?7v5XSCI/peYgrWjxuQxPHy/IcVoJwO3dWpI3t8aqYrMgH7j8lPr9B/Rw9vQg?=
 =?us-ascii?Q?zVEMICvpnZKVEXCVlloidoSZMkUHgA2jW5WhLvzJei7+VRSWNkFmkfvQbAUs?=
 =?us-ascii?Q?F57l/8ufym2KF/YXICtUGKhdVaZlMfzNJBogu6hrmKaukMi37QCnPFCVRiIP?=
 =?us-ascii?Q?MuavuWZgr9jXFMj25cQYrYnrhgEbmtp/o+0bIjpnn0HoGKWWB2ATdhvmvX9w?=
 =?us-ascii?Q?uS1mLSCiuut/q8NeSTsIDFoG/GYx6blknNIpwExAya1Gb4JJB4HW5JDXYI9s?=
 =?us-ascii?Q?PJMeNDzM9WgXannmxOBSQkdYDw8AOMZ+MULCJ1afyZQv4S/4Vp1KYCji4f1B?=
 =?us-ascii?Q?sRrAOFi1XfRKm3ZATlR1IhKjVGx3e8I3wKxU0zzItiU+27EESRD7cY3V4lal?=
 =?us-ascii?Q?xTa+/YP8XLCdqYhDh9GkoGUNCGGmnNWBjm7HuK1fuwZgvc6N+3EDCs83XXeU?=
 =?us-ascii?Q?k1zu8ip2IXfJ38hI37p8vO0uRV4HvQFUQp5nSuPjwQb4sNbhAZKpT2tSQC/G?=
 =?us-ascii?Q?Up4ATgUhF/q4bHCaZv400WzYgOPjGvSzUD5LNNFQc524GCTujlgbplO8O1fn?=
 =?us-ascii?Q?NM1I+eeLw52Z9RcAM6Sy8Ag76a5PlzbraNOpZPlQpgQESrkVQ8bWkDYjV1Nc?=
 =?us-ascii?Q?P1CmAyXd8ZI9ss+WmqHJ3YJb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dfa969-dc25-49f7-4e07-08d8def6cb8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:18:03.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaSNYcmBPRBmKeeko6rYlwQPA2RR3XNLbH05Xgi+KSoPprZh4HGlAQ8SvzQWP0/LL2yQYFlRel2vJGjhe32cdStbtkm/Y/JrdNGUoh4vHwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.0.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add arguments to set number of test runs per table cell and to disable
initial run that is not counted in results.

It's convenient to set --count 1 --no-initial-run to fast run test
onece, and to set --count to some large enough number for good
precision of the results.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index a2120fcbf0..519a985a7f 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -155,7 +155,9 @@ def bench(args):
                 'qemu-binary': path
             })
 
-    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
+    result = simplebench.bench(bench_func, test_envs, test_cases,
+                               count=args.count,
+                               initial_run = not args.no_initial_run)
     with open('results.json', 'w') as f:
         json.dump(result, f, indent=4)
     print(results_to_text(result))
@@ -211,4 +213,10 @@ def __call__(self, parser, namespace, values, option_string=None):
    both: generate two test cases for each src:dst pair''',
                    default='direct', choices=('direct', 'cached', 'both'))
 
+    p.add_argument('--count', type=int, default=3, help='''\
+Number of test runs per table cell''')
+
+    p.add_argument('--no-initial-run', action='store_true', help='''\
+Don't do initial run of test for each cell which doesn't count''')
+
     bench(p.parse_args())
-- 
2.29.2


