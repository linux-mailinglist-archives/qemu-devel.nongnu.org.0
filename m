Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309F45C6E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:12:04 +0100 (CET)
Received: from localhost ([::1]:59876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpt0F-0006lT-5K
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mpsyP-00055v-Tu; Wed, 24 Nov 2021 09:10:10 -0500
Received: from mail-eopbgr70095.outbound.protection.outlook.com
 ([40.107.7.95]:32159 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mpsyM-0005Oi-Eb; Wed, 24 Nov 2021 09:10:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O67zzj/fNR8P2TwVPda/gC5Y1ix07/znkUCO7SVJ+4X5OpWqrpMhNEIT55srQeUXDLZ55ScPKd4ju7PFoi1nxf9RTQbF1GFR31hegP3cgSIn1GZB6izEaZg3ukTW7P10AeQTZx+TEW7BVBK40AbLJY2pWVUZpYU092CZ/aerUmOb+NQEESdUZn22BKCRuPZmelBKd0dMFkWTvFCv/wr87Vectn92dSJvsNescTFSV/xEHRxvwi9tEehTnvTFUSrQsYDkVM7tkLTGLj908mmyLgHOD+3PqXwJIek6B047B1g7tDnt+6rDEEp0awtCvyEFkYsfVssJ9hM3/l+3hao9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQcX2mV+TgKHFHg7naOgleKMlK9C6+cW1OPMo68K9PU=;
 b=fqkTpV2+MCbAhCJBASS7XIzCTEQO1aCDTiMjjYcH+diAS78gubbjfjljGy9GIDZHRkim/oEo2nBaIBXvT00blbQ8VTqq6VzKbX9pxKsM9JCbGPwkootWkmNSshE1CbZgKrL9GslazcCOY9ofdhEZw0X+69+Hea56/Fw/TyL4lHDrxk/02LfV8/1UtSgSHjzTdHJLfmGuWsONRfvAjtwY2bQ2Y+sO9cr9kF/GzyYCXT3RNYao6MeebtliEhJNs+ZU/JVWtZoVKRP3KfYJPVgjN5PNS6jicm/c0tJJbcFaJF5Dsrr0YvlfmM6B4e3pGK9L5xJWx720qtB0IrZYBnqDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQcX2mV+TgKHFHg7naOgleKMlK9C6+cW1OPMo68K9PU=;
 b=hjMi+OB6UlwnfvN/iDXNpg7kFE1nMqUeWga4v2mPkvH0TxIgdkTo5JAyp9yJrSvbS+PmVxU30wiPtwVOwi49WDIJlbXgt/yybeHgL5uFdOaP084o8Ky/udizKixJM298XnLXEl+clotYhoKm4iYFPzpK0B0WO9tZhYM2+5vmxDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3187.eurprd08.prod.outlook.com (2603:10a6:208:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:10:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Wed, 24 Nov 2021
 14:10:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [RFC for-6.2] block/nbd: forbid incompatible change of server options
 on reconnect
Date: Wed, 24 Nov 2021 15:09:51 +0100
Message-Id: <20211124140951.439684-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0101CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::42) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM5PR0101CA0029.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Wed, 24 Nov 2021 14:10:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c69a792-931b-419f-4c76-08d9af541a66
X-MS-TrafficTypeDiagnostic: AM0PR08MB3187:
X-Microsoft-Antispam-PRVS: <AM0PR08MB318787D53E418693AE954D2AC1619@AM0PR08MB3187.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AY81sAN8zQPDmhJzGObnllzXghqbsYOj8cm0DV7uT0V5/JBjLUss6+iH9QEJ5Tf5sC5brH8yJISO8O1BI9S4ABqD/fUCsOFeDnaljRGGAxj1yLFfncwC/xv0OGxrj0G4IthUrv0o78i16iqDG/vBaQuhNBCu5OeJJSuWgwrs6kM8GTmL2fJm4SS1aCibPd0ABMvLBsWWUrshXhne/P+ITdHlE+6NdZAjJ3vh6zpD//16xoQ/ut1Bd5sZyN9KGD4BBboWeSPEsTQdiz0URHKys959UWzCvAkF1VatMkJgAzkNQvTNFDZcibZSY23BsJ/Xz7iO5BmwTpb4vhuVeNjAr0kviA7ylLq9OZNDO6nUjIkCBzM0pUZjyKT8eqAQT+3kr6nR+0FlPXMh/u2UsPv1xpztAzruu0+xXj3Qkx7KGallC6Ong+Rn5tV1eOYnFPooXCT3P4LYu+XqRgKvrJUjl98E/WI3K3LB3Uv5RJURTcFq/mZAntqVKh/x6CrzdekUk3WIiwTcs4c0KhpGv2hE1epEYCe5QeafD4Lqd9gObp5WwmXc3g7jOFLtl0gVaKYwzI1FqJKHKMGl0JlAL9qC496kEL4Jan8cX3tTWlUnnLL2/9209E1GtS7zYC3dTUErPk+F2xOEJmQg0bHxWsQImfbQzoyBRZW0MJTuea3n7wV0thgJj8qqXZkVS9gy7wLsaHR7yX0oQTjhBJ/ZyLc3aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(6486002)(66946007)(8936002)(6916009)(36756003)(6666004)(26005)(4326008)(956004)(2906002)(8676002)(1076003)(86362001)(38350700002)(38100700002)(6512007)(66476007)(2616005)(186003)(508600001)(52116002)(316002)(5660300002)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePBWYsDfzK2XxJ6bTj0luGtoiYkM8CWtPcSu1Ug13pj/GERhd47kj4Mj6pzs?=
 =?us-ascii?Q?NrXjGvlL6F6YIDPiWGxzn4FaMCw7J09sJMaXg9b4TfAKW32EAFgXr9zoj/IR?=
 =?us-ascii?Q?VT/y0DJRD+gZVgwuHJW/cNu1KL/RTrA+o97jn2a3c5SfLoOU0NjTfYKnFnnV?=
 =?us-ascii?Q?c+fl/db3d/V5DlXalH3rGhS/IShwXBc+SgkF/zxTQxDdKKSvqWOzYw11LC5+?=
 =?us-ascii?Q?TFyxxZXMBjMqnsJMYLPQhFQYLsDKYgLy0YiOfPnwOwCiD20gxX5tyN8TDxVO?=
 =?us-ascii?Q?eS9dUevqwF/9rZc7kw6HNSCzrRH6S7yWlC6MSJ9BrU8bLSsgBiITbMu/TDQa?=
 =?us-ascii?Q?5oTSwaxcO6D0cGTOyV2+q1v3WmXGTo071U96JRSuMallYU1GX/Fvt1EjaHM4?=
 =?us-ascii?Q?SWI1/nWzKBnb5XO1umqZ5EAMDcTZa8N3qVSMDwLJC/enHhccelgQyKPnhG6W?=
 =?us-ascii?Q?3VJIyx1J69p6tlOMVY+d6cUT2/a2oYBIzvyBC9+jojxbawmAY9WV1+ZcUiuP?=
 =?us-ascii?Q?CErUcKxO2o7m5wyAbefLlmERWUCQLMsa57cT6sU5H+Jwi27xaBx1+GGKBFN6?=
 =?us-ascii?Q?vZH5to73s45B+G/BTFQT5BwMu0PSfaemPKiJ84ERYkqr3iulvwnIcOuXUWpG?=
 =?us-ascii?Q?b+uhmZ71G87FVgvfodwe5HBwnXj6vxjkgMgcHDX/W4FiT7pLqaLu3ITWRvXZ?=
 =?us-ascii?Q?5dtqUM3t4ywApsUCEyQPeL3bsDyyUVPT/q57xA3KbpMuQTOPxQOklAIPVne2?=
 =?us-ascii?Q?ANdx4wXcgjTGjLM1ZWXnr1fm4Cv5LsOgtygeNNCearx4QmAdMMgRDIqAVCVE?=
 =?us-ascii?Q?qDs6MFhRvkpHXKTq7UH+yIJXqoSpNC9uzpRJbdCQP2wiwWEwOnVw3RuVi+pk?=
 =?us-ascii?Q?LL2IU4Op7M+POW7K/uQ3I1tOyaKSdySKafppBAETEBM7TK6qyeOOF8bShd0A?=
 =?us-ascii?Q?E7uG4jyGZDcwi0pdarT+blR6FZ6RRP7YkLwPQeqKFr6A6E1fYQeaAoebO3Q3?=
 =?us-ascii?Q?fi9Jma6mWAjLNXBUestXiL7X/jJxTK446UaBZtCdWM7C23YydGJDvIZmuyDD?=
 =?us-ascii?Q?VA4Tp6bSz098rPGyj78gznMjNoHfpel/GMFaVFVYFGpQbzyGq6zRGSDjUaHV?=
 =?us-ascii?Q?EaBMieLh/WiTyueGoXwrPuwJVfqRsGzD5uLwVFokH2KnVChvK+7amFsFOifn?=
 =?us-ascii?Q?FEjBVEo1gLN5a2C2WttLKFhbpJDxmSf+SS34FTon58ivvfGNSXC1jh5w15QS?=
 =?us-ascii?Q?h0E+tHnSiODZwGdQxAlpJ0zmaXxWtVamW330mLWPUNjPBjhq39uAxawYVymi?=
 =?us-ascii?Q?yViL6Ke+TJzv2NxK8M3oSNmkwhdB1XrLV2zs6wAAdY93fbHMnXuNzWcSgSEm?=
 =?us-ascii?Q?a5N4Yo9pciOhO2/dkE7ZKfcwNyJPGYiobKTZFVtLCNCAAh6rjxB3ZCfJQo71?=
 =?us-ascii?Q?OOURv7ox9S2JuLrDgTumEMd5i6WHCiZe4GQzQEh3FCI2GqM+c69Ckh445lO1?=
 =?us-ascii?Q?no40inIBjb/xNvCJFczhiT01vs/CehrR3U/Qaem/1ZveOZktC/aa3m/RfNi3?=
 =?us-ascii?Q?VjziBQipM4Pl6pwqL4mqBuZlXDpPuEPNhA7atQwJaWqSXlRNOigrYPcgJ/L+?=
 =?us-ascii?Q?HDNZqwtmz0nNUT4vtMOjLlMVJklR4nXKdx6Mj8yam71QUTAWyKeRQ8CqX3ZS?=
 =?us-ascii?Q?inZZW8qp1hMyW77qW4hEI2ZAAwg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c69a792-931b-419f-4c76-08d9af541a66
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:10:00.7369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt5xHI8itFkOUdnPfPZHuH/TC5YCa0zigrLFGrfnVvR83kQkB7wI4zrjKwqWegxkB7L7FiphHoP/GCxJ/D0dbXuFPk+CRgfxap1jZotduRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3187
Received-SPF: pass client-ip=40.107.7.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reconnect feature was never prepared to handle server options changed
on reconnect. Let's be stricter and check what exactly is changed. If
server capabilities just got richer don't worry. Otherwise fail and
drop the established connection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all! The patch is probably good for 6.2. It's an RFC because I didn't
test it yet) But I want to early send, so that my proposed design be
available for discussion.


 include/block/nbd.h     |  9 +++++
 nbd/client-connection.c | 86 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 78d101b774..3d379b5539 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -157,6 +157,10 @@ enum {
 #define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
 #define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
 #define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
+/*
+ * If you add any new NBD_FLAG_ flag, check that logic in
+ * nbd_is_new_info_compatible() is still good about handling flags.
+ */
 
 /* New-style handshake (global) flags, sent from server to client, and
    control what will happen during handshake phase. */
@@ -305,6 +309,11 @@ struct NBDExportInfo {
 
     uint32_t context_id;
 
+    /*
+     * WARNING! when add any new field to the structure, don't forget to check
+     * and updated nbd_is_new_info_compatible() function.
+     */
+
     /* Set by server results during nbd_receive_export_list() */
     char *description;
     int n_contexts;
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 695f855754..2d66993632 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -37,6 +37,10 @@ struct NBDClientConnection {
     bool do_negotiation;
     bool do_retry;
 
+    /* Used only by connection thread, no need in locking the mutex */
+    bool has_prev_info;
+    NBDExportInfo prev_info;
+
     QemuMutex mutex;
 
     /*
@@ -160,6 +164,67 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
     return 0;
 }
 
+static bool nbd_is_new_info_compatible(NBDExportInfo *old, NBDExportInfo *new,
+                                       Error **errp)
+{
+    uint32_t dropped_flags;
+
+    if (old->structured_reply && !new->structured_reply) {
+        error_setg(errp, "Server options degrade after reconnect: "
+                   "structured_reply is not supported anymore");
+        return false;
+    }
+
+    if (old->base_allocation && !new->base_allocation) {
+        error_setg(errp, "Server options degrade after reconnect: "
+                   "base_allocation is not supported anymore");
+        return false;
+    }
+
+    if (old->size != new->size) {
+        error_setg(errp, "NBD export size changed after reconnect");
+        return false;
+    }
+
+    /*
+     * No worry if rotational status changed. But other flags are feature flags,
+     * they should not degrade.
+     */
+    dropped_flags = (old->flags & ~new->flags) & ~NBD_FLAG_ROTATIONAL;
+    if (dropped_flags) {
+        error_setg(errp, "Server options degrade after reconnect: flags 0x%"
+                   PRIx32 " are not reported anymore", dropped_flags);
+        return false;
+    }
+
+    if (new->min_block > old->min_block) {
+        error_setg(errp, "Server requires more strict min_block after "
+                   "reconnect: %" PRIu32 " instead of %" PRIu32,
+                   new->min_block, old->min_block);
+        return false;
+    }
+    if (new->min_block && (old->min_block % new->min_block)) {
+        error_setg(errp, "Server requires new min_block %" PRIu32
+                   " after reconnect, incompatible with old one %" PRIu32,
+                   new->min_block, old->min_block);
+        return false;
+    }
+
+    if (new->max_block < old->max_block) {
+        error_setg(errp, "Server requires more strict max_block after "
+                   "reconnect: %" PRIu32 " instead of %" PRIu32,
+                   new->max_block, old->max_block);
+        return false;
+    }
+
+    if (old->context_id != new->context_id) {
+        error_setg(errp, "Meta context id changed after reconnect");
+        return false;
+    }
+
+    return true;
+}
+
 static void *connect_thread_func(void *opaque)
 {
     NBDClientConnection *conn = opaque;
@@ -183,6 +248,27 @@ static void *connect_thread_func(void *opaque)
                           conn->do_negotiation ? &conn->updated_info : NULL,
                           conn->tlscreds, &conn->ioc, &conn->err);
 
+        if (ret == 0) {
+            if (conn->has_prev_info &&
+                !nbd_is_new_info_compatible(&conn->prev_info,
+                                            &conn->updated_info, &conn->err))
+            {
+                NBDRequest request = { .type = NBD_CMD_DISC };
+                QIOChannel *ioc = conn->ioc ?: QIO_CHANNEL(conn->sioc);
+
+                nbd_send_request(ioc, &request);
+                qio_channel_close(ioc, NULL);
+
+                object_unref(OBJECT(conn->ioc));
+                conn->ioc = NULL;
+
+                ret = -EINVAL;
+            } else {
+                conn->prev_info = conn->updated_info;
+                conn->has_prev_info = true;
+            }
+        }
+
         /*
          * conn->updated_info will finally be returned to the user. Clear the
          * pointers to our internally allocated strings, which are IN parameters
-- 
2.31.1


