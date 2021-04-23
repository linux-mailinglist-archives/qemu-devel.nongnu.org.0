Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65D369C40
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:54:23 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3kk-0002L7-G0
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y4-0005QC-Pf; Fri, 23 Apr 2021 17:41:17 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y2-0002m3-Hy; Fri, 23 Apr 2021 17:41:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huAQsbI5GfcC7RvM4QQJfp4axFt4U/EFcQrUdwaCkAC7bqDqaB7i959HQAIVEOjF67B8iqwBUQoyyAIsRPOC2nVDgdjj4CW+fha1C6YOMqIL9n0C9ziNHbhlTAjN3v11xgzJmI6TZaTC189eTuw70MOWh9i3DVIXfRH+TbESsuv4/FtycFc5DApclMUA95B2Jg3Aw4E8OQZG4H66f9NgzvSchPxQaeIh8+EtfWG/0QvuSHeij4hUojagZwOb/kY6npWIL6X0fAMhjInAqoI1ZtaAHWaJ1amHThsYx/uVJbSgVKVj5SqTa1z36z9En9+vxNISw7SCTL9s4bsRrIIKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO/I4/5TnuZIUbHHKjcpuazN6wnPTuFmreRjtJbukXM=;
 b=PsBhcAunxHg/3jcRwjrz+kKAmC//Qy/md9yr57S+UH8Ta7j+Z8WOJeC1yI9SwxOyXdE7Q57OeGjcjBnwinUKIl7ndGvX1jxkjBIoijoTkf4P5x+Co/RmjKUYx7Ul8EWCrYExYjNw8uiVN14ri/tX6yzXypAmZ0Bev/EU36gLIFEau9a/Wh+xHV6FLdlE6QgluSeznpgX9qO9ciYaN3mxHpgF/UAGl+tyP3l71E3twKdfUHSezeKNwK4KEij3H/You20/dmmlTz16srG2FZNiCU638igW6FTAuXlCTJXfdFuzzeve+/YSZzp1hOKrR1iZVuBaR3KKLc0QBYt8uTX2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO/I4/5TnuZIUbHHKjcpuazN6wnPTuFmreRjtJbukXM=;
 b=sggpkhQmb6U4XlXoFItTPT5L8QTD1XkHaHcXwKaHJu9efOyAa8k9d/KxI5wvUn9/Un/6lHPCG8k4W0PGsJMTE7gO8jlofGaHfgCGitV7zKk8bUUwcbc7utt8L9cAqq7qfdSxQDeeJJZ2oOeljOhT6BLrFfA727kD/isYsCsdb+c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:41:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:41:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 08/11] qemu-io-cmds: refactor read_f(): drop extra helpers and
 variables
