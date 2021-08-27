Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFFD3F9F09
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:42:30 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgo9-0006Yt-27
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRK-0001E6-Vb; Fri, 27 Aug 2021 14:18:55 -0400
Received: from mail-eopbgr50119.outbound.protection.outlook.com
 ([40.107.5.119]:12128 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRI-0006i4-RT; Fri, 27 Aug 2021 14:18:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+quDkeEiAADGnV+DS2DG99MsxJ0G/+aHjTcio42hrnPNH/+0Hu1gDPwz/3OI4XMIgizJfPJ2A2N1kmXDUwA5dHwVQXu7aTrEVB5zZfd9n8vIhdlIooCMJtNjZR4hlgApJJF10puQTN33O+1+NIl0OeBCkgFlRNQWtBxalcheY7rb//4IwTL9QKrOVkP1VdKMTmCibxImd5lQev6AfeUP5MrtVtRSXxMq0usybWoDzvcKWJGxpTVj0y+oqeqhFqhWR3Qif0EQ7NPzcSvL2hQKmGoH5G5D9SE8TZXbIXQrZoUhhVDc3awWKdGz4rjiuslyRKy2WSR2icwe4HyoT3reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9j3u3Y5yJA20jpt0Tg7DN9PUeiOPxctgrkd8K5IcS8=;
 b=jMgv0GmEMh80opQOygiIEf5n1B4LadR+B3Cc0/IBskGRkhgeqHWDydAWa3YnKjCb8QN5N40zg3+nfSJuJ3N+HVQBK99Y+u0zF9IemrC6SWKP5kqxt5h9Wf6O+iUn56akIfNhAK0tsJ4E85k+wmQEqNiFnUc/wX6840OQeO1Y/oGUz9TZHwwa5Vo/5RQI8KHoZhIYkW3S4F/2TnnkxzphSLZ/PacNiw03uiuyaRpAZt6DfETn1cMmGutl31/RVWsYtavp0L1mRYZuulobOVsUJ9mS4ksmfmgILiZrT7zjzWVEwGBAfj8GjxFfsNcVOMLvf5P3Bln2s2BPGqQIiwetbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9j3u3Y5yJA20jpt0Tg7DN9PUeiOPxctgrkd8K5IcS8=;
 b=MAzsfmzyEt0DCvS6q4txUrrQ+wJWS29zHb16i1+AFkT+uh7YZf0gnGeonXtbbEYrL16xAAvU4i1UORSUIq0GsQQMD0OkZmrbT3jZYxrnRdFekBYwjUNv2XpotXf72RLgdkpmz3Scr5RtWxNlJi4RNOxTo7B5gloS65DE0+6iVPg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6774.eurprd08.prod.outlook.com (2603:10a6:20b:399::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 18:18:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 15/19] iotests.py: add qemu_io_pipe_and_status()
Date: Fri, 27 Aug 2021 21:18:04 +0300
Message-Id: <20210827181808.311670-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eee204d-4a9a-48cb-b49c-08d9698719e4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67747E574CB2E556458E1664C1C89@AS8PR08MB6774.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:337;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YV/1t5ZbjvjhIUdHaFTuBssiRDGE49TgeXUAStRyeAQ+KK/C1veOWTeFthbYLDvPph8au5YUvw22brOMkYyWeGLjXnO2vnMb+dGt1terhDfto5SEcYijntbog9a1eZQrF3sdOxYtTz+IM+kCsG9HLFCZyS+64wzc0VQ6/0oLsKwm+gqnJ/GlbIKCpKZqPxp/Oi0WQk6c4lSdTGnm2BEX533xevaWRiBNSih+YvXOKWEjjVxUwfnvSSodHS9uUllNKmVZCfH8rDTogDmbzvGl7onLdMblCUyyIMEECf/8V1IJSGWlv6PFps8jRyaS/vImO3vPDmY8qKOiKVe9eE6P3Cvdvl0Kjh0oLUQiFUVmK4xK51sksLbn9LT81xRxV6Tp+0MjYTumqZ53GV9PsHdUveu+r2FocYE+tFP5Hf9CVYA5QTZMJCBUWSxoJmV1z6zBlaPwGSlq0f9pPF+ICg2cdzOdPcDjtTWtom+4rkeh5BMePnJWU4g1lAQ1mfNGZuFVozBzavDX62oACrBKTwlNWBd5inDmJ/PqtLdZ7Sm0LipQulHLQ4VcbV7W6n5hpQjUifvbe60yBr8vbfcOQ9WvCmZtikjCcZPJYKa7uXf6h54i/zyuHLi97Gn9hauViy0kUM/Js6NnO7K3Jpjfg/EXSTyVb8m3bP4wEwbm8zAYoMPyNGHmax98uMSFGEvFCBNeQAYkHNRYSCITqtgxgTCDog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(136003)(396003)(346002)(6506007)(52116002)(38100700002)(8936002)(26005)(66556008)(316002)(6486002)(86362001)(38350700002)(6512007)(4326008)(5660300002)(2906002)(66946007)(186003)(478600001)(6666004)(956004)(4744005)(66476007)(6916009)(36756003)(8676002)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NygT8K/IJwCY1GB81is1ZjZwWuSUh0E7s/g6KRoZ5X2KmRA9w99Iwb16bC6Y?=
 =?us-ascii?Q?6Pw5Bg1Mh21RZhPDhBNL3wB7pg1lpXZ7BU0K2CBzf+GHtJO39VfMqqqr6q9v?=
 =?us-ascii?Q?MFhZtcedQPN5m2OWo0NRk4Clq/SjrwX0EXbprOXpVki5jmIPEHlaqN6LNVvt?=
 =?us-ascii?Q?zQbTSN4U6W6bm1T67pb6wPoCv+HuIVP+Mn4s4S4d64ousXy/K5nUlPMqlMcS?=
 =?us-ascii?Q?WAujVR+XJtsLNdk73cEgtMK7K7Bf2zC2nlm5sL1VQhaNXyHazh48PbhGTwLp?=
 =?us-ascii?Q?JFRleGdAS/I7BOREB9IILHn886+WrrWgmg7s57MtkkfjFykLWj2I8hFK5W2l?=
 =?us-ascii?Q?JGTfbhu89livwKP3BAYWHV5UmMGafoS2BIj44C+5vfcbD/Uz3lWGssuNaXth?=
 =?us-ascii?Q?bglgjNCAB9WAda8HLa3Sv6Y7XWkwgk+KAb5LKU7o2nIJjBNw9zRgJnhm4enw?=
 =?us-ascii?Q?V+22Z4Mdg7dz4LBADd0Lw5J36YhPmkt1peT5w13yx9Rru5lY+wt+032u2BJy?=
 =?us-ascii?Q?NdWqnUWxVtMeJf+GbmfES6LUi6Az2oVdayFsV4ogvF3JzHBouSg8DPz56I0W?=
 =?us-ascii?Q?JwPZHnNmdaEY6DQI2qc08hQ1nZOp7AC/FpLuu3I1anuJt0ln/1H/sdb11+m3?=
 =?us-ascii?Q?m+LkbWpKtD0VafvVBk92B1xLhEQtoEOG+rUL5vZFzNuGifDlZj/zIovQndz4?=
 =?us-ascii?Q?fJZvmHF/cJrXPHdOUYL6HvPihUfbqD5JnskeoA+LK2vMjKchWd02zaUZ0J+i?=
 =?us-ascii?Q?2BvsuSV3k/erWkpmNnJYFX/kTzQFreIgI6GnYLWlszKOcaKzl8taxw4ws8dh?=
 =?us-ascii?Q?FfIeKym2n2emyYx3A7Y5LO0XLPGtfhVlZQ3504awo5HRzD9MJo0XdgDO918g?=
 =?us-ascii?Q?7SdE3Bz0ZFmK2xDJSZRbjsuT5Uu0VBMxXkoCfWDabyZdKQAF1Ceu3k+D+NGn?=
 =?us-ascii?Q?BvaB1tPlQhi4yFCrr0/DGvcnM+FV3hlygsM9GHbnpa/TQ3++7hUMFd7g5weq?=
 =?us-ascii?Q?JIwjnA0yBlMbWCAQ9IaOzpVIm6iGV6BrkAxA0e7RgJSyEGwc/+9x+hcitbVA?=
 =?us-ascii?Q?P/fGUwk7Ay5ZeuI1N2iYhjDFyA18ozfysXG0h54JSI624CJlUtdPqgY90g7I?=
 =?us-ascii?Q?o6n4tn9jJavukHZ2D0v3OjSvcIfTihpIpxZZl7lWiYg4HBYyWW4Hfh9bhpas?=
 =?us-ascii?Q?6GetVv837a2SE9TCwFaPoZpWr5r/TYaqsR42w5D7V8ODDBMMCCHDD6O9nkpy?=
 =?us-ascii?Q?qbYCU1xmFn2kpOpVv3FwQ+ekH03Ge8KBsZae89VlOQAdlbIDpIqYksJ0rk/P?=
 =?us-ascii?Q?oqd/wY59Vz5BcSWt6T/QBdCA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eee204d-4a9a-48cb-b49c-08d9698719e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:42.6790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWJlF2IcgfsMV4h7jNyLNZMS0tbip8vczmySwmMwlkn6Duzc+ZOiCQ30WCumfdH/eJuSAICeN0RXrodJcszEfp3clnlHxHD7K77GZYZdIlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6774
Received-SPF: pass client-ip=40.107.5.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Add helper that returns both status and output, to be used in the
following commit

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 77efcb0927..ff96d8ef16 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -206,6 +206,10 @@ def qemu_io(*args):
     args = qemu_io_args + list(args)
     return qemu_tool_pipe_and_status('qemu-io', args)[0]
 
+def qemu_io_pipe_and_status(*args):
+    args = qemu_io_args + list(args)
+    return qemu_tool_pipe_and_status('qemu-io', args)
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
-- 
2.29.2


