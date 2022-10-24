Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C7609A7D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:28:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYZ-0004dz-8k; Mon, 24 Oct 2022 00:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY6-000433-Ce
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:55 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY4-0006BT-PJ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:54 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4uZvR011846; Mon, 24 Oct 2022 04:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6XgbaW1j3UaX/Qr65o3z7cIMt9V1DanK+ZYU3xctle8=;
 b=rMIykFBKbvQotD2qYXB0RFtqOXt4TUb2qBP3PRKQZj4QSv85qoXJPmlPYHEZVuGK/X9I
 Hh7sXAoQlIbG/Lzw41bzi9kKssYv2up//UmwUF56LyaqCwNMWW7vSQj+sXdKHtMJwdG2
 CefmTWE1Ypbat914gyg+XwU907mKOczTHsv9dpATQyOaRGhSbqxJ7TxTLO7phfdu3qlz
 fBuZSafeCTkHZc6t1eZp4C6zStOlEUXReua+B+2CdY+zlgJM6BeuL0hGj5+nVXZHbtZQ
 RopbtUROQxCeFs2RlSsZZUs7VQdzTdlifLx7ckcT1bIb8aUVhogeEsaC+lM/wE6tlUqS iQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9stjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2tj7Ngi7r8y1xB8+B1WTwR9oKQLtGswEY77OWtgBVL34mB2WMtO0gsZMsp+gBMizZjP6h26fruvC3ih+eHSg5Wzb8JtNPzZQrpDq2xXPdiuecWdqXy4GoJcLMhkU934FIyNqzuz7fsk953nxdjeKbMQDkSmsgcdTA22DwMszY1BO0hd17DThE3yNi0HqYP/nL7oQt2XJH6DobNV1JGEZgX4Q45Dr9INwBZe307eWjsZrtr3HgMvxvlQREx6sQPJ4T5i8+foT3ai9tmfMztxgNQ0sXXPOQmWoEdf+KCT6G2yGiJ94yXll0K46AMskXHvygzjwnYOY5U0JHk/gS5Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XgbaW1j3UaX/Qr65o3z7cIMt9V1DanK+ZYU3xctle8=;
 b=PkLUfnPc5+lpGMISZpG6NgTCbaWp67TE+eAOG0kLn75ZtSFuAb8jnaUkdnlE+IAgolJ6kxx/8oE3w9MGAv/Xjr6u2WD3Zg8NUkN/YMiEjnrXfqLna5v3otRP6Vwmy1nKcWs5WLWX9DT29I/voxbCIAnHSN71w8Gx+Y8o0c4/wOtN00cLu4ohzGnWqbUeOyg6nVaYorPx6R7EvR8jQbDsxrjoGhy/d2s5b3KAo6cLnzhFUcWeDQD31yFERmOPkeCwYBcSZH7vuL6OVGi4+BdZp9XZzub5sHQZNIssH5X5HjOF65JtmavuWkXbRcZFRP92NCz4Y6SVQt2xDydu/ZgD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:40 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:40 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 12/16] hw/9pfs: Translate Windows errno to Linux value
