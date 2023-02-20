Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70069C84D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36W-00086S-2P; Mon, 20 Feb 2023 05:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36T-0007zk-6R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:01 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36R-00007k-Ee
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:00 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9CRZs026793; Mon, 20 Feb 2023 02:08:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4eBRErfMpVmQYhZhJHRvDDAEFBlnCDAod94L+/LmaTE=;
 b=F7gkNXn1jqCMna797rv77PKq9n8HW8DZhHExJ7BBIOZ5s8yRNUV1wSK1n9+dpmJh0RM/
 Q3MxuKiC7JuSwlRQGrUBenT04Tz4WeYFNu/WK2ZFxIHC2sg+HKQpTg/0meAMG4tC1tyA
 6cEdxDuyUGLa8JqSborYDX3yqa1EX8zPx90rxrihgIIGLhn2CqRHiVbWQYz/l4i3dKhf
 xrFCfSzJod0bnhcCkrDw2z4/Ng6K1v2ZQFF1mHPlMXLELCK16ZLfFaF7wbxNBUOpFCrd
 F43M8NA4ywgm3y5mf7RlCk38IPQgoXEPJrIdHzNjtauHI375TXWJBQ3H6zTNrfHrn9RW Iw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psabx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZjbxvmDj/YuOYk5Bs31zZ1HWeemmp3M2W8LacqFVoNZhlrkAuiwC0T/o4Jfc1MgX3dQ3GmyartP/0g6C4QHjb7oAl8Spb7cJQvOx2ZYohfucIOq9QL0+Uk9wdE0KiuM28NXkPikr28NFwRY0i+Cc7lI25K44rbutmhqVLn/a9uZnpSzCtCRZG6iYj3foor94PGebYsyIoUqH3K5z0AsSKH/6w6NO335tPvLClOqKQ/rRB/okCyxX+KfAuUU6vbXmwYLOZXZMUOLT5nkNGVv5ZLamWrSVGPzZ947N9/Ila4OlSVWSpKx27MpmSnQFSRRryjjU7VydWPirGaIKZvAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eBRErfMpVmQYhZhJHRvDDAEFBlnCDAod94L+/LmaTE=;
 b=XOr6hHtq8H0L5EQoV97Rn1F237iF0k36hOKd+G/ZqniZzA0bnRA1sGHrPkNNMOdHn9BV/Ia6BuzDzI5RrLpv1+g0ftphORDi58UbTn7weV1MvZp7sGOYrtcpbKeKQRXFTZDX/vD0jqv7g0uf/ZUOmrcF/q35+Hcd3NfB4wt7n2cBTXnu9Absl3idKV5+3BVp/hWxCDAo1H/7kOSVXnfShlH7SfjtCvRyEM8izDIeNhySXcLawTCIi6WzVyvhPC16ZMKACxGbeWL+vC0vIr1dkrsl0S0kFtaBkwEOk9y8nC24Qtt7acSwppCoAuvvizURvXQGXTZG6QCvHWlhoWMZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:45 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:45 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 08/16] hw/9pfs: Add a helper qemu_stat_blksize()
