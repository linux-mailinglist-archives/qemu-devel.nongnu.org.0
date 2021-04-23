Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B9369C3A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:50:01 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3gW-0005tZ-MU
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xz-0005K8-7e; Fri, 23 Apr 2021 17:41:12 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:24032 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xt-0002zb-MT; Fri, 23 Apr 2021 17:41:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqKvhcdy6LHjlBfZKNDJKSE+Asqpzqi4z1YCBTkezEQTJ/hh95IY18zvCWt63nkGnm6cVefTOPqRrfdLhuE66or5SgxqK85g/vCYibr27P7gjtvs18z6BQKrY6ZIrpBMEOyBgn+4sjE5gl9qd6WtLVHnUJSixCCqT9eS/P60MzkB7jrdUtnVpH69d03HXkWF9R0k2NvpDcmxdME2EriD2BzkP5mhp6PcqwuvJgv/AXKj3LR8NjKC/bwNP+KQyTtsk9KMfnuBHPqX8pb3x/+/nxlRPnZPT9QhPWqFVL8xx6zUIzgQf/7xvwkVsCOPu/YMx0Mc7D63Sp0tb+K9DQUt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiMBlb5YAksGckFjOqZA4SECGLoEWuX1V5MaI84x2Cw=;
 b=MxEcNOqa9zY3eF+PCjTkFpxUBNbFyHeQwEtaVGyMoqod6cNmHI3yQpSMLWdqv8DL7v1PABgZCeOvuF0c4+JUvGGW37ERDXEZIkkutP7uAMsRieZHErq7bnAHONcsbJ5HnJMOCJx8+uxUY+8JA/O+jovWBU5dskgziOEa77HmJuFcxEQt6WhzvcV5Y59esBuUl/vKIfWiXsKGhmFy6HVUCJJISJSoRsGPXn+uzTJ2ZU5U2isAK4CwDazklrzC78xlVihzkgBgvx+iQ19BMjfkuCDXsyqn62kpgc5XzHwiOqSMaldRCNtKiXsh8aVK/iUR5o9t6Bzp+C63Asphoao+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiMBlb5YAksGckFjOqZA4SECGLoEWuX1V5MaI84x2Cw=;
 b=hzT/c4jA/hhLoFzpwi2a6MZHAe0Y2gecv3hEbCRBIgA0Laszw8bLYE1eAr72qOHuZwmhq8RMgY9Sxu5sIFLPu8fG24ZtM4AI86hmbVxspJs7TT7L1nOR84Av6UWj7l647zncTh7IBXfBcULd3iH4RUe9zuKgpNMMNOea7ylGOT8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 05/11] qemu-io-cmds: move qemu-io commands to coroutine
