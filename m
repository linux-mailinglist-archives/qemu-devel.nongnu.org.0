Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE5310E0B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:43:10 +0100 (CET)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84CL-0005hj-Tc
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l8479-0008JO-2R; Fri, 05 Feb 2021 11:37:47 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:26183 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l846z-0002Vt-Mr; Fri, 05 Feb 2021 11:37:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbh5I3hKYPeRIg8aTw1DIMeyIdDG8MMZPWyCS8ypxDQ34vYVbbrhsTO1s06pCPtkqbmBGNykpT7y7c4ex+MlrtrrR47LnBBn7l90Y5/CiCJ0RNN3NhZ4FcrSUArU7Vy3iFosa5KvTxVjdS03s9hFyLZM4A128O4mRdbDjM+k7aQetfXnqxuFOcMpecfF2eKb1YGdEOj9BMeiEc4b6rb1rnts6PhnHPkoWuPGN+u4D3MsscyzHFieihobhNC/+KuwYVJd5eO4VTT58jCIOEhFfTQzfciZo2nWx9K6EBBn8pSF64sumvuiYO/DMvmCE+H2q8XaQNDtOhmOXmtbF7YpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tXKF1sKSwyXKGnCdxZtPrM8/Bz4PdDpZz3R6FbvCXs=;
 b=X3AHkxNI+UhWEcyQyKPD+49G7FJHor5dZ+pJjaEgCy4AC52zHoAfQoCdOc+powtD/ScdQjrG8vXCAaAuusa7OAUE6gRPkebpCvV53NVhPnAhivygr0+v/87RoVGQJd+8pARIqjX0soVc0KovAnBTGRoTtOssBMTGY6HAeV/iuvnWiaQV8bPZmeX3n684dp+tSIanLInnt5MCl50pOiRNxcwRl2rPZD7PwiB9xVptD4/JeeHCaCcXqVq8LJ1Z5sAtfXXJRE7HSLi0FtnH+dPSCHqV9xn7pSpkm05+xv8QmkxfbnUlNux+xbMjUtlUBHH8PKQzKnXtzrylKLvb4dmAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tXKF1sKSwyXKGnCdxZtPrM8/Bz4PdDpZz3R6FbvCXs=;
 b=JlaS5AFb/fR4yB1b7AN5jrhIxsW3yIZ9GRBebfWHEHzzv3DNFw5vKwu40/fX1A8wDJhnGsfgkGOwb2+F0LejHjsDan32DhkA4DcS52CLJgz9tmnkFP9BlwFdPmvcg8SAEeoMd59pIH4JjPoB5BPK613LGwRqOhZSSk4m+nwN9Lc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 00/10] mirror: cancel nbd reconnect
