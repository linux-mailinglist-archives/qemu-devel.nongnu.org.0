Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF40369C31
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:47:41 +0200 (CEST)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3eG-0003VU-58
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y8-0005Tf-HX; Fri, 23 Apr 2021 17:41:21 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:24032 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y4-0002zb-V9; Fri, 23 Apr 2021 17:41:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwNz+SbL3ftjVWjAk7BebGMopZV+i+Ajf6ziELBasW6dWjRjaQ6ssSbDZBXtPZw9vt070voBrZ17oMhHM9uSowUmI22F5JnQtH7Sf2hxs/fKZGvYDg6t/wc45sZRAOWR0ITqvR+tpcfO2ZbuAIkjJtNBRGc64Oy1D0eCGVmi0Uf9AE7mv5zlpVdlA1a8qEFJZcLgrZCZSRL7YfDdQWBCcjzhRnD4hwMsduRhVbckms/CuM4HGTPlDXjyzw/JuhnnJHW5Iu8v1PZZXG5aiLRe75Ibf4BGQhXRqyJHxYwrHM0tT4RVvZYnMGEj/n+fow0jZJKSQOS+zxre2UWIa7Zl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6aWC2ioIpnfTC9mp4GejIEk5Vp5y8012RMNfuTSg9Q=;
 b=aBMW0aNN9IbkJCJZVWUJQvUx3xbE6Es9uZu4iKuTYIw6iG39Mfk7aUJq15/pamHg9IECi1yVdKgT1T7FG4d4LQ4vt3LiQMz4Cvv9PQfFFBEBtQ9qYNSqpcbSlFdsv2wrio80Um1CQ53ytdECQA8U3qYtqTgvOi8USQo9DmqWMPy4XrZQQ2WLiQOQhnEVwOYwyqhfK79pFdPI5hCscJVZqRuMokGaFJd6tXS34i7bN7aMfmo4vnBpZ5d5FM0oNDVhae/XtQbdA2TsHitv5z2qsiCzkUSjCp2ZFSjmQRsxXue5GAJVm/uJcN4pQRIdx+u90+SBVjYAOvu0mRl10s28eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6aWC2ioIpnfTC9mp4GejIEk5Vp5y8012RMNfuTSg9Q=;
 b=YxWuHMgWhkDUwf1kXAWO+jfhlQ+2xwTQTd5HWvRupxIKBTNiC5273bNq2dBelivPbE0MYo/ni6jRMHQR+kQZh7s+T5qUD+LJMHAkvM7HPdUBOJ1urZ4HFUC2iJJqMplYNAmDukpoX8MsC9zG/FGnF3bSaAcglM7I/x99Dy/sm7w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:41:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:41:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 09/11] qemu-io-cmds: refactor write_f(): drop extra helpers
 and variables
