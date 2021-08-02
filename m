Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870803DDFC6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:01:30 +0200 (CEST)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdBp-0005I7-IF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5K-0002Rs-BR; Mon, 02 Aug 2021 14:54:46 -0400
Received: from mail-he1eur04on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::709]:64771
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5G-0001rV-Ph; Mon, 02 Aug 2021 14:54:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIon1g75S0NNwt/2cDVhwhi+lVpPpz6ySw5NN+nFREhoGqGR0R7Vtv44rnZwYgxmVhsEP4ML3Ia5y6HFNzgdZiL4ryfBu7FXbcCx991ZLbAkB3woGCp8CmoZWiQv/ut8nmF0a+yMbgAqo6/bd98t9ClnVgGapSc/cs2KKeIfIq117dJwFOmSB3TWblRS5gj0Kj73UsOKXNkduxA7zJ7/F7++nal80PW8DgY7BYQJvhlxtuY88XkC0QGzD5fw7ZqVag7Cxb8/+u+gpxC6ziOeXCXNoAw2cWr+2FoCwchMnk9oul8OwwTwmbM0MuaJ3i00DaAQn1GT6pDSWqMV5qiISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj2dUeA9mZc1wu3JX30UzMpaodGgZWOiwdvphrGmrtE=;
 b=c9pEPD/ohsDgwqsPgur93eTWobeHhN1vYzB8OyVG+ZteXlBe6CC12Z1sK5fDgikgxO1jNYOLNT+ES6FBam1L2X2tH644Dfg9m952t7sk04M7Uofi/Vl46DZhHyUEQwYzdzrCvC4d4dFtbSjDblpGk7VJIAxaISSTa+dkUDq0rzc8mIxzFs1kigxoSr9Uos9KszXQwuvO1PqRIyCNbWSkCs+8T8KYPUJhCn4w0zcXh7BqPEPn0gW9O2lhRQ2/7xt7CqCJmMuMKIfEtn+ZuEa17IEQm5MUeoifFfnFUnzXttvia1AMULY1CmMQcJhjmYFp/k7qOuFLBGn+3FflI/yDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj2dUeA9mZc1wu3JX30UzMpaodGgZWOiwdvphrGmrtE=;
 b=uQ+rYMuHQFQpSo4vp5gLcisn9bzvtJv7IzqAgDm3uukz8iSjlzY+N7d/UJKaLNZP3b2Ne40fovwiXdAdTx2jxIxLQiUJhkx55XF7ArnwltCXDBLU7sIDWGomEFCkPSJDaql2VxQlP6+gxUekt6BSXFvx95VLyuIIjIuu4U/lpSg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 18:54:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 2/8] block: add BlockParentClass class