Date: Mon, 24 Oct 2022 12:57:55 +0800
Message-Id: <20221024045759.448014-13-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: e0761660-2c7f-4cde-f273-08dab57c6b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qtDruQI0nPSWsSJu1JT0pKlUUE1jTxmz5nzTYSOwtjRh2ElDv8GkFqJPJyAqe9UOg3jqXEQ+e4wSXf4QUuiObGRRcpCO1i/38Wqs3jKTAoo3acQCgs/o9QNoQmxzQiDYXHafpZZkcw87nb01Pv+mf5YjcktmmLPiCItCDuuJ7lADPeKY6eCF4aSSFjlW84Z9bO3OY9q1w/K0SCzB/oLmmZBpLr42+XVPuULQmauREN+PjXi7RSmV/9ZLWmgrDw/8NWhKZ4HJvS9jHzFuP2OnOSpRPC4PKeHcoTfzpkFRkChY/tvgSsXKMXBSnG1I3M2E/MsnvEtiP7GQRaLnOqNgkwimZev58AcJtaUYI0RT7rJV09DTp1nuBci1m1MdhESogGAEJExrYHmXEz62PNO62qQ1hZmkF+X991TfWMs16y+0+ImgQ1g0e6/HssQ2hr6lTTlQfUPrxhc+fHpKByw3mQm9HY6RuCw6pjFaBCYyBuTUDcl9cXgz3zMd//KzmFhQQQl6r23QDbAmZViKN54xThPZg06hyEDYBanp5ZwNi3fuLfMmBW/vlEfa+NCVysMyZNRY0wGEUdgcCu8h4y8UpW6qF/j6PcjnscTtqjQ84S7QaJ8s7+Ip9d21YvjYDPsW3FAHRErll419kSp54SBYeYo2dFmBh2tN5lqYIeSYT91NZronej6vfKTsyf0Sg22JGqs52d7v7APLAwF3om9EoYKCC/KZUEeFE80MWcdY50Zb35XhELCXL3MRcM2WCuI95uF32DXMDo8wFQlxeN/xxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6FW62tE4MuE9Z8Cid8Q1ErFPS4Y9JKm1WGfLa0iTHIzeB+4jiBz6iTfZR6UZ?=
 =?us-ascii?Q?+OCPHNC2KuFb0YmAcfy8XlSuy6bpvKT2kvtXrQ5PkpvAdun/l1eLhmLS/6mn?=
 =?us-ascii?Q?KgYEIJotSsoeDLpVvOELGUarzqnTAOs93zBDugdT5CtbpUdAbIQqtUM++CFy?=
 =?us-ascii?Q?xT6rYJ2O0s5LUGOkEAWGxVBV0DRH4gEn3RUqBSng2S7gKBkotsucLnjKmwhE?=
 =?us-ascii?Q?0VNp4io/k32vVhvYIiv4qnfxZRSus1kko9UPbNUkYWkeuFrJ2EpZD7Rd8D+N?=
 =?us-ascii?Q?9/r6y68bZEg3AZTUrVFKceVY6z6wp/RS5TzGCKtwbAcYSmC4tpDo3Uoi4nXq?=
 =?us-ascii?Q?oAtXM3Qt6djZJOogb0uUgS0tj0Cu5VTq/IAJZuWIG9NGw0WrR0X4ygu5/BJv?=
 =?us-ascii?Q?Apbqt92txkFr4oLlscVV+bB4H/kQVkK7UAh7vAY0svGywptHVH37feJhZxOI?=
 =?us-ascii?Q?ngG9A4SR1EZvrYfachSq50VpFZ3iL9VtyTGyoWUimBs8wRV8cYcdo68CdDXW?=
 =?us-ascii?Q?Hn5M0WN8aSjFPd6oMjQUYdWZBwkPnswp0gOxoefy9cqSTwwBPAeGIzjmIIOT?=
 =?us-ascii?Q?0cdLS3Immid23N8G3CSvVL2HKvY/4IlbVRspw/TFwtszWKCqkJJy8dVZPB/d?=
 =?us-ascii?Q?oVPct5PlBAO1ZoHeeIe712vnbtGgHCbevqV+eGLz4u34lIntBwYOtAGV0M6S?=
 =?us-ascii?Q?wd6yHQeF6paEJ4W+tGQnokctdS2zUmvHavV+qHEYaRvcarkhvW+UxWPi6idK?=
 =?us-ascii?Q?I8Ng7mcBmNzDXdV33OpZka3yF4pNmSuKiKtPsjZyTv9q+e2QBZ/KcfgI2GMK?=
 =?us-ascii?Q?ErbuA8WHDbJY9VpW+/S3SmJ0WACC5PkudJ0LEPT6vlSAbB/k1TFXKm8uCi5H?=
 =?us-ascii?Q?g2Zn9C1FgHPrG2hBxymP1IdNUbuFm/mqMxaQ53JGYRbCVQnb1m7/a9i70O2v?=
 =?us-ascii?Q?9/BXuGf+ui4a0YSq7dBTd6ZQII2iYc7lmNf3Eip8k7nxqPE4fsuv649dbjhm?=
 =?us-ascii?Q?x1/FtWR7aer4V889IkBB9wq++Q0coDGIyPFXz2BlCZyiishTI7B7DqH6dbm5?=
 =?us-ascii?Q?PO7QJxABol54rES5SATiJos/NsKcsOLHemPrWu7PX6SkoHtyve9dU3qQYQoq?=
 =?us-ascii?Q?nRSoJ+bU7c0Ti6kiA/UmkG3f08sc5xS7pNpN7P5Bi3q+wPu2g1/nrnewwdcd?=
 =?us-ascii?Q?5lZrBo1exI45g3VZfN2kLpLg7RUwOiBI7re/HJ1BhdFiIra2QDNCRu+29kWn?=
 =?us-ascii?Q?mSNUZH0RYlRfHSuHmVYY7wlADkIzKqJHwV5PngW81FQWmEfERRby1I3Cwx1B?=
 =?us-ascii?Q?kYthRL8fB+SJODyvzaBYn+NOf9MS/ZreK5cnPFhT4yvBwNV1U70ZwsVdfBho?=
 =?us-ascii?Q?ABzOMKJbRTlHdRiqk20dT/BoAQV6VuPIVvJijJOyIdNqOC3hplsu2CaNIVZq?=
 =?us-ascii?Q?DWJFzJzHTOMlgB/dadn4MMVdbg8AlBuGEcQkvxZyOOzpzKRPqdTyI83uawWL?=
 =?us-ascii?Q?sEQgqpgpAwtIzUAeeQS6ru6Ue0Jzpl2XATj2DGVYHb7QVFwsMg8WAyCZGpPL?=
 =?us-ascii?Q?o5Zrp6hZHYj6wF3gG80sn4w6MfAO2AJgD3pY9hnfCrUq+C9XcqHhH80mporA?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0761660-2c7f-4cde-f273-08dab57c6b0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:40.4466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtrUauHKvs6e/UCsmSt0lgKiFEbeb31XLmhkV0wGj3jwfKd6W4L3aIFQN2/qbwqMBPuCWulGvvAo33NSux83iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-GUID: Fpkp-sllKNhfRijf7MG0zlLnpxh0oLbZ
