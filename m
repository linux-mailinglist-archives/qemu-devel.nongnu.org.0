Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9162527D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:26:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZc-0000Xs-QC; Thu, 10 Nov 2022 23:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZa-0000WU-Gc
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:22 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZX-0001ZT-2n
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:22 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iP024928; Fri, 11 Nov 2022 04:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=g4+5Nk34AbaSJWhXTaDd8OGNDH5bMbDEK3ah/RPsGKg=;
 b=KQu2ZhfrxRDhOsrVcgZpazIUPFRdp//AH4BIbaTDJlJdL3Maui941LqvQTJk8yR63GLG
 bYQtpscoGv5MAJxT2Qssa8n870T7TPhNFqrVWHhKXMPtYn4w4m9VqJyXO12ikdfzqfgs
 iRP8DCX199ZlAsFQ8S+xdaA3EAo8EajFQwIlvHiqV2PTC4+AfhhTBIVRtyy1Brw0wr3p
 Q21VQiidigx0veZZ4PkSzQJ+CQmogK+akPRovZZ9GyPDPsWmhdeKTnWJoJIOhzUaDHje
 ubEWrR/TelXeui5yZyZAbqDq81uS3DPKxdmLOOUFGBVgx+BV2x1nuST/JKZ2v/Y8oK56 0w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxMeMmP6Qav9gC/eaNb06UV9VvjUrI5CAd8U0k9ybH1s77Gek6Vs1vyWRknsjZXHrzW7vjAyZtT4E27QIq7K9o3PrWZLOeN8M2X/pBwPEP9Tnpek3oACCRgTKoNbX2K8uEso4ElWMWDzjDyyrMbE67Ib4fziMEaNnWSgVzwKk8R6+/ByWWkediDp3siP5eNWFr3Kf9wmz3WyrHlgCCrojcIQ6a+zG2MnpaojNkrnQZSuZg9qtd+RAQrm4qnPxlM180RVFKtWPijLejcV9E8M0vZ3dnFWMgRpUrwbP5w7d9ntOaKLJq//rO5kHW+TZxtC7YqQOpARx+kj8cH/sPEkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4+5Nk34AbaSJWhXTaDd8OGNDH5bMbDEK3ah/RPsGKg=;
 b=g6etALYu/GfiJD90eUeNAqU8kBUetVa31SRLYXnIrTh6f6Ip9Kbju3MSvH1CVlW38JYkMa1jR+YNcomrh4+PMh5qxoQoZcbQZ2U4Tu1hFCLrp6Z3kPw0elDVkCOcII56K7aEcoiQUK55vDQWGb/gRtGN2BIFg79DYrKyT3rHgmhyeDmZdG2NGorhT/PDgqgEeAO2QYz99OMUafYayVIeawjMh5bF55hhlfowjTwJMkcGK8XnZ27zMbpoKBcEO6EZvS2PbA46WbFdMhI9ACu8kYuzekVIY4/Om0C53OCCJcIIN57DtYZVG9IgF9UXP5WeotLIZhFSn741lMspqs1iZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:01 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:01 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 07/19] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Fri, 11 Nov 2022 12:22:13 +0800
