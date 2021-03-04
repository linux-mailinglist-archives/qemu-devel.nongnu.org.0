Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC332D09F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:24:48 +0100 (CET)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl9z-0005cT-O4
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3f-0005Jq-RC; Thu, 04 Mar 2021 05:18:15 -0500
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:7297 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3d-0002Ie-Vl; Thu, 04 Mar 2021 05:18:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTp4E28aL1FURJXDqpL4wyfkpbgcdL9MfymFaApuCsN5SA3eNdEsqsHgm93ZeuSAwHcfOWV6PUFAZdVmwT+qL4mSTR+I3K6a5eItGsZeeqHJ7I2TUuk8Ojs2j5KyrK2f3SFkrnP/jh2PKJksVDQtDhjTX+G333JXluHYlxoBtNPwP4ykOY4RkRjaKeKTXpkLCJ9Bw17wvYQkiudOtFmqwtzXffdSx94h34raEpJQ3hDhZoD0mBlZYyDhgQ8lrptNohEm+s+KtJMQnPvSlneJ6VYNjwG/5OdEvNQi9PKXyrL+khqTIm0G7O99vCglGX1CdAVzy+p3o9zvK/t5Ir5hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVB61YhGDbkAPjJ89FpFutgAOkP2n9R7QEM/GX07eio=;
 b=YAWb4QJOklsoNv3quKEj5GqBLQ4iouMOtEZX58z6pnfX73mELpb0PsEMQZ21XC/VZfE4yMfFSMkGHprQCw425tLzfgxrf3KYKrxteb/m9VgQkAa4UMteKs4MLgI+oLAPpiUpoxVJPbgEAxwalxcIx6GV7jWh2gkHyDbcyV0C9nyXcS4nDq6kWhl6PkYlk1DF2nMELdvswsHXNEG/yDdsqNhGkyqMAWW3PMRgwsssq2JvNwqJ9YEFGSRi9OSdbdsLMvdGbT1o7VYKqU89ufCLVyK8bXLPHQJzst0/7MH3+qhAEYqFXuC5KuRVD7KURzwzRaF8ITHx0KGUrCq+WHBJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVB61YhGDbkAPjJ89FpFutgAOkP2n9R7QEM/GX07eio=;
 b=cEpxaD8nB5ii9imRCjJzfx8Y9UkJDWdB/QCkJv19JzPfBni7/c8gyfYENzH7L/urmgrYJ6wr+jJE1VjSnQrRwBY/NQQNzwk0c5W/5IUEtMLggBZr9+6JxwhfgPS7kc36ADGjcDLmEnAyrQ8peQayrF4Iky5d4Y5DCEhj1+Chomo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 10:18:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:18:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 8/8] simplebench/bench_block_job: drop caches before test
 run