Date: Sat, 24 Apr 2021 00:40:30 +0300
Message-Id: <20210423214033.474034-9-vsementsov@virtuozzo.com>
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
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:41:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89f50103-604c-4c8e-0bc7-08d906a07cf5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63749CB29B369170C72FA6B4C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dPw/W6tI/N/VMHbSGv6z/IBHp+423f6nItxoEi0MTEZOnw62CrvrqlFNXvuiCYcXY8U/AlfMPhZbqwxruRQvzPO/zHs70YWB/lL7bz+SU/L9opfiK381iRctDvswBxHFkgchFduWoz1YzfOttYo1itEfhjbpLGUEw6Cu3GSrg+qdGvtpH/8Mvr/2NT9qNgrxMx73GAT+Q8WJ3tpClLtqLijjn/6KgzufCkN7CqXONdIXDYoidjGGQg8iKcFWMhF/ZDsacBn1+lqqylqSazoyY03PU/uv2+lIM3eZqdY/Tr48/vxmYO1L80+UxGj7h0S1QmvmDQtLYzFX3VhxTtvFS7AwVceEe0dapay3OVtolaroU8+slZMbTWSGEnRHd72pO9r86N4vRXjPOg5pdw2R2t6b/hHJZYVwKpjQmgQrYNN8IcnTNR6aSb19XceWwFz1NmfmwvqplimuOr3nvtuFca2KQRgYAd/E6yEuHQcClCqsiGMWOqze8yaxjOQuBxOHTgPm7v0XaXAX7c4KjFpHQYL+Cax2j6QMPS84nwJZ7FFBztiErW4OTR40uVQkQQXtv8IiumshHaBW/dG8gF8GuqeOZ4RglbyvWR6wLDpjyjh53alspkCcZ19c1JrBdjicP0yTYPyCyt4JzjuV2jpyuDCE2ewlFcM17zLe4SBPU+cj1g905VAqt6HbZ/69r/d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KeVfvSxHpFv/sHMNfFcKVW0j+4reInaAiAWIYy/vJjZtZenjHl6LK/GpfrL2?=
 =?us-ascii?Q?XLQGPRCxUiA9omP3gvOHn37uhwlqVxvdjS8Cjw7xU5/rwW91jqQl/hFdXPmq?=
 =?us-ascii?Q?7DyhxA9PRa0DMKEoEWR3MCPih2oc3molajgccm9/OZpy1k8GfdXkWXbuAnci?=
 =?us-ascii?Q?ooEPYzKUwqd+pFtVFhqXP/HLp2KDYv2tGB71jy2PHwgMeluKV/1ibj3YTTjc?=
 =?us-ascii?Q?ERCQssUiIzZZ8DtVXoZLBokEsL5Dfwe07j2KYi8tWHW83dXwJIGiLw/eIivv?=
 =?us-ascii?Q?hk7G2HD0fYGV8TaGL/nWyU6wBOShYXF0Iihtj+grNZdOBKZXzXSGjT6qp9TL?=
 =?us-ascii?Q?9zfAyGiTISm79gyS+VbNGHeZaGhujDrdSZR+ie3odburjnLYId0LHqZUcYNm?=
 =?us-ascii?Q?1wTJ/curo0GYyV9bc3Tf88olTrf/FqCrrsOUrbzHSaetWW1IhlWxHsEjz/dh?=
 =?us-ascii?Q?kTltrTgR+Zx7pHREoTXO8V3VAGZz4ZKXsyT7vv6re6+VyDj8umDwbyy0GR8y?=
 =?us-ascii?Q?ZwoCLOUTTCZyWJ9ejUng6TNPDtkfOY26IPnjJ/7nP5jiNcbyFyJhlD2NCX92?=
 =?us-ascii?Q?oEQG5Jv5SNBhFY27Xa3xAYOov1MnWcdjA+8VpCM7dVLqEcHyjw7CqxSLveVC?=
 =?us-ascii?Q?bRUA7VZ19oYKTgjuZpbgAUQ4KkTEA4NBTrU9gr8gHVklnUDyMCCyFfHr0GRr?=
 =?us-ascii?Q?aSotGGU6djLQg1PxF7GlWxlBNuoVdXVtb1jZaFOyMYE5bEsqleSuUa71iHf4?=
 =?us-ascii?Q?5HdjZ6EKlyDUKfGtC0+UhJHYeQzjE7iYKPyaT2vMUUc1yCCxK3jyQxsECvuf?=
 =?us-ascii?Q?VF1iPEuyOaY+mMXoIqJk/ElfLL7SkO86HFErpwMAEYwVBRR99Fa7RCI4oalr?=
 =?us-ascii?Q?Bb0e/mu86G+H2pUUlwGDnbJUa/vtyCWDekFjbqeSAooopoIFurFuj6UAQJu6?=
 =?us-ascii?Q?peTvQEIoMVJA7qQs4rqESnqv47Tr2mKHHQBb5Xc3A02tbozUmDlwBjWEezNB?=
 =?us-ascii?Q?YqF60qZ9K6mkaGOlHwolY3auFbeq8jvmI6EMvSQSJBRxAru0Nxf5ZxpE8gvh?=
 =?us-ascii?Q?x+pgdae8vJY0OU72px8ySFjoYAaoJJSFkzlelsC9Cfi7JJ8Fh4+kYPfmDeEC?=
 =?us-ascii?Q?qJa5RM2MhYRswKPLPleOBnuzV6+V2M1bt+mnXIo7i1NccgsqUPAY8GVqzLmp?=
 =?us-ascii?Q?x+gVpIvOOhusdipJcIdlFsGC7LAFXq6L7ygQBCAxzEtLJlyn/q0YrPioOjwg?=
 =?us-ascii?Q?x2h3pa2D1stSuBywxeANLOKEZzRxYi+5xJAPvoDNN2ws7EKNi8c2s+SXVLxr?=
 =?us-ascii?Q?2J7tAHCGh7J2h6beilpHGrQQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f50103-604c-4c8e-0bc7-08d906a07cf5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:41:01.1684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHkR1f07OtuXpmej63/haAiCk9q+tc+YRMp/NPuS/+7a6BLZgmSa1rJzmie99oNMuocGDHWTXknpoXNpXZyylHeAdLKp3BfOpfrYZPgdZCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Now all commands are in coroutines, so we want to move to _co_
