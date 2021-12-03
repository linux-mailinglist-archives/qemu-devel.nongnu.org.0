Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5215467739
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:24:23 +0100 (CET)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7by-0006JI-I8
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aU-00047W-VB; Fri, 03 Dec 2021 07:22:50 -0500
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:26637 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aN-00072E-Ag; Fri, 03 Dec 2021 07:22:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP/sKQ5IEocz2gFRYL+HyYXCuYQMNAg5GfnM5IMVGWU2OU6Wi0Scsrrp/8jTyRIdWiR17hHbc0vri1SMW/5wky0oDNXdH7EaaprSOgbXdc25PwQdd6X8CVFLN7HRNGQjdwxhp+k4MJoKDr6JODH6wvpivieC6cbZxkB8p6M8nIhPRVsEqPFQCV1ryBgZSyW1h0V+qr0bjxEEscEpuh6ey6hsi1D6gDh1halNDW0P5bmjn2jKn8pDVpxRltBBJXnPWntpGXUvtov0DkA0s4EfN4SoPsnwopMVgCfRrAIpgePHQjJmceuEvPl0+vABig6/S4MVDoPDd+rcWVgyNAwMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5VypB91RRfKt20EFtOkyvqBKp8y+vRtHlchJfqBwWw=;
 b=B35r0K3NpdgJCzplEcuEHP/wcl4oC+g8nSEjgcuLBPwfiaKDqMinMYpHeQcWKFg/HLsccdK2wlBaMQy+FWsUyoAtt772zQrTpPcBY7eHx3+FShKhlkfYGDyTWMyeG7829EDrc3UBKP+y7tZF4pb76GLI6JbJNsk69LNEf9Ku5a0i0ANIEAf0EHvbwqzG2iiwyldiV02q+wYervoqTH0ogA1y2FFHljQnmitFmlZ4PjHlAiGHVcQu6427hhmttjsx9E9lrJ/InghpaaibSEwC/JosJSyTazWF2Odo7RGXymBwavMbchnR4pmn354z7XlU9qZ8dOoYoiD3D9/qQte+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5VypB91RRfKt20EFtOkyvqBKp8y+vRtHlchJfqBwWw=;
 b=onL7OJ4iHG0K2f3r/iFiVj/XJ8Ks8dF84jVP1UY7IXio32KtXqAwoU7pvYxLmdfp2QpaOYMX7YE0FhW4bPpYClc77ShU28sPzBoNxR+Np2v4iwjnkPtHkr2bqAxBuixP4u+vUwh2kvcq5Awgh2JbK+tf2DLXg0TO5hWkO2l07SM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 12:22:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 12:22:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 0/3] iotests: multiprocessing!!
