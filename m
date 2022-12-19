Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED68650A0A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:23:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHB-0003Fl-UA; Mon, 19 Dec 2022 05:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGl-0003BW-Hy
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:19 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGj-0007SZ-Je
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:15 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ8ML3I018813; Mon, 19 Dec 2022 02:21:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=KXtzgryUPbFK1F7ykYUTKpNRY2j/TZeYnB9X8WUxZLU=;
 b=Y90gTLKpCe1ZlCGyMY+tStM1TF7sTm5oigjP7o2DJkbrIkT86lfxU8duU5an6fIeVADv
 KHHLvc94lsBPE3boc1SHpGdh9Q73vdbQRqr8lSb3h4hKGLx2l/sngt1xBn9qTz9dY3Ni
 +waYI1d0PhAedLBzgPHPZGbHAKJZnfZ4fNV2mxtJ84YHFDVDOAgLL7cEHGWBnLcdG8jd
 bi/+oDYoTWJW7XFJAuBVEO9fhI/Tsav5csghIqT7iDVK9y+gwC7MZOXGzgteVCE39pEW
 V9+Dk+64VgyEcYkBhWdO6b/utvNgRFRKHBI9sSvKHxsrhQ9qjxXfIKUlK8dbcW5m/w6a tQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh9x8s77t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 02:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG7Hdhe74ghxoTd7GAo/aC7QkCFBcAj7fUMZcxu718xr8DnMT/IRqgvGSoYE6MKGEg0N3wWzKMB3i5sKqyQU/vTCRy4BC5+g2DLgfM6FgYpSZjECsWiRD90Cr2uBn5vQo6QBe8Ep1xGL8LE+oOBOVh58oK+N0AcTAhuWShEH257JO5QkLfutFBx/zELD5L/gvDpPnTZSPx/WIbR6IzB+/8pr0woA6vDWZwQthyCY0Dx7rBVtaCDfLvc8VV6Eu7xLJEHZ3RKKDF0R9BPtADO9DwWE1//1oB1ys2KhJboQtK6d0n6jvpsMCOygG0u8uqAx8J/DArUt49GiVgWfg+2gOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXtzgryUPbFK1F7ykYUTKpNRY2j/TZeYnB9X8WUxZLU=;
 b=fE02AngCgCZUfT0/K7bW8cKwURrrcTitHQggLB0rlkQAwO0UO8MiF5gk7hB6alvHL2BRcJubbda6VDN1ahuPoIIwxSdSG/OaONfuQ+7iUdmdhCSwycz5ZVIww//pzQOUABV6LmuyOBxY0uZnKf0o7YUidhprsFah7cf7qQqG8YZbd/qGG3HXriAgIW/xq/YT67e+ECWtDn8Zmyw143UAv6zo/v/E1r76nhbOArcOG2CONDhbjos8sZb037TiKLN3Pb5Wf7mCNEE8pU7en7OORsV4zgl7hU4W1sB94FM+XShL2Yac4tFaM5jqru5H/0J29x8JSYG9FNLPGZXHnBmVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:59 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:59 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 07/17] hw/9pfs: Support getting current directory offset
 for Windows