Date: Mon, 20 Feb 2023 18:08:07 +0800
Message-Id: <20230220100815.1624266-9-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d00833-314f-4556-2ce4-08db132a73a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzHGhtgDb04zUjHIVqkX0GJR/j7goHtA8/PGrrIT7+VKsYb9pQXuIn92KMuZNz8ShhRTZCHyqjzUyuWz9W2pVOeTZa5LZhnRw4LugyN1fCDEo5wbKNChsrVKON1pvfBYFpcTufRJFPxXXeUu98rKz3iWh8vLYA+2uW552yP8qxulVsMGIb2ZVF6B0CKKrRLMpo8ht+UJeJTiCHWQBGoE0up6EgP+M2W543swR74nr8rdxhslz+nSVBqRtQOfcvHUNvEpKtzaXJToVptMBqUdkI1w06Jx8SDaDaJWfO37kB0SIE7vibAcm7Xk374FM0ts818cULIpwxH1jr/U4b5F80t9p8LGxKc8LGeKFTiaqdTijpKgUYq97JkpQ0HWjoVOb0h1e94lh1XA5EjcuwN+Di6IAr+BZxMon9vFiSgOtw1/NOXFuCDxtGTfz1w/ysZeA5o2Acq2xPf9F9myimwfWeLi8oE+u5xDKmkhDwecmDAt+nZVnNv5z4oTSI+MpJb/CGuAMxe015+kJk3XAt/x0BFTcN01ym0SQRlU7zGlYlepTr+MDaAYT3MdpIh9sie591haXUVYX65QdeOAA1sRuGjzyKM/FOtOQRG8mlPfjI4Jfnmyq/8Rq5AiYvm/nuuBLFTb0pjoHeudsw+H1ACQPyEEFHl+3jnJ1GrGDMsrZcX+23te2MrwbkOVjMP5gFEMuej3iTuM9fr51iln+WDBag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Mg6J2RtP09+ar/iXdWnyZk3jNS5BxRmxokPFTp/an30bgW+wQtIBVy/fiUp?=
 =?us-ascii?Q?KUhPX3W4mjKAdLZX66JewpT9NN3CMBFNj75hThW7NXXmqyQiO+bHvw93v68d?=
 =?us-ascii?Q?qgw3O7Khlu70l2U26VlcOYZ+q1f1oDiOKNyQvI2O6nzDwryoKQznQBBRi1eG?=
 =?us-ascii?Q?2oEke+IZn+/pbEZLKcNOXcmgOVT3pdLAIhD7yoavBxLZ8E1HBcoElBKtJmZK?=
 =?us-ascii?Q?NQiLceELVjR0UWONH+cBX9WBV4tTi8dJUsaVGKNRoV1tE9jjX/SPsKGDInv0?=
 =?us-ascii?Q?ox82DmkKg4hZWGuBQs5qOMYKnL2MIBq28RUR1j741F+U2PqdRGnlgZQbrH/3?=
 =?us-ascii?Q?9QYgbDYC4S+iyt5ZSljBT9CyyZsG+s7s+ar1iyx8EErZ/nJGKnrWbZD7FrWi?=
 =?us-ascii?Q?lVn/J7GqpRGLz6SKhvtYSr0XXorTmYSX5Lw7/9YlIRPwsnunSoSMsdgug+lj?=
 =?us-ascii?Q?Co5tkKWhpo1lSd2cZP8HpxQkM5SAfhuRBtq2jLxzbiagEQ3UkkAjaOEyLNAH?=
 =?us-ascii?Q?W4uqeYreRxHXUlJwv6Daa3go4dbEaY2qL0sRSn5G6M6hkQ3nPYmFNKNKsATW?=
 =?us-ascii?Q?+bFvl+PLrEVL2kqpDAJfMlhN04Sy6+cLYjZ0xD/5jdGVZJfpcAqHwBee0LlP?=
 =?us-ascii?Q?fQAFhFsB8ACfmCIZzZPja7bR5TS3kFj+nVSNG/d/8ziU7gXTz7a2uHRUrVal?=
 =?us-ascii?Q?GJnQ9llbEQAshdUmgYV3ZbiDeTklduGdvzdlyPxAYgqx/EMdKB+1QBkt0rze?=
 =?us-ascii?Q?RFZ/AT7aWmkKs48nNdXlCf1yzgzwd99XkrnsB4snXXMMFwB/bASlC6Wis047?=
 =?us-ascii?Q?HylUZGaswX6lYIcSut3Gwy3e7zIXLlp3IPtaOoc7nxT636U3X7A8YnAqZZbM?=
 =?us-ascii?Q?mnV/46iRgJV/BFeHqu4NuaArsAgvr6gf89sc0OJubKG9dNS68w66hZYI11PK?=
 =?us-ascii?Q?fJbxAEwSuY2PqukiXNpndWGaMRHG4io0Bc2B0aLCt72InrQLNx8v6zy1+k0e?=
 =?us-ascii?Q?NHQEgOSHtgcMDJd20HiPnmmFPKq6rS3I3fAJM0LLloHrFlX0QOgKw+Cm2g0Q?=
 =?us-ascii?Q?i7tsD6vklJk4cFgtQp+r9ZnNm4vAn0zbsc+stw+oGowpDdxYjlGnj+pkMZKr?=
 =?us-ascii?Q?Icz1RJGJGbH48YQD7v5kwqGuppiYIB3YSqpbbuOdggWpmWmBM0kaqBNPnGbj?=
 =?us-ascii?Q?thY+PuSb8rlDmLSxe34iGGUsIlEcbiQ6A/c2oEe+UibKRHt1ThvvQbg1Xtkv?=
 =?us-ascii?Q?kWARuCBa8Z6A3OfOsrK1R+MsGIuXRRBrovKScw2PlAVT8htgBr1aHsBoLq4w?=
 =?us-ascii?Q?GvMfoph0wjIMK8UOpq3VCD+N+ckTvNBjm/sXNkhbOjaxpHBN+9DDZPVIgdnH?=
 =?us-ascii?Q?/rDFXgCTtH0suRXNVNIBVmblnnpIGYcgPX543Rp5vSzukGUC+uoOYuzT1RmB?=
 =?us-ascii?Q?sycc7iTWTPzb4K30rs+00Mv8fMOO1dPikBsucBGZqFdFeq006nzUETi9dGOH?=
 =?us-ascii?Q?RUQsvd9S341A6zwgJUixjJXv+5xxv215uqPr8id78JSqTW3wSGrQx/cqkSww?=
 =?us-ascii?Q?b8sFVsrEc3yjxZVWKH4AHHv9XRxCmcnOI6yYKYZZ3M+N8sr7oBdlIDgjWR+k?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d00833-314f-4556-2ce4-08db132a73a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:45.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8rhvgUOIMH5/5jzO2el+3hdh/wSCbn3M8Uo7NQ7BOUikn6Vdsfh/J4/zo+kuLrlXL/gJOs8cIJzwHJsX6u84Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: TWavJn1kNRuuLPcEw8S4o1KiQvCg7hmY