functions. Let's just drop helpers and use blk_co_ functions directly.
Note that count is checked at start of read_f anyway.
Both blk_co_pread and blk_co_load_vmstate returns 0 on success, so we
should not care to set ret to 0 explicitly. Moreover, no caller is
care, is successful ret of qemuio_command positive or not.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-io-cmds.c | 44 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index adc9e64c37..bbebecba55 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -527,20 +527,6 @@ fail:
     return buf;
 }
 
-static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
-                    int64_t bytes, int64_t *total)
-{
-    if (bytes > INT_MAX) {
-        return -ERANGE;
-    }
-
-    *total = blk_pread(blk, offset, (uint8_t *)buf, bytes);
-    if (*total < 0) {
-        return *total;
-    }
-    return 1;
-}
-
 static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
                      int64_t bytes, int flags, int64_t *total)
 {
@@ -586,20 +572,6 @@ static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
     return 1;
 }
 
-static int do_load_vmstate(BlockBackend *blk, char *buf, int64_t offset,
-                           int64_t count, int64_t *total)
-{
-    if (count > INT_MAX) {
-        return -ERANGE;
-    }
-
-    *total = blk_load_vmstate(blk, (uint8_t *)buf, offset, count);
-    if (*total < 0) {
-        return *total;
-    }
-    return 1;
-}
-
 static int do_save_vmstate(BlockBackend *blk, char *buf, int64_t offset,
                            int64_t count, int64_t *total)
 {
@@ -667,17 +639,16 @@ static const cmdinfo_t read_cmd = {
     .help       = read_help,
 };
 
-static int read_f(BlockBackend *blk, int argc, char **argv)
+static int coroutine_fn read_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false, vflag = false;
     bool Pflag = false, sflag = false, lflag = false, bflag = false;
-    int c, cnt, ret;
-    char *buf;
+    int c, ret;
+    uint8_t *buf;
     int64_t offset;
     int64_t count;
     /* Some compilers get confused and warn if this is not initialized.  */
-    int64_t total = 0;
     int pattern = 0;
     int64_t pattern_offset = 0, pattern_count = 0;
 
@@ -780,9 +751,9 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
     if (bflag) {
-        ret = do_load_vmstate(blk, buf, offset, count, &total);
+        ret = blk_co_load_vmstate(blk, buf, offset, count);
     } else {
-        ret = do_pread(blk, buf, offset, count, &total);
+        ret = blk_co_pread(blk, offset, count, buf, 0);
     }
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
@@ -790,9 +761,6 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
         printf("read failed: %s\n", strerror(-ret));
         goto out;
     }
-    cnt = ret;
-
-    ret = 0;
 
     if (Pflag) {
         void *cmp_buf = g_malloc(pattern_count);
@@ -816,7 +784,7 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
 
     /* Finally, report back -- -C gives a parsable format */
     t2 = tsub(t2, t1);
-    print_report("read", &t2, offset, count, total, cnt, Cflag);
+    print_report("read", &t2, offset, count, count, 1, Cflag);
 
 out:
     qemu_io_free(buf);
-- 
2.29.2


