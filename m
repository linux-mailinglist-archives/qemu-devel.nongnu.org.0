Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C5650A03
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:22:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHF-0003IY-Bt; Mon, 19 Dec 2022 05:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGo-0003BZ-21
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:23 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGl-0007Sw-Kw
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:17 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJAECTG003542; Mon, 19 Dec 2022 10:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=JiN1VhiqfcVIjGVp/gcgMows6Q3QhyKARN3vrouX3p8=;
 b=VB68/nLluG/fLPY0nmqCVMHCpiCq0eU7aEx4UHEz/0ttBvtcMImiA/+eOpZ8rgqPBvTr
 WoOykhGzvpJ21dSTPd1IQDQmhLXM6Gt7oKjYc58iyRCX7v+MMTwkvq/aM6vJW30nZAD/
 WfXJy4nujTcUBSiG7MvLF3q2hZj7wJdCYIAe80Q7wYDE3Aj4vAtmudKRBxipEzZfE+Ab
 CO+sbyJrbxIdDhKQc6679ahKZw022xuSvqNzi4FlGWfVmLzCvvqkqgaJa4QDXovdPKkX
 GBQ0Fd++Qmrn532/ZJLFr01suLahcKIXM9u5IfOKqVeizUnJUDNcmJd5J8kJ0wz4ymGw 8Q== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikud2iI+K5i0w6Yjl965a2nLXINyWe6L/nc7aRwTW81E4QAHuDejuILuqhpOZgXZjPE7Ml1NRa5Sw0lICbp8OiPUK6JvMkDY+/U6kq3GQImHjL+KQ2fDaxNeLDIsBlW1CGqcGZcJVFWfPVTbtk0Tv4D7NLQ2wKHFvNa/s8aeJVVVBhBYkjqLA5PSM1tYTNGbFOQnMSoH1M0gUceRz2WAtM5Jvl/SKcXtfEJA4dpj5Rt9ndLth31MEoBLYtNT8M5SPbpoRZyL02TI45BA8vwCv1SptCF+eM7WKwMO+DGkvRRtLIDBMUstEVOoH0sCNyKN/mTzjRtvXzmOXftMfyv2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiN1VhiqfcVIjGVp/gcgMows6Q3QhyKARN3vrouX3p8=;
 b=RkZmBSa8jOmBN6YYUhcUmF5sWp/H6XNmenziE7rr/KVyCXA08rhcEsXrItJg9LmAAojEdmBeyGzU0bxAR4Geck929u3+z9U41gm9BC2tyGdlmnGdCLPW0FMDi4U170Xl5Nyj1TxmV+6fY76Luwu63cuL8K+jRR5DsWWt/ooItmGnzhf+fkrr5Lo47yFWyNWWF1togIwZN6Wk350MBTkKqnE3H+UzSdI/KOLXTWHc5iNIaezdZCSg6737kzkMKikI5ABy0vjtxapMe1EiCBUQPdiRkiTyuf3hMG5g8DOMDuOjcFluyzsqeZO8FjT4c4dWAZLEV1bbhZm7Y/UVrL6pnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:03 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:03 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 09/17] hw/9pfs: Add a helper qemu_stat_blksize()