X-Proofpoint-GUID: TWavJn1kNRuuLPcEw8S4o1KiQvCg7hmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
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

As Windows host does not have stat->st_blksize field, we use the one
we calculated in init_win32_root_directory().

Add a helper qemu_stat_blksize() and use it to avoid direct access to
stat->st_blksize.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h       | 13 +++++++++++++
 hw/9pfs/9p-util-win32.c |  7 +++++++
 hw/9pfs/9p.c            | 13 ++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 1fb54d0b97..ea8c116059 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -156,6 +156,7 @@ void seekdir_win32(DIR *pDir, long pos);
 long telldir_win32(DIR *pDir);
 off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs);
 uint64_t qemu_stat_rdev_win32(struct FsContext *fs_ctx);
+uint64_t qemu_stat_blksize_win32(struct FsContext *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -285,6 +286,18 @@ static inline uint64_t qemu_stat_rdev(const struct stat *stbuf,
 #endif
 }
 
+static inline uint64_t qemu_stat_blksize(const struct stat *stbuf,
+                                         struct FsContext *fs_ctx)
+{
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
+    return stbuf->st_blksize;
+#elif defined(CONFIG_WIN32)
+    return qemu_stat_blksize_win32(fs_ctx);
+#else
+#error Missing qemu_stat_blksize() implementation for this host system
+#endif
+}
+
 /*
  * As long as mknodat is not available on macOS, this workaround
  * using pthread_fchdir_np is needed. qemu_mknodat is defined in
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index 61bb572261..ce7c5f7847 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -1443,3 +1443,10 @@ uint64_t qemu_stat_rdev_win32(struct FsContext *fs_ctx)
 
     return rdev;
 }
+
+uint64_t qemu_stat_blksize_win32(struct FsContext *fs_ctx)
+{
+    LocalData *data = fs_ctx->private;
+
+    return data ? (uint64_t)data->block_size : 0;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index ead727a12b..8858d7574c 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1333,12 +1333,14 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 
 static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
 {
-    return blksize_to_iounit(pdu, stbuf->st_blksize);
+    return blksize_to_iounit(pdu, qemu_stat_blksize(stbuf, &pdu->s->ctx));
 }
 
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
                                 V9fsStatDotl *v9lstat)
 {
+    dev_t rdev = qemu_stat_rdev(stbuf, &pdu->s->ctx);
+
     memset(v9lstat, 0, sizeof(*v9lstat));
 
     v9lstat->st_mode = stbuf->st_mode;
@@ -1348,7 +1350,16 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_rdev = host_dev_to_dotl_dev(rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
     v9lstat->st_blocks = stbuf->st_blocks;
+#elif defined(CONFIG_WIN32)
+    if (v9lstat->st_blksize == 0) {
+        v9lstat->st_blocks = 0;
+    } else {
+        v9lstat->st_blocks = ROUND_UP(v9lstat->st_size / v9lstat->st_blksize,
+                                      v9lstat->st_blksize);
+    }
+#endif
     v9lstat->st_atime_sec = stbuf->st_atime;
     v9lstat->st_mtime_sec = stbuf->st_mtime;
     v9lstat->st_ctime_sec = stbuf->st_ctime;
-- 
2.25.1