Date: Sat, 24 Apr 2021 00:40:27 +0300
Message-Id: <20210423214033.474034-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 250ddf78-d393-437c-74dc-08d906a07964
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB637493F3DD9BE4FC17D5B43DC1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhWIiNc8LvVLgxAyZBzSGCD0ayTvrwhei4MpOPCDHfEH4xX/oJNRPO1xwD63yAXuFsJfiuc4lqFs/YX6JX6XsQp//fIirwsH7MVd+myMYM0weL8IY4dz/zKQJ2p/eZdDiyRUvAv4rwjXii12pEVzZw5INRXHUnCD1b1PL2BzXFcn79cGImlOKV8Zmjv5f47sfybYxaRHREhPOeMLDgKffpCkNWVHn5BfSHcVjGViATsHOwwenrHywOkLcxjtmVK+7/Or/gGGXBGhfiWVKU5b9UwXCtFjrhFyC0FbOYfdau09gab+dDBDyQtNqozbXSNpkI1rbP90K7U4/HEbHlCSvMWUyHtXX4cygYJkdIaZ7O+PQgorjQVkvK7sbJ343yIK15t7iMNNRp1rx/5M9/dzcIy/Jhj0el11OpsqO6JJkypnpqtVpfWaDh5+j85DuoNA/LoZl+XOiVxm4v9thx7Z0B01AslAod/TlAoaijsygzYYXFKqwCvoudl8eXq5WrUNmBorMvHyXmoz5+BrDIDvkSnf+rJjpKMyt4pK6qTGuVsRYnHz5h3qmITWxCKtb776YkceyM38kdeJrJvkycjfvs3XaO0ugnFhaxr3XeWajA7xq52/HIICPKJ7P6vmAGWbw/b91iRGsLeuU0990f2uCwpfdN3nSGE6n6+L3CgQ/5tfpd9+VGXOI/6qxsNJmvs2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pi4DbhgpZRO2jSIcCEMKbJDKr/YGVIhg7rnN3T8lYLY0tuJd+7aRuJ3FYJRv?=
 =?us-ascii?Q?jHEBadD+RURimyadipWHdUexzK538A+tde30O6dXNJ+5AFQamlgHC9dxUq5N?=
 =?us-ascii?Q?sM1KWyatMLhHcgU6F0KON3WRTJ7jx3DOlHXV0L8mBZT1MUn+AHM41t6AWWnK?=
 =?us-ascii?Q?4afbPDL+YfDSwM37WlymA9aNnAAvO9u3BYyQwz64RFYRKkZGHiwf20TfhVO1?=
 =?us-ascii?Q?3DcIUYq14GBbvEXPZQnr5YGQhjG6rdyERRTy9uxWRrmlkEKkIa02DOrOPwtV?=
 =?us-ascii?Q?4jIcsLCxXTBMDoR0abfTeIIriHqbJLn3OkScjZ4VJy1XH2dn5TRyiu5diQ/H?=
 =?us-ascii?Q?rsxQE0hPtFqAbQ7mdwPm5nTjaYcN2S2E93i2rKAnJAtbmxZAvgx0j5ZNh5/L?=
 =?us-ascii?Q?Jg3srqvPJFTc+xbbvRA1V6hNm0MchAIjn4bef6LENad8FuW6OA1y3CG+8Efz?=
 =?us-ascii?Q?CVRdR+8leXPHvOdKBOw1MLwsuRGYXDvx1/QG6WC0I+YU/omIGmIqYoE6bdOw?=
 =?us-ascii?Q?iolo+Y53gNnPxAyQvTVw6O+d12GC9aml+Mr5mpzYmpbt44fePtNw0fbCvVsx?=
 =?us-ascii?Q?TGzFMi25nP643/nyWA3Uqg5zaRlNCUHGBRs6mzfRGm2aMYumjI46vYcIGtGa?=
 =?us-ascii?Q?kTNW/dasglbD4S11nhF4O5jzrmDi4i87P2NkHUe10VsxbIr0fmuQssn0ZSFg?=
 =?us-ascii?Q?bjAyAiIFbsBExehoNmhRHDD5mShAylokEmlQxVVXqbpQtfw3yXtsk9IdAGRG?=
 =?us-ascii?Q?aWEqlsESXtoKRtGj6c46PSCmGlylJmPJTFnWHyX+x+Fhm54jyTBRM2QvoGnH?=
 =?us-ascii?Q?oShwafWwuT8pw64nfvSO1EP8l406/drH31orYXKb/f2UuqvN9q2puc0eg+uh?=
 =?us-ascii?Q?aM9yJtbZetqndi5UkhV+TrmTNaYDya+YH1JZHw1Fx9evEucmc6YtwkO90xBH?=
 =?us-ascii?Q?1p3SM+8+16dlOzzzn2xEr2+x6oRGrBsWoRnYNBMSAH2Sy6o7/uN5hCahesbm?=
 =?us-ascii?Q?8WexmVBQnjfU1Iyqm/bzAG73kPM4dZgJ9DqfJTdP2Fzx7sQDp5JCqTgNSgRX?=
 =?us-ascii?Q?MsIcfYkl07bqfwEOiIrC/a454gA+QimyMl29diDle8F46t7MBUkKWv+dz+EO?=
 =?us-ascii?Q?pWZj/r/VyNRefgOSQghM5z5bjF4g9Gyn2676sLnQ2Y1CsvubvB+41eK4MI55?=
 =?us-ascii?Q?gSGGLs8P2n++Tlb0El31PzrcBOvj09KNHmIbBaXrDrFvztm/qyigjGytrKar?=
 =?us-ascii?Q?Srqz7m/brJ6QwAe4oFcDUMMR10YgmMAn6m0dy4ZOiaQjKxw5OkdDg97E/oe2?=
 =?us-ascii?Q?1mDojppicbwK0O5CkgmVaLnA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250ddf78-d393-437c-74dc-08d906a07964
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:55.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMK1OsHtw4KrY9so85H4A1ehLNpKgWsRg6YeBX60oukaaQk4VQ+m+Yai9ox3NLjzCBqIvShwny9Ib+QsY9zYevj36NjIwPuR6WAFCmr2QZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.20.117;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qemuio_command to coroutine with all qemu io commands to simplify
the code and avoid extra explicit polling loops.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu-io.h |   9 +++-
 qemu-io-cmds.c    | 110 ++++++++++------------------------------------
 block/meson.build |   3 +-
 3 files changed, 34 insertions(+), 88 deletions(-)

