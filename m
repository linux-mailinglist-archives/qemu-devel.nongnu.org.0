Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABE650A08
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:23:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHS-0003Ld-5l; Mon, 19 Dec 2022 05:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGu-0003Bq-4o
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:25 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGs-0007Tp-Aw
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:23 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJAHZas012947; Mon, 19 Dec 2022 02:21:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=/XbfOYap+3mEAI2SyyOjxeojVnvdsqoHhEGjnq+BoGE=;
 b=l8aVBWkFkYzGDsdXImJS5tm3vab6NipfiEeLO3dvSAOLGHqi3wogcC1hLyaS7kgKTNit
 QtMthVCs9qG+rOPj4fYm8WnfdHkiKqrC+lEhNhOd4kVvBnJ+exLBT7zhp3KN8kp4f5cR
 H93iJ7XURThsTk985PT8W02N0eB5BApoU9n0K7lyR1GpcXKKBlDKKBWM2mNKdlxKbqxc
 kpgfJ+XSpB7hUhNN4jffUKwpJnG5HoFPQO5XGZQHFBaeOoTt2IAqlNrMk13u3vfzx/wK
 LhJKAG+LiKXTLa4yqrPoJJOvrdMt7L5xprmLFAViKkhuUjeCZ/sAROZKr4AequKpjr/m vg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh9x8s77w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 02:21:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak8p3wn9eydoC1gw483sEFS1K0+QAx9Rx3efKEN1cih2kFIIR/48YRpEzNPoTr8wFmF1QSJ0u3faoJV41ucnWujL2Fc9/BlZ+CcErDtUtZ+XWVl42H2Gbxg2kslXTmxuVvT1V6FMiyCwWqhKx/U+40jngj4Scf+V25k3WhUDMsJHa6K2YzhT9B8JqeJ9DJpztSwoW2wgACMuP9WSkuqHlZIQ8mh8SolJjxHPRjR5BHHtOpEMwS24tk6hhzOxBV7jWFASQsHlxFg4GksbKGXZKXzAvGfCyPLuCYhCqD3Lnfiu2377SBdm/g/KmaT4asJXIDZ4FxUjkU1jkMzA/VvvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XbfOYap+3mEAI2SyyOjxeojVnvdsqoHhEGjnq+BoGE=;
 b=nj2NRn+Yp7UWcr7pyop7SC/r48kXPgUjSMs7vjqujaRE+07rIQ44pL65W5jhYfPpWmP4X8Ws4VpPadNGJ6CBt8WPJcqd5bGru+QD5ZKlQVdUk3x/0zQP6qFHqMK8UgYYwU0O+oIc/WJGtybSvbVj92YJhoMJD7BMdHSsfcnQiGUuEKtZwTuDeOgjFBU3FfRwrZAj4TqmONnIL3qcAI4XqeuzUhjikyAuosXMM1+pNi8U5NMDFGIz1qcplZxl/5xBiljv/l+8Cfrg6ZviB0MIkJ19CidcqHnlFtAI2uc6xTalIdRKmKv760+msU6LnzWeHI8nAQRtoHWWfT7/Vj5JhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:07 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:07 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 11/17] hw/9pfs: Update v9fs_set_fd_limit() for Windows