Date: Mon, 19 Dec 2022 18:20:13 +0800
Message-Id: <20221219102022.2167736-10-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 07bc7935-0098-4240-dc3d-08dae1aabb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnjjdFss78Nmzm8yOZ/Yi9cQXwqIN8WOwNBzpMG2jl2glqn0LPmtM8teHj5BWYtVKMi3jbB0y40oClh5tOgSHBQ4r53eq5mFpAnmf8pM9efEMN3qge+UzYGAKCt4aOJacHRSOyQjd0tcXCJ5DRAU7KftJKh1mZetsKRqiziaER449FUp7Mv8LuSHLA9WbInWaa/alqIo1+5V/3CgnPv2qyP4oioIdiCKObF1OfKL+vUUmSOjoMhaWtrk7LTDqZUXLtYgcLA6Vz6VMY0pRiEPy3TbWL/4PVRzU9qUwPq/1sAudmSOP/1FWQzKaeBU/ROZaNWY1/cCWW3ab+qfpaaGOqK4E/F3RaE9OyCAwrG/yS2XSg8+yPcg89jVFWIj+hPdvTeheMUhZP1neQjaULsyn/Grc8sGqc9t007DntOaESbjlQqMAo7X3iXl3njHyCf58yKLcIauNdxhwPSvSWgYWkh4Hqp8qkJYdHo/+bjt94gBdf2Y797XVAcTIbx5oZ68slqn6RqY7MmGbYyHBlYvlZzpS61Q6VPKTjvkyP7Jo6Rp9cQdYlDI1/lWCKsvskEQH+fMO2OAI0fN+VRDwKmpFv4o42IK6QgWr244IooXrFOtiofC/Bzj/VcN+u85wxbLAg1h2ws7OePY0waKUeq/4oDOD9YZigoakDm5FN+Y2zXrxNGr3cjr9LGck/Sk2/3tYP41GgWRXC9ewnFCsDIGIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fnffA+bYNZBZH8VwV178o72l8aYecEPzjNvgeQxDCJIR35kD3h2JDaAbK5WS?=
 =?us-ascii?Q?AFXprGiuk1pLQfjEy1rtdry9OPsehwGzgLi5uXYCtv73oaMylLa3WMzqLd8l?=
 =?us-ascii?Q?1iI9zmXzwaHTAnQMo8MnhuCHlR0hTHz+8G1mQaVQ9PCNnKbbXJUNB+rBQWDP?=
 =?us-ascii?Q?SjgMAOVFyFGWVSjj7iq6AHa3gR8u3Z4xhI9357/pSvxHx6ykc06ZzNqBek9x?=
 =?us-ascii?Q?KXYBBBDREuUb6OjvRaTet5Hes8sQstH+khW3dFWPYjud1ciNA6NZdbQrtpSy?=
 =?us-ascii?Q?vnSkAtz8u5tjLJrnZFF+31Sptizx2JjHNQLhhNUQ7k3aUPIjQnW13anC9HjP?=
 =?us-ascii?Q?JaU0ErUg4xvba7/VZUGaeZAUKYN+mMySRIf4/D8Z7n6R4+eh36pLNw/G8fMh?=
 =?us-ascii?Q?1THm5ntrR33p2Oj5dLHloPCpEBA6ySOwBD5H9PezgSnIIYvpKr5f+G3Aw4mP?=
 =?us-ascii?Q?SXO7ZAW1HHztVqcuTa3NzxwvzpCtKnZvR8lxfOkzmrd0Q6ErEDGLcIk+U8sl?=
 =?us-ascii?Q?1j7aCNCa7/77yuRmPFAGh7q1fW74xWTlu6eqM0xrajpFJVsTzr21Vk6eb/84?=
 =?us-ascii?Q?gJfmPImcHauqME564E/P8CYajBecz98zejh/q9uLSgSNPwiDUe0UV3gEZUk+?=
 =?us-ascii?Q?StMTwrSg/l8NfmCEbUcJiHGDBQqxeEZSQY4vOEAQ6nsCIsWyNDEH+lvBr4qc?=
 =?us-ascii?Q?6NpaZqUhqOf4gXA6n6SHnZAypRpnDvPzdDgAzsCVQa+E/zXf8W1DMxxf3z5m?=
 =?us-ascii?Q?rBJ3+hAvmEujcVsxmzuw0DTLOxFaV2EqNZrR7V6TN30ESPKMErXDrno7YDhU?=
 =?us-ascii?Q?LAXO1cjH9elhLAZJYegu5Nk2l83kp+jVS6JqBy/vniaO+kyw/xpXmJwgMfka?=
 =?us-ascii?Q?hnSvhoHYWbLU3EqSnwLn+h1m8z7bMHsVVAGyJlH5bbtlazqSmWZFicGJ779c?=
 =?us-ascii?Q?+YfW7aOxd4XBy6FXpRaP6z//GKqp7zE6ZKX5/+S9txUBUeTWt0zw8HRpPvVA?=
 =?us-ascii?Q?15TLY7r9OEnUC5KUNdcIZAG58L8lnmTFspKl6p6rpaaJveuCjMnTEEqonZld?=
 =?us-ascii?Q?D29NaHdJ9qQmYapg/w/6kXCShYqIn7KJcjZ9a8x77kSay/Z297OewIIGfqKo?=
 =?us-ascii?Q?Yhl7GwyAS/f/cJvlQUnP4wfGIUs0CEWIJMxUxFSpgIuTWl4v0CI+KK8hfgoW?=
 =?us-ascii?Q?/GYIfZhIX+qZh1kqjsRVv1DXeUcZL5Ai7zm4qT4dq2BD8MAa5nbF0ncVKn7q?=
 =?us-ascii?Q?rTfbMIfJAPdxzT/uKyK4lR/P2K1Jms5Ak9crQQ87Ed1Xpp8pfmKF/YsnzKAJ?=
 =?us-ascii?Q?b8KOMjoU0r1ZBlpqtWYp0uyF3RB8gXv76SFo2teQYJW4uEZMcKAbXhSClivo?=
 =?us-ascii?Q?PyqJ6g4hAqRKrSJOd8TruHRtitVyV9dIrNeWMKWrihP488tnS5Oz0ek9tLCC?=
 =?us-ascii?Q?cn2hpeTfvaprPkRDf1VhRkKPELUd3Bv5OPkiC6O+TywsVXI6XobT2W0ioxMr?=
 =?us-ascii?Q?nZFz1ki21Ic6CYNTTElaSd8hhCkO1ZNEiuQggdNVuOVtp7ZDDU7aLpNkJNxE?=
 =?us-ascii?Q?ZHJQw3aEpfUD/sG2e84Vcv/36sNE90TpB7ahOMIq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bc7935-0098-4240-dc3d-08dae1aabb48
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:03.0713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7X6Yusq7PrAyazKAwE0E9ZAIscOwbJkLxKFcBXl4H3xLAIpRO25Av8nLeYDY0kRI1ueD4slSiMeXuoiEY7g8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: At-AW_3KR023UAyz_rJQxGSWzjpgCtk3
X-Proofpoint-ORIG-GUID: At-AW_3KR023UAyz_rJQxGSWzjpgCtk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190091
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As Windows host does not have stat->st_blksize field, we use the one
we calculated in init_win32_root_directory().