Date: Fri,  3 Dec 2021 13:22:20 +0100
Message-Id: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:20b:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 12:22:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072be713-4c7c-42c2-f1d8-08d9b65797da
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2178:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2178DD94B6DC9A18F86CC439C16A9@AM4PR0802MB2178.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sk14KtfkRxId/lLIjPqmXaVuPpE2OerE6DNFgePmb1PLCQ2abKeaDHKPSkRQJthbnd0N50zWrJoUJuxtscq5PnCsmJevRXBpFcMo+dA1j50RHf9z3dU0HSIOKAdNEqgqqddUM5cyNWCVtDB+7qoO40B658RFn++/W4pGAb2XAJc8qXVKWaXkm4FOoRhwJTWedicP6tU9rkG4FdMawYykdj6Nq7NZnVQbauSly0cQGjyGZ8rWvsxYGMEkRxTM9AHVfyTCIXJECe/axyCHPnZMoSQjHRFsB/VFQu/fBtpGZBpYiiY5QMG3zpJ9MO763qYituU+jKT2FtASm7L0zNuF/Du6OdGdkbdwodhUNqjzepLrAcBysL3ZP7JYWGUQd71b9O2OqolZSIfg7h2VlqNaobOlbSVo9ShVYjrLh04dv1lnfJzGMcHYl84HWyLe9y/7psfjjuYs3XqKPj+0rZqlT+saVZm3VszxbuWb7WX4KH2TcnWVACA574LEvcZiFU8alMK/mFQDRzEzm40S/ht71rGk4GGVco5fE3P9KT8Egcez///7/HDMS7bN7hbxnmSWL72iL0oKbCIUpnbl4WSMgRKD+jYswLnVWl2AKgI6MUpYjSsrYYFuretF0kIZar9HIb/QHCPJ9tCCotOcBAEY2x6Fkk54gZuF18W+JTN311MXMLcNU6VqccS7FVY6b2OwmIB2rRomWSAQBODMv8aBRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(508600001)(2906002)(66946007)(83380400001)(52116002)(6506007)(186003)(5660300002)(8936002)(38100700002)(26005)(6486002)(38350700002)(107886003)(4744005)(36756003)(316002)(2616005)(1076003)(4326008)(86362001)(6512007)(8676002)(6666004)(956004)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zrdJE4FL53UyR7bd2S7Y6YPyPuMXmBjKLWz4qmS0ZPSxw7HjWoiKmW2NCLQE?=
 =?us-ascii?Q?tMmPjKyy8K3Mf2eKEBDZOzq065bdLVt8V3O3X6QQr1H8kajeBQDXY46OBSA3?=
 =?us-ascii?Q?Q/4srZ2ITgM3Q+yf8d4HRrNA8rJQ17vU4AwC3VWULdVZakRzby5Cby3SDlRH?=
 =?us-ascii?Q?IAHht9Ch+Qpz9R6meU7SjvozhYhkjRTIB9hIELSJjW81KRriTHtvmNLHSty+?=
 =?us-ascii?Q?PTH3rknjAhtjWDTN1QoknVbKeqFUSL7jPyto5Xs+HYQxw2KnliKlSO+UY0hw?=
 =?us-ascii?Q?icPv7RPKVK5VMXEK0UKMvLtnvb31fDVfPduSIHfVGtG2PYHtpp1dV28auSKQ?=
 =?us-ascii?Q?I1fkTsto98k9Un+C4Njd3xcqlj0J2yP7+A4CDoOvdlqy7IU49P6sCZzhyzxf?=
 =?us-ascii?Q?vTwsrlYn6dZtvWiqUXZXdQzScYYxBDbmNtfYDDErrz20B8eohE33gShuLyfu?=
 =?us-ascii?Q?KLpUNz3J2CwBL+ZP+y0s/Jb7xbuFUasg3MtvI++rJC2euz+6ZYA/po/RMOfF?=
 =?us-ascii?Q?iqCOJP3BoHkDdWTIfAo00gAVvdzqj3v+vjABGBD1LbU3myEAUFc0E6dTxwck?=
 =?us-ascii?Q?vr/4/Nnx8ySmEfwLx2zG2712OMCL8G63uRyToCQ7aIX26J3UOEyvqSgC1mYs?=
 =?us-ascii?Q?t4XJfsNKAdZhh+ISOh7FNT8l6hNhnV0+rT6gDq4ICvsufJftvbma/83wSoT8?=
 =?us-ascii?Q?pQ9PUuvYHeIkHyZ1Bw4WKnrRjPVv+duYrmPW1LC/jO6aVJCo2DcrhVh955M/?=
 =?us-ascii?Q?+vGXGWVrZYUtk7MgarRomRbjplH3zneSI+hUtz0ltzab9hrJb08ZpvGMJffr?=
 =?us-ascii?Q?pwhSOxNK6nYNavS/kDHC9uWbrF6w8Vwj8XLRB8l2NFdbedSTRG+e5TaR2F9Q?=
 =?us-ascii?Q?dEU2SmIHm3Q3Txggy1YTuxOrAMbPK2p4+N9+qRexGDr4dKZebb0bIhDgvsGm?=
 =?us-ascii?Q?OkqPfcGzPHhYyQoGddSyIpzoa8Z9irz+bKOEjmy1ngKwTZJmb5hESQz2hLoj?=
 =?us-ascii?Q?vbcb4vkJ1Xqfsy04qJnNokOfYreio0KLWz+XxTfEUs/e39gw3XSbXe+ZBB66?=
 =?us-ascii?Q?gaFz76QWgzbe49uanJkBmDZaqEyDBRZhQsBFkhcV8aIhQ4URrGlsBw/FsNR3?=
 =?us-ascii?Q?A+P91+STZKKBYlkWG14VB+ezXP/soH3LlnPA3+RRjV9pMM6nYKKKGxu6Bup2?=
 =?us-ascii?Q?nfcip14VDPjtqwnrZJHlt5HoevUK3Dwrt/Kfi+WrB6fOrkRdWsyiGbHBtU+E?=
 =?us-ascii?Q?6z1BsLdizGllJt3ed/9B4pZ6uMhcvmqsXh91TPYEZOEwtwuLfD/Kip8ot2Os?=
 =?us-ascii?Q?3wBJ+EluBiuhP/bay6ENfsxIRElMWCmnUsRHWg7SaZJDY5Tydr8s7HbGXDjj?=
 =?us-ascii?Q?WcQ1HNr4beKUmV37ot2QrApjH9tMqcOEbE9QBAQCa3GEkO3NgjdTfi8pvW7u?=
 =?us-ascii?Q?k1B/ztVIPcZ1DmJC2KGKHUtsqCIzvVOhApURrto+BLoP6ZhYyDnid/l8rPUg?=
 =?us-ascii?Q?wMVhg2m38eWu/bFEfmz6uiM3v8ufGq7LeDBV4tA1cT4ejJl404B6hK/703WB?=
 =?us-ascii?Q?b0yZqBSGgq0rbRS7/Pxe3YvsHQS/I88wLj7BrqjcA7VFRRVBHarJ6F6SNhEG?=
 =?us-ascii?Q?oUjRMjKmBl8F/6lTeWNXDCY2uncHV9BiwssGYRz6ue9MkjdxdGsCC/DLgHm5?=
 =?us-ascii?Q?lctOjQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072be713-4c7c-42c2-f1d8-08d9b65797da
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:22:37.8890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/NXih9xtGXtFVQwyxkq/wpRLOBFvHQyCsa2gxQvyt0EEJDksMnfl+4SusxjgWFvfyi5W76e/8OqT19E1UdamhTS2bhZiw3VZ8QzWOtcCUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Received-SPF: pass client-ip=40.107.7.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Finally, I can not stand it any longer. So, I'm happy to present
multiprocessing support for iotests test runner.

testing on tmpfs:

Before:

time check -qcow2
...
real    12m28.095s
user    9m53.398s
sys     2m55.548s

After:

time check -qcow2 -j 12
...
real    2m12.136s
user    12m40.948s
sys     4m7.449s


Hmm, seems -j 6 should be enough. I have 6 cores, 2 threads per core.
Anyway, that's so fast!

Vladimir Sementsov-Ogievskiy (3):
  iotests/testrunner.py: add doc string for run_test()
  iotests/testrunner.py: move updating last_elapsed to run_tests
  iotests: check: multiprocessing support

 tests/qemu-iotests/check         |  4 +-
 tests/qemu-iotests/testrunner.py | 86 ++++++++++++++++++++++++++++----
 2 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.31.1


