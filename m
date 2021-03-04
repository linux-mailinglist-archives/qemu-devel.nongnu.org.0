Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0632D09D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:23:49 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl92-0003kv-P3
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3Y-000508-8w; Thu, 04 Mar 2021 05:18:08 -0500
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:7297 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3U-0002Ie-94; Thu, 04 Mar 2021 05:18:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXziwuhpf2jqa6Wx1JQcHaQlO6Gx03G+9tv22bWMqyuSFLpFFUExG/8gkArPhLjQK/jR+vftPYbf8IX66y7DWjytHVu1T6sF95iQsAx1y7Wzg8RGMmi8D3YMGaUh7ZH+5HRoCMfCXDJPvc3z3JcMrEkjjPZA62CeYJb1kv4WNKwgepGvbHJBPxNHsSo1p/znxcm3AVt+fHi7XJJqUI9Vt63l8pf43ssRQ8mdPImp/HAq2G5+moEGhHNKwX1Fxuc9SiRodI+ptcsK/wad2N0R5hsiZsuR5+/X5libruxSVcZOGUlrFDN5yLow75NWlfB27oBptvSTHjuGRGBod/WPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oD0YOD70762jiPVd7TsK7wHRccQa3lCZtJZchFGpPs=;
 b=Z8wKnPbGN/24ddRWGOnbxHdc3EA87qcidpkl+FiE6bDgxgfhBE7O9Tn4FzKTZt4M5chHECKJOTiNJJQY76OU7f+SQPHrpeFFnNmN4TsqZoaD3pYDiNu8ZKVE/p3T8vI5YZFVOz4/RcN0vukgo14z5T3KvveAZim317ekXRUe88u+GaYJ6p5zt5lnCggwgJ7bxdZmFhFcEZ4+BOnPbkp4x2rZ2H1WMrrII0+GZvQGymqwVOCMY7Qa3KMfN1wG2cgXpDXmWYTR6j8ydq6NoxRJz2YgMtHJnbVew312Zp4F7qpgONJlpxK3XrSC78EgiSIYqxHNE01FYAdMCSx08WDJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oD0YOD70762jiPVd7TsK7wHRccQa3lCZtJZchFGpPs=;
 b=BG4Yk/KPEjGtpNatopPc1U6IGHt8eAhrPHPCnwZk5b7Mzz6xIv142n6gfQnG8biTKtNA4j0gScAqwt4H1ra/DZ5GMpMGUthe1BxrvXrXB14XmB0+vOfv2gsMhatMgdh5wn75ObQ8NQIJbrz+iPzgHCVD5drlJPdvoAcGdCMefcg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 10:18:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:18:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 5/8] simplebench/bench_block_job: handle error in
 BLOCK_JOB_COMPLETED