Add a helper qemu_stat_blksize() and use it to avoid direct access to
stat->st_blksize.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h       | 12 ++++++++++++
 hw/9pfs/9p-util-win32.c |  7 +++++++
 hw/9pfs/9p.c            | 13 ++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index b8e5c037a2..ff16e74f5d 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -131,6 +131,7 @@ int openat_dir(int dirfd, const char *name);
 int openat_file(int dirfd, const char *name, int flags, mode_t mode);
 off_t qemu_dirent_off_win32(void *s, void *fs);
 uint64_t qemu_stat_rdev_win32(void *fs_ctx);
+uint64_t qemu_stat_blksize_win32(void *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -258,6 +259,17 @@ static inline uint64_t qemu_stat_rdev(const struct stat *stbuf, void *fs_ctx)
 #endif
 }
 
+static inline uint64_t qemu_stat_blksize(const struct stat *stbuf, void *fs_ctx)
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
index 54c10069b9..07e1fcc4f1 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -954,3 +954,10 @@ uint64_t qemu_stat_rdev_win32(void *fs_ctx)
 
     return rdev;
 }
+
+uint64_t qemu_stat_blksize_win32(void *fs_ctx)
+{
+    LocalData *data = ((FsContext *)fs_ctx)->private;
+
+    return data ? (uint64_t)data->block_size : 0;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 36916fe581..def85a57fa 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1335,12 +1335,14 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 
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
@@ -1350,7 +1352,16 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
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