diff --git a/include/qemu-io.h b/include/qemu-io.h
index 3af513004a..71cca117b9 100644
--- a/include/qemu-io.h
+++ b/include/qemu-io.h
@@ -18,6 +18,7 @@
 #ifndef QEMU_IO_H
 #define QEMU_IO_H
 
+#include "block/block.h"
 
 #define CMD_FLAG_GLOBAL ((int)0x80000000) /* don't iterate "args" */
 
@@ -45,7 +46,13 @@ typedef struct cmdinfo {
 
 extern bool qemuio_misalign;
 
-int qemuio_command(BlockBackend *blk, const char *cmd);
+int coroutine_fn qemuio_co_command(BlockBackend *blk, const char *cmd);
+
+/*
+ * Called with aio context of blk acquired. Or with qemu_get_aio_context()
+ * context acquired if no blk is NULL.
+ */
+int generated_co_wrapper qemuio_command(BlockBackend *blk, const char *cmd);
 
 void qemuio_add_command(const cmdinfo_t *ci);
 void qemuio_command_usage(const cmdinfo_t *ci);
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 19149e014d..adc9e64c37 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -555,56 +555,16 @@ static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
     return 1;
 }
 
-typedef struct {
-    BlockBackend *blk;
-    int64_t offset;
-    int64_t bytes;
-    int64_t *total;
-    int flags;
-    int ret;
-    bool done;
-} CoWriteZeroes;
-
-static void coroutine_fn co_pwrite_zeroes_entry(void *opaque)
+static int coroutine_fn
+do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                    int64_t bytes, int flags, int64_t *total)
 {
-    CoWriteZeroes *data = opaque;
-
-    data->ret = blk_co_pwrite_zeroes(data->blk, data->offset, data->bytes,
-                                     data->flags);
-    data->done = true;
-    if (data->ret < 0) {
-        *data->total = data->ret;
-        return;
-    }
-
-    *data->total = data->bytes;
-}
-
-static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, int flags, int64_t *total)
-{
-    Coroutine *co;
-    CoWriteZeroes data = {
-        .blk    = blk,
-        .offset = offset,
-        .bytes  = bytes,
-        .total  = total,
-        .flags  = flags,
-        .done   = false,
-    };
-
-    if (bytes > INT_MAX) {
-        return -ERANGE;
-    }
-
-    co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
-    bdrv_coroutine_enter(blk_bs(blk), co);
-    while (!data.done) {
-        aio_poll(blk_get_aio_context(blk), true);
-    }
-    if (data.ret < 0) {
-        return data.ret;
+    int ret = blk_co_pwrite_zeroes(blk, offset, bytes, flags);
+    if (ret < 0) {
+        *total = ret;
+        return ret;
     } else {
+        *total = bytes;
         return 1;
     }
 }
@@ -654,38 +614,22 @@ static int do_save_vmstate(BlockBackend *blk, char *buf, int64_t offset,
     return 1;
 }
 
-#define NOT_DONE 0x7fffffff
-static void aio_rw_done(void *opaque, int ret)
-{
-    *(int *)opaque = ret;
-}
-
-static int do_aio_readv(BlockBackend *blk, QEMUIOVector *qiov,
-                        int64_t offset, int *total)
+static int coroutine_fn do_co_readv(BlockBackend *blk, QEMUIOVector *qiov,
+                                    int64_t offset, int *total)
 {
-    int async_ret = NOT_DONE;
-
-    blk_aio_preadv(blk, offset, qiov, 0, aio_rw_done, &async_ret);
-    while (async_ret == NOT_DONE) {
-        main_loop_wait(false);
-    }
+    int ret = blk_co_preadv(blk, offset, qiov->size, qiov, 0);
 
     *total = qiov->size;
-    return async_ret < 0 ? async_ret : 1;
+    return ret < 0 ? ret : 1;
 }
 
-static int do_aio_writev(BlockBackend *blk, QEMUIOVector *qiov,
-                         int64_t offset, int flags, int *total)
+static int coroutine_fn do_co_writev(BlockBackend *blk, QEMUIOVector *qiov,
+                                     int64_t offset, int flags, int *total)
 {
-    int async_ret = NOT_DONE;
-
-    blk_aio_pwritev(blk, offset, qiov, flags, aio_rw_done, &async_ret);
-    while (async_ret == NOT_DONE) {
-        main_loop_wait(false);
-    }
+    int ret = blk_co_pwritev(blk, offset, qiov->size, qiov, flags);
 
     *total = qiov->size;
-    return async_ret < 0 ? async_ret : 1;
+    return ret < 0 ? ret : 1;
 }
 
 static void read_help(void)
@@ -910,7 +854,7 @@ static const cmdinfo_t readv_cmd = {
     .help       = readv_help,
 };
 
-static int readv_f(BlockBackend *blk, int argc, char **argv)
+static int coroutine_fn readv_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false, vflag = false;
@@ -968,7 +912,7 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     }
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
-    ret = do_aio_readv(blk, &qiov, offset, &total);
+    ret = do_co_readv(blk, &qiov, offset, &total);
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
     if (ret < 0) {
@@ -1047,7 +991,7 @@ static const cmdinfo_t write_cmd = {
     .help       = write_help,
 };
 
-static int write_f(BlockBackend *blk, int argc, char **argv)
+static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false, bflag = false;
@@ -1235,7 +1179,7 @@ writev_help(void)
 "\n");
 }
 