Date: Fri,  5 Feb 2021 19:37:10 +0300
Message-Id: <20210205163720.887197-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a327cbb0-5c19-4bf0-b584-08d8c9f45629
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44705D07926BDD615FA8FFF2C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cN1Ha24hBPpHCaQlC8jCvKEhhW071eNbWWprprAqeskIFA7H7QH6qEUVL0huluSXUr+MCSR7MtGaKVgcHz2ya/YSKpMZzaS91h8Li6O/oVgoj1uAj8s23vbB8nDUy1+4Fsj0QCgvhsRa7zVDS/mYOxy8bUqWnrlVgyyPokwFjrRNEtHmRcIbfQzXutN7TWqCED0HxlyOw0cb1y7qbhNS1GzUTeAdOwLWI9qMvqPt1eGDEEJ3voCe2v+JWFimP02d7ooArtiiUMlk0NSlGsui0MgHi06kf0n7QOT0yqwY/5LfZTfycct981ZqiP9+jfPNf09eTsfCGcl8i3tfHQbIHCnZ2njkk4Os1JsAGW6Bv1RwFAHcL1j5TV5cXp++hTYU66bd91ZqNcvyWl5I0iXO0fE8drqlBj2PWN++sG7wLvidwQD3e+aRl3u5YNLtSiNlnnHa13XCJwq/qM71P1j3hTmrSJEJoRqVMCZFJrsL78UyzzteVjb7HcgnkA3kKg3WXUl8GbWG9o45xyCa4KjXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EPQxhSBrq9FGOYnP+pg57GxLJDFUCpYldcrFndSX/T52ZCvBinaWg1NjOcXB?=
 =?us-ascii?Q?wpqa2Ndha4a1c+V+JUzP1HPtbcr/784yrc6PYgAiwXyH3ZKqun7OOCWAVz0V?=
 =?us-ascii?Q?odxEW2Fo5j+ZYpjp1ncc+ZpiGbyQKPAbbaRm3rPFPMUme9Sum2vqyQ1fNcx7?=
 =?us-ascii?Q?+oLuxbCTV2X4+o2iTKO2ByTSXiwzUNkgV6vaZTr1897IuGmk67Z0gRHjik6f?=
 =?us-ascii?Q?vmgzZ4bIC157kRrIxcN2871wOnruP0oAam8oUaXhVht81CCWASDdlr6TyVfX?=
 =?us-ascii?Q?+PaOddv+ncjwRAOWrlEbdpTaTDNzuxUAz8ekaOztIK+hhbkt+a7IZXJ5WOsl?=
 =?us-ascii?Q?5Ob73lxZK1TqQCLCN+vcGugXhwu2PNYhrQRB0jbDmPuy6Yqf6DzZEmTWOK4d?=
 =?us-ascii?Q?FCpjmZTW8K92dLurefez3JwdWdoMayfpNOsXTVPMCB366Pkiuq7FG3dk4rP5?=
 =?us-ascii?Q?Gv9U4vEkp5YeRvyy5+LBgyMUT8uCs0G1wapPggmDT11rZYj80TbdRvmFQwzx?=
 =?us-ascii?Q?5iGELOKgHmxYV2kwlm/H8zC99/iVNMWbtQSUqQcAagh20tMxoXHFxOS4zHSY?=
 =?us-ascii?Q?agbWQ+43EUbK+XVyMb8jGowijHEiBCurp57LIll4SNkZWwHch5e4sVPBQMwL?=
 =?us-ascii?Q?+dvbCNqzzOnt/Rl/d7z0WNlGshAaqHRpa/xiyXNCU9RKM36sa4lQp+Q6+YjI?=
 =?us-ascii?Q?bbOv6kTGQFh3Lk6bxL3Jrh202NjKp+wQmO4w4Rmu1xQfJT+3/Gjcu6OwXQCC?=
 =?us-ascii?Q?CAoyiqnIZMeCJSVrtxgOPPS1bBEu0FdX6M6vN2aBFpq9PiZj/rvgjs+UMTZM?=
 =?us-ascii?Q?1aalmX6JeiAoBGgzRWL5fkSB6alq7/WA/re9rB3HrpskCMh4aK4oA/hiqhrE?=
 =?us-ascii?Q?1eryNvucWkvOEtz0fj3hdJTtoETtre01ZbPZUAics4wMdkR9g2RcsaFNoLuY?=
 =?us-ascii?Q?uOG1/BTBm6vbL9pMkPUwAgBVgciFHUWOurCd3LmaX+X6y2MTVq8ufG9fz74n?=
 =?us-ascii?Q?0QUNevSuaFasirYAwvC09HMw/ZiIqmc6SzDy+skQ4I5WEL3fTJwT5QIJAGWk?=
 =?us-ascii?Q?K6USq6bk+YGb7nEBjoPOJ7DHTlFublE7vDcV5AV13x5dbCGIz03fWK/aVwMw?=
 =?us-ascii?Q?0VtYHA0GDbo98RXi9sBXU1cJx/ubLT4C6VY/IL7bdVWUQP3Od4M9cttENP6q?=
 =?us-ascii?Q?1wDGmyu4gHV/+awz43TFimjqRT19xp4S3YXH28YhwXHvPx5bvL09qJRwfKlQ?=
 =?us-ascii?Q?AzfX9Tx+fTONB5XOCjRDmha9e3BMfbKsM4rxHZCwfBVRJTtf3kpXHdxkGgyC?=
 =?us-ascii?Q?OK9PdpF1S16nsdceC/B3/nxe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a327cbb0-5c19-4bf0-b584-08d8c9f45629
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:32.9205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vk25g0Jqhk7T4JSNg9np0pELfSYnLLuPON7bxbNrTZGFP+rAEQPeUV6CKtkNaxH+BrOkTn2qgpLA9q3TzsyYd7ydhFuhYyHmbrBSxmUL2Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.2.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

Hi all!

The problem

Assume we have mirror job with nbd target node with enabled reconnect.
Connection failed. So, all current requests to nbd node are waiting for
nbd driver to reconnect. And they will wait for reconnect-delay time
specified in nbd blockdev options. This timeout may be long enough, for
example, we in Virtuozzo use 300 seconds by default.

So, if at this moment user tries to cancel the job, job will wait for
its in-flight requests to finish up to 300 seconds. From the user point
of view, cancelling the job takes a long time. Bad.

Solution

Let's just cancel "waiting for reconnect in in-flight request coroutines"
on mirror (and backup) cancel. Welcome the series below.

v2: wording, rebase on master, add Eric's r-bs, update test-output in
    last commit

Vladimir Sementsov-Ogievskiy (10):
  block: add new BlockDriver handler: bdrv_cancel_in_flight
  block/nbd: implement .bdrv_cancel_in_flight
  block/raw-format: implement .bdrv_cancel_in_flight handler
  job: add .cancel handler for the driver
  block/mirror: implement .cancel job handler
  iotests/264: move to python unittest
  iotests.py: qemu_nbd_popen: remove pid file after use
  iotests/264: add mirror-cancel test-case
  block/backup: implement .cancel job handler
  iotests/264: add backup-cancel test-case

 include/block/block.h         |   3 +
 include/block/block_int.h     |   9 +++
 include/qemu/job.h            |   5 ++
 block/backup.c                |  10 +++
 block/io.c                    |  11 +++
 block/mirror.c                |   9 +++
 block/nbd.c                   |  15 ++++
 block/raw-format.c            |   6 ++
 job.c                         |   3 +
 tests/qemu-iotests/264        | 140 ++++++++++++++++++++++------------
 tests/qemu-iotests/264.out    |  20 ++---
 tests/qemu-iotests/iotests.py |   6 +-
 12 files changed, 172 insertions(+), 65 deletions(-)

-- 
2.29.2


