Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710C36DC65
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:50:08 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmRz-000799-DM
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyP-0005tI-U2; Wed, 28 Apr 2021 11:19:34 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:17025 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbly4-0001uP-VF; Wed, 28 Apr 2021 11:19:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkW9uVakDmbnuF6oRObCbKgMhrZKioHMqdvqwc3LITLkcrvaeGuXwfStHI3gAxvTGqBboQM5abBEkqdDNsjsLI2ZmUvcH0a/eadZcHMRjdTru+WmDBhIzsPiC66jtmabzdNJRtdQrbhFiELg/5yflNg6QIJYhEDUuOaSabukpboG2kjxto/9ggeA4XAVI5PcZjTGk52sU6t4+tNjCpNv4lJdJxKQ5iis17RFsfaZL46/d10kM4BdmrqIeHIPs6HJXEqJrAGYePDyQ6zFoA6jq72312aJ8uq0PJ5qS6dVbgLLXQayM3PzhZkKXjGWi7S7QuIaRK56w+kZd9p+5gYuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbinJFaHHP8iAfVJeQiHl9LV8EcflIj71RoQkOzFFco=;
 b=iyRpySMnwCiq4MjmptCyOd2JiaRSUq+9MlggluGWCa5otP2L5Xiniq/9FGGJoCrEaLMdSXaigAd0D/p02IZxAGpzc7noXiI5+DLCarzxIOCwoVEncVAhSSRjk/Xewx4CqONsoYLm+FjxO1W0ZNFEDgvazwB8yKeezcds4Sztu9nlBkys4CBiCd33Z8Vxkq197SHLAch2vkHad8JVruyYQb4rVvTUDz0MWeENHOHpH/pbUwIOhojAar0InsylUtFXxe3IEaRvSul1p9LVT+rWf83FwfKswdFcpR7CEj5+UZqGJwgs/OIdVJ9mb4M38gOkMQtvpJLOOAQf2JCHkSyzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbinJFaHHP8iAfVJeQiHl9LV8EcflIj71RoQkOzFFco=;
 b=c1iDWaVgxeo7C24HdRuMC1zKplRWfDF9XR8IelJLyIbD0aEHoEDegZjCEYRtYRMsHwNzub8rGREyFfpJO7NJ2OigYVFW09fczx3MRSt5e/XLkAGX+Kic+VVtmk/UIirb+X15Sbd+FTWlRsWtEt1hYf/Rg1asQGyziiJnTL66SEI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 11/36] block: rewrite bdrv_child_try_set_perm() using
 bdrv_refresh_perms()