Date: Thu,  4 Mar 2021 13:17:38 +0300
Message-Id: <20210304101738.20248-9-vsementsov@virtuozzo.com>
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
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:18:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d03153-709e-455a-46ca-08d8def6cc2d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38630AF1DBB71DBE52D8D9D1C1979@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bm+wbxhHM2QL8DKD0y05iZoPftdexvGV1m0k20XsR8eqpy2qPFsFPEz+MUzs2RL8l57O4r3fjmnPI9/vJ593z+WnJaRCQNfZ3UWdGT90swM2nZebbrMQtmUeg8GL1s3xWFiWCPhNiIwwGdEkOVECpiPjCZYi//73TeFakZj9poFnWIMjTuqSjGXt5cUOw5U9x4dvVBQ49Zvlj9QHDlUj1FVf0NUg1CXi1kzJj9TibsK8lGPuwpycy1PkTutEDiywkIPIFC1KYvM7N5rG6og9YDMilFKNe7SP3Svg0xy8g66dxZMh5ffM4T5Phr1K0UhaOoZSalhdSUHOo82fHZepxXH0l7sXz3e2DkDetxBqPHf6Fy0643s6yQzHDZeHMMKABZYZJFGs98WWnmZBw0k8sJ9WQYBHYmK8S7DerIAi15xBn39r27UHztRbH5TXKhHZ9yTLy3y1mKUkS7QZ/dXiavoqB1aekzuo4eu2xbCAqjfEnjmFPgyyEQIeXauDkgJ2+kQNSoHKjLOhSAXqhee+GLUDgBi3sRh9R4eolD38OxAsEgQOmN0mywRS2YcxpXRa9G0CI5hM/pPn2m6PD/5n6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(83380400001)(8676002)(6666004)(956004)(52116002)(186003)(1076003)(478600001)(2906002)(316002)(2616005)(6916009)(6512007)(4326008)(6506007)(36756003)(26005)(86362001)(5660300002)(66476007)(66946007)(4744005)(6486002)(69590400012)(16526019)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9dBDkVLWmgSk+34xpXyDZqdlLv06q2D9p/5Qfcdz+6z0z1pzE6HafwGymkqV?=
 =?us-ascii?Q?tvOgx/uuFwV6eK6q8CkKVOu1GSBZlFZzoYXkYxVJ9qGdW4DFWHQLdgfbFfi+?=
 =?us-ascii?Q?YW8bxEiKdrLaDcb4pBqLcBuxGVzJnXvyxGINaS2lrVLfUUjlj5k1umodh2aU?=
 =?us-ascii?Q?zSy2yv2OyrmnbKqYlB9Sh/N7Fs6FOjRPG5DmVCcIZPkykVqlU3jgCRf4wTBP?=
 =?us-ascii?Q?+HXv07u1CAPl0WvboT9GufxXVhTkS46/l3v3bi2uBPCy9blRw8MK1RE5dZSj?=
 =?us-ascii?Q?XmLrP/UJ/NhxhYTKTIuCl9GshaiSyK3FzeXnHJUftv7pj0BdavYDDUcX1rxi?=
 =?us-ascii?Q?5hj4+ugpJOZ53nNgVSayFpNQBJb/1coGeW2E/GSXhKHV/XaDBz2Ao2vc7QT+?=
 =?us-ascii?Q?KX8Gqf5GYo5Vgeh/9c8hmrmT1UiBMd+1vWnn6IuhYmRKGV9G1utU9lZjAi4a?=
 =?us-ascii?Q?WQd0tIjyWvEqkumTxu+DltVtpNxvNAFUHHlHZXBxNFf4EjTf8qAUVsHZLl8i?=
 =?us-ascii?Q?ADGMzikivf1R1DUeD32Fytk5fyYyaMWqPJqA2K0vuoarXLBwtzNvH/oYjZTv?=
 =?us-ascii?Q?Ibe2wnI45yFHjQl4DpoxjY8qKiDwaUucmfpXR14DBcZ0VRCBbn8PHwj3F4Kr?=
 =?us-ascii?Q?231NNIO8/UlyRp/31L3Z5C6SiEtaP5hCBK/XpeMecF7FFO7M8dxk4rXLkR5c?=
 =?us-ascii?Q?3nN/bkVmsevgRcMyrp+fFEhdWcDNcYWhgCwO3hL432dBDPdHtklPEJQPVkFM?=
 =?us-ascii?Q?+EIfOr+j43oUHAvWgdu7uV19+ezOuZTCHI6uOvL5TNDG4sgV5t/cB+2HUnJf?=
 =?us-ascii?Q?uUkIXouTaKhNRvn2Amuwi4wKdBMke1JbWUGyfdS+/eueF+UE4JZMQeNps6HD?=
 =?us-ascii?Q?ijOgwnuEe63gSEJub2A0Cx/EMQFIXu1dqUQvnSfOpZInKs0hiwbATOFmbhMe?=
 =?us-ascii?Q?V384E5C9U8A+GtLC+cZQAyzJWiuC4Anzkdpsw2EOLmRM7isrDnIIZij/PfIY?=
 =?us-ascii?Q?wtTM/btZd3EM1vDV1cVxGjxkwRmjQrshSfvfttUNuGOiDquBFAX0KIPxd2p3?=
 =?us-ascii?Q?ksw1DdAwGGag3pNSxz8Xws/DXTWpF9GqjqYt52/DDfr9M0vn086k+tkDhAMv?=
 =?us-ascii?Q?I+z99rmOvU94aymAalmFeRvXZnd/pMr0Z9Q3SalvqG3s9dIvFVNhqd/1P1dR?=
 =?us-ascii?Q?9BIylrDEHRbg/RG/0Xk59NMmkf+Nx5hNIqUalZVEa0yGZbZPun24B1KL3Vue?=
 =?us-ascii?Q?pVQib1/XMU8UNjGg9bU+dLcyJQi4bZzTdhSR3W/KALR8dP4WhNDFuUaEQtjC?=
 =?us-ascii?Q?j9EHnZ3xFaxFpPQ4zvYKQTdq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d03153-709e-455a-46ca-08d8def6cc2d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:18:04.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLrYCSadGb8rrZi7a1WffJHk4AeFrchhUV4oPWfrBOASKcmRJJyXzrRcclC5PJ3QKy17LqlkUhyfZQvUK/6J/otvMgc6OquG5SUCBdHH0F0=
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

It probably may improve reliability of results when testing in cached
mode.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench_block_job.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 4f03c12169..fa45ad2655 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -53,6 +53,8 @@ def bench_block_job(cmd, cmd_args, qemu_args):
         return {'error': 'qemu failed: ' + str(vm.get_log())}
 
     try:
+        subprocess.run('sync; echo 3 > /proc/sys/vm/drop_caches', shell=True,
+                       check=True)
         res = vm.qmp(cmd, **cmd_args)
         if res != {'return': {}}:
             vm.shutdown()
-- 
2.29.2