Message-Id: <20221111042225.1115931-8-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f85fc1-90f9-4681-b30f-08dac39c6b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5x7h3wdCerShEvUu80pr1rtRuvpqsh0LUWtqrj8rXrdJzuqkoMuzTtndBWXxa3i4A3+8VJaBqq7GhwcXf6zbmS4X3wHacn1KFjeOU1/A3aO1ULO9YXazmXcukw6iOrKCRCZ9SumDNpg1zPP9XZ7lm6T9+Vmg8FiJpPua6nw0UYFwZdF4Ep/px787HyXP+CmbQg5EjkclK4WLByFOqJVvmu+Z4pcJlvhxTfZnMOxrk5ik5Luhzwcw3RM64nk+qrdM0xV2l8ih0S1dQQ2QpEeqmEt1Art7XmoXuCRXB6rKf8UzvbCrO3SPv1DUVemfA0xX5bSg7YKpuWpsvS0EZX/v7csafF2X98+w/8DUsvc/hdzC1Pcfpd3YGVougTh3uo2vrPmENu0YtWNCQQshjeZjozpQIC+ZBAB6sh8xKyyABGuizwpQ5VRxI7Cm9PAThhbEK+FyvaJZsMMQ4mQpeaOwFetnSu/JWXkbfq9tpFh1sOjPfD/Y9tsBqrcdFJlc6n5Y07NqJFpBRMIbwmpNWur6fN42dNqiFzspIQ6cjyfp+Hxy2RVHHxOVh8OX/FEjPEiYYDNlF2U2KuIIPSBxzNm83owzMCY45a32Xr9ElJiPG90itciktlDw3Bs6Dllwm29bqIs4sZfdqBsc0uTEqmz3Ocdr+W4miJjtRMKqOtrIdEaWWRgiy9gg43zIgu9j5LKP5LwPEmG9kKEw6W4WF6QZTSUFfBj8Iq8xXuM4cmExCXw366gXkKbBNetp5bSIuU2EVWouZfRihRQaE14D8LgpPIrJ7k3Z+tyMqpaUIu2De5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(30864003)(41300700001)(6916009)(2906002)(54906003)(5660300002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nn0jAHhJJYVj59WYRnfYuLqVtNOAEeLSg/bfbc5S6VoGmu9KPhCLkFGV2f9U?=
 =?us-ascii?Q?mkGW2iYDo4TBnNVn7DWafNL1xVGSrb4j3TN9VpTsgt65tmb6uenyrj+CMINX?=
 =?us-ascii?Q?cXE7gvMBHAIygbDYzlRX3JF9/714y2uy/QotMQUn71+PtsW9Ab28Efdwc6hX?=
 =?us-ascii?Q?gVN7ObgSH7bSALcM+zNMbiEyzZxwJQpQG8aW7UnhV7aNTrqpoal99HzuVKIG?=
 =?us-ascii?Q?wa2w6NYWn7GjB4tlGuPv/hgAoVTewoNbYJ3Uqi2YDrEP6WttFFEihKDY2tkg?=
 =?us-ascii?Q?si8rXal3gZDfCPb1XBy7mXEdAF4xuoCvDGMbtu9/D4uOH0dVn7/2u67POUCj?=
 =?us-ascii?Q?/eQzaC9nPp9mvdm4PngQArWF36eFKEi4jebGYM2SZvjz9Cz5xOKr2U0qSFgO?=
 =?us-ascii?Q?e5wtBq0yfXkoLavFh0V78RLVm5Ru9ND9m6iU003lyxLC7XPVDch8M4dxpPhb?=
 =?us-ascii?Q?ht/hLKwsG4E++/Db0+dbBr7dSU+eVfBiFepGH1Wab+GaUmm3exBQzDFtpaGF?=
 =?us-ascii?Q?a/dQUae7n3GhjkXw2V3rcKsidtpcFYhz4oG+Kgn0WeKWvH1OIT2lBLSri5Nk?=
 =?us-ascii?Q?QCo4fPgysokPkAySXUleUvkWslJ0qeN+3iwKWLjjtUMS4anTPhehbJ0Ylrfv?=
 =?us-ascii?Q?lUnu5EKcITJFQwgDcSX4Wnvi3GAeDsZby+cBtTcgdH03Lt436rAN4adRW5mh?=
 =?us-ascii?Q?oxvZ348aof5q612N9d/pxBjJX0ahusLWN9fIEP5LFIHxalD1QhwP9U3Hm+85?=
 =?us-ascii?Q?oR41SMOxiqmUcsRObLf1GVbgwAIQ3w96DQJt1y7WITOERSz+yAof0eqKzRgC?=
 =?us-ascii?Q?etYqel9az/Y7osuNyXmw26NV/M0oQjR5WrZQq44X8SKa1dwLO94Vy01kLish?=
 =?us-ascii?Q?hbhKQKKlhlP9nCiSYHisNNECRdWq0uZnCT4bu8vjIcp6wCJxq8HrfxgG2D76?=
 =?us-ascii?Q?2nlIbRHb1rmFlfrJbama4TtViLNgfdkotU+8OGBYtrWWQuFKNw96kBLQv/2o?=
 =?us-ascii?Q?OrJJZ7oBmobz/yz8b6gNNGe+DbiiYxVbhPpxrRpF5ludx6x5iaUQzhowzcmX?=
 =?us-ascii?Q?adb29CGM9LdfGDqT5bLt8mi80HGKsscc7EYWoM0p8aVRdZrHW1p8G1ZqLutr?=
 =?us-ascii?Q?G6QEP6dbLcYAMhhkWd5NBzzuFcL+UZmUP08D56qNqi/FvIdMojiP+ZDxUkl4?=
 =?us-ascii?Q?nXNX95/X7ngwX+ZjgxPBcuKX4YCkiTH7qQLK9YeRll/rQSQ7YA1OflprViEJ?=
 =?us-ascii?Q?a02Z6JG87F8wnuBCcnoVp1Ks04TIi4ELEFR72l4PT7zeBnLFff1nU5v5pejh?=
 =?us-ascii?Q?rp7tnmM3Wc7HNPGQst5x/N2q4frtL2aSWtLO/BECj+USBbqkyeRLoO5qJuE1?=
 =?us-ascii?Q?2adh6lOiZTDkJhxBmOYirvYtonW2S2mCtXXQE4nJsb3p/WGCT8cQWY8FHpZr?=
 =?us-ascii?Q?fJQmHQmgQr4oeDEtqhxsnuTx51hLlyRfWhGKaltyUlvKALkL1uoSpLTwsLP4?=
 =?us-ascii?Q?Mcl0crgcWdqP91AcsPSkYtFFygFcURnFky2mYniDl+D/FYhr1OYMsz23AM4j?=
 =?us-ascii?Q?bnEGlCmRVf7YaMlK9kP04LnvM0T62RTMWwWxHueH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f85fc1-90f9-4681-b30f-08dac39c6b39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:01.0585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ECBGhClZSMkhJbKbbwMPF4U3dt9pxd5YbknUuvrFovxoswUJMIicCdgGcF2iKiLMPhPsp2j/vgLFa2Ua3SZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: e_QCzm5h0h2ylJCjFj54oshcvnkrXuOM
X-Proofpoint-ORIG-GUID: e_QCzm5h0h2ylJCjFj54oshcvnkrXuOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Windows POSIX API and MinGW library do not provide the NO_FOLLOW
flag, and do not allow opening a directory by POSIX open(). This
causes all xxx_at() functions cannot work directly. However, we
can provide Windows handle based functions to emulate xxx_at()
functions (e.g.: openat_win32, utimensat_win32, etc.).

NTFS ADS (Alternate Data Streams) is used to emulate 9pfs extended
attributes on Windows. Symbolic link is only supported when security
model is "mapped-xattr" or "mapped-file".

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Support symbolic link when security model is "mapped-xattr" or "mapped-file"

 hw/9pfs/9p-local.h      |   7 +
 hw/9pfs/9p-util.h       |  38 +-
 hw/9pfs/9p-local.c      |   4 -
 hw/9pfs/9p-util-win32.c | 934 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 978 insertions(+), 5 deletions(-)
 create mode 100644 hw/9pfs/9p-util-win32.c

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index 66a21316a0..eb4f39ddc2 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -13,6 +13,13 @@
 #ifndef QEMU_9P_LOCAL_H
 #define QEMU_9P_LOCAL_H
 
+typedef struct {
+    QemuFd_t mountfd;
+#ifdef CONFIG_WIN32
+    char *root_path;
+#endif
+} LocalData;
+
 QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                              mode_t mode);
 QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path);
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 3d6bd1a51e..5fb854bf61 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -88,26 +88,61 @@ static inline int errno_to_dotl(int err) {
     return err;
 }
 
