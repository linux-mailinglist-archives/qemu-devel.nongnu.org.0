Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC2592B29
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:18:49 +0200 (CEST)
Received: from localhost ([::1]:43538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNWFE-0003lZ-CR
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzd-0000R2-Bs; Mon, 15 Aug 2022 05:02:41 -0400
Received: from mail-dbaeur03on2099.outbound.protection.outlook.com
 ([40.107.104.99]:8993 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVza-0000MA-VO; Mon, 15 Aug 2022 05:02:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nglJaJ5ROMd3Py/GM7zki0hyNlto8USuafJv6vttC5FX9o4KUj+lpzI8kA2J78iy3dS0ZzIAKpQ+R1TcL2in0F5FraIDVDScjqSg9QVx4aopDeVbfiPJq0cAg2OtWSD2mAD+dT9ln9x+6GvzGPIy1BnRXWTeJmwPczJiAjN7sVXYFOhbN/9qGATic34nc9KGt9mjlqxyw8P4M7api7CCZJ09W4WlOcH0wQ8BsOnsx+5xa4PZtgIk4X86XrSXeSlLZCMfwS9ePX6dsmPdlez4F2Y0DG47SxEBiBzFcyg9isGnxlaBeFNnilEMn8lbO7cPwKQ40vFjrSMsYIXCphhTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFwyXlkdf5j9f0kc3Xx3zZffRz32mQ57UskGPkaHJQ0=;
 b=QvxahAzfSK0KDMRgJDj7auSP3Dlki2DPrLXhW89ysh9mWphvrXy9YFAkftWuO9X3c7doVqaKhw2dvXnJrjLMxRLyECVLsXGYWjOab5GMrY4t+nUskrgmqMmOqZbeEazZJGzP3i3JeDUBVmx1gEwVo/sJ9OjquFIPEDJRqoul1u0izmoR5TpF2GE5TDPPvDC+0aKQDyboPlWLbUeWGbpiJ+/LZANaui8Jc64XgSOyZmftle2Ur8JIsis6AvoqQ6NIoxoi1RUdZCMFc7oIkMiYy3SHj22Wts8NtWwe+AZQgzTgRAn+KAbtgJ0N/pvppg204Npx0lb1rspK617+fR29Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFwyXlkdf5j9f0kc3Xx3zZffRz32mQ57UskGPkaHJQ0=;
 b=kSOYwNTvSmVJ5wdwDDH0HxHwjIrb20xYeWcVjmfFCQQowKcF+LqOYa6XurKm4KYPzqOshdUgM8iXHU7k6+P+q15h+9e5vtIkBlIHDW94o802bZs30YbXC/Zw0HueCwN+8MfLdNTA5jDmQQU05vawFUarvdTwNwfUkmEogJPoMGa4sAqBpwPe6YNtaVCeE7pCoiXZHvSkJmvnrfBDVLesXQ7TgJVrNXdQgPcBrult9RQjpjhpz5Im50XmaKHEIzQL40DZG2I4MxAXglb1cF/+9NreNIxroNIxe9YiKCPUJwKz7RgSLmpB97uWjj8DUvO0UIrGb72lqCbo8mTDHa9CCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:27 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:27 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 3/8] parallels: Use generic infrastructure for BAT writing
 in parallels_co_check()
Date: Mon, 15 Aug 2022 11:02:11 +0200
Message-Id: <20220815090216.1818622-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e11228c-e674-4599-f858-08da7e9ce0a1
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3U1u2chH94rQ/w8G91S+S0mB+dkU3MnOA5/Esnzf9gzLR6q3EaquDN3LR7fuXhYOlxMnG5mOSJs2pxxkVDz60PQJYDZSJZyBAXQj4nc21iORWcMVyzHTSvdVrPNezBpMAyYtpEv5HMzCFn9zAR59fnPDyZ1/+ItFAOt06t64NEIq/zQRNBgOtakgsukjifXNRkb0vHK5MSmSlaT5/rjYQ3HDA2toSYaNZaVENf6AJBmmV5/1t2/nohGQUg5z/Wu2nRpVQKDlC+3UIbAHfM151V4BtquyavkDoM+R51lVOU/3SvmgrlOfzLCjzupYSyQAR9Iq6vpSOaTsCZVDhMoNCNG57fU5Gw7VFzs0QZs+YlHjBBhyVdRJ++5/g0tbppki0TPHyzHZY2pI3aCIs4vojnpyQUrb6HjdP+sVgwQxdkavrsSCHoxvHsxcFNHn1wEDTlbA0aIl8B2XafmO4uEDOBcp88bNAsxljW93dWCLZDT9Gb5Fwi8Xb9b34RwM9deiRjDywghWDlXiyYAJoZT/E9rF+t9JAEjPa9XRawrmCF0MAPHKlKPQ599WI7toW4ZqsU79O/VjGEkJhBRdRBxCx0RtjEU84F+mkv7RE1PF3vFaY4Roa8vG89BaFSWf7+LkWJTduaP5gXG/3HA9KKSqpqYKzYzem3Dqmb4HpYre6AlaRZC4kQK35LlT9awyItqprACBeEegdbvVsFr3fjoQa1UEDRK+SlJYM08GoUeJGQeF4n2/Rqsw8YjDAE72ojLVISrHCWHe0qa5GOwtsVCN6y+hgSAlE+QLrOor04d54zbkNunf32PZlPqGToEsmBKLwSv9/7F8xNXEB0Ce55TYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lORbpRGhCkm+v5j1xtkgNwJz9XPHJGR9M7PAnr3PifaHV7Po4qt+CFWG9uWZ?=
 =?us-ascii?Q?VjVSNBsfntvwdUsNTy33LIXD+f/WYDmuT4R+hErnqSqN9/Njw15s2Rr6/XWF?=
 =?us-ascii?Q?Q5UkVy0m1YT1Q3xPwi27PiSA/QqKZX+T8Wef1BWmH96runOwniTvKLnzfo3D?=
 =?us-ascii?Q?WYJarMI98gw/9IndaEPGwOKUn9Sy5tmJc9szZQm9bswd6MQ6Zz3AviIMSPff?=
 =?us-ascii?Q?tRLAxJm7WpRSTMsZ97MxFP6TeiCIPoWS6Uw8SW++LG/he+fIQyS1lccFqWks?=
 =?us-ascii?Q?G/CxaxW5nDrrSO8sZ3qGxX9YauKbL9yWsgcWlzpX0gg9IfeH0bORtR2i2GfL?=
 =?us-ascii?Q?XJtQ62i7CEI0nunurH9ZiSjkrQnznYKOp9llM+E4nFbHL2HQYikivOl0MKfS?=
 =?us-ascii?Q?dzI59O5eyGd/ydtFgFEU6WVK4B1xzit7efa37AqbuzE6HISnNE3CCl6Svzij?=
 =?us-ascii?Q?mHdSCvznA/a/YV+c6Mvc57ATZU/5IS9z39dNoYPjqxFU8cAGMmWW28u7CmjQ?=
 =?us-ascii?Q?9Li6BnnorSm5BNBzZLqoUQkO3nqlwzSdF2tQ2U8oxVHtFwr4mKImjvtfL8j8?=
 =?us-ascii?Q?kR2tSCrnAvH9xGpR9lVntVvkpEnlHgERSqLh/4W4/pCyyxEFG1VThwUvZEef?=
 =?us-ascii?Q?8FJf9oou63oLxM55Y0EdJrOjRGYEZdhd10sxOgAp7QjHaqoGKHvAmkdLo2Qo?=
 =?us-ascii?Q?onsZce+7bpN3AL2jkSVfhjluE7tuJKZmqPjG9vOK6LNG/kgJ8il4AyIDywRQ?=
 =?us-ascii?Q?z0E9clWoplZgH86wPVsI4qffonl/fC+qqnYXeB7r2Vk9Ust+VpB8E8C1UzkI?=
 =?us-ascii?Q?p7NZVFC+NMc9voC+iuy16fA9nt+mHR0YHEVnHaTfbNAKddd1z7w4Zab4H2Q9?=
 =?us-ascii?Q?Yvb2y84GZX3Mq06z9uFtsvX6DQAv6o7yb8/bwzZtQm4nLshKK/j22tSck9cB?=
 =?us-ascii?Q?R5c4I+EYjB5D3ZVBGrllv+VYgr1X3WahGH1JVTPYSv3CblsAhz8wwOkLtPVD?=
 =?us-ascii?Q?23tNOddiWjSRPJrfEZ84c+ut8eTS5CHEeGJg0z5XyeiBTAVE/Nq6B9ALElAS?=
 =?us-ascii?Q?Etdq1Csq6GXNOg55qKIQskcGvguBMI8llQqbVg8rUc4vcd7RrPzZLO6cydL+?=
 =?us-ascii?Q?2M4GMZG68/MfhmiD0VkBo5H0JYEiSFvNn1TzBCkR4OCDRkmOP66vL/jQtkWB?=
 =?us-ascii?Q?lh5JMTBpMYLmnMeWnq/LWIAnH3XGbVtz+DLJdzhbzPOmjEsYcP23KwONViW8?=
 =?us-ascii?Q?pacnEJ2l73yk80GhlxxJhRBrtgWuQQTyrmzORundnj3siyamWYvBKYYMzBkB?=
 =?us-ascii?Q?FMC0LoC4nDDo4ol0qOBKg4vQjf74cwSbOl7/MC+uG7JwR+v9SH4sZzxczQSt?=
 =?us-ascii?Q?mETDxq4BUQojbhI5qKf89frnnIQxWnWDLIKth7LoFBHigz5lqV2on9cIaDRa?=
 =?us-ascii?Q?xlN6FhMSq7VhaRFk6Hn+pZFYtIfMwCd9TeuPCzlkKsBBPZFg2MRkcxJG9FRb?=
 =?us-ascii?Q?AaNsW2RG7Ptb7mYTerGh3fB9coCpYXnueqQbnFd0HsIy/UGASbQu+tfOPys1?=
 =?us-ascii?Q?TYmau9thpxLSaSMG2OtHDLsO8LfZ0HjPUerwFwlBJeuFFU8E4Sr1mo6Cf4uP?=
 =?us-ascii?Q?Of4gM3ZTHiLI8NrO/E3sznw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e11228c-e674-4599-f858-08da7e9ce0a1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:27.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSOPH7dy0bKi0x7jPgK1BQMQSLT4Y0Z1N599hhdADXfyNcdghikyZVMGdtrKaBI19L/xKBPC/GEUlIPT1nYAu8O+khIgj3fzWS6ogjxF8IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.104.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
v2: Patch order was changed so the replacement is done in parallels_co_check.
    Now we use a helper to set BAT entry and mark the block dirty.
v3: Fix commit message.

 block/parallels.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7f68f3cbc9..6879ea4597 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -428,7 +428,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     int64_t size, prev_off, high_off;
     int ret;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -467,9 +466,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
                 prev_off = 0;
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
                 continue;
             }
         }
@@ -485,15 +483,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
@@ -522,6 +511,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
+    }
+
     return ret;
 }
 
-- 
2.34.1


