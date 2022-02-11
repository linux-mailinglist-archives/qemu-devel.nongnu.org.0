Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB54B2778
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:59:10 +0100 (CET)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWS5-0004oG-EL
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt8-0000bE-BL; Fri, 11 Feb 2022 08:23:06 -0500
Received: from [2a01:111:f400:fe0c::726] (port=41871
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt6-0008I0-E5; Fri, 11 Feb 2022 08:23:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVSFWDHcvVjYgBvrO0iqcmuyEs/9xmQSQ4WMkgMVYq+adTUdAjDGWmqdPP4mT3ZpdxNRbld4hrhbelZ+59I8k3Xrdookt6RYCv4lmTpigb46IiHNdwGgsKAUCdtQGIQnvNZvo0NYmQIk/H4saTJ65QmakcMzycEbygvXMTiX60pSaxVM39WO9p4c+KEIYKH7hynv7YxAxvFjRqjnXzaJtcgKb+C6CRwcgEgkJCP9RD8y4zy9VUvcmrLgDcA14xtMfpPQ58AQZ8NlHR+CN+1/CGSQ+9rzJruPQGhvqI7dV0Axg8d1yIKG/dDFh4urEL497iIqgZjeH9jvY/t6ncXtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB0Y9SApIuqwhwYqJTzYzlWa74N5xMaYr4QvDu4KsKI=;
 b=dUlE2/VSfC5Jn1nfD682upnK0OMOVy4d69Unzh+Y33kbvy04awuDUcJ903AP+kaLF0CXLA/Mwmeg/VHRxpumDUrVPQ9UV8rhc+nWAwbHiG0vIJqMaJxSRliKN85ZtHnjLTGgwI6v8eRbLNiZh/CWbXeJW1wMtRLhqCMKzzCfKeiM8IdVT6xw/4fenUAJlU+JqZRGSeFn1QLgHN2z/GYpM2GEgsqtbQZ/Uy/lMhW8s+JDkSJs3ZgWzoC7UEVY5seXlJxXe7tTOz1pDtmWaloQluIs1f+VZ14D1Ln2dewBUaq7rMOBkHjr8KIHRIQQMkBGp1OEdW6yikSnrxtQFeu1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB0Y9SApIuqwhwYqJTzYzlWa74N5xMaYr4QvDu4KsKI=;
 b=ceuYicfLQs8G9iK6Zf69/R7H7ruzw52lJKs3DzDwPiFA9lAZjDGq2y6B6kuY6fl8BHGfEDab6EIH2oW1/bZQJL1W3CYL96twwmQpdDDQBz870OPax8vk2FYaTdJ/CYkm4NxdGPQ/Nq9ECzir7/MffvB4WXtMEknk64srs9HrgMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 13:22:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 2/7] block/nbd: Delete open timer when done
