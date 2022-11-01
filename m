Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF68614EB8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 16:59:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsIG-0002mG-S9; Tue, 01 Nov 2022 10:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1opsIE-0002lO-Ll
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:31:06 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1opsIA-0000up-00
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:31:06 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A185BUj021515; Tue, 1 Nov 2022 07:30:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=T1RPZ2yh7rA0bYU2UZ5iA51hZbflKk7nVU7HloWNFZE=;
 b=e8YZ+LGAwCmYARwDtT2bKTCV2v4cwYsk6jefRWROFkm5Qu9BtS1bMZvgksbttUlSV6En
 CwygRIQMLdC/fkuN9N0vkTc5lu6zYgBAdJ0gbu3S1BPlra8yHIOd24CVF0S7FS0nudEl
 JRhyyIdS5eUESwQBquFczBsViG71RphWv9TemI7qNkh+3wfJtW8+AKJj2nWPqNH1ZWfh
 pRcVI5LhzR+d80EjLGAdgXoNizWdYetwMgDjUiBf24Fz753twCuqAY160W66twtr+NFF
 vmvWlrikIMIMpUQ4XsMdviJFbeeNi99iMIr5oxVpkQ0PP5X547ug2PIzJ9wOVh12thvF 4A== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kjq1f1vvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 07:30:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BB7uETxedOiRYfIrCX2ljfoQ2maq700lB83wSqcBeM6vvP2YFRqzRjmPScgUcnnyAv6mTtcyiz8EuXAsK9qOAb+LCRaKQpcBneM3EJfKw1yPPAkzwzOIaPWKcFDpE5WPlu625oex/NoDmIhPl8NPD+VTNgSo1a3XcNI1vT+41/M1qKYk50NSB5f/0FcdlWwo1yJN7Ood5P5mwdw2or+95urixlyNyEMjJDSrcta6eK3yTX34RDOQX4Y3u/7xesORH3cBGatfoxVVyR1CAxrCWGZFoaAeXK+hF+VnMMcKJ71ROlnerCY0q5keqPaYN2X/eXnyYBbvWjYzmXcb9qvPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1RPZ2yh7rA0bYU2UZ5iA51hZbflKk7nVU7HloWNFZE=;
 b=mR855Mz0LsBCO8bLTRZAGZcBLWMWs/JP/Sob8wJF54s1yovhj9m93Tx2nNaLNdkbafQ4p7l7/cc6Jyzu5NSpH0qJuk/tbhbFUaUgDamBWNagKzcIimSBWZBe/hKe6KpXnpCSE3jI1MUqmYTb0WU+GGC28EHmB81tuwxcN9/eNlPBdTNivfdyJ4vsfYLwoFJolv46Gk/rz1KuP29bAOsgVnTNEXycm6T5C88U8ZwXCbsrwBeouDqhPciz8F72ycwqjtSv/tE7MHkUVCS2c2OzTpnyQULsilNP217Km+WqfgTOQuILGCBtVdwAyAxTR9fgbTr1LOYX/k+cUq7gG6RVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1RPZ2yh7rA0bYU2UZ5iA51hZbflKk7nVU7HloWNFZE=;
 b=Lfs14bhZQrNbdYGQ/QvQSCvkaP3pm0WMnSKDj049BvbhiHi0WZnhvAVSLInwgKgImTxIrAsZ+Bl858tyejFAs1TfAZ01S3Oj4XYgzPwz+dfFV05lNsOu+3Lf3P5qZJRZm/MMFe97bpD4yB9S6FBXpVeZNDM8Z6V1KXK46gTB/OgUO4COwIai5rppg+7Wr76QXzSVsU/z2r3F0PjoOPhmxdH/c34Ga7IDcBUyyaAoSEXOkMVtPQdY8pOVKKTZZFUl+8HfZvzRuq/LRae4comakccgJP6rk8OTcq8oi6VlxZzY7EJ66KSKv7lPdF8ytC5I7CusA2HdbzIS5aXHiAxAlg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH3PR02MB9138.namprd02.prod.outlook.com (2603:10b6:610:149::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 14:30:52 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 14:30:51 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH] migration: check magic value for deciding the mapping of
 channels
