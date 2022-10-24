Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0A6099DC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:32:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYE-0004Hu-9J; Mon, 24 Oct 2022 00:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXv-0003tC-PL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:45 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXt-00068u-R9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:43 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wTX9017633; Mon, 24 Oct 2022 04:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=VUDe3U1eqSLzc8yDGCxSdlQo2llDVsZM9his1/vi9PM=;
 b=jCil0BNNFw20t14s9vwcxD13kk6+DbF3qEv+U9TEZcL8iDsekALLMZDB+ThOj8E0xUjj
 pVREvXrhqyKFpBPDB45wAklCcVIL9E2jJf1yfQ6mCEbAS0KSYdvbmQT5s6p7x2qWRGyo
 Hy/Idg3SfzvV62gxuUHEBdQcy002ZfexYPTbBEQHrWVQTjp1Y9AtOQamholBG+RzMcxj
 1fUmSS8dly1T3oIRnt7o/F6o7VduFCWvq8h/2s6ohn/wERNuBmb6WtoCzc/5EkQ0aBSV
 Ol9WsDNGwy3Asfd5N9bldNay9SlQR4UaESu6fUQvRZa1xCPzYOgQt7mdMZGaqZlzdCE9 bA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc5r2svrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBUzder0SZgv0ZEt+vj/epDAseviVjH2HwZCsrDvteuOeAcVdtbZ4DhNfFybhvyhGhaLKHKFxoWo7GFE7SLnbE73YBrca6mbCkcNwk94g4DXBWT9NCV4rNVqvk957ZxixY5jA4HQXWPWQWyjIeimpm7bATXBE8sicRRHxuWDd3aD7xStU5f2Niigr2wplm2TTeVe3u2GutdmuErkKKGTXF5Qy2WqBBA/TcFmfIg8U3I34tJnGkwt93o8T1gIWVeXbN4zzvPkDusreP5a0v+nIklHrLauGJR4LsXWha772oJPiXEtv84WvIYuOSrGOWfIzFUuJGYu8bfAAjX2WwhJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUDe3U1eqSLzc8yDGCxSdlQo2llDVsZM9his1/vi9PM=;
 b=PXcYf8hd5xZnBXnP9haTKH9793MCTDugZw1fszFSP5uBDctMPooMCY/2AVKEDT7AQ+rMerhA+BDrzwIWBPaZV6P1O3i2e7/+VW4dhnjuTXQCo6eKirAxSVgjs5AwsB7xWFWdkMLYh070gDu0ohN2KlSGrOp7Egxf3VzBxD9IvPmyoTw1ai6slJi/G7JqFmwSCeRqQtot8llwtqbVRPSSqeOarENzz78xTP6wFRO1DNULjHYUH49WK7GobjnMqvxhdKTg0+1U81Yz6En5Rk0JBRbupFNJU3JEe/NB/5tf521lS7NMSf+GMSp9cuJeCVIed27z+grfw6ejvP6AQaT4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:28 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:28 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 06/16] hw/9pfs: Add missing definitions for Windows
