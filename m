Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B323FFE3C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:33:53 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6W8-0000ce-Du
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RI-0003NA-SI; Fri, 03 Sep 2021 06:28:52 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RH-0002A7-43; Fri, 03 Sep 2021 06:28:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWmetGhXgbkcOQOhzHGLF6OmcXEGFxO9Hm+RsmKsDClJLScgXNuD7xDct6W31ppCLLLPh3vNpN8/Fy6l/bWBvCmYAxNgtN++NnaBXgePxupriQ4LMooCVQya6RmvWpkOXLJ5OeWTJeZLsUFPH/PhZE4nlFF4HQd5KKi311uWRVeFI3UJIPWUptAJW/1OAXVKhfN+qq/vVB2qaEBS6M4W3F01QN3EEW5qQI76qxidsqf5SryXoWXqywz689mHcd2ZX4lA8xB+tWvPiEu0jJB9AjFvIh/OSb93Bo4kWUfGVcRe3TKI7KVyal5n1FZ3KqIxvOjcEaihhtywmh3RCpo5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gD/VePNZHIux4q7yb0SoZp/HHdjYFRawxqg/8Jk423g=;
 b=KaiKRtPx0JJ14ong8oARANcFp2A8DJPmba9UjmTFLoClxBBUq/kPfkvcug9vNDukLa81y7UKPRUWh8cC0SDZpYMQoCssMUOlmS9H7IpVJAtQew0G9s5W35k2+AQ+rdkUSTduijM3z90QFowwpB7tRgveuAXov2lKRGvswXTmUwFgoWtRYZ+egdaFi2a0Pr/cbzwahV9cC3QLZB4eVh9xiuFG3RkxsGq8SjRiybdkDz0YY/+0DG12URWXxrXTh2qNm5eko+ROyp7+sTBWblNUYJwrZX4C5KrcB41l8mP+RtbdRnSeiXWxPQ/7Nt+q1uKl81xDw4Ppg3gauYYmY4p5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD/VePNZHIux4q7yb0SoZp/HHdjYFRawxqg/8Jk423g=;
 b=mXXILbtVSAy1nL0eFm81mNOvsBGqG/LvCDpmPmPkTTnHLkgTJnOoal+QL6aJaRUib+hYiDhVwRf1jvXy2O2o7F4wOy3B3+cZX58/hOMDWG5ZRfKMZ34p4H5Uey34cNPzR+X3SGIJmQf6OqrueFyg+y1DoZCMdSyLrYtrljmwhOg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 09/11] block: make BlockLimits::max_pdiscard 64bit
