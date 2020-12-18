Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390AD2DE8E1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:22:22 +0100 (CET)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqKOS-0005ap-Sm
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kqKMp-00053K-5C; Fri, 18 Dec 2020 13:20:39 -0500
Received: from mail-eopbgr00108.outbound.protection.outlook.com
 ([40.107.0.108]:46987 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kqKMi-0008WK-4y; Fri, 18 Dec 2020 13:20:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0c8hguNhGrKMz7vabxlhvnKerio7xGTg1sEB+iZe8MFeQY3aPsTtj4IbzABTNlSpH/fzSyt09cF47UplZaRdp6JCJUgU8z/DWU9ttxnxKIw+1xe3EQhRTLiKhzqDfOdbLbROrlEH9ee1Op6oCuOhePq0UMZWN2+9BdahNMJ6TWsoqFgEHero+DkRTr9ayoDsZXFd/ZqnQ0SZy0/TA0K4mq4vIRM6r30AyhIpQdtku1xNfuhFXfEAsGkwakscBcT4SKiLYpvNAYUrUbThYy493zSRDOmFUIrSuuPwEAHwzqTlJ90Cv399Bz+ZY+VdvFq+Xs+DixnSWbayrjRf+9BMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pc2xPusRV41LHjGlKz3FKcQ5c+IXuLeRgLCSCIoDZ8=;
 b=XX9ehK4kjXPPvCB9pYIcixL7+x/BGK8NKOlEC+jkcR7WamnQ0yGKLAf0QnW7fEx+0LaWxBLqxIk5uBIlwwqjQyDnj4dwqQzdwTGoIWS3AyZWmuvrhgDFWWTUZytUsLXNKDzEYG5lUHRFZeHpk32ZKMNX8Y9rx2jyN1PWqKPN59rYrteOTIkWEndlQ2n+x6YebzHWR+YVlXwRJMHoyX9FpKfakbo/H8WBLiVDwU/hXw8iDVRUYoybUWYck8MTCJf1Q3sOM7E5cH62E19bZEqTU/6YQxS+e6+bdkbRgI9PL25XDYxqtyF7ThI61anVmYxXkwUDZKs8cOQnlzqxDmUIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pc2xPusRV41LHjGlKz3FKcQ5c+IXuLeRgLCSCIoDZ8=;
 b=r7/mobOwtfA+KXr1gkNc1IsnO4Uba6MXSEoXvC9ExP+NbHO+SGJ9o8d0rOgJOqNJY/U8MycWsUT/eoonAnoGuW7lr6EQuxPkXoQBP3ta6aY+GmcnNaItDR11UHLjIXhq6484yGOvuknHovB/ctZBF7ighT/45GgSnBO1vLeZU9E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 18 Dec
 2020 18:20:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 18:20:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: fix _check_o_direct
Date: Fri, 18 Dec 2020 21:20:12 +0300
Message-Id: <20201218182012.47607-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR06CA0105.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:208:fa::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 18:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa3a2fe4-9377-441f-abd2-08d8a3819787
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4724A265F9975DD4B908271DC1C30@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYUagJjEvbizM3iY4QOeoZR4ffeAJUM2JRVbfTY+H82b8OrBKF67ReTjc1Fh5ccPVglKQo0qumR+8hoZwUPvZGib2lXOIGR46tpiYNKufr+2SAM+Oda24tndTYpKHXxSiW7y+jMAd414A+Og3tBcswAVWso4vDg5mSipMNnav028WSHnkXoAFA1n7AqiiGWkoOjZky72nQDrcQ/44+F5O/PAEFggvgwZnCQni+x7pLjGW2rBGpn8mB9n877euqBfbybLwct+drjov/3h+og0V01JWgTQVQglWV0UGVY5kPAOaHP4YEiKjw741no09sIvW6qIHXhPCYAlh3Tq2+qvMHGSSx0xlGOYI5iH/u0tf+E+5wAuhmRNZ+yz0PMyOt5GwXwrD1tj4SA9opv3CSkyVdDA0GiJ520KLW2IoqIgBgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(83380400001)(16526019)(6512007)(8676002)(107886003)(86362001)(4326008)(6486002)(508600001)(36756003)(186003)(26005)(66946007)(1076003)(6506007)(6916009)(956004)(52116002)(2906002)(34490700003)(2616005)(6666004)(8936002)(66476007)(66556008)(5660300002)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mstRJH40/lmfhB0rQmEdhAYG35hdc5fT26My9N6trIZlvdmBkFjzn82L0AaN?=
 =?us-ascii?Q?Y6F8ZbaHnFz/1lFbb2LcPuTiFTZ1Aic/IKNFiMM8MJAquPV+wcjBVmnZvL9Z?=
 =?us-ascii?Q?2SNfgvW8NJHp90HFb/laSeibst6xH/lZ8uAt8AeCAp/HnKxMw9pRUIB8f2lo?=
 =?us-ascii?Q?zShScJfyA1I0VzKvu1//Kg9t6dJ/1A7uvbKPr/6/FYCmcKi4QHAsw8jwUqI+?=
 =?us-ascii?Q?V4kdpT0DjjM7mdl87bL4XDS86TjM/dXMrpUH85i6fxA/K19uHOpMVg96O7Ep?=
 =?us-ascii?Q?URYVC41vO8pIBbRKzddStyrWT9JwTJqZnlS1clNFIrM4zCYnXHuPz2Bq8D01?=
 =?us-ascii?Q?G7pYIc3ll09sx7i+yLoX+Uv1jJfBR24chi3oWHN+zMJnwkG1XF1dZEX0Mdx/?=
 =?us-ascii?Q?owJNGPr9/eAf7gGwF5IFPTiU+ll8aRods/aIg68iGFZnmKXhF8sX2UVY+etL?=
 =?us-ascii?Q?TXTAA96qo+W+gw1kssYS1+tmvdF5O4L8ipuwgY5ynWnZ9DwVDOdF9FwxpVOe?=
 =?us-ascii?Q?tNgL1xSBm1NfQBIIL1qxLmu9s1pu1G73/AAHFHkmQWfnRk41M3u1p74La6js?=
 =?us-ascii?Q?hU8PdpmxC2OjqS/1Q58qFpLy8AuF3T6/8NH782+iRuIA3H2of9OQL2ycHjYV?=
 =?us-ascii?Q?vN9gJ3cLwAy2QHP5L/RDgA9YiuKhpjStWBKwwIAdnYtk6r2zWHOQQAD7X73Z?=
 =?us-ascii?Q?rYubafOswdrpwZGGj4CpdyR5BWM9RVQPNGEMfNj8NpP9uYVOztMAJCGfOOse?=
 =?us-ascii?Q?XWoAYm0ESEx2nmPRSx6mw+1l1jLyjchCmtSEZeBn5PuDFejZ3ZKM4dXnE2tg?=
 =?us-ascii?Q?8K+l4u73kXlOLw6YV2VygKdT7prNY1NkJUgol+8AR4S4e0chxa2GYxIBwM1t?=
 =?us-ascii?Q?XexTRs3hAXMHqut4gkT/GVnT1q/ckDhjfDPhYE3rOIRDHrXK/qNuxq6N+DjH?=
 =?us-ascii?Q?Jgs+/PnVpjZymFDR2kWjfU225xl0hAMaREY311wHF3gmr0ZAlLGacJrNiAyu?=
 =?us-ascii?Q?evSh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 18:20:25.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3a2fe4-9377-441f-abd2-08d8a3819787
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIADQ4PAAZDdxtYvApr6J81UxV5jJ8Hv2s2rg4KZ+e8yfmTbq9jsiM1h90F+CaPDh+fzVxzfW7BMLPMOgtUqHwl+5Crz2BGpknaTL+rtKoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=40.107.0.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately commit "iotests: handle tmpfs" break running iotests
with -nbd -nocache, as _check_o_direct tries to create
$TEST_IMG.test_o_direct, but in case of nbd TEST_IMG is smothing like
nbd+unix:///... , and test fails with message

  qemu-img: nbd+unix:///?socket[...]test_o_direct: Protocol driver
    'nbd' does not support image creation, and opening the image
    failed: Failed to connect to '/tmp/tmp.[...]/nbd/test_o_direct': No
    such file or directory

Use TEST_DIR instead.

Fixes: cfdca2b9f9d4ca26bb2b2dfe8de3149092e39170
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/common.rc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 29354654cc..297acf9b6a 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -821,9 +821,10 @@ _supported_cache_modes()
 # Check whether the filesystem supports O_DIRECT
 _check_o_direct()
 {
-    $QEMU_IMG create -f raw "$TEST_IMG".test_o_direct 1M > /dev/null
-    out=$($QEMU_IO -f raw -t none -c quit "$TEST_IMG".test_o_direct 2>&1)
-    rm -f "$TEST_IMG".test_o_direct
+    testfile="$TEST_DIR"/_check_o_direct
+    $QEMU_IMG create -f raw "$testfile" 1M > /dev/null
+    out=$($QEMU_IO -f raw -t none -c quit "$testfile" 2>&1)
+    rm -f "$testfile"
 
     [[ "$out" != *"O_DIRECT"* ]]
 }
-- 
2.25.4