Date: Mon, 19 Dec 2022 18:20:15 +0800
Message-Id: <20221219102022.2167736-12-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b10aff1-ad51-4b88-c4bd-08dae1aabdd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqDMttLxZHRtMA1xxZKbiODVwiA3MkHfMib9L8lZTCnU5iiWgYmQFWg8C6XprE2xUwlFdM+wwg1vAgYbqrfe7lmJjGetYla/7BAaBOsSfF+RJmJVaM3UjPbOtL+pmoD1c4vLBBnJlwloG6puD++W03v2Wu3W2DQVR/w6M3VZ2tq9RCRTqwraypaA1B93ZlpLzAVFDc03zdICi2he8a26JALknIFuHPTS0BQfQSzKABVaMxW/eutLNJNOyxTehQR+Sbq+D8kql5CdcbsRYZF93UqWNXDXtfsIioicQYUx4wLqC8ASWp3rUcsQ7Ybxlxd9oSnCaMkJmKe8RQ22DFRA4OVgOPPQMGULeT0RC9C0HaI4+6eaVLePQxPI2QRKrBBHAC5ap+l4mIKvPnoaF1OysgTHTM+gl683+V8/y9DiaBsMMQafUiHK1uTrk8/+7mEYt2h2lESN1Jvwt3lc+AOecsomgJWl4XTlU5ainePxUlqq9Hn6T9K9w3VfCUEwxMvosiO+WspLHLujoWYrpNVu6DPwsmJxHGEJEg5wXn2ba0BiY7qnN46bDS7BhTpQzIJKAdFBEnshWId73nDyFCgYf0gKF6j4InTZdXpXDnsy/MMFU/W4NlJ4LaQ/YFMXh/njHv2NCOzsf0+vGHVErCXDutCe7ZdshcI7b4Cw7NuwO0iH4mQdPK6CRf2wYDMZOoZz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YwGV/ZOdpaECcd85iNjdmvI6PDYfVRwT1WXVcUBwCrQxDDxa2wxw0RLpAtQ?=
 =?us-ascii?Q?B4sWUUvtnEOcIjzNosvNq8aUxZg2CAjIQNaZzfPVoez3Jy/g+TztR83oOhST?=
 =?us-ascii?Q?5CAnLgzColpssiNzjmR1KU8FOmnIm1SaEMPyaK+a4q8FVcNPMdXRWvToKstH?=
 =?us-ascii?Q?QsTCkDLEDNC9+7PXQm9/b2FrHI1XX0WOvPkmeURrCUSAAj4Yl8+hgImj2jfF?=
 =?us-ascii?Q?SACN2kwIulry7sdYt0T3GP7E6nsq2YYUfg9UYGsSGHh7L4sZwwD619cCy0Si?=
 =?us-ascii?Q?EuZCfz9Yj7p88szx7hvlOl7ghx4rrAkVJT7eM3Cr5D57FGqsDC4u9HWRCgVK?=
 =?us-ascii?Q?J7v690/yNGGOCItkx9sM2PMba0yQN8wymTmt07X4TEhtC2RB3baWNlUkhmz+?=
 =?us-ascii?Q?U/b7o/K5t22SKs5Esm+613UElNw2FPPPP0R07D/MLHTMbH+sSDwdXYJEUoUL?=
 =?us-ascii?Q?2VMB6FcXvLv7u2La99ELoc/K5B0HmPfHGqEXL6I62QUpM3/r3B6/OfDHjp70?=
 =?us-ascii?Q?zWHgTm/pBgrUEpJAwh4V7ON5SsGjFSZ6IjP9ACFD51sfKQoOEnLjt9QskZer?=
 =?us-ascii?Q?CetMEmn4C4AtgdNjMjZA5LcEwxRZHtQuUe43C2mfu3mxs+R7QIMh1kL4jgz/?=
 =?us-ascii?Q?1R1lg68ZSRSPAlp9MdEaxl5txCC0RwDykJy8u+9F6lDE7iiyZIO9EwxK8W4b?=
 =?us-ascii?Q?WRb/amQhVt67R02jwkXpjZjGfdI1UsFTy68h0/TJkxT7UMQeMungjvduibwg?=
 =?us-ascii?Q?0XLwMAzwG3nNpvqmuIDCGV4U3cI8nzrz27QsybQ0Y1JaSf7uSdtC14zayli9?=
 =?us-ascii?Q?op/BVrPaE7uQS8iwVntfuiKCMrrYKi8HplqplOhLGO5ctiMa2zQiss0PbWcW?=
 =?us-ascii?Q?Is5b0ieZnGTLnyvYZGo0z/zHaM8qQ+VwNdTP0ySpKVcihLTplshezN33OLHd?=
 =?us-ascii?Q?IrG7b9meXKdP4FWcuzhifMyAUVn5iNdYwI+Py+JEHeZcj7bi5otGeU8GegwP?=
 =?us-ascii?Q?qkWveHIPmpurwD31irDALqloxynaqHYXb5cC/rrEXt/++aWnyAlSxiDI3xet?=
 =?us-ascii?Q?ufECTpbOcqRbHS4C0JT9dtrzaCK0TdkH/NS3730bwXYSi/c9isAOlY49PXv7?=
 =?us-ascii?Q?H0DH5ebN233QeLZ89MqVkrfU730Z/NCsZwOxIRLikLCtmRW817tR3XS6Sldj?=
 =?us-ascii?Q?5/RF2Qc/aO3nVEB6PDQ4/kIEzg2oS99ipF1M/4+1Y6hUIuFzTMFqc4IqkJ/V?=
 =?us-ascii?Q?Ui0+wHNmfxHWaKrJGwHaO3IXnF2544P/zERB8fM1ktd7LwI/eJmieABiVgIF?=
 =?us-ascii?Q?HXpLRgzTcnZfTBwwEr3wUO7Su0gkkfJFQe+83NV7oF5mq3U2nw502hWKTjkX?=
 =?us-ascii?Q?hYss/34IGcE65lSsJfeubP0+567gBI9hG7XSUdcTM6n5OHmmLQnpFAf42h+w?=
 =?us-ascii?Q?JDn2Tha61I7+q5aHHRz8NWMrlRVIDgtAJ5rj4QY/XLHGNkHj5tQWqIAllYrx?=
 =?us-ascii?Q?qht8CAUoAP0G6XFLOUJjc/JmmqCZd0qCn+e9P+ngMoTEC5caQwRKJzLWYKys?=
 =?us-ascii?Q?hzZfZD69hq1gFhwAUhNLNJdpeM6ywj1fr6xVyXPY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b10aff1-ad51-4b88-c4bd-08dae1aabdd3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:07.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0s/eMIZ4cZk6F2rdZpxtgVWV+3n/AV0rAq8e74ddCP+IQ1y4QMHyh96UCEEz8C3gWRLc4WXtzhZuxJt3g9fPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: K2bpMfCtPOlJNrzzJju2sm-Xzxwxg59W
X-Proofpoint-ORIG-GUID: K2bpMfCtPOlJNrzzJju2sm-Xzxwxg59W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Use _getmaxstdio() to set the fd limit on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2497a06f43..b55d0bc400 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4396,11 +4396,28 @@ void v9fs_reset(V9fsState *s)
 
 static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
 {
+    int rlim_cur;
+    int ret;
+
+#ifndef CONFIG_WIN32
     struct rlimit rlim;
-    if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
+    ret = getrlimit(RLIMIT_NOFILE, &rlim);
+    rlim_cur = rlim.rlim_cur;
+#else
+    /*
+     * On Windows host, _getmaxstdio() actually returns the number of max
+     * open files at the stdio level. It *may* be smaller than the number
+     * of open files by open() or CreateFile().
+     */
+    ret = _getmaxstdio();
+    rlim_cur = ret;
+#endif
+
+    if (ret < 0) {
         error_report("Failed to get the resource limit");
         exit(1);
     }
-    open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
-    open_fd_rc = rlim.rlim_cur / 2;
+
+    open_fd_hw = rlim_cur - MIN(400, rlim_cur / 3);
+    open_fd_rc = rlim_cur / 2;
 }
-- 
2.25.1