-#ifdef CONFIG_DARWIN
+#if defined(CONFIG_DARWIN)
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
+#elif defined(CONFIG_WIN32)
+#define qemu_fgetxattr fgetxattr_win32
 #else
 #define qemu_fgetxattr fgetxattr
 #endif
 
+#ifdef CONFIG_WIN32
+#define qemu_openat     openat_win32
+#define qemu_fstatat    fstatat_win32
+#define qemu_mkdirat    mkdirat_win32
+#define qemu_renameat   renameat_win32
+#define qemu_utimensat  utimensat_win32
+#define qemu_unlinkat   unlinkat_win32
+#else
 #define qemu_openat     openat
 #define qemu_fstatat    fstatat
 #define qemu_mkdirat    mkdirat
 #define qemu_renameat   renameat
 #define qemu_utimensat  utimensat
 #define qemu_unlinkat   unlinkat
+#endif
+
+#ifdef CONFIG_WIN32
+char *get_full_path_win32(QemuFd_t fd, const char *name);
+ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_t size);
+QemuFd_t openat_win32(QemuFd_t dirfd, const char *pathname, int flags,
+                      mode_t mode);
+int fstatat_win32(QemuFd_t dirfd, const char *pathname,
+                  struct stat *statbuf, int flags);
+int mkdirat_win32(QemuFd_t dirfd, const char *pathname, mode_t mode);
+int renameat_win32(QemuFd_t olddirfd, const char *oldpath,
+                   QemuFd_t newdirfd, const char *newpath);
+int utimensat_win32(QemuFd_t dirfd, const char *pathname,
+                    const struct timespec times[2], int flags);
+int unlinkat_win32(QemuFd_t dirfd, const char *pathname, int flags);
+int statfs_win32(const char *root_path, struct statfs *stbuf);
+QemuFd_t openat_dir(QemuFd_t dirfd, const char *name);
+QemuFd_t openat_file(QemuFd_t dirfd, const char *name, int flags,
+                     mode_t mode);
+#endif
 
 static inline void close_preserve_errno(QemuFd_t fd)
 {
     int serrno = errno;
+#ifndef CONFIG_WIN32
     close(fd);
+#else
+    CloseHandle(fd);
+#endif
     errno = serrno;
 }
 
