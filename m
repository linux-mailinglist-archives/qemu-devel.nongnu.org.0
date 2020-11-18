Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C952B83A9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:15:20 +0100 (CET)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRzD-0003FL-Tp
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:15:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpF-0004aJ-BW; Wed, 18 Nov 2020 13:05:01 -0500
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:34980 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpC-0008Qn-2S; Wed, 18 Nov 2020 13:05:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix4E3YC2pXJs8PDXCUb4erVNGk6mLxFHHOhP1v8vXkxEEGyF/tNeNhaNmuejR+1yYdPtviVo20TYRQabMR9/i2PHVvQB9HXNTNo1FTx3UQxPdrCXbfr9fDOudgB4tzRpq+W08/54bOkV/fet+YMASXj0vyizuRKw1Ss1/isB+dkEx+5W4Ekg41aOwByR9SAAH61ESHXQfs6yCXJ/wHD1gArzgNfNh4u1Xnu3psoOb9JumYr4AqINHn8Zgclp0Zh3U6yNmmwQ7TjA/5Uwmzy0LNJXygqWPRoCbEsfHF6e+7bcNadWgzW0Q1s5MryUZOKP0LGqVk7K28gy8gQLuKHBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syH2bRGGfv2feXTxLbmydlAm/5WfJY809yJQqBYGHVU=;
 b=Z21zoOUzCHu2lLietNlUCvU/vpAHjO2jPi8NWsWAwVlaDy3okl7chFAKpC+HC9usSiBDLNTdgZy6nSP+DLpSUxO0bhtKUvQi/1S2e+SJ8U9Uidb/FARKqpTwGBmz3SskxwO+u7TvkvpXOMZroh0plvfsTvH8m6nFedqnJ7eJ6A/eYjn9uCuz/xOuab7bBZfcJRgVgUX6gA1dq4HW7QtmWVGZ3yZ8CfnCbUJ7GrTNvhEw1akkRsRLKR0iXTZTJZi/ksyWkiMbaEhV4JWLAyx64Hv2sswd7Wq88rqbMdfSZTHnAOFCYgezMkYCrvY3Xe3zf+Fd/Eu0iC+ylAmov2CbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syH2bRGGfv2feXTxLbmydlAm/5WfJY809yJQqBYGHVU=;
 b=dLz1RDlAmehKEnY3XEmE6YpwpI42DVrCqFKCRnnZQrsWlzI95HPa1uDQK/dWg+netSUhyl7qwFau16RbmN5T/ytIU6pupThy1NtZKBLEQyr88Us9jJRt/lGGuo/La8FdlL0OEYBDEx/tHeCiR2iSKdAMa1el1aSyyV7WDrosZGc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 02/11] block/nbd: implement .bdrv_cancel_in_flight
Date: Wed, 18 Nov 2020 21:04:24 +0300
Message-Id: <20201118180433.11931-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11c2e3d2-f268-489e-2c8f-08d88bec6fd7
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912370B656797B3BBB5783EC1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/YyFjyge46W4GS4+Fs2z0fPsMKSORlsQlhM7xZTTXv6k58f064eNWl1RFh9NOXBnq6u6ym2Uq66anYHb/ZFplgL7h1HRz+QS+ctsKwzHpjC/+AZI+TFPcgfDvRTN1jcIIXTKI2aPEcrf1vKPS+Y0y+Ck7kDRpGuga4O5MPCUZEs0iezJ960hEb5/pKlGAJMB7kY8GL/Zf73hc6/WbdT4/OVVInOm6R4cdlvSZ+MlZkSkjy1UG1b2JmcvuR8cBranU/CzqkGi3X+sGSR+843jeAj/d6ja3qzNnj1RPTG4wSUgOsBlbyeSCvqorDIbt6x+5NCrNHh95wNY6pMMIGQ0hWLDuODZ4uFFW5bPC5N6FlfMpb1I4fTKxriSQ7yHG96
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: qWMyPp/0J1pTqXWKtkqjhO9rFSXVunC4DOjsWfuJJQAHxHJMJdW/S4bN03AZBAsf7z4hA/ydGKkc0e6XAeBKxLceP8IY2FgDn5CY8/JVWOZ7f6BXBFQ8Uf06ShOhGofIirX6/h0I7/VTrsRQ+RSpKP7rUqHyzpJY3j1obnHanDjZ/hft41wjhHjyvYjiqU59ZESlRmJf/JuYpf2SxMW5myyGtVlGGT0LQDfLLIao9z/q2f9izequejbFokNjE/rpI8Mi0agiJKfmI/FL0M3n/brJrsZt0lwItH52T1VlW/+3XxEh/QQ+TpqGRy7vHQ8ivMs/OEO8VdSH7qY24ijKJ8U5zLw54nEVFPJoxVNi0ARaZjiFCQsllFhYF4GMuBnQwfZr/QqNh34AxgULq+1TNn9tL/eC0HmFTria78graKodQEAnn1g5JUb9gXm82elKtDC0+ncgad/rgYx+2yb2TMx0kHLAXPi3Hmqdh2ugjoy6oto0vUqOkS8zVL300UfwK2bf3n8ley7lDo+WE7BuIo4CcaaF0d2eZ4SmGYuuksXscOHlCQxgueMpOdCWgFuN1PE9DE1F7gce9jcIFN/2O63rlftQHw5Jm/C27lTjBSD8RDScjW3BtTGJnocwaukE5IqIdkSFZprUhNGUVyhQzQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c2e3d2-f268-489e-2c8f-08d88bec6fd7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:47.9314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqU1KhAQFDGhTyMRmeqRk5o3ATKlVC2TqNsHNty6zW4WNiwshQbcXZAnc/oDD+VTbTOiBjpCVI2XsqRRuK/9ntXKqMYJYK7HF523Aqh4hF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.13.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:46
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Just stop waiting for connection in existing requests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 42536702b6..887410b106 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2419,6 +2419,18 @@ static const char *const nbd_strong_runtime_opts[] = {
     NULL
 };
 
+static void nbd_cancel_in_flight(BlockDriverState *bs)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    reconnect_delay_timer_del(s);
+
+    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        qemu_co_queue_restart_all(&s->free_sema);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2445,6 +2457,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };
 
 static BlockDriver bdrv_nbd_tcp = {
@@ -2473,6 +2486,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };
 
 static BlockDriver bdrv_nbd_unix = {
@@ -2501,6 +2515,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };
 
 static void bdrv_nbd_init(void)
-- 
2.21.3


