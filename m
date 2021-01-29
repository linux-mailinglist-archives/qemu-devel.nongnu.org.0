Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59FA3084FB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:16:25 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5M8t-0002PR-UG
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5M6x-0001tw-8j; Fri, 29 Jan 2021 00:14:23 -0500
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:21376 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5M6t-000748-V5; Fri, 29 Jan 2021 00:14:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKwY0qCe3WXdMwokGPSwEOaeddLUrdQ6ZYNajwa31mBTGjqNIpIosKyZygWdPYcrxzRYDVaf37IggOAsYWtf4dkkSSU9kJ5AS0K9RAwjuJPDBZw3LuUoTy0DqLFsIevwAvZwMMDGrWC/aBu2vegqRJInjr4IeyHfEM7cNLe0eWqBtrNrtYyRdHg2Oh3ISh5AYbsmVkbsqsHyR3+le1dBH3eEfYkGo2+NKtCp1muQ8i1016tj6RY+wIMSdoElQxm2qbtKS13/3V+9pxRWQHTzUMUdY7qSbPKEvahMOO3WPDBLPm8MvndkRQUcidy3vAOvh0IDzdxEfgYdOfnfRFGiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beVRFt57KZF17T/cuqpqLI0LvQqW1TU/VEfLIB4zcsc=;
 b=A8E1zoPLfR/1aJfg7AunS+8vnLFZ/i3ywPkpHcMwfBQpN6cRwE9p5nPHypW8D/26eDXVVCx2e5viAINqkFEMZPwU79gR7FM88ptoGjvb99g/RZD0cNWUSVtGcqbd5L/RPytGXBx2BGGQJRWroevoGDEeJrgsaQwymmTf1O0otPDTcvf9LqyqsYO6iMNoWvJDPF95oTXq41taBaZc6zVgeiY1zr73IzQp2j0qTLHhDe6mgmtK77yM4zux4+FoTKXAwUd0uIAmaD9oG+y0dh48KB5xDjYmBcL1sgvS51QXOsYN2nBTJCsUrMx05ZeORUiTbWyQq04uu1GmuyYZqnLmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beVRFt57KZF17T/cuqpqLI0LvQqW1TU/VEfLIB4zcsc=;
 b=NMJ4NHOEpNbKVLqgSgFKb6TohBeNALHAqm5g8nIyM5o+4cUcxPFBu/cgKI6hpa36/VqjDkMfcKqnDFjROdX9YiZwUCVFvytlxLmkw01uVpsl8IXe9uRz4r0Tp0m72e3dJ2sNudfQdVJrxpf6FniUCTmkb8s4eCPqzRgnNU4/5Ns=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 29 Jan
 2021 05:14:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:14:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] tests/Makefile.include: export PYTHON for check-block.sh