Date: Sat, 24 Apr 2021 00:40:31 +0300
Message-Id: <20210423214033.474034-10-vsementsov@virtuozzo.com>
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
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7c6c101-544b-4fab-29dc-08d906a07dba
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63742CC6638A4DD99AD74E00C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwISwx5Iv3ZDRzRkO+yy5oN11AvNZ1gJ1FvITRehDHkHs6UpzWvDGMhzcJz6wUZcdD6pXbwoEqGLLZf8sIgV+2tmtedR4Gf25vxV3uw6jen6HrYhCfYMM7FiGtvoOfNECbWLZpazFBtUD7m3SFnt53rffRjBwJwbbu/bH4I9t79Z4KtpJKfpo0IPp7kZG04Jvk1oMKYQGT0jnx5N1cy4qzqVlJs15wPwb8IXsXKp1jk3dfudp02UoLubLThzo/4djdKSC98RQD6CeEiYxSUjDlH3TB07todxbh2rbNkRvH/Ekeg7ZR4BITRh0HR5ieaB7EZGF7AzcW/JBHEoSaQM9AmjR8pUfvHY7ZDPS7JMFgHvCDwNDhstZjfWgaENMj9h8R6ZdWyvFV9dly8v7248e2+KCjOQe1UpWKzcg/eozwHLnC7aoXlISAbzFoSCz2X88Zm0i0ZMGgckNz5EQEDjkCV+Q11KyHQztZgfdi84nRVdwp6aL6ovt2EOlg52wKL5/pu55p8iQYokuc2N9Mlbp/ygkRL9Ak//NWvd5cnV/LH37crIOwM/hjUjfggeW/70ui5tttNywJWairNjlSj9JE3rFdsYrZk1vX+iNZTz2g51kCxrto7a4ESrejb4URTmCDgksOGnVwyk+ewbvEgUQQ9VR7v1Jv+oTIXNI7qLZT3cN7ZaiwTOvhgx9FyvcXUC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PsAOpbTXn9s6TSZHTL2+txHmw7D/Zefv4VZnM0kkhzKJNYAsbNOjMo1hBfMO?=
 =?us-ascii?Q?CHybY0RXpUDljUjIiZfLH6OF8Ee4v26VJnoTiBnJjDDI+P0ByPUUV4KMfjsp?=
 =?us-ascii?Q?3GW/5y57kq3HrXnw8oEWn+GcypWr4eLWB7mahHjjv+dl1+Oh7X+iddhzA1el?=
 =?us-ascii?Q?zKWBH2wHxvTnzf0uFI2tS5kyl/IsDuA3n35TmJL+jaeyAR2Tf9xCEPGvOA7W?=
 =?us-ascii?Q?NXbOIDKxTNVJnDQu0VbIrO/VFOIbe4iTl9br3ZUl9UQt8bwxqGiBXpfDN+wC?=
 =?us-ascii?Q?zot3waZ6gTaB/ixloy0dYYnbBhsWW93TrAch+wrEmllkDNCx5MoZqHVuWHm/?=
 =?us-ascii?Q?d2xcWtYQGhA6soIuZytxwGrdvdEeyXE8591Rp6u4LgUe4NlA104+0Zmrcz4C?=
 =?us-ascii?Q?yI3QpTDp2o1+U1GZW3LhrDQ2aOly9z91madieYMNAuVmo+sCUqsc/xw6Je/n?=
 =?us-ascii?Q?Dwyn/RteXPC2Tz/Y1SWuBciJbxWPSiD0uGavQQ0/k0gDAiJHn0+o7MakfHV5?=
 =?us-ascii?Q?orbyovDszSsGyV7VvGlDLD/CC/8zU9Q3XGogZbWnDTbU8t7bxAPfXlZmLo2l?=
 =?us-ascii?Q?o6ataJF0okdvl73Yq1vZdMMMzFjy1nhIPAh3kkfTD1PasQbpsTgvrCSeXBcP?=
 =?us-ascii?Q?GAhbonwjahwReU8caurFgMdipTm4/Pn9JsrORo4xgZJlnbwxa4XcjI2kQ1Gj?=
 =?us-ascii?Q?vSz52lWxsHpBB4SHdQiVgH1YscpnxhQN888TaOuuGZN0IaWRNzSCCa9akoj4?=
 =?us-ascii?Q?wQP0FYWtyYyerQLj58GGoW53JmWEzemxhyDUJtTUZ06SPF2HmhYLyUZAJGhQ?=
 =?us-ascii?Q?WEN2HixF9ydW9FHfTIk0argyTW1snY1Mdkj8njJMTZLwr/QhQ8b+zWxW4W5s?=
 =?us-ascii?Q?+mnmdEro7My1OxTjUyAteYb2OFfkhySC1NDhM2oUOZq2xi+/90w89pGRmP+p?=
 =?us-ascii?Q?6pn0Vhj/udhJoF6ZqdkdXXWEzGx+F4FVFF6Mzs6BwwwTr6L+x/f4z0oygyiF?=
 =?us-ascii?Q?T2NGcBO4YkDZjlf6RPP+3h4gC+wIKvmPJ1F9J3kKoElhOI5uL9aq/i3LYh1C?=
 =?us-ascii?Q?bi8ciL1goKStSEuGPhTFqNIsI6T/2e64Zn8g96fVV3iKIaQV0iFo5bed4duR?=
 =?us-ascii?Q?a5qoHXaF6mdCeD6tL4C4WDD+47UNkWirHs9QN73WMEnSL5k/htabLo0LgxG1?=
 =?us-ascii?Q?ErdWZ1ucuATQLhNzQNHobaEM8cVU2GvRXSUS8nMRzPwK3dMH3PqzEj31Gx6I?=
 =?us-ascii?Q?qdYAK5VDLla6xLD9ITjZe2u+/ND/j3NsY6SlIVKKFyS1rn6YNrAqkJPZyRnc?=
 =?us-ascii?Q?RUECm+lkHhC4uXwHI6v9TnE5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c6c101-544b-4fab-29dc-08d906a07dba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:41:02.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq7OaO0rhdlBZh7dJew2Hu6llUZv9IIybrlWWKeBQUdDQEo19eCPpBeathQ/caIwwHwj0bZNFWdseaNZi5EmHN23ImVapjRZhTzT7mpjFJQ=
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