Date: Mon, 19 Dec 2022 18:20:11 +0800
Message-Id: <20221219102022.2167736-8-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68f98123-1933-4356-7749-08dae1aab8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8Ah954EiayayUPzy5C3FsZ9N4TmEfc4pOIovn/Lk1hZUyFWVWrjM7DZCD6UryGN9D3/rlwYhK1kUwEhYpVEXchWa9KW3hxB584J5uY8+Uvhwiou64Grm8uJcNBcNFEPW4Z95uDAJPX4RBwoeiSzJre7SM3ZhldR4N6qrRw6iD+oPlSNrFMiiFJtnLl6ETXsh61E/uVJNkv7KsH6se3W0X6ObXmk/TKkCNJzZfU/KDeRqZkqRk2GKLSSN5aral+5KKtJqMIH5Yzg+wZDbwysvDO7AfBAZ0pUkFkdNhcSMIUnor5OPBe2oUE9KTynaYtQkQNyYZxkg9W8TmT63AJjytRgciYYpy6o5kiaIIALicCCPXC8hdfTc2xNaQvPmu7cHpbC/78zeQi8zz/CpKfLRMJg2i0VjQXEr8bZNjh1v9UERpKH3CUo5MM6ppZlekKCppLKoQYxOLfPj0ailgizM4UtL9sy5LD0c6yJ7hOZn/q88ah+HTCqhGVtlwzr6DPd72U4mVssZA9DUCbmAtM8EgqRdpQ6IIbjx7Y7VHgzm+8DBDXLuYnPsDglD6Dn6/37anRP9h5k8Zinlk8uv6muAYJqqwfEWz5yaw/m9rPDdBlJ8gIHkT6Lc0FdPr0UdipPckZBkZJLzyFvFcK3RJoGPSym1Ww5kRdm+AN+JIHtdwuq6eA2jWLU2dF/rSmyntUtuvVFd6bHEODqLW/92+01cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0aeBEj4D4OF7QxWw6hZQppu/tgYDLZxvY0rFCJLyTfYDWU7yawjVKBzkh42?=
 =?us-ascii?Q?vM+JR0SfK9IVIIbBH0FD9/ZdOPQWfjFdTOvZ63iloxaO77hy1wip8jsuqOqn?=
 =?us-ascii?Q?MaEo/9nTlFRdKRB2z49bjpANw8OUmTjFrQfGF12xebwMBEIF2qnAMIEvNu+m?=
 =?us-ascii?Q?A8jqhlLtL+hHRwaP5GcFfa0wcvKaIYNKIPvjqfWkLkJ/vxso1P5ix1Yslv6z?=
 =?us-ascii?Q?CeB4eodhKF/HsAwn18BjuqTZP94YuJ0B8TJOKXqlK3lUoBdp2/HKToykX07e?=
 =?us-ascii?Q?bf1JOr8NmWJjD+Q+ZgYoo0WHpgBUPifA95aTQASmUYdfPzj4jTkajXwGSxYU?=
 =?us-ascii?Q?LkiGEgUelRZ2md9O3gczwabnja2S9/z6CvC0ZSNMT15QtGqewq4OLoj8MEqj?=
 =?us-ascii?Q?VXg5fgHIgn45UlqzkUc3tyzFo/PnKy4NO6QoP445X3TQ9PnqSwLCOIXNQkcf?=
 =?us-ascii?Q?KaE2BQ5YtyaKY1QDmpyFFOYgwyP65hCcq97Ho0kkfWgocFSsY5+vVOSeMW8c?=
 =?us-ascii?Q?RE5KGL3afbS46GBHYFYt4zGBokw1A33L1pnsPYE28i3nrqkvpcWqZmZgxbUz?=
 =?us-ascii?Q?dj07/s0+cZOyTGoG94bGP2Msg1zqrcC46aH9qXuulMwJ5fdxXZ14Pm4HDp60?=
 =?us-ascii?Q?KDlTixAcckj/3WxRDHqA8vBhLKDXWbe27uBJ3tjWpxS+OW4NLxlc0YE7+Ico?=
 =?us-ascii?Q?t7Mu+0OO64qpQf05TYJ9qUULADoxsas0DQrJanA8F32YKdxleYMPDzz0uP5w?=
 =?us-ascii?Q?QnkqusVdbR6Dd8Hcr0Vn7h8PYokFjnzyMWEk+fc+LvwtjVyTFIWXV2aZoTQl?=
 =?us-ascii?Q?6k6RFw1jXsg0odS9oja7/OxpZZrLqeMaCxJbO21Kf+kc5hLsZLZYHnNF8vmD?=
 =?us-ascii?Q?WFevb5F3i8UwaWHDhjxgiiYk7VVK7shsnkMMU+eBXMZBUbWJYoL9AbTlstNQ?=
 =?us-ascii?Q?nPgy2njv/tAbKrhrGwd8s0gdBmp10AhGKu8WB5r3bkE217gcpbfpDbCS1e8v?=
 =?us-ascii?Q?ys7fl6IofcWx2AIFr0O/suwHVOmH42g0TJZQ3EPjwnWYSw2OqcnMq54uMVXw?=
 =?us-ascii?Q?UHNfjKmlxfOW9E9cAeH6B39BPsA7UNhJS8WNnp1h4DWYVbpi/R+F0j3AEbjR?=
 =?us-ascii?Q?yJjjRfcwA2zeKZtJVjkgAwFTgnEBArD4QQHJsTbawuDmoRpaw0FGbZhCTdPz?=
 =?us-ascii?Q?PSQYHs0SZXPyRBXRO8nPp2+pI+RdRKNwyOkRb06xzHEnCkwK0eN1/eOohzzs?=
 =?us-ascii?Q?zN3c9ka5uhKipDOlw4+gyy3WhWa0yPSQRTE4+f+bHYXXn+ZBm5L5RXM4SHPa?=
 =?us-ascii?Q?kveADr1c/AeymMw2jtOL484xkqLueqPEyysP6Wg8pp+3K/43EG1xZizcDTla?=
 =?us-ascii?Q?hhocbz4jU/Fvy1+W8joKXtPKKvvHixt5eD8Tb9ziKSc9Wc7mNlhnCZPNkIh5?=
 =?us-ascii?Q?zLUwM3hEoaiD5AZR7U0BZ+Lu1MxSe1A3+cxJDWAoPupN8WL2f9fyI6mYsGUC?=
 =?us-ascii?Q?OFAQOgomYSdhf49psP0/OqZMWhjPEPw10XX+MjNJ5/yOf4cHNTK4rpZRapUv?=
 =?us-ascii?Q?ucu44C6II4MP5cEJLLiT971tP1RE5SGQ1MaTa9K8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f98123-1933-4356-7749-08dae1aab8ba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:59.1291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvHSYSmdShcziDv4pyOZZfqF15ohueuI+491pSV/q+gAMVUuZyJOclmB+e5vIIEFmJnNDMiNCfp4Eae3rjECfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: nMvP7Ywh27j9fnAzobaRF9MOSXxx8-pm