Date: Tue,  1 Nov 2022 14:30:29 +0000
Message-Id: <20221101143029.14246-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH3PR02MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c27836c-76ed-4704-b46b-08dabc15ad57
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blHH+YsK+2/YsW282ex654j5j5wAp6+kMwjqx4j6wq+gkOY/+RuxSWQ6xJfHKXcodaly+v/RX+iHSRIUOggAtYT+vURytumAbfd1HkvQ9NGaG4889oTalnXwSkao7fi0Mvr+BOoJXerf7wPQ2XYrq48J7iSIvK/6DDPivdt46fj8kT3EjiM93hRcg16BxjlbbYefyIKuLD6IZh9Hzvp/czex7iOM7RHX0931/tOMMd2BeTCCnTxwSqfDSJfdHUDVvxvTlmggDvObFv++iSEPm9wrO/Oe+fpQjjDhSqUKEsIWTd5omEhF5C0TjELzqX19HNry6Go6O00Qon+ZApGwE5viIVP6EJF0S8A7UdQ06u30TBYpFOyuXd2uCys4lRlIDMcOEEPEpHfZkN7OKoF3dy+uWccA7EUpRgVkckcOV0CJlpc6tK4twf979N8/VAr8EkzyhCM61CGQOeNrFJBTNi+ACt6FsVMWwgiErfvIOw8y+hlNhFefQuGgKZSHIywi+06p8E4VfxfKlPRkpz23tWDfaywqr1WKnBGbsoRpUbO1snFyte6lmASHocOSZv0WLd35mYkrOqTkDmuIPL17kKoT5Nd93gWZAw5r0w469tcEE7TahR8SP1KcI6e1DFIgoscKLLIjNAqDYIZ4+o2YsJyfkm27cPr8iCU/rKIaiPH3bJ80UFIlWVXShBZu0fUe09zYBKcdI6SBuj8Vyf6sXFUyT5/2Do7nxZOvohPeRKz6AfVZYZRoggIW57KoKNJHMmk3YKOC3uOt7J0Dp6vLAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(86362001)(38100700002)(36756003)(38350700002)(478600001)(66476007)(66946007)(66556008)(2906002)(4326008)(6916009)(8676002)(52116002)(5660300002)(316002)(8936002)(2616005)(1076003)(186003)(83380400001)(107886003)(41300700001)(6486002)(6666004)(6512007)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3eIY6p2xSWrPrPAwbhU4kN3Vx4NiOGmR7aRa9TAkrie7XZ0L48C1kHDxlIvb?=
 =?us-ascii?Q?SmEBaucQ4BVQ0DHIqFeaEfsxUsRwkEiKQm7I5dLwlSTRe9jp8sjYRGB/yGg6?=
 =?us-ascii?Q?flJAgEwPaCJpg/5vHECLcL7x1671kSDL56TVXX7Qn6HC3T6DjSdG/MM/r+MQ?=
 =?us-ascii?Q?OLYSiNt4eyieqZWQIgMX1zTt1J/kN0tRazOVU6aALM7zTFX+ULFl/XTcPwQu?=
 =?us-ascii?Q?9QdQQF9bkyhp6kKLB6pE/gN+nUGgoHWJ9PlifgcX3nqXeZYYPWvtGLKv2jlg?=
 =?us-ascii?Q?KvFB1GxLh1y3qufOFaLWpHv4rePJHhtxqJ+scefakEtl2/6PQ5VkyE1ESFZJ?=
 =?us-ascii?Q?8ZiY8eKv8+b70sreiZDzixyx397tC4+qrNWIQg9n1FeBh473AIQY4gKBtT2v?=
 =?us-ascii?Q?7qw+u0gMzewiMJk1UbwO6UOHOE/8HvKYCCIsjWqWerh5f1+xwvdgNsCR7Of/?=
 =?us-ascii?Q?vV/DphO06Gzwbz9dY1VDNqJt1XBgq35kg5B4StgXD+gwhoqA23rLWHohcRgZ?=
 =?us-ascii?Q?/CwvfCip5uP5hnVKwCQGke5arZiq3d5jIJZjKEvBUO6UdrN2eUrz32FDWgHj?=
 =?us-ascii?Q?2oChD+tPXX2iK3LhzxvIUdzmrSe4zfmR57CPWrM5LGDIA+TscttSuUQJIvic?=
 =?us-ascii?Q?H3V9Vb6xYGw4DOgZTgIeReLdrrKmPAbddfOUpYbbOTtxba2nigcaJxX52KoY?=
 =?us-ascii?Q?T4Zhp9kHZ8k4L8qBQa8e0g/Vu9ZRR32i/IEKRYczJabEsZnibSvErHJGIWIK?=
 =?us-ascii?Q?F6Cwe+wEkUfn/EPemZ0b1uxd091HJ/nAOqc7QW3ondks8hp5DRFmmUc1Upi+?=
 =?us-ascii?Q?doO1GTd2hKuDzm2RbPbLNVmQ5DEPsLJJ2CMDCFhK6DK0N6pPhymGzqVQqA7A?=
 =?us-ascii?Q?G1R/MXPFQ1G6E+YWSzBIK7RE3OonB4IIaM9tZ7vMyUwLT/EmQCIowVT0pzeI?=
 =?us-ascii?Q?/tJPQF1ld/0vwwTvsiyeel8+rm1xvRV3XpB+v9cwO6yUxB9o53UzgX6ugXe+?=
 =?us-ascii?Q?e4KRl1rqviem0RSh1dtVmRmbe3DruNqee4XATdqgNB+YT5R/68K6oVRI7iij?=
 =?us-ascii?Q?1VEb+w1Oa7nw9YZv7z3Zo/IGcdopT3PmtQQA9JBOLEwltfckABEUo1irota4?=
 =?us-ascii?Q?77y37PCShnx+TRlEdGiMeGKKxFFDZQ6J9KeZcK6VjB8Fbx0H7cKqSB43miUc?=
 =?us-ascii?Q?Iik7AYYtYOQJpIkH7vmZJEdhRxP+yU1puWPDnv8csvnUUynbmRWzzkN8REqR?=
 =?us-ascii?Q?CpE04maxnIFDYhbE63kQLD8pvBJzqrSiC+ElLzuiwKvM5IbStWQXip2LK3SO?=
 =?us-ascii?Q?u4wX/u1T68rE6F0wAX1x/1hQhykA4wmiDcWIhO2iSZtESJK/G0lhACdyTem+?=
 =?us-ascii?Q?X5d+7RpwktZ920hPGP8kSJwYM8dX9CWCA3/hE3maZhSHM154HLJLSNIeQ9MB?=
 =?us-ascii?Q?z+dBBGiClrObDWX7RacYdZUpauoDJTAyptItAjHWO5o4mGFg5mNXoxWXF+p+?=
 =?us-ascii?Q?LyNNJ3eQ6FQUbdjC50gn6kSVmsbUWj9sqwIUg0kK/jwm3RxYiri+QJi77CZO?=
 =?us-ascii?Q?cEYDYr2zYqaEGZNvvPPYndbjLFZifLT8+ScDU5P1lQh3Q/Y/t5gFZ5LyyUX1?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c27836c-76ed-4704-b46b-08dabc15ad57
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:30:51.8793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUbEYDwSJlojIXZeeWe48Fo+GAQPt9+QN8zWqcJB+N0fXq649/ME+eVXp/rKTKA3st9gf0PJQQNY9NHFe98t8z/aAoEBsiwj1+vNmtZnXJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9138
X-Proofpoint-ORIG-GUID: 1vyH7whyOe8oVdlfEeUXxADLSMdjMNdN
X-Proofpoint-GUID: 1vyH7whyOe8oVdlfEeUXxADLSMdjMNdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the default channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, this patch
uses MSG_PEEK to check the magic number of channels so that current
data/control stream management remains un-effected.

Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 include/io/channel.h     | 25 +++++++++++++++++++++++++
 io/channel-socket.c      | 27 +++++++++++++++++++++++++++
 io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
 migration/migration.c    | 33 +++++++++++++++++++++------------
 migration/multifd.c      | 12 ++++--------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 8 files changed, 119 insertions(+), 26 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..74177aeeea 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -115,6 +115,10 @@ struct QIOChannelClass {
                         int **fds,
                         size_t *nfds,
                         Error **errp);