Date: Fri,  3 Sep 2021 13:28:05 +0300
Message-Id: <20210903102807.27127-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2249228-b1b4-467e-4441-08d96ec59958
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6945CD091E1E9E1C4107DD7BC1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImOp7DOidbGoFG0K5Am7u42sW4EdKW/GluTJ0PnJCaWfeIpRxMOSYa8Mqp+KvmWrlZJ6KrOSooL8PoWcrBBFH2XksiArtIzMaw5ul2/lMMj3iHhOfSOutw6oPajMGGGO2w85LCGDYskXzIuA4P6uTHZ3Vt9PCieLYc8GfBnbNh8YRwZFfvL+T/Rc2IrGJWPV2VWLjhAZR310BZ/MOnOjCayjMOl62zp0t4Fk2hfR8BZxju8GqZsSsHxJDQr77xnGmiCloaI4F8VWgYxmNJVYUpX2Z5sRPkfP8OFG/HEfylJTgNp13ZUBZS1AWtPuaIdbOIGK5aS9iqC3ygxr+qKGONfh2e4svbvpL8xQKZknY0bNqKeWql9gEMlYdyfbwrHcHjTb/J1i7QSaS6XkOfAcu0//hXnTLTp2l60FhsMgdPjyZBMv+wqes1PaGEv2cnoHXRZlKy0IUuou8VQDwp3d+RP/qE1DzAIKJpe8Ufu9FJjOeYlqcAacR16iP+MNsTsKmY15fFXjCumR2A8fPYIJUEaGKMYZIvMPnoPrHLVV8HWa3F4KhGTqOr4RFyoeDT6bOrNIrp6zlo5vhPKjn8mkYbocZ/on4Em4TTw7YoshPwTzppI2LzP/T487+L7pGcLd0+purkDooL/aENyqnUZa0G4VEkCZVUuFe3gWrPHbzf9uTC1zVkMY1pVspTEDO9mb/hKHbpCQGdWsNaMn36EsgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?afOBiKtixujoHOV8KI4HK8eKXBzASKsLfuuHWor7/AyXhD9xo6OJDBd9RkX2?=
 =?us-ascii?Q?OlD+L0yACvOHKlS73rHo1EFbGN4ztVscI+kB/JkX3BEPqIcZuDwOj9pzwZd1?=
 =?us-ascii?Q?pavHz+gupGnV+2wpGqJfDA/IQ/YvUzd3W3CdqKOZsgScqqvmElAtMOwYOCGO?=
 =?us-ascii?Q?cQFuDtM9dPi+iPA7DyAQKPQqzoSkovagPkY7KfujX2BXOR+MH9LE4Xf/fWua?=
 =?us-ascii?Q?XWSh0iZG0CDyAhdfXfcYDldaOi2OaPZ9W23fY/6wfabvOnWNlQx1AmdX1dIX?=
 =?us-ascii?Q?uhhQ//V9+j1jDxwbXgmkVSdyWEzrFFz9lLh40j8CRE1rPYkg7142gAVG+U1U?=
 =?us-ascii?Q?qPR3J5fte9G3Tt/QaUXRsIzTJq66o3B6VsqNJPO2u3bhKMVEv5jILSxAGH6f?=
 =?us-ascii?Q?4QSOKGszd2Whk/BGxUaCLPq9lSfFZPgtCqYkXiHFY0zgrKwpKJPDqq3mcnbv?=
 =?us-ascii?Q?FTyoE4/EPjfJD84RntgzYXb3tImUuwdtt/iq9402YH4LsAvP3aAaAg4ha7or?=
 =?us-ascii?Q?fcSGSQGHYBI1uqx/Mf+4fGWW0ZLnkJsBkP4cOdGgGvd4FuQsmfHMgRRz0rjM?=
 =?us-ascii?Q?BITNjn1pDmBb+dDj+aNNNk79c+PEKKX+7J+PC7mhxOWzDWkaki4EMtNvj7Nw?=
 =?us-ascii?Q?9JuI0IyITr+YsngOPQzXHFp6bvKj9HGEWp9JCAfaZvwyroYEaD2iQ8ZElC8n?=
 =?us-ascii?Q?ysynHtb5FFgD3AnCnW1E5mcnL+iaTg1JX5GZpqz24YFk91vh1SDhysk4sge0?=
 =?us-ascii?Q?gHL588iUi793LvK/owDR3Nls5bxFtOB0Xcm0fdhlIMQaK3xMqXE6tqNa3rIr?=
 =?us-ascii?Q?G9g8D31rSbVwP4LEjicgxsu2seLMansjOKVwy9bf0/dxIFMdu/OnFJazUwFU?=
 =?us-ascii?Q?qTcnZb+p/OqP1ftSKy/A9QZhC29/rL6C0J+0Ppadc0Wo4XHNiiS9jiMmMtxL?=
 =?us-ascii?Q?iASQJ7Bkmww+/OdrvkAI6fC1Ehsol7b5LFgbpJ70SLFj7hCEJ3MOKW8VaeKY?=
 =?us-ascii?Q?qK6uDN8xeUx1svhihIcsuIrSgprzf1xGOU97U+NaNs0Nk6icL7G+UDWxUc4F?=
 =?us-ascii?Q?ybzvWfSgrdMsb4DJgj4FMkjPvMmuMVUsErtsVql8vPtJ7D/CzBd08uUsx83E?=
 =?us-ascii?Q?Xqv07yFGMVsjxe/JlRNbgl64tEgJ/itC7DITTAEF1YuN4N+rCN4I4dl5Q8BU?=
 =?us-ascii?Q?qxfMG/ZYEx7Ng0ONGWdxZ8oNachkC9oePajpWYcftKwuZ8z23Vk26sM1UtlJ?=
 =?us-ascii?Q?40VIncRkIRiWDIfck6ahWBg2pr9NBJEzu33LM0pVEDj0b+MBs/7zZA/UUMnp?=
 =?us-ascii?Q?f3hPSdICajUO4Do2jj0PrZ1W?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2249228-b1b4-467e-4441-08d96ec59958
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:41.1540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vh2QVpfSoRjDgbnrfK8veX79M13icfVBulbCnQoORwbUoDp7OqRAbh4Z/OhFf3H3SeI8D1quuC8gvAZ6Qy6C2Rfs3w6TT8n9bHL5ibaaOq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We are going to support 64 bit discard requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_pdiscard().

Update also max_pdiscard variable in bdrv_co_pdiscard(), so that
bdrv_co_pdiscard() is now prepared for 64bit requests. The remaining
logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_pdiscard variable to INT_MAX in bdrv_co_pdiscard().
We'll drop this limitation after updating all block drivers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h | 11 ++++++-----
 block/io.c                |  3 ++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 112a42ae8f..5977859f80 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -664,11 +664,12 @@ typedef struct BlockLimits {
      * otherwise. */
     uint32_t request_alignment;
 
-    /* Maximum number of bytes that can be discarded at once (since it
-     * is signed, it must be < 2G, if set). Must be multiple of
-     * pdiscard_alignment, but need not be power of 2. May be 0 if no
-     * inherent 32-bit limit */
-    int32_t max_pdiscard;
+    /*
+     * Maximum number of bytes that can be discarded at once. Must be multiple
+     * of pdiscard_alignment, but need not be power of 2. May be 0 if no
+     * inherent 64-bit limit.
+     */
+    int64_t max_pdiscard;
 
     /* Optimal alignment for discard requests in bytes. A power of 2
      * is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index c386cd700e..a5ba1f4cf2 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2997,7 +2997,8 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
                                   int64_t bytes)
 {
     BdrvTrackedRequest req;
-    int max_pdiscard, ret;
+    int ret;
+    int64_t max_pdiscard;
     int head, tail, align;
     BlockDriverState *bs = child->bs;
 
-- 
2.29.2