X-Proofpoint-ORIG-GUID: nMvP7Ywh27j9fnAzobaRF9MOSXxx8-pm
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

On Windows 'struct dirent' does not have current directory offset.
Update qemu_dirent_off() to support Windows.

While we are here, add a build time check to error out if a new
host does not implement this helper.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p-util.h       | 11 ++++++++---
 hw/9pfs/9p-util-win32.c |  7 +++++++
 hw/9pfs/9p.c            |  4 ++--
 hw/9pfs/codir.c         |  2 +-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 90420a7578..e395936b30 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -127,6 +127,7 @@ int unlinkat_win32(int dirfd, const char *pathname, int flags);
 int statfs_win32(const char *root_path, struct statfs *stbuf);
 int openat_dir(int dirfd, const char *name);
 int openat_file(int dirfd, const char *name, int flags, mode_t mode);
+off_t qemu_dirent_off_win32(void *s, void *fs);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -200,12 +201,16 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
  * so ensure it is manually injected earlier and call here when
  * needed.
  */
-static inline off_t qemu_dirent_off(struct dirent *dent)
+static inline off_t qemu_dirent_off(struct dirent *dent, void *s, void *fs)
 {
-#ifdef CONFIG_DARWIN
+#if defined(CONFIG_DARWIN)
     return dent->d_seekoff;
-#else
+#elif defined(CONFIG_LINUX)
     return dent->d_off;
+#elif defined(CONFIG_WIN32)
+    return qemu_dirent_off_win32(s, fs);
+#else
+#error Missing qemu_dirent_off() implementation for this host system
 #endif
 }
 
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index 7a270a7bd5..3592e057ce 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -929,3 +929,10 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
     errno = ENOTSUP;
     return -1;
 }
+
+off_t qemu_dirent_off_win32(void *s, void *fs)
+{
+    V9fsState *v9fs = s;
+
+    return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState *)fs);
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 072cf67956..be247eeb30 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2336,7 +2336,7 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
-        saved_dir_pos = qemu_dirent_off(dent);
+        saved_dir_pos = qemu_dirent_off(dent, pdu->s, &fidp->fs);
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2537,7 +2537,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
-        off = qemu_dirent_off(dent);
+        off = qemu_dirent_off(dent, pdu->s, &fidp->fs);
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 93ba44fb75..d40515a607 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -168,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
-        saved_dir_pos = qemu_dirent_off(dent);
+        saved_dir_pos = qemu_dirent_off(dent, s, &fidp->fs);
     }
 
     /* restore (last) saved position */
-- 
2.25.1