Date: Mon, 24 Oct 2022 12:57:49 +0800
Message-Id: <20221024045759.448014-7-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e80b15f3-5241-4d0d-30a8-08dab57c63a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJF3eWOWW4ZknASoHW/J7xnawrAOWfz/A/oebnCau2QHMejf6UNSO5NEFtOK6viSCtC4yzc0W/SJeNivr/c1FsR3mawjX/cFEmxxQ7YUy6n0N3yCizDYgmambx9xaQ6uxdRXk6f6ZQVBk3XySlIcfBbN/1ssXX2kWiu+AWYBbUB1+SRq0IL0hbOGDp7Nu5gx2YFze098L39jbPDUCiR7/bbb9tvUflDE+4ycusHIUDJJEdEMyjwKthLthL8iX0dw0cIV2sMDO7QMLT+NedyjERC2c109rcTeSyv/D1PyuK6v0kS5yrMo+JoVOoclQUmpYaXefhivkmr5mXNFFxLEI2B7ijwSPPPkQsiUzlt+iFN+uBLs0a4KXKmVrw0gRR8qbCPEWv0ypwPtTxPpvIbuIo3eryO93SZ9sKI5pHrNWYzivfyKVgScPn5/cSHpcHRsOsfZ5nAIFtJQWR0hdr3LpPDtQtau79IUyWxrb1OoqEqcD5zTPMWOhW2gbL+fU7TPzhte/kn8+UCPXJPZ0IKLs6Pz9p8PxTj0d+r5zuZh7XEPj4Vqs/Vxn52C3IEmwyAjSEk4FwJbeMFfuApXiEmZOhTTmQW366uTguntFg6dOVmZvWD7JRmm3lTNI3nUHoQfeWkKELOl4aGpStnKedmcMxVKwo1J1K24qPDWSt9p+Ehy9wx0kouZFMtsN/izjfPzYgrB3t93Mv8UQ7XmqTj6Ka5xlozXMGc9g1o/IdQ9uAV9xx/1qfIPD3dDbdTp2PUzJ5s8R0AOcMxF+soW+xHH2/0V7CtYlc9MJCnkcbP6qaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(966005)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnVO5QrGsXJpfUz41Ylq47zqqcWSBGefb1ChJvknyQhqsJ/Hz7QlR0OcVVZg?=
 =?us-ascii?Q?AdI0xPgwA7hjquLSGS5/Ssk3UOsZzAsopJObvEhQsyTXFlUzbVufAtMjXQkj?=
 =?us-ascii?Q?6p2UkcFKNlKcs7HY73Yi8u+49eGf9W7ItWAKf8fD54r83GM6M37vWijppFqu?=
 =?us-ascii?Q?2thUJO4zjUaVktDQcMxkGMrQbfPGQQeVHclYVt0HfW2zcOHKZYyUHS/bZNVB?=
 =?us-ascii?Q?xX4dL2lNSXtU2p7SgHlbskCybW0mD16EuAakG5Qvrg89exHRmPIuzZXoo8kn?=
 =?us-ascii?Q?h2iLV8oCafvtlnMA9vxAEBTcGjuxqMMZDwGlh1rJxv/botukVDDnvODHW6Ul?=
 =?us-ascii?Q?CS4s2EM3gpeVt212PHOj/PZ3PsX2biuMPAfDk9N5jNvjP+AvrNid73J7sVHg?=
 =?us-ascii?Q?98YQw3DPnazOPGmdJHWFbFJK5xIkiuNo+ZYrDKJN+j3P+E9yoA1HQ156cPNn?=
 =?us-ascii?Q?R0dvWp/1bpyyvdD60PP8LyV+S3JO1Mt59H8tjfnRg1tGnnMN7tcncacXNVav?=
 =?us-ascii?Q?heU56nA1BHAcLipDyVe5yFnW7W87ilyywsRyFalDBwHcULeHWq0vQjvvEoX3?=
 =?us-ascii?Q?Z7dBGKaPAZcJnV89Bx8NggY6Gt1DVFdXM+BA9TBDl7cBBgMOvJYokJvm8Grj?=
 =?us-ascii?Q?SL8jDD86PH2kq9ok6/FNHVq+Whtpy4woG8FfI4wFLvwbNTgIyAEGB891ML8F?=
 =?us-ascii?Q?EFbiczvf89j0VLkNjqCM18lK6sY8xjY+jZye977Z0QsYDZoECyczS1AyQj6+?=
 =?us-ascii?Q?t9mNNJZgRdZ+aD8PIbJlm6QD6Y6g2uCYuv8/1x92H4vf84YaOQcJ3ygRpTqX?=
 =?us-ascii?Q?i3GQH+6bZaBogvdehGWbPEIfgY2fOib8kl4MXGLDeGg9ZZO7nTT0/HQY3e4u?=
 =?us-ascii?Q?HLOAsRGmNnPN0LTc54r4yi/wXEQyDHlbX2/F+yt7xe1898A00vSl+i8Tgity?=
 =?us-ascii?Q?/ozbDyYTFdBqxiG/bO6A/MM3EKqQf9fxFQ3gUqnPM0tF3VqZIo85Wc6FP0oF?=
 =?us-ascii?Q?TofpuUjCUmO46jT5m4sKwOGU1dtDAhCDnU9j9bDOJX90qNYFM1yhhHqJmiYW?=
 =?us-ascii?Q?DlFQMJx0Hw4km62hswbPMieeweFNzQKiEDAEWdKr7JkJI3EmR7e/5WKnVUCM?=
 =?us-ascii?Q?R/CtChHD7UfMzdrrzfQ86kkWGnkOy2li41H2LctbeOu8rP9M6Tvni26xe1jn?=
 =?us-ascii?Q?oF3ou6ogOvG12QOhEdtgtNjiYxKDruNCI2RXYiH/hF0jsYeovu+YmRnBcslu?=
 =?us-ascii?Q?w77zqqFWbNOm97uJtQ4645epqxSePpWqTmWUz0ixs7UAIWkw2KZVoduYzUCW?=
 =?us-ascii?Q?en1oEHunxAhM7jkUBL6dZKkk8jKlrLHZRokuHSpwHrnWb1tLln7WBnPAJvGt?=
 =?us-ascii?Q?J9eKow8LQPab9Me2AjKRDajCrXRkeT476VPN5MoSHCdW8h3HGh05QMCa7F5I?=
 =?us-ascii?Q?Kq+8elbwT028suzb+tsDdK6PxCHfwJglIbmOnRMjxplhesYf7jquk04M2pfG?=
 =?us-ascii?Q?mEs6hhgJsPMoKF9JbBMeZ8UTFKTotUOZI72eKPGxKiZJGeVH2Rz2BDWPKFiJ?=
 =?us-ascii?Q?VtVJgttIIRyGEhHzfOxyhpVCxviE7HVY0wiNzT0vF+4XAKn6AROLR2uyNnbg?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80b15f3-5241-4d0d-30a8-08dab57c63a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:27.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqZgNQkgWzMrAZRVNRwYwSP1NpJhaUb0rhGMipaZ/3jQ1lwv1XSuryhh+QEsTP76lhiRR7wndemIo+JqZmweCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: sEA-AloqPglvPUw3K7M5LJhx7wE_93sZ