Date: Mon,  2 Aug 2021 21:54:10 +0300
Message-Id: <20210802185416.50877-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 989e2429-7e7c-44bc-027c-08d955e6fa03
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4278810283116FB42DE54DC2C1EF9@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:216;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ur9WUP6aYKwKDMteWePsHr3FowifmPOjuvbxmWyqze61kiWUoZoj1xf8FYvwWJ/jdIDiH7crRVJ6DBUFTmdhopk6BMfBDBWBsDMhzrXCWJzb4RlyRGZERJo8+YtMg1dZCV9ZBnxoyK2MmWelZpmSQ/9TZVDWjNe+zKICWDKA3CebINGyULa2ePs/UjdQinaOJFjZrbykL1CHsjOP40yuOMbShTyeAGI7EInMwwWwg34cA1M85nhWyYv8PjkQ98BTtF2xYOs+Ms+lkVKTDAP5W6cQsB2ap0Q0m9SiKOg9oXF8Drl6639wneu+ySAoYLewy7LXkxgZ59ocbSlCmqhV7JvCYBFbDy+AlMjgNmfeTKupBLK7OFrepUaoJkT51F+DQnUo3Ig9vO8ywLjAOXjFQjknit1N7b9LUzC1Yn/DNSrcdrXeEitHkO153vpQfIRlVcmTVHi5jzc7+XtLhDR6YNo/La3n3xUSZMMrFTILqVeXJ5c5fCFIRaXQFqiN1hTCWXWEHTARbXaKHAT7snP9zjKlsWUoJV61opYm72+cWgzAkIbRJo3hmZ5YO4h/oawMKTNpLIsydEucNXxv5DZca7aLlzw74FoKF2i5AQG67ThxO8OEelVSSCW1XqeUSdyHbqv7xRtaYtikX4hdoajkx5sU2ziV6wOk8La2I9fj0KAncbWsBAraRWsbSJVi0JKXA0hjkhy7FNZFcR4JHGl8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(186003)(6916009)(52116002)(1076003)(83380400001)(8676002)(6512007)(38350700002)(38100700002)(2906002)(7416002)(6506007)(2616005)(478600001)(6666004)(36756003)(5660300002)(8936002)(956004)(4326008)(86362001)(26005)(316002)(6486002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X4lsBvSvbklHDSNGwrJyyIg2w6PlJG/zubKlfQKsq4a1V5y0DDqhIvw0AxwQ?=
 =?us-ascii?Q?H0moPI1MyQ2j/J7fp2zMpjHDtBglRQHh/7BFamBy0T57OHElwJwmGNCuDTJG?=
 =?us-ascii?Q?CCCMtxBb/dXaY4ul8pXvbqL3L/SaQFyfgRGVmuj+WWRBSXPD2M0QfB/7dG8L?=
 =?us-ascii?Q?dVMRQxgnPn3N1dLEhRipH/P2X8JwUxHKx3GDSFMVqV7ZlWgwNlwOTc0sWV+X?=
 =?us-ascii?Q?LahKr89rMksnxQ7P7RzJFeJ5n9RGtvEDiMLEbk3MdClHCS89qBTFr4YSnPBx?=
 =?us-ascii?Q?8S6mDqTQ4s3CnI8A6fZ5vL38J5SzKWJAFBcXP+3vJK8/BKu35dZPcId1vCj/?=
 =?us-ascii?Q?OW8w5vt2Yo2GPEMDkOQb5WiSgRysFb8xnhYNzsa67WoQeHR0HuYou1bL9zgN?=
 =?us-ascii?Q?OleFWA/SjuP9aEdoke5dI6UUCwDfjjiZf6SsoiL/5MVwJcPksXv9/tCsRn/Y?=
 =?us-ascii?Q?Bimi2R1FmndNOzzxMeDv9natflAccDI/Fg1cQx4bWyXvQODA26MMz+o1HALi?=
 =?us-ascii?Q?x+M5unlMhL1ZWtAj4FWeHPJMNgDg633wEn5wZYNCib1CSXv+XO1R2KJCiOqZ?=
 =?us-ascii?Q?W6GJINAdFYuwguUSLbz+B/PspaZ99XVa5m/0ghjMAZ595kpydbkErg3KZjAQ?=
 =?us-ascii?Q?LEmTzoJSnqUZbLZceWwyFpPF7zzdxjev9RbzeeGgKWh53okn0bafiZ53a2u8?=
 =?us-ascii?Q?8ypgWOJSqXqvjL3dDNbRhl2iA4K2SFybKP8tMAZpikA6oaWCSFesHvAaWMoB?=
 =?us-ascii?Q?TDeNrEaGE7kkuKdOCb5QqubfKPz+2XsVPOvxITSGC7Mo/I0Li8cYKimm2mTj?=
 =?us-ascii?Q?LdrwJBxrKq6hfK3KmFRM+pH/4ADohf04gjnLsM1PrHl4grP2fRxb6G7/068S?=
 =?us-ascii?Q?h8lZ9AVAGUPasQqGvHDj4xL6TJ43YJ4fy0xipjzbPC7+W7lbITLtnhEsN8MQ?=
 =?us-ascii?Q?b1550Bm11kpPf7jKoMstBn9DWfPj7LvKu0sc+EyPguRl6CkZ7ruWCRI1oYNa?=
 =?us-ascii?Q?XIu9OhprP1pRaJvz8n7OKP2lx7uE8kPMU22R4wwbA0IZIhMHogNuKAtQISrY?=
 =?us-ascii?Q?if1AY0iQcu3ePZ7/KHJM/j7fPK7J1JdWGq8EPSjgMUpqV82J7OLQkYn2STCh?=
 =?us-ascii?Q?YAHGDt9ybRLu3N21anKIFcL1LIhFaxIxT3qnpnT89w+n5QX0KOD/RGXd7Ppz?=
 =?us-ascii?Q?eStu7vicLfc/969Y8ELh1VLD767p1OSugFIl/AtVvZ/q19hAWRHV4+vdk4qU?=
 =?us-ascii?Q?+o1Ef8PG3yZfQ3aWg8fYZpClxhCroZ92hVVVUlR6hixgDPXcHnJbY8r1MOhV?=
 =?us-ascii?Q?L4ewT++FwRfVErV/iCHbB9NR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989e2429-7e7c-44bc-027c-08d955e6fa03
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:37.6429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8y4JYKBpB5at5mX6XcO/WhhddPnappkcxSAftbuJ9srcRPnALXs/CqzH15X+1HQjnwPZR20zLNcPPCY63ru7yNSmn3Dm07P7DIzAjFpcwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=2a01:111:f400:fe0d::709;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Add a class that will unify block parents for blockdev-replace
functionality we are going to add.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-parent.h | 32 +++++++++++++++++
 block/block-parent.c         | 66 ++++++++++++++++++++++++++++++++++++
 block/meson.build            |  1 +
 3 files changed, 99 insertions(+)
 create mode 100644 include/block/block-parent.h
 create mode 100644 block/block-parent.c

diff --git a/include/block/block-parent.h b/include/block/block-parent.h
new file mode 100644
index 0000000000..bd9c9d91e6
--- /dev/null
+++ b/include/block/block-parent.h
@@ -0,0 +1,32 @@
+/*
+ * Block Parent class
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BLOCK_PARENT_H
+#define BLOCK_PARENT_H
+
+#include "block/block.h"
+
+typedef struct BlockParentClass {
+    const char *name;
+
+    int (*find_child)(const char *parent_id, const char *child_name,
+                      BlockDriverState *child_bs, BdrvChild **child,
+                      Error **errp);
+    QTAILQ_ENTRY(BlockParentClass) next;
+} BlockParentClass;
+
+void block_parent_class_register(BlockParentClass *cls);
+
+BdrvChild *block_find_child(const char *parent_id, const char *child_name,
+                            BlockDriverState *child_bs, Error **errp);
+
+#endif /* BLOCK_PARENT_H */
diff --git a/block/block-parent.c b/block/block-parent.c
new file mode 100644
index 0000000000..73b6026c42
--- /dev/null
+++ b/block/block-parent.c
@@ -0,0 +1,66 @@
+/*
+ * Block Parent class
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "block/block-parent.h"
+#include "qapi/error.h"
+
+static QTAILQ_HEAD(, BlockParentClass) block_parent_classes =
+    QTAILQ_HEAD_INITIALIZER(block_parent_classes);
+
+void block_parent_class_register(BlockParentClass *cls)
+{
+    QTAILQ_INSERT_HEAD(&block_parent_classes, cls, next);
+}
+
+BdrvChild *block_find_child(const char *parent_id, const char *child_name,
+                            BlockDriverState *child_bs, Error **errp)
+{
+    BdrvChild *found_child = NULL;
+    BlockParentClass *found_cls = NULL, *cls;
+
+    QTAILQ_FOREACH(cls, &block_parent_classes, next) {
+        int ret;
+        BdrvChild *c;
+
+        /*
+         * Note that .find_child must fail if parent is found but doesn't have
+         * corresponding child.
+         */
+        ret = cls->find_child(parent_id, child_name, child_bs, &c, errp);
+        if (ret < 0) {
+            return NULL;
+        }
+        if (ret == 0) {
+            continue;
+        }
+
+        if (!found_child) {
+            found_cls = cls;
+            found_child = c;
+            continue;
+        }
+
+        error_setg(errp, "{%s, %s} parent-child pair is ambiguous: it match "
+                   "both %s and %s", parent_id, child_name, found_cls->name,
+                   cls->name);
+        return NULL;
+    }
+
+    if (!found_child) {
+        error_setg(errp, "{%s, %s} parent-child pair not found", parent_id,
+                   child_name);
+        return NULL;
+    }
+
+    return found_child;
+}
diff --git a/block/meson.build b/block/meson.build
index 0450914c7a..5200e0ffce 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -10,6 +10,7 @@ block_ss.add(files(
   'blkverify.c',
   'block-backend.c',
   'block-copy.c',
+  'block-parent.c',
   'commit.c',
   'copy-on-read.c',
   'preallocate.c',
-- 
2.29.2