We are in coroutine context. Let's call blk_co_ functions directly and
drop all these helpers.
Note that count is checked earlier in write_f, so we don't need the
check in helpers.
Also, both blk_co_save_vmstate() and blk_co_pwrite() return 0 on
success, so we should not care to set ret to 0 explicitly. Moreover, no
caller is interested in successful ret of qemuio_command being exactly
zero.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-io-cmds.c | 81 +++++---------------------------------------------
 1 file changed, 8 insertions(+), 73 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index bbebecba55..2f0a27079d 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -527,65 +527,6 @@ fail:
     return buf;
 }
 
-static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
-                     int64_t bytes, int flags, int64_t *total)
-{
-    if (bytes > INT_MAX) {
-        return -ERANGE;
-    }
-
-    *total = blk_pwrite(blk, offset, (uint8_t *)buf, bytes, flags);
-    if (*total < 0) {
-        return *total;
-    }
-    return 1;
-}
-
-static int coroutine_fn
-do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                    int64_t bytes, int flags, int64_t *total)
-{
-    int ret = blk_co_pwrite_zeroes(blk, offset, bytes, flags);
-    if (ret < 0) {
-        *total = ret;
-        return ret;
-    } else {
-        *total = bytes;
-        return 1;
-    }
-}
-
-static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
-                               int64_t bytes, int64_t *total)
-{
-    int ret;
-
-    if (bytes > BDRV_REQUEST_MAX_BYTES) {
-        return -ERANGE;
-    }
-
-    ret = blk_pwrite_compressed(blk, offset, buf, bytes);
-    if (ret < 0) {
-        return ret;
-    }
-    *total = bytes;
-    return 1;
-}
-
-static int do_save_vmstate(BlockBackend *blk, char *buf, int64_t offset,
-                           int64_t count, int64_t *total)
-{
-    if (count > INT_MAX) {
-        return -ERANGE;
-    }
-
-    *total = blk_save_vmstate(blk, (uint8_t *)buf, offset, count);
-    if (*total < 0) {
-        return *total;
-    }
-    return 1;
-}
-
 static int coroutine_fn do_co_readv(BlockBackend *blk, QEMUIOVector *qiov,
                                     int64_t offset, int *total)
 {
@@ -945,7 +886,7 @@ static void write_help(void)
 "\n");
 }
 
-static int write_f(BlockBackend *blk, int argc, char **argv);
+static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv);
 
 static const cmdinfo_t write_cmd = {
     .name       = "write",
@@ -965,12 +906,11 @@ static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
     bool Cflag = false, qflag = false, bflag = false;
     bool Pflag = false, zflag = false, cflag = false, sflag = false;
     int flags = 0;
-    int c, cnt, ret;
-    char *buf = NULL;
+    int c, ret;
+    uint8_t *buf = NULL;
     int64_t offset;
     int64_t count;
     /* Some compilers get confused and warn if this is not initialized.  */
-    int64_t total = 0;
     int pattern = 0xcd;
     const char *file_name = NULL;
 
@@ -981,6 +921,7 @@ static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
             break;
         case 'c':
             cflag = true;
+            flags |= BDRV_REQ_WRITE_COMPRESSED;
             break;
         case 'C':
             Cflag = true;
@@ -1013,6 +954,7 @@ static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
             break;
         case 'z':
             zflag = true;
+            flags |= BDRV_REQ_ZERO_WRITE;
             break;
         default:
             qemuio_command_usage(&write_cmd);
@@ -1095,13 +1037,9 @@ static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
     if (bflag) {
-        ret = do_save_vmstate(blk, buf, offset, count, &total);
-    } else if (zflag) {
-        ret = do_co_pwrite_zeroes(blk, offset, count, flags, &total);
-    } else if (cflag) {
-        ret = do_write_compressed(blk, buf, offset, count, &total);
+        ret = blk_co_save_vmstate(blk, buf, offset, count);
     } else {
-        ret = do_pwrite(blk, buf, offset, count, flags, &total);
+        ret = blk_co_pwrite(blk, offset, count, buf, flags);
     }
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
@@ -1109,9 +1047,6 @@ static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
         printf("write failed: %s\n", strerror(-ret));
         goto out;
     }
-    cnt = ret;
-
-    ret = 0;
 
     if (qflag) {
         goto out;
@@ -1119,7 +1054,7 @@ static int coroutine_fn write_f(BlockBackend *blk, int argc, char **argv)
 
     /* Finally, report back -- -C gives a parsable format */
     t2 = tsub(t2, t1);
-    print_report("wrote", &t2, offset, count, total, cnt, Cflag);
+    print_report("wrote", &t2, offset, count, count, 1, Cflag);
 
 out:
     if (!zflag) {
-- 
2.29.2