X-Proofpoint-GUID: sEA-AloqPglvPUw3K7M5LJhx7wE_93sZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=608 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240031
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

Some definitions currently used by the 9pfs codes are only available
on POSIX platforms. Let's add our own ones in preparation to adding
9pfs support for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
 hw/9pfs/9p.h       | 11 +++++++++++
 2 files changed, 44 insertions(+)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 4997677460..7d9a736b66 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -27,6 +27,39 @@
 # include <sys/mount.h>
 #endif
 
+#ifdef CONFIG_WIN32
+
+/* POSIX structure not defined in Windows */
+
+typedef uint32_t uid_t;
+typedef uint32_t gid_t;
+
+/* from http://man7.org/linux/man-pages/man2/statfs.2.html */
+typedef uint32_t __fsword_t;
+typedef uint32_t fsblkcnt_t;
+typedef uint32_t fsfilcnt_t;
+
+/* from linux/include/uapi/asm-generic/posix_types.h */
+typedef struct {
+    long __val[2];
+} fsid_t;
+
+struct statfs {
+    __fsword_t f_type;
+    __fsword_t f_bsize;
+    fsblkcnt_t f_blocks;
+    fsblkcnt_t f_bfree;
+    fsblkcnt_t f_bavail;
+    fsfilcnt_t f_files;
+    fsfilcnt_t f_ffree;
+    fsid_t f_fsid;
+    __fsword_t f_namelen;
+    __fsword_t f_frsize;
+    __fsword_t f_flags;
+};
+
+#endif /* CONFIG_WIN32 */
+
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
 
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..670f5dc4fb 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -3,13 +3,24 @@
 
 #include <dirent.h>
 #include <utime.h>
+#ifndef CONFIG_WIN32
 #include <sys/resource.h>
+#endif
 #include "fsdev/file-op-9p.h"
 #include "fsdev/9p-iov-marshal.h"
 #include "qemu/thread.h"
 #include "qemu/coroutine.h"
 #include "qemu/qht.h"
 
+#ifdef CONFIG_WIN32
+#define NAME_MAX            MAX_PATH
+
+/* macros required for build, values do not matter */
+#define AT_SYMLINK_NOFOLLOW 0x100   /* Do not follow symbolic links */
+#define AT_REMOVEDIR        0x200   /* Remove directory instead of file */
+#define O_DIRECTORY         02000000
+#endif
+
 enum {
     P9_TLERROR = 6,
     P9_RLERROR,
-- 
2.25.1