Date: Thu,  4 Mar 2021 13:17:35 +0300
Message-Id: <20210304101738.20248-6-vsementsov@virtuozzo.com>
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
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:18:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d07a972-85ae-43b6-dde9-08d8def6ca49
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3863A9EE0DE74CA67D33BAF6C1979@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PAFi2v1Kl4lQ75HMFWwVDOc54eKVHJvyoze0+KdjNXIRPmjXdxw5qwGh/cfdfa+CWQbw5AWC9BTNiV915Uz+W8ClxHL8I4cSfSbAyZ72zuI2LnMSM+jLyozIB7QZW2MqXoGodpMk2GZ0tb8yWiguZW4v6ZrxwTirAItQJjVIwjhsVgInqr42mwq0E0bq1o4eGCdxGfkXcsZNHNMn6CWlgZEodeDzrAHl2ZNMa55id0HK0ejW7doP4TTGMvieo2b5Oj7tbnNe6JGyU6vqjXKal9gHx1jE6gWCI0gN/BRrYL2RZUfA0NWHrMLRyXCZ8CKvoCeldPAk1LAKLzSG7j2dgpXd+Rtbs6Rz5USmZny/H0be0v9b2FG5o9OAa7aNUlI9cMLWw13AaAWrl821AX9yluFBtTwLSKbblSPlutV+fUx9texq6DeGFP2XdILxHXlVAkAdeMmRZDLo7pMJwvmPQyuxNoYIRHO9fYOmuXe3nselj18wrKTAyeJyReoi9LCXzN6GH0aOcFjCBQhDkdn86IN7u9Hz6UE/r7MeaOzk81pAPfc7JPklbiQHso38BFMDjYbpNZgM6KScnhDMC+LxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(83380400001)(8676002)(6666004)(956004)(52116002)(186003)(1076003)(478600001)(2906002)(316002)(2616005)(6916009)(6512007)(4326008)(6506007)(36756003)(26005)(86362001)(5660300002)(66476007)(66946007)(4744005)(6486002)(69590400012)(16526019)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zPrCmqta35lslmE+ciL/N1PFaXLsq5wwdskUuQdzmKAmSeqt33iSJmfSpVHQ?=
 =?us-ascii?Q?pstxqs0+769V+IIBmPwby097XpRd8cSUJ3lYoUB+z89fzRnPqe0sjwFRUMkn?=
 =?us-ascii?Q?3jGLv8TjSzUxDd78nKSLI1sxJI70mKtGjrC49SvNbO4eaEf6Ja+wSz35Gv87?=
 =?us-ascii?Q?PgeMnS55gL+wX6RSTGLuYlKSFSnrljwyyA+AI4nQyP7XUbcv23Hjhca/SmYx?=
 =?us-ascii?Q?mKaNhfbmNvu+6i0Mc+Q3dfTHyZ25X9YoTHrovPjjgYgIxVmK0rprBYxZLUJu?=
 =?us-ascii?Q?siusCdeTtZRNImsNtMiVkNGK24XWgGzIqdgYyUfOLw4D5OcQ/BTRTaVFYxdY?=
 =?us-ascii?Q?g1xwUEO74L8va1Y9cbLe+M0lJCXR0/y2xOkE3CIEvcpEj4wJ6gsLoFOF9Z5P?=
 =?us-ascii?Q?LLW+PfQnK/PJtyKBjharwOVt9QHbwDIhZ4cI6QQ31NV7P+SofaGcqjVl0TvO?=
 =?us-ascii?Q?mSsSqtDgf0q2skBTsC9creF4ecsLTSnKuB7Ke1QPxuzMCeW52UwNfNQLaHfN?=
 =?us-ascii?Q?uN/gVkX1qpQqb5GDIdL+OV0Irbz+TkTvSdKD7pLzc1aSAj2IdpuaTQxaICxm?=
 =?us-ascii?Q?RSWtlt5h1DgUuZp9AbZvGcu5bEgq6CwOKtjYvErnjJZimINnxWhXiNv25jJs?=
 =?us-ascii?Q?j5RXuhxTDTaitPBwMcVKoPUf/rbwtfqpQLGWu2ujjEbtN+dgU7uUS5dOb3r/?=
 =?us-ascii?Q?joEnzPeXQ23bhkvbZPw/5oYZA1AnUnEmJF+zarEdWSGkqc3iqR8YVOcOhfPb?=
 =?us-ascii?Q?ABHCn7ckVG2DSdT6njr1k1oupGRsyMuL6fU4mzr63OSUkkCJaxpMWZfFNYmE?=
 =?us-ascii?Q?xOI04dboKVl+FBscdIMGFgomoW40i1X4gEQxhY6rE+BR1JsRrJ2b4pg89XtG?=
 =?us-ascii?Q?NTqPCWCQNwY09NUzFOBO1G8Oe2BAqpmJYQ+0dpOvNSsUt3fVKgcnBsz1Xs1h?=
 =?us-ascii?Q?gE3WNQijPuHuFWilhpwsMhXvLSka5cZTuHVv+mndgqyFYDL+QCf47a4BXGRK?=
 =?us-ascii?Q?umwun2CV79ehZMz9lXddvrz/yLk/7NfeHz0AFOXuCIHs4YNPlkZe5J6IjpiS?=
 =?us-ascii?Q?fZBVeWDWxSbTpBMcXW4+JJYQ1Fu+T5wvE7I1DGFUHlfOtAeZG/qmFiMGzpYq?=
 =?us-ascii?Q?WXdMr0BnFhXpJH37P9m3ELCen515EvHjWEKYnIYkF6tCn/RlXEA2xINUuk0U?=
 =?us-ascii?Q?ugwZSC9cbF9Wm07NuG+9ELHB4Ln1HSDIsWd3NU0GowlNHF46sIHlPcgFKszQ?=
 =?us-ascii?Q?ezynMgFc5vIBNJrHjj84dlNIgjsxWRwhnoX3JSEyF0grEoCOKN2pjYgc7ueJ?=
 =?us-ascii?Q?tigWhUdehMThQKbi/oRv8fw2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d07a972-85ae-43b6-dde9-08d8def6ca49
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:18:01.1752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3OvASLaaUSXzu5cd+u9Ikl5HsHpKDRXpmmfOyW6eCvGW8mk5QYPqsOH6UYCWP/7jRZ27eCpPzhwvBbAqNPXYRxzegFDfLerbU6FtoebzYI=
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

We should not report success if there is an error in final event.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench_block_job.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 8f8385ccce..71d2e489c8 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -70,6 +70,10 @@ def bench_block_job(cmd, cmd_args, qemu_args):
             vm.shutdown()
             return {'error': 'block-job failed: ' + str(e),
                     'vm-log': vm.get_log()}
+        if 'error' in e['data']:
+            vm.shutdown()
+            return {'error': 'block-job failed: ' + e['data']['error'],
+                    'vm-log': vm.get_log()}
         end_ms = e['timestamp']['seconds'] * 1000000 + \
             e['timestamp']['microseconds']
     finally:
-- 
2.29.2