Date: Fri, 29 Jan 2021 08:13:46 +0300
Message-Id: <20210129051346.56109-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.77.43]
X-ClientProxiedBy: HE1PR0402CA0019.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (178.176.77.43) by
 HE1PR0402CA0019.eurprd04.prod.outlook.com (2603:10a6:3:d0::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 05:14:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33fdfe2e-5580-48e5-dbe9-08d8c414b697
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354253CC810EF46278EBC116C1B99@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKE8YMDYX3Nx6dNTrjTqSChmPfrU2o5ScmcBOdU7ZeuIUBoliuaxh74QqYBw8q6GnMSAiItGA5EOLHfAaYtS4B1z4SuyIX6UpGf+/ZUUxNY9V1U7nwzKI9pxMNcIXRi9gO3T4smuztx3GPdH9+KwXRFp0HgucI8dtiKuSkjQHCNRT1rVDo1+DTQcKknrzop+/XHZ2CptnMwqtxxYoo1GHsk+snm0T0YIa5STY0J7y6ZQA84BEHeZR6EcBbGTVD6EPMZFiIe+l24AnbTUx4iOHzL0Cxgrl7QSHq6jr02RZiECg9RDufsz+B+sK9ZlunYjdxn8NLHlhisQ3j4jhUjDXxY+pWu11QTm7B78y3yK3eHXdJlq6uPzelc0dN6Uy/6rSY4F3TgKFa6XeQuCJkZ7dxDuGNt5xsTnBSrbWF7IJ4TPJlbDEMJ92e9bM1bnzGwE1TpsFQubqVpDeP963IZrgwxCeotd7QfMrc5leOtJ29yndE567CmtFdk3Iq+PRJ9fPJlZQcjR1YKjnxHcWW4yLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(6506007)(5660300002)(36756003)(316002)(8936002)(8676002)(4326008)(16526019)(52116002)(83380400001)(956004)(186003)(2906002)(2616005)(66476007)(86362001)(6486002)(6512007)(66556008)(478600001)(6666004)(6916009)(1076003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wti5psWmUV8PinXwMABWOdiq0/uDRWVTCVSEVWNmpVRalzs7jNdAfzoMvMNv?=
 =?us-ascii?Q?7hkxCrRoN0mCeNWUAX1aIjvYs9ADR96YuriqF1YtrhFbpgBXLwf3PfKbz7+h?=
 =?us-ascii?Q?BE+tVFGmHwpBw/gwZ5AX8Xaoygh0z5fvlSoh677zb0NGdWmLUBVYvldRhSQ/?=
 =?us-ascii?Q?D8pvEDw9Cs6tKwPNtaXR+k/QDBS2UfJDdAfuLEo3rIE/XuY1sIJyF747cr/+?=
 =?us-ascii?Q?fnCvSAc/dgkJBtVCCqno7aUvTLIqbEYKEHYmHjeVpvvwg+n46kOVisU7Nry3?=
 =?us-ascii?Q?gjz+wpzmtrK3RQvanVeZGDPLwyzywrFbAhgS/WG/4TOegfzaPwvnsZB6kpEC?=
 =?us-ascii?Q?LcpRoBIsgj7Ge5oK+o30FJB5nzlziltKcY6cUgYQ8UCbpcmgO0DuGkkrge4E?=
 =?us-ascii?Q?dvPjCyLQPnr+jVjmRd9/fhuZ+O1HY7kB3JAKkiWAxsSe5j7YYdKkRg85iDXi?=
 =?us-ascii?Q?h5bHddxjEp3rwV3vh2tRDs8Ila43NdxjjaRqTuJIXqHaj0bbwkMFIJluFADF?=
 =?us-ascii?Q?aJDvrhPJtvr242KtjejbTziXDCGyg9HQ+LG1FDEbOWQa+31OZDD/fiH0zGw9?=
 =?us-ascii?Q?aaIOnIGpd58gbdv9uj5tKLVHFq/ih8Jn5VnUYwWGdFXkga+f1FKVgNiMgZO5?=
 =?us-ascii?Q?tOE9M6hSb6P9HczdAopHrOPEoOnjR32Tt4sa3BTSis7A1JLh2WHup3pdLLt7?=
 =?us-ascii?Q?UZ1w6xhOHvb8ZdZsW5nO4pkkqVNQ2wFwB7guzMmNz5t1ZfqeeI9mrGnZIlVq?=
 =?us-ascii?Q?A349EGeZVfGa4J96pQ6oO1mfWloQItJjUmz32lswyeTop/7o37JqQksltAYC?=
 =?us-ascii?Q?irgBki3fnJu9mLqbRd+oAMw+6Fgyr+N/PS1TzTmXq8kkH3lz3V2H6NAqRftz?=
 =?us-ascii?Q?KO5/kMWzh/+3kxk5lOl7yVtctetwavig0GjDd/OdoRSo6GAu5vpg7t7Cpsj8?=
 =?us-ascii?Q?5y2JnJzApvnJ48gZ8wXiRmpK5rRSEzfUnVrv6Cc5aRDn0ASpkawN81Awbcn2?=
 =?us-ascii?Q?h6QtuMkA8KFuVIwrraisoksuhzOQi6I0aYvss2CNwig+8yIrDF+DiK5vajMc?=
 =?us-ascii?Q?TCTpwHlz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fdfe2e-5580-48e5-dbe9-08d8c414b697
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:14:11.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gGW1FqBQuXySHzBRiB/MNLOJbI9B77AxvIfIr6PxwwrWmkwAYqteJsaFq95B5lxL3xjPzEF4C22uj0ffOdm2Igx8oboTsJj6BO/mOPBUUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.20.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check-block.sh called by make check-block rely on PYTHON variable being
set.

Fixes: f203080bbd9f9e5b31041b1f2afcd6040c5aaec5
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi! As Peter reported, build fails on platforms where python3 is not
/usr/bin/python3.. This patch should help. At least it works for me if
I move /usr/bin/python3 to another location and configure it with
--python=. And doesn't work without the patch.
Don't know how the thing seemed to work for me before :\

 tests/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3a0524ce74..ceaf3f0d6e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -138,6 +138,7 @@ check:
 ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
 QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
 check: check-block
+export PYTHON
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
 		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
 		$(filter qemu-system-%, $(ninja-targets))
-- 
2.29.2