+    ssize_t (*io_read_peek)(QIOChannel *ioc,
+                            void *buf,
+                            size_t nbytes,
+                            Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
     GSource * (*io_create_watch)(QIOChannel *ioc,
@@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
                           size_t buflen,
                           Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read in data
+ * @nbytes: the number of bytes to read
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read given @nbytes data from peek of channel into
+ * memory region @buf.
+ *
+ * The function will be blocked until read size is
+ * equal to requested size.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp);
+
 /**
  * qio_channel_set_blocking:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..b99f5dfda6 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
+                                            void *buf,
+                                            size_t nbytes,
+                                            Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    ssize_t bytes = 0;
+
+retry:
+    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
+
+    if (bytes < 0) {
+        if (errno == EINTR) {
+            goto retry;
+        }
+        if (errno == EAGAIN) {
+            return QIO_CHANNEL_ERR_BLOCK;
+        }
+
+        error_setg_errno(errp, errno,
+                         "Unable to read from peek of socket");
+        return -1;
+    }
+
+    return bytes;
+}
 
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
@@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
 
     ioc_klass->io_writev = qio_channel_socket_writev;
     ioc_klass->io_readv = qio_channel_socket_readv;
+    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
     ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
     ioc_klass->io_close = qio_channel_socket_close;
     ioc_klass->io_shutdown = qio_channel_socket_shutdown;
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a2d9b96f3f 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
     return qio_channel_writev_all(ioc, &iov, 1, errp);
 }
 
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp)
+{
+   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+   ssize_t bytes = 0;
+
+   if (!klass->io_read_peek) {
+       error_setg(errp, "Channel does not support read peek");
+       return -1;
+   }
+
+   while (bytes < nbytes) {
+       bytes = klass->io_read_peek(ioc,
+                                   buf,
+                                   nbytes,
+                                   errp);
+
+       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_OUT);
+            } else {
+                qio_channel_wait(ioc, G_IO_OUT);
+            }
+            continue;
+       }
+       if (bytes == 0) {
+           error_setg(errp,
+                      "Unexpected end-of-file on channel");
+           return 0;
+       }
+       if (bytes < 0) {
+           return -1;
+       }
+   }
+
+   return 1;
+}
 
 int qio_channel_set_blocking(QIOChannel *ioc,
                               bool enabled,
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..f4b6f278a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migration_in_postcopy()) {
+        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
+                                        sizeof(channel_magic), &local_err);
+
+        if (ret != 1) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +774,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..be86a4d07f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3