Date: Fri, 11 Feb 2022 14:22:35 +0100
Message-Id: <20220211132240.781958-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 909c6406-1565-4b2f-96fd-08d9ed619ae6
X-MS-TrafficTypeDiagnostic: DB7PR08MB3865:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3865F1FC31AA375BD5FC9695C1309@DB7PR08MB3865.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJSuZjq8AhAUe/OP7HJq5jknl4HMrnAUZZrTIM5U47VEA44HGFid3dC7WNPG76oLMr1j9bagYLjNzRv7d1ooxnqPoKMpUJPXVS+JhifmroyeE9xq5qaQkoSRWqHcF7zkTylxqjHLG2s6ZWGEDLHJflR8Cw737LOWV90Z/p+14p4LTiKLCZbLbXUPMJMo6gVROmBfZ889h4opNFJZsbvZGKZKkZZfH4zoRCwCqs3K5K/EFLgLJ+JDofMFr0NhABatHJoXla1a+t+mjy9x8MJ2LJILy3bMYEi7mmWblN2uZJf+26w50cBdJpQcrTiv/v/X5VnJdDF+CEUqsziZaADimot4J/6yEMwudO5WOSWg77LBFSGPPTvmU9GfcQN3SpxDpUqWfkmZt+Pc57O4DM+DkLi542fb2iwZbJwAG4mnw8ztsaIlVM2Yiboh7AaTVD+/fhocGcEWFI/7exkLerGfFctvrrEEcUoPpYG/ZRr/kmP3szDy50Paao69N1LJfOoYvwZlbQPLXR5TscqVVqF9+hKZvlBSmVegvN1MmGUiTFOnw6yoVB7h5diWl0T36NdwedsdrVQxahWVDZtm+tn8MGUnAv8jWbIKVJKgKwR4mzzGVUdpRqc6QTYxOaaSaPzmubrZ+uK55ZzPT8q6E8ShYZKssp8WgbFN6F9bfhel/r9OYeiFriSDYCJBxnS30QZBmgkM60Iqra3qtvKxa7sZxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(2906002)(38100700002)(86362001)(508600001)(38350700002)(6486002)(36756003)(83380400001)(52116002)(186003)(26005)(5660300002)(6666004)(1076003)(8936002)(4326008)(6506007)(8676002)(66946007)(66556008)(6512007)(2616005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pU1XISjXXhArdwgDgJALr4GPsSRLDDnpogoNJq0loGe1q7gPb8vWD4FPXvy?=
 =?us-ascii?Q?/uXdPbpx6QjRFE/5Sg2pAV03SsWIMPL9EJlJ6Sqh899Ejnb/L327OlptVEzD?=
 =?us-ascii?Q?4YyTN9Tes/qcsuY53J+nWUSsj+97QeVm7NE+y5ArDkC5bN9NiR7zf7hf7jIe?=
 =?us-ascii?Q?a7e2Ic91HnpbmgkmHIJbcPHrpVRO2U1+T7tyTJmJcQ7p1RkJsOMCj62xkEY9?=
 =?us-ascii?Q?Vj7hJkatEsroTU9ae/eL9Q/rA5iymxq9MTDKubCpkz82MhjjqjD/5tICA0Zo?=
 =?us-ascii?Q?0cIoBpXqwmS0A9n5V3PHJGvoCsffKlazl+S+ApB17L/yCZPcuSTcOPr0llrm?=
 =?us-ascii?Q?pbOKFlDXhtEWevYw5bi+/gJDOqcbHG3m8Ut+b2t2c4qlYUjf9a28ZhN/L6bG?=
 =?us-ascii?Q?tTJN0Jou5oNdGASL5iDHaC+LnqOSK17Dnyf03jg7ErEfAo0qJJvqBeawWNFY?=
 =?us-ascii?Q?rLubEzM5+0fAX2fQ8BfSZi1DxOzy3Jl4kBtaTR9hwVv+PVeS11y2CARODPeK?=
 =?us-ascii?Q?K4LYCB9VMVFh8J4iT6DADFcUfivtoyGveCywqviM9/q6DBpQDR9V73pdmNLu?=
 =?us-ascii?Q?9ubqyNZXpQ9YyeJFzykhiz3eOgjKQSfiuzVZFBGHOTVxh78FWEJxDjamjTN9?=
 =?us-ascii?Q?EhP+zJMRJzhDfEX8j/CRWEAFkvMVGMm4/ihas3xMBzQSf2GeVGWRcMIe2Y6q?=
 =?us-ascii?Q?OZe8ov5ZPcecu8PM0PJELkTWIKUbZIHpejUiNHhwBGdqlVroBOqp9U8DIXhL?=
 =?us-ascii?Q?Ey0DHh8iBNy5OkprqBk17a1JAU+Vktin0c+FW9GM2ba687Xj0D3zuFb+Pz/t?=
 =?us-ascii?Q?wnejca0f2p7RSZuXPN5l7Lh91NCYMnFgcNxZEfQ7OfLbSO2OLNVV8MwSC2EJ?=
 =?us-ascii?Q?Xt7cs+dbghiHHt0anc9saOEZw40PNklGnzxiLY4pt3zNbAUS2bF2H2DBCMju?=
 =?us-ascii?Q?w3e3gLAKDhDEX+y2INuESnQAc6uL5xLYEGKiWPYCnU02BdNzQW/tKQ4PfKMq?=
 =?us-ascii?Q?+QXc7Bf4KV/MbnyPiNQBcGPUBwyLDLkmedS6Y9QscD27Z/BLoZyIXukuul4C?=
 =?us-ascii?Q?Dr4z32phCW1EieD5B66rjLAM11Lg9WNaZrIrmCuoiwkUxHzoStT2FYbBHL4f?=
 =?us-ascii?Q?aU//7wxADUA9yu14qJNJc5FZRlEeI8ZsV8Squ/bjIQ7UJMU8szfBeNux0Bd6?=
 =?us-ascii?Q?IrxXW37pI/cNUostUmjmiv8+cQkTK7bkAu/uMlqJ5pQviV+xQ/4OGH83MpE4?=
 =?us-ascii?Q?jbH8CeYvIK107coFAA+GCvMlSLmBWcW70FZRuWnkYlYXvIDtxTFZ3lAooBU8?=
 =?us-ascii?Q?xDu/pHpOkZ2ztj16IfciQpCg/SeTyxfi4IQ3R9g3YDuAxPZakviVb4YRga0g?=
 =?us-ascii?Q?qrpSAPsdP6ULpApzbHKjD2qXK0T3iHhwX2+3kqeJmakPPbn7eUkj3/p0o2+1?=
 =?us-ascii?Q?DzzKjyXs1B2ZfkCdZypNPu1BMebcabXYAdW/povDyqW6xvkQ4nKOeeg0WK3x?=
 =?us-ascii?Q?5o8lSwg3+5LdPzNKIzZEsMGcW+jKusIo7RDHRvQ4zOWATBtrWcFknGsMgdOK?=
 =?us-ascii?Q?kIV0GktyNkeu+c1mq3Z+rxnMY6jFKyGybhp3apPdZUOZIGCq0el0NAn+HnD/?=
 =?us-ascii?Q?52ZnXMWQv8Dh6TY9VP+r8w5ig1F6tDuk4bcaqnw7gh4+0zmp58ScCIdn6vC4?=
 =?us-ascii?Q?pzMoRw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909c6406-1565-4b2f-96fd-08d9ed619ae6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:51.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4FHT3rqIJFsR7XDtTecKScxs2or46/amELais9rM5Aq5FH+PPk1pxtVluDwkb4qsT1simLrbmQlDoFdTwAI+zIIKkIWC6AOt08tPJdMYIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Hanna Reitz <hreitz@redhat.com>

We start the open timer to cancel the connection attempt after a while.
Once nbd_do_establish_connection() has returned, the attempt is over,
and we no longer need the timer.

Delete it before returning from nbd_open(), so that it does not persist
for longer.  It has no use after nbd_open(), and just like the reconnect
delay timer, it might well be dangerous if it were to fire afterwards.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 16cd7fef77..5ff8a57314 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1885,11 +1885,19 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
+    /*
+     * The connect attempt is done, so we no longer need this timer.
+     * Delete it, because we do not want it to be around when this node
+     * is drained or closed.
+     */
+    open_timer_del(s);
+
     nbd_client_connection_enable_retry(s->conn);
 
     return 0;
 
 fail:
+    open_timer_del(s);
     nbd_clear_bdrvstate(bs);
     return ret;
 }
-- 
2.31.1