+#ifndef CONFIG_WIN32
 static inline QemuFd_t openat_dir(QemuFd_t dirfd, const char *name)
 {
     return qemu_openat(dirfd, name,
@@ -155,6 +190,7 @@ again:
     errno = serrno;
     return fd;
 }
+#endif
 
 ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
                              const char *name, void *value, size_t size);
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 22377a3105..24e21141d5 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -53,10 +53,6 @@
 #define BTRFS_SUPER_MAGIC 0x9123683E
 #endif
 
-typedef struct {
-    QemuFd_t mountfd;
-} LocalData;
-
 QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                              mode_t mode)
 {
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
new file mode 100644
index 0000000000..ed3d519937
--- /dev/null
+++ b/hw/9pfs/9p-util-win32.c
@@ -0,0 +1,934 @@
+/*
+ * 9p utilities (Windows Implementation)
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * This file contains Windows only functions for 9pfs.
+ *
+ * For 9pfs Windows host, the following features are different from Linux host:
+ *
+ * 1. Windows POSIX API does not provide the NO_FOLLOW flag, that means MinGW
+ *    cannot detect if a path is a symbolic link or not. Also Windows do not
+ *    provide POSIX compatible readlink(). Supporting symbolic link in 9pfs on
+ *    Windows may cause security issues, so symbolic link support is disabled
+ *    completely for security model "none" or "passthrough".
+ *
+ * 2. Windows file system does not support extended attributes directly. 9pfs
+ *    for Windows uses NTFS ADS (Alternate Data Streams) to emulate extended
+ *    attributes.
+ *
+ * 3. statfs() is not available on Windows. qemu_statfs() is used to emulate it.
+ *
+ * 4. On Windows trying to open a directory with the open() API will fail.
+ *    This is because Windows does not allow opening directory in normal usage.
+ *
+ *    As a result of this, all xxx_at() functions won't work directly on
+ *    Windows, e.g.: openat(), unlinkat(), etc.
+ *
+ *    As xxx_at() can prevent parent directory to be modified on Linux host,
+ *    to support this and prevent security issue, all xxx_at() APIs are replaced
+ *    by xxx_at_win32() and Windows handle is used to replace the directory fd.
+ *
+ *    Windows file system does not allow replacing a file or directory if it is
+ *    referenced by a handle. Keep the handle open will lock and protect the
+ *    parent directory and make the access to files atomically.
+ *
+ *    If we don't protect (lock) the parent directory, the parent directory may
+ *    be replaced by others (e.g.: a symbolic link) and cause security issues.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "9p.h"
+#include "9p-util.h"
+#include "9p-local.h"
+
+#include <windows.h>
+#include <dirent.h>
+
+#define V9FS_MAGIC  0x53465039  /* string "9PFS" */
+
+/*
+ * build_ads_name - construct Windows ADS name
+ *
+ * This function constructs Windows NTFS ADS (Alternate Data Streams) name
+ * to <namebuf>.
+ */
+static int build_ads_name(char *namebuf, size_t namebuf_len,
+                          const char *filename, const char *ads_name)
+{
+    size_t total_size;
+
+    total_size = strlen(filename) + strlen(ads_name) + 2;
+    if (total_size  > namebuf_len) {
+        return -1;
+    }
+
+    /*
+     * NTFS ADS (Alternate Data Streams) name format: filename:ads_name
+     * e.g.: D:\1.txt:my_ads_name
+     */
+
+    strcpy(namebuf, filename);
+    strcat(namebuf, ":");
+    strcat(namebuf, ads_name);
+
+    return 0;
+}
+
+/*
+ * copy_ads_name - copy ADS name from buffer returned by FindNextStreamW()
+ *
+ * This function removes string "$DATA" in ADS name string returned by
+ * FindNextStreamW(), and copies the real ADS name to <namebuf>.
+ */
+static ssize_t copy_ads_name(char *namebuf, size_t namebuf_len,
+                             char *full_ads_name)
+{
+    char *p1, *p2;
+
+    /*
+     * NTFS ADS (Alternate Data Streams) name from enumerate data format:
+     * :ads_name:$DATA, e.g.: :my_ads_name:$DATA
+     *
+     * ADS name from FindNextStreamW() always has ":$DATA" string at the end.
+     *
+     * This function copies ADS name to namebuf.
+     */
+
+    p1 = strchr(full_ads_name, ':');
+    if (p1 == NULL) {
+        return -1;
+    }
+
+    p2 = strchr(p1 + 1, ':');
+    if (p2 == NULL) {
+        return -1;
+    }
+
+    /* skip empty ads name */
+    if (p2 - p1 == 1) {
+        return 0;
+    }
+
+    if (p2 - p1 + 1 > namebuf_len) {
+        return -1;
+    }
+
+    memcpy(namebuf, p1 + 1, p2 - p1 - 1);
+    namebuf[p2 - p1 - 1] = '\0';
+
+    return p2 - p1;
+}
+
+/*
+ * get_full_path_win32 - get full file name base on a handle
+ *
+ * This function gets full file name based on a handle specified by <fd> to
+ * a file or directory.
+ *
+ * Caller function needs to free the file name string after use.
+ */
+char *get_full_path_win32(QemuFd_t fd, const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    DWORD total_size;
+    DWORD name_size;
+
+    full_file_name = g_malloc0(NAME_MAX);
+
+    /* get parent directory full file name */
+    name_size = GetFinalPathNameByHandle(fd, full_file_name,
+                                         NAME_MAX - 1, FILE_NAME_NORMALIZED);
+    if (name_size == 0 || name_size > NAME_MAX - 1) {
+        return NULL;
+    }
+
+    /* full path returned is the "\\?\" syntax, remove the lead string */
+    memmove(full_file_name, full_file_name + 4, NAME_MAX - 4);
+
+    if (name != NULL) {
+        total_size = strlen(full_file_name) + strlen(name) + 2;
+
+        if (total_size > NAME_MAX) {
+            return NULL;
+        }
+
+        /* build sub-directory file name */
+        strcat(full_file_name, "\\");
+        strcat(full_file_name, name);
+    }
+
+    return g_steal_pointer(&full_file_name);
+}
+
+/*
+ * fgetxattr_win32 - get extended attribute by fd
+ *
+ * This function gets extened attribute by <fd>. <fd> will be translated to
+ * Windows handle.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = {0};
+    DWORD dwBytesRead;
+    HANDLE hStream;
+    HANDLE hFile;
+
+    hFile = (HANDLE)_get_osfhandle(fd);
+
+    full_file_name = get_full_path_win32(hFile, NULL);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hStream = CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_READ, NULL,
+                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
+    if (hStream == INVALID_HANDLE_VALUE &&
+        GetLastError() == ERROR_FILE_NOT_FOUND) {
+        errno = ENODATA;
+        return -1;
+    }
+
+    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) == FALSE) {
+        errno = EIO;
+        CloseHandle(hStream);
+        return -1;
+    }
+
+    CloseHandle(hStream);
+
+    return dwBytesRead;
+}
+
+/*
+ * openat_win32 - emulate openat()
+ *
+ * This function emulates openat().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So openat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * For symbolic access:
+ * 1. Parent directory handle <dirfd> should not be a symbolic link because
+ *    it is opened by openat_dir() which can prevent from opening a link to
+ *    a dirctory.
+ * 2. Link flag in <mode> is not set because Windows does not have this flag.
+ *    Create a new symbolic link will be denied.
+ * 3. This function checks file symbolic link attribute after open.
+ *
+ * So symbolic link will not be accessed by 9p client.
+ */
+QemuFd_t openat_win32(QemuFd_t dirfd, const char *pathname, int flags,
+                      mode_t mode)
+{
+    g_autofree char *full_file_name1 = NULL;
+    g_autofree char *full_file_name2 = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    int fd;
+
+    full_file_name1 = get_full_path_win32(dirfd, pathname);
+    if (full_file_name1 == NULL) {
+        return hFile;
+    }
+
+    fd = open(full_file_name1, flags, mode);
+    if (fd > 0) {
+        DWORD attribute;
+        hFile = (HANDLE)_get_osfhandle(fd);
+
+        full_file_name2 = get_full_path_win32(hFile, NULL);
+        attribute = GetFileAttributes(full_file_name2);
+
+        /* check if it is a symbolic link */
+        if ((attribute == INVALID_FILE_ATTRIBUTES)
+            || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+            errno = EACCES;
+            hFile = INVALID_HANDLE_VALUE;
+            close(fd);
+        }
+    }
+
+    return hFile;
+}
+
+/*
+ * fstatat_win32 - emulate fstatat()
+ *
+ * This function emulates fstatat().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So fstatat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int fstatat_win32(QemuFd_t dirfd, const char *pathname,
+                  struct stat *statbuf, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    BY_HANDLE_FILE_INFORMATION file_info;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+    ino_t st_ino;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /* open file to lock it */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING,
+                       FILE_FLAG_BACKUP_SEMANTICS
+                       | FILE_FLAG_OPEN_REPARSE_POINT,
+                       NULL);
+
+    if (hFile == INVALID_HANDLE_VALUE) {
+        err = EACCES;
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        errno = EACCES;
+        goto out;
+    }
+
+    ret = stat(full_file_name, statbuf);
+
+    if (GetFileInformationByHandle(hFile, &file_info) == 0) {
+        errno = EACCES;
+        goto out;
+    }
+
+    /*
+     * Windows (NTFS) file ID is a 64-bit ID:
+     *   16-bit sequence ID + 48 bit segment number
+     *
+     * But currently, ino_t defined in Windows header file is only 16-bit,
+     * and it is not patched by MinGW. So we build a pseudo inode number
+     * by the low 32-bit segment number when ino_t is only 16-bit.
+     */
+    if (sizeof(st_ino) == sizeof(uint64_t)) {
+        st_ino = (ino_t)((uint64_t)file_info.nFileIndexLow
+                         | (((uint64_t)file_info.nFileIndexHigh) << 32));
+    } else if (sizeof(st_ino) == sizeof(uint16_t)) {
+        st_ino = (ino_t)(((uint16_t)file_info.nFileIndexLow)
+                         ^ ((uint16_t)(file_info.nFileIndexLow >> 16)));
+    } else {
+        st_ino = (ino_t)file_info.nFileIndexLow;
+    }
+
+    statbuf->st_ino = st_ino;
+
+out:
+    if (hFile != INVALID_HANDLE_VALUE) {
+        CloseHandle(hFile);
+    }
+
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * mkdirat_win32 - emulate mkdirat()
+ *
+ * This function emulates mkdirat().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So mkdirat_win32() has to use a directory handle instead of a directory fd.
+ */
+int mkdirat_win32(QemuFd_t dirfd, const char *pathname, mode_t mode)
+{
+    g_autofree char *full_file_name = NULL;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    ret = mkdir(full_file_name);
+
+    return ret;
+}
+
+/*
+ * renameat_win32 - emulate renameat()
+ *
+ * This function emulates renameat().
+ *
+ * Windows POSIX API does not support openning a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So renameat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int renameat_win32(HANDLE olddirfd, const char *oldpath,
+                   HANDLE newdirfd, const char *newpath)
+{
+    g_autofree char *full_old_name = NULL;
+    g_autofree char *full_new_name = NULL;
+    HANDLE hFile;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_old_name = get_full_path_win32(olddirfd, oldpath);
+    full_new_name = get_full_path_win32(newdirfd, newpath);
+    if (full_old_name == NULL || full_new_name == NULL) {
+        return ret;
+    }
+
+    /* open file to lock it */
+    hFile = CreateFile(full_old_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+
+    attribute = GetFileAttributes(full_old_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        err = EACCES;
+        goto out;
+    }
+
+    CloseHandle(hFile);
+
+    ret = rename(full_old_name, full_new_name);
+out:
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * utimensat_win32 - emulate utimensat()
+ *
+ * This function emulates utimensat().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So utimensat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int utimensat_win32(QemuFd_t dirfd, const char *pathname,
+                    const struct timespec times[2], int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    DWORD attribute;
+    struct utimbuf tm;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /* open file to lock it */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING,
+                       FILE_FLAG_BACKUP_SEMANTICS
+                       | FILE_FLAG_OPEN_REPARSE_POINT,
+                       NULL);
+
+    if (hFile == INVALID_HANDLE_VALUE) {
+        err = EACCES;
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        errno = EACCES;
+        goto out;
+    }
+
+    tm.actime = times[0].tv_sec;
+    tm.modtime = times[1].tv_sec;
+
+    ret = utime(full_file_name, &tm);
+
+out:
+    if (hFile != INVALID_HANDLE_VALUE) {
+        CloseHandle(hFile);
+    }
+
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * unlinkat_win32 - emulate unlinkat()
+ *
+ * This function emulates unlinkat().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So unlinkat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+
+int unlinkat_win32(QemuFd_t dirfd, const char *pathname, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /* open file to prevent other one modify it */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+
+    attribute = GetFileAttributes(full_file_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        err = EACCES;
+        goto out;
+    }
+
+    if (flags == AT_REMOVEDIR) { /* remove directory */
+        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
+            err = ENOTDIR;
+            goto out;
+        }
+        ret = rmdir(full_file_name);
+    } else { /* remove regular file */
+        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) != 0) {
+            err = EISDIR;
+            goto out;
+        }
+        ret = remove(full_file_name);
+    }
+
+    /* after last handle closed, file will be removed */
+    CloseHandle(hFile);
+
+out:
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * statfs_win32 - statfs() on Windows
+ *
+ * This function emulates statfs() on Windows host.
+ */
+int statfs_win32(const char *path, struct statfs *stbuf)
+{
+    char RealPath[4] = { 0 };
+    unsigned long SectorsPerCluster;
+    unsigned long BytesPerSector;
+    unsigned long NumberOfFreeClusters;
+    unsigned long TotalNumberOfClusters;
+
+    /* only need first 3 bytes, e.g. "C:\ABC", only need "C:\" */
+    memcpy(RealPath, path, 3);
+
+    if (GetDiskFreeSpace(RealPath, &SectorsPerCluster, &BytesPerSector,
+                         &NumberOfFreeClusters, &TotalNumberOfClusters) == 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    stbuf->f_type = V9FS_MAGIC;
+    stbuf->f_bsize =
+        (__fsword_t)SectorsPerCluster * (__fsword_t)BytesPerSector;
+    stbuf->f_blocks = (fsblkcnt_t)TotalNumberOfClusters;
+    stbuf->f_bfree = (fsblkcnt_t)NumberOfFreeClusters;
+    stbuf->f_bavail = (fsblkcnt_t)NumberOfFreeClusters;
+    stbuf->f_files = -1;
+    stbuf->f_ffree = -1;
+    stbuf->f_namelen = NAME_MAX;
+    stbuf->f_frsize = 0;
+    stbuf->f_flags = 0;
+
+    return 0;
+}
+
+/*
+ * openat_dir - emulate openat_dir()
+ *
+ * This function emulates openat_dir().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So openat_dir() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+QemuFd_t openat_dir(QemuFd_t dirfd, const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hSubDir;
+    DWORD attribute;
+
+    full_file_name = get_full_path_win32(dirfd, name);
+    if (full_file_name == NULL) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+    if (attribute == INVALID_FILE_ATTRIBUTES) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /* check if it is a directory */
+    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /* do not allow opening a symbolic link */
+    if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /* open it */
+    hSubDir = CreateFile(full_file_name, GENERIC_READ,
+                         FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                         NULL,
+                         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+    return hSubDir;
+}
+
+QemuFd_t openat_file(QemuFd_t dirfd, const char *name, int flags,
+                     mode_t mode)
+{
+    return openat_win32(dirfd, name, flags | _O_BINARY, mode);
+}
+
+/*
+ * fgetxattrat_nofollow - get extended attribute
+ *
+ * This function gets extended attribute from file <path> in the directory
+ * specified by <dirfd>. The extended atrribute name is specified by <name>
+ * and return value will be put in <value>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
+                             const char *name, void *value, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    DWORD dwBytesRead;
+    HANDLE hStream;
+
+    full_file_name = get_full_path_win32(dirfd, path);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hStream = CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_READ, NULL,
+                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
+    if (hStream == INVALID_HANDLE_VALUE &&
+        GetLastError() == ERROR_FILE_NOT_FOUND) {
+        errno = ENODATA;
+        return -1;
+    }
+
+    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) == FALSE) {
+        errno = EIO;
+        CloseHandle(hStream);
+        return -1;
+    }
+
+    CloseHandle(hStream);
+
+    return dwBytesRead;
+}
+
+/*
+ * fsetxattrat_nofollow - set extended attribute
+ *
+ * This function set extended attribute to file <path> in the directory
+ * specified by <dirfd>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+
+int fsetxattrat_nofollow(QemuFd_t dirfd, const char *path, const char *name,
+                         void *value, size_t size, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    DWORD dwBytesWrite;
+    HANDLE hStream;
+
+    full_file_name = get_full_path_win32(dirfd, path);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hStream = CreateFile(ads_file_name, GENERIC_WRITE, FILE_SHARE_READ, NULL,
+                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
+    if (hStream == INVALID_HANDLE_VALUE) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (WriteFile(hStream, value, size, &dwBytesWrite, NULL) == FALSE) {
+        errno = EIO;
+        CloseHandle(hStream);
+        return -1;
+    }
+
+    CloseHandle(hStream);
+
+    return 0;
+}
+
+/*
+ * flistxattrat_nofollow - list extended attribute
+ *
+ * This function gets extended attribute lists from file <filename> in the
+ * directory specified by <dirfd>. Lists returned will be put in <list>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
+                              char *list, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    WCHAR WideCharStr[NAME_MAX + 1] = { 0 };
+    char full_ads_name[NAME_MAX + 1];
+    WIN32_FIND_STREAM_DATA fsd;
+    BOOL bFindNext;
+    char *list_ptr = list;
+    size_t list_left_size = size;
+    HANDLE hFind;
+    int ret;
+
+    full_file_name = get_full_path_win32(dirfd, filename);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    /*
+     * ADS enumerate function only has WCHAR version, so we need to
+     * covert filename to utf-8 string.
+     */
+    ret = MultiByteToWideChar(CP_UTF8, 0, full_file_name,
+                              strlen(full_file_name), WideCharStr, NAME_MAX);
+    if (ret == 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hFind = FindFirstStreamW(WideCharStr, FindStreamInfoStandard, &fsd, 0);
+    if (hFind == INVALID_HANDLE_VALUE) {
+        errno = ENODATA;
+        return -1;
+    }
+
+    do {
+        memset(full_ads_name, 0, sizeof(full_ads_name));
+
+        /*
+         * ADS enumerate function only has WCHAR version, so we need to
+         * covert cStreamName to utf-8 string.
+         */
+        ret = WideCharToMultiByte(CP_UTF8, 0,
+                                  fsd.cStreamName, wcslen(fsd.cStreamName) + 1,
+                                  full_ads_name, sizeof(full_ads_name) - 1,
+                                  NULL, NULL);
+        if (ret == 0) {
+            if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
+                errno = ERANGE;
+            }
+            CloseHandle(hFind);
+            return -1;
+        }
+
+        ret = copy_ads_name(list_ptr, list_left_size, full_ads_name);
+        if (ret < 0) {
+            errno = ERANGE;
+            CloseHandle(hFind);
+            return -1;
+        }
+
+        list_ptr = list_ptr + ret;
+        list_left_size = list_left_size - ret;
+
+        bFindNext = FindNextStreamW(hFind, &fsd);
+    } while (bFindNext);
+
+    CloseHandle(hFind);
+
+    return size - list_left_size;
+}
+
+/*
+ * fremovexattrat_nofollow - remove extended attribute
+ *
+ * This function removes an extended attribute from file <filename> in the
+ * directory specified by <dirfd>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
+                                const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+
+    full_file_name = get_full_path_win32(dirfd, filename);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, filename, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (DeleteFile(ads_file_name) != 0) {
+        if (GetLastError() == ERROR_FILE_NOT_FOUND) {
+            errno = ENODATA;
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * local_opendir_nofollow - open a Windows directory
+ *
+ * This function returns a Windows file handle of the directory specified by
+ * <dirpath> based on 9pfs mount point.
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * This function checks the resolved path of <dirpath>. If the resolved
+ * path is not in the scope of root directory (e.g. by symbolic link), then
+ * this function will fail to prevent any security issues.
+ */
+HANDLE local_opendir_nofollow(FsContext *fs_ctx, const char *dirpath)
+{
+    g_autofree char *full_file_name = NULL;
+    LocalData *data = fs_ctx->private;
+    HANDLE hDir;
+
+    hDir = openat_dir(data->mountfd, dirpath);
+    if (hDir == INVALID_HANDLE_VALUE) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    full_file_name = get_full_path_win32(hDir, NULL);
+    if (full_file_name == NULL) {
+        CloseHandle(hDir);
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /*
+     * Check if the resolved path is in the root directory scope:
+     * data->root_path and full_file_name are full path with symbolic
+     * link resolved, so fs_ctx->root_path must be in the head of
+     * full_file_name. If not, that means guest OS tries to open a file not
+     * in the scope of mount point. This operation should be denied.
+     */
+    if (memcmp(full_file_name, data->root_path,
+               strlen(data->root_path)) != 0) {
+        CloseHandle(hDir);
+        hDir = INVALID_HANDLE_VALUE;
+    }
+
+    return hDir;
+}
+
+/*
+ * qemu_mknodat - mknodat emulate function
+ *
+ * This function emulates mknodat on Windows. It only works when security
+ * model is mapped or mapped-xattr.
+ */
+int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    if (S_ISREG(mode) || !(mode & S_IFMT)) {
+        HANDLE hFile = openat_file(dirfd, filename, O_CREAT, mode);
+        if (hFile == INVALID_HANDLE_VALUE) {
+            return -1;
+        }
+        close_preserve_errno(hFile);
+        return 0;
+    }
+
+    error_report_once("Unsupported operation for mknodat");
+    errno = ENOTSUP;
+    return -1;
+}
-- 
2.25.1