X-Proofpoint-ORIG-GUID: Fpkp-sllKNhfRijf7MG0zlLnpxh0oLbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=564 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Some of Windows error numbers have different value from Linux ones.
For example, ENOTEMPTY is defined to 39 in Linux, but is defined to
41 in Windows. So deleting a directory from a Linux guest on top
of QEMU from a Windows host complains:

  # rmdir tmp
  rmdir: 'tmp': Unknown error 41

This commit provides error number translation from Windows to Linux.
It can make Linux guest OS happy with the error number when running
on top of QEMU from a Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 281fdcbf8c..145a3117dc 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -69,9 +69,9 @@ static inline int errno_to_dotl(int err)
 {
 #if defined(CONFIG_LINUX)
     /* nothing to translate (Linux -> Linux) */
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
     /*
-     * translation mandatory for macOS hosts
+     * translation mandatory for different hosts
      *
      * FIXME: Only most important errnos translated here yet, this should be
      * extended to as many errnos being translated as possible in future.
@@ -86,6 +86,7 @@ static inline int errno_to_dotl(int err)
     case ELOOP:
         err = L_ELOOP;
         break;
+#ifdef CONFIG_DARWIN
     case ENOATTR:
         err = L_ENODATA;
         break;
@@ -95,6 +96,21 @@ static inline int errno_to_dotl(int err)
     case EOPNOTSUPP:
         err = L_EOPNOTSUPP;
         break;
+#endif
+#ifdef CONFIG_WIN32
+    case EDEADLK:
+        err = L_EDEADLK;
+        break;
+    case ENOLCK:
+        err = L_ENOLCK;
+        break;
+    case ENOSYS:
+        err = L_ENOSYS;
+        break;
+    case EILSEQ:
+        err = L_EILSEQ;
+        break;
+#endif
     default:
         break;
     }
-- 
2.25.1