Date: Wed, 28 Apr 2021 18:17:39 +0300
Message-Id: <20210428151804.439460-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8860e4f2-eeb3-4b37-f690-08d90a58e3d1
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59096CEC8484AF2CC55D4189C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s13VsuG4nMUfv0o1ccE5JcR+P0+91Zh5YZqfB0A5Ry97k1yWSaTv/U1fVkPn4QXIL4TuCkPfuhk1ky6xzUpDLJ50rD/l9p+vWiME20jNGOUHereda6AKpgxKrZNhNQjJMAG3ucih6XQsjXWUbiuDIk8yaEJ1UVF+S4cbKaXp1mKD8mVb3XzI5SmfVnVVy8kzPV9SGPXCPhXF59CZ3Q0YFoeHY8aThU0LVayL4igypnK9+/DR0imjf2VKT1Amm+EtI2MiJBVM7OSsJ7WkFRXD3F9PogTNjkS8/3vPQoah3y35TBODp+XmOgYP4/WZbB6iASU7rBTQ7TpvGv8bDWivi3K3Ip/08XaS/RS0iJqi6jWOAMzx/IZjVvMG6G4k3AA5qhg3IW++xOTgnFabZr2KtEA7jlmGrBFCYsDGHu/vNXdrtWJkzZ4eutQ4Hp/zn+d1R9hVyYOuQDxUmKcEdYXMklvP5vtdsyY0jTjl9TeTdwPwFQxKW9z9ywfb51Q1efAd50X/MWT9SSWTTvP7dOWEbFZ1KM40Vv+pRS/XZtraGicsR64+AdPfeJymR1F3IVyvnlO4/Xk8FNXAR0xCbSCcPqzy9f4QbSWRrd5c9MAt7GFLf11GYY05Ki2Tyoz9um3zYWsAlJYXOp25YpEFWIHrt2yvQt2qI7yhO25mLY3je+k4iQhobIfF4HEwQF6hB47g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5omNQSG0JhgSoiK9clexR9OtrgAdWD5lcy7NVvwClcfa//fir1+FuzCEHCge?=
 =?us-ascii?Q?ppT5GHcUi/z7fUrPFkJ89wJyl36iSwRNU6cHV4T4o8VT3Jh7Np5f1EMt94pW?=
 =?us-ascii?Q?0LkwuxzltrXroOwkwecea/upFboKnZ97Vc9kZiqi+GbW2m7EgdahTjXX0OM1?=
 =?us-ascii?Q?ltCCD3jbtqS7NCIgjWa6pWfoBtwJLzGtHv4Bj9b2khPYMgroJszXv1LwJTLc?=
 =?us-ascii?Q?0eL26UJ4Lnp3ovCe+d/v8XKBEhjyXm/+hJnG38iyPydOALSpdyO9v3i5Qak/?=
 =?us-ascii?Q?tMo9vVOMWSrsIGdlcuU3v5yIdRLeekUT/CTIwErRVDXDGsMeAVA6pcgkoTXv?=
 =?us-ascii?Q?SQ8M3VM8EqhbCLUStMI/4CVv00WAl18jpeq1eEW8sMGNWk9rBmutfOiRiGDO?=
 =?us-ascii?Q?wb42iNDhIizVl/ZC4iHzRbVtonPyOww2sSiu9pY8wCyAE9mSrxaq7WOxrWWs?=
 =?us-ascii?Q?tg5IyKCbskqyzkFQR57s2/gfE9uq/d73Uz0fYGUHT1wr1owi5ElKSlL7tKAL?=
 =?us-ascii?Q?gsqwV8ljvR/Y7NdYIFY3m81aJk86TjQCSEvv/FOxmt1zMAdeQmkz5/o1sp0V?=
 =?us-ascii?Q?qygCbg0ENyNzE9T9DrtqavmyCYkcMvTdAXrMG2Yh8P67v7k1mjzhB8uBEf7k?=
 =?us-ascii?Q?ckf+Wh1wEfOHQ6IFqeANxPZEv2FQAzKdozgn7PZoeoevn1n2BfC9Z47fHIa7?=
 =?us-ascii?Q?b13yyywJedxk9r5g7Jql/evtm3VDrFT8paReImZzMgvaPsEJjzU4Q7AlBAY3?=
 =?us-ascii?Q?yTdLVHA0Q2e18QX5ak3LY3hiqC3UjiPCd1YtqRfo3+Y5gX45g2qNWjYZ3FRe?=
 =?us-ascii?Q?iFnuvLiL4wiTKrRnUWcB09bAm8pUd9zgINrQ5yAgH0T8aI4xYQ0P1PKg8bOo?=
 =?us-ascii?Q?EfCLsLeEKB1O3RsvktfRHsv31hP7QY2O6IGlLyd/Rdk6e4YLRbeTpvleWFq7?=
 =?us-ascii?Q?MJQ3B+EL2XlO53+mLHC3Ev/jkPCLwli+yBZeR5IkCxCIdlUuWpWncNOH05q7?=
 =?us-ascii?Q?TRCB4AJDAKPajXQpOajMxjOqBsfrLlnc9mtMCQUO6Rl0CpLMmSmxfk4MHMGb?=
 =?us-ascii?Q?aIA3X02BoIn6sEbQMkAGtK3zuzyE1Q74Pn5+HHdlzaRr3z1YUnlQ6TN22tPX?=
 =?us-ascii?Q?RisKdvzxB6lSvHScSdHDF0Fs5POqcbnx9hfJOnyZgLdiCNtTIzndyu/im0Pv?=
 =?us-ascii?Q?Nf38mQV0dee28f5mdR7TF89sLWSyVx5fuWLDNzZPPbgayitGIKGAFEsCKcph?=
 =?us-ascii?Q?ZxDBPlXD5NhlgOm6MkKzomSk1JJaMDmCdfyMtzAHWSHBxZ7gIyH6Yh9yMMAx?=
 =?us-ascii?Q?5EnL4DdEdZfFI6mHhkNwu875?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8860e4f2-eeb3-4b37-f690-08d90a58e3d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:34.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49d42HJPdJccUG68TuMt1WI/bL5YTJhnJXRXvmVCvpTFGRfcmLxTBDZfn3eIbtB5MQQZ2nheCmOk40XtqN3bBfEjE/33+y6W2TFJTUYzLm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are going to drop recursive bdrv_child_* functions, so stop use them
in bdrv_child_try_set_perm() as a first step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 0ee0c2f29a..4511766825 100644
--- a/block.c
+++ b/block.c
@@ -2454,11 +2454,16 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
                             Error **errp)
 {
     Error *local_err = NULL;
+    Transaction *tran = tran_new();
     int ret;
 
-    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL, &local_err);
+    bdrv_child_set_perm_safe(c, perm, shared, tran);
+
+    ret = bdrv_refresh_perms(c->bs, &local_err);
+
+    tran_finalize(tran, ret);
+
     if (ret < 0) {
-        bdrv_child_abort_perm_update(c);
         if ((perm & ~c->perm) || (c->shared_perm & ~shared)) {
             /* tighten permissions */
             error_propagate(errp, local_err);
@@ -2472,12 +2477,9 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
             error_free(local_err);
             ret = 0;
         }
-        return ret;
     }
 
-    bdrv_child_set_perm(c);
-
-    return 0;
+    return ret;
 }
 
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
-- 
2.29.2