-static int writev_f(BlockBackend *blk, int argc, char **argv);
+static int coroutine_fn writev_f(BlockBackend *blk, int argc, char **argv);
 
 static const cmdinfo_t writev_cmd = {
     .name       = "writev",
@@ -1248,7 +1192,7 @@ static const cmdinfo_t writev_cmd = {
     .help       = writev_help,
 };
 
-static int writev_f(BlockBackend *blk, int argc, char **argv)
+static int coroutine_fn writev_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false;
@@ -1304,7 +1248,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     }
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
-    ret = do_aio_writev(blk, &qiov, offset, flags, &total);
+    ret = do_co_writev(blk, &qiov, offset, flags, &total);
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
     if (ret < 0) {
@@ -2283,9 +2227,7 @@ static const cmdinfo_t resume_cmd = {
 
 static int wait_break_f(BlockBackend *blk, int argc, char **argv)
 {
-    while (!bdrv_debug_is_suspended(blk_bs(blk), argv[1])) {
-        aio_poll(blk_get_aio_context(blk), true);
-    }
+    bdrv_debug_wait_break(blk_bs(blk), argv[1]);
     return 0;
 }
 
@@ -2457,11 +2399,7 @@ static const cmdinfo_t help_cmd = {
     .oneline    = "help for one or all commands",
 };
 
-/*
- * Called with aio context of blk acquired. Or with qemu_get_aio_context()
- * context acquired if no blk is NULL.
- */
-int qemuio_command(BlockBackend *blk, const char *cmd)
+int coroutine_fn qemuio_co_command(BlockBackend *blk, const char *cmd)
 {
     char *input;
     const cmdinfo_t *ct;
diff --git a/block/meson.build b/block/meson.build
index d21990ec95..27e11aa199 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -114,7 +114,8 @@ wrapper_py = find_program('../scripts/block-coroutine-wrapper.py')
 block_gen_c = custom_target('block-gen.c',
                             output: 'block-gen.c',
                             input: files('../include/block/block.h',
-                                         'coroutines.h'),
+                                         'coroutines.h',
+                                         '../include/qemu-io.h'),
                             command: [wrapper_py, '@OUTPUT@', '@INPUT@'])
 block_ss.add(block_gen_c)
 
-- 
2.29.2


