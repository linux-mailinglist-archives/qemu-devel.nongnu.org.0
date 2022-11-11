Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8B62527F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZd-0000Y3-8N; Thu, 10 Nov 2022 23:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZb-0000X3-Mi
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:23 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZZ-0001aT-4E
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:23 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N9pt004974; Thu, 10 Nov 2022 20:23:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HZO+0yGtG3Rr66MSooBmPWDGjGuHB1C3qKMoQtSVztA=;
 b=CAmiwHPi3kWMMvkxtyQT0j3YmtYsCb3/DVyCdSFobkPEmn5MdrJyAHDy6XsRpxQMc9eI
 LeLBWsf7nYzGZpcJPzwDXGLE3BepaUjG1HH1zZF4ERVL5J2dSxUkvVU9Ulj6uEu6ZakW
 wCbCCMgPtu1VwxDDDDk9hzCQOC4lxp8jO3DnGHR/mhBj3U8P5s7ezF6SVdGF+zPxQFrj
 Y51gnrQn40Z8fKnQuYvZVH/fXaGxCEBlt55pY7Urah/Tk7JWpw1Kdww2pu2vBsXLoCnv
 r8pUXtDT1eFsEEUyDO+alyPkAzeLs4aeocOOGgAtvKLh0ZY8f6oQRpbOtwJWeqn69gx2 Og== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0bJUI1zmPF0mCpgGWRSKhNjixIJAW7qYeOfUT5s+fCvqt3oDF7dbOt3Yg5eAyvGv39gk2vXCZempUINKEuY2oKJIvaYihfwsaNvjdhoKQjibuMDfvZKLY1obpsBXqEaNnvn6kyc6RwwrhW/92f87RGPnus4x/moxJ19fT5p5wPGlQg9tRqxYY3bdBcvhT3z4SKScTxaKF4DTKrqtjCEUMQ4vJdjAzTLDqJk0xraU5SHk3Wabhicxxs2OwGl8qqo4+C3mmmMsRmQRjO7R9I+FtJk5vPWg/QX2XeQ98Pf5tki8Os7IWXeDqS/YqAZFMQ2k/2Bc/BE+NNieGw30X6adA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZO+0yGtG3Rr66MSooBmPWDGjGuHB1C3qKMoQtSVztA=;
 b=J+YSTlWdf1Jw9IERNk39Jptg4pJfxuwEERrgLAZfwHUFrwgDsoaBi8gcNizMDL8EHEX8zIQ7qMd9AAmuW5VQEhIv8Slx+XOp3wMA/mg8rTtrHHaQghDA1BNtJLeohrmCoblyPqXeiV7GPxdaqJw0m/Pcf9eX/bhGXC9Tk8tEIoOVZ/PY3UOOODdx3egO2Zara/dC2p3cotu8MIhFM8anwLBafGqh7MFXlkrWa4qkp/JnBSrelWb0UVY9ETp5MdPFM0xf15de8GwSaKwxwcjheptv3czDOTtY+4qyU35VVsK/8W2QtT36lWZSuRdr4looqR5/b1e8u+b4SKcG7LK/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:07 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:07 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 10/19] hw/9pfs: Add a helper qemu_stat_rdev()
Date: Fri, 11 Nov 2022 12:22:16 +0800
Message-Id: <20221111042225.1115931-11-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: cd8291a2-b08e-404c-cc4e-08dac39c6eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weqdMuaU4rLTWxxIcFnxNV8I7749zyYQTOidXiq6jiZV08ydJikYMhJJ0AEC7XDGWA7BHMJ3bCRcxHRz/V9Wz8w8MeKSlC0HfN3MALK6ro3wuTQ6Sx7JIief+9rAAGU9NOen5wemEitoojuWFt4gMt9WS5okijLKZi+aWyux5FMEpAlxF0aQthcGB5xgX1yccBmY6yNyMsHMsk1ivkaXYVOq+jYAl2j3iAUGPmfvlbVIBM3tKK6/aLX8Z+t6gGhgH7uRcpHqCIhfVLb+jt2/+AD+V/3JS9vfGedZ8AIDfHDg+IXeRihGhoWSZ/1vZISB4X/OOfbKfmwSPORJ5KTEAy5O0ejnhCEsCdH6zI3NpKP4iUm9wq+uLfGOg82BrKvErhl17Fg1+tYUmTIP7aGPe/gxigRA9JRmsXH5COKxBh6SpaPK7sXvDI7d/x/Fk4Mhc37PGrGE4uZMNE8K35o+LyYBV3IxKIfIi1hX4bhl5KaKcM183zVSoQqqfnYzfidLQFqwK5hKbjH8DbHKqtsfs6LgJh8VL3UnTasvqeAyM0wEv8CoUHWoZoPgBdEi3iSnVbyWNMqpK+G5kESd0Pxmz4Iqt+iAreodJhkq4VIHQiaO2/EyOu4wW7qKdOoSiiWiaGyOMdw7yWsoFqc0vQTId+zSUWYoqiNN9xxg9TYuErrF5nbhfLg7DsgoKvZhJ9p4ZcFiMMlhBP14tNBgiZGkEf7h2OM/68PIJt0bTZj1tosdB4sSQ3h5TQX6aAB+MT4kGBr7XNm+Hlezrilcevh+0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJcoGYHiHzlqo3r+IZyGZ1GPCZOMf9KtwxMYltFAkJZC1nBLLxG7T0m5ktiU?=
 =?us-ascii?Q?AZJQ3OXcNMNS/cBqtyoO7BUvzzzelJ9Hrp/s00OgqUH0V3dwTPoxrpBCIBK8?=
 =?us-ascii?Q?9MucGZyCL+VSji2Xm/Tr/hCeoR2lhcTeQA9Kbl52L6p8oHKK7EeUnhPb2cNb?=
 =?us-ascii?Q?PJTqGneNtwm0iw1HZ5hUmkmjRRYNnmdtBhMT4ikv14DlMBv5WanhpX6DxejP?=
 =?us-ascii?Q?JNXiMO+z2pKcUexYyLcDU2vpwdE8s5s0i5G9qON2sAxVrI+s+jZWYHXk+NAL?=
 =?us-ascii?Q?GH7WiJopP2nJtD+EzqZwmL8eHAuVbO4hz2/a56z/S28sYg6sOgpPbwQRhpvG?=
 =?us-ascii?Q?3bXZKJOxfyLhTK4ADKEL0f6I/hcQD3nn9LW6nt56wYB4SdbJDikGPclLIAXW?=
 =?us-ascii?Q?KktS5WVuNLvU8A1kN5X9qEH9hpuId4ryuoOP7nQetXFJXW9kSpraONdodYn3?=
 =?us-ascii?Q?ayMnKWwj0HLIjR1vbQAzS3hbW4laUb1SdnJMzq0jZCTWWjBDPlcH6Ms9g13U?=
 =?us-ascii?Q?H0U7peh7FYg1vSFTwc9wUIIRDnHk0xQUMvFCBNdhbGXpOqycvE5FmnYJuIuy?=
 =?us-ascii?Q?45eXnQqWiJOkidx6exOhHnpF7Z6z6G3umACqMcIGfsKP5wtbzMyi0U5U368d?=
 =?us-ascii?Q?BWQZjMUSVnmz1uRs8HeceWqjoY8uQnjh5Hg60L91invK9ANxzq/ZKgdAf5mI?=
 =?us-ascii?Q?fV/P7EHZniuRaa+PvNNGkMrK9sOmOvhcO46uZewd3Q6AC5zIi5ptzHsd34/b?=
 =?us-ascii?Q?Mcy9SCKKpOpoN7oIgt34iZJmBbqWO+gF154PMmFblXMKtTCpT+UW7MYi7tVC?=
 =?us-ascii?Q?M//IQoP/TQz1857PaUX4YzXENHYh5D4AYP/PzMicDQbvospuqLXvikw/wTTR?=
 =?us-ascii?Q?H3YEZlP6lcJPO93sSnPmeOtYMC03GL13gkOT+OMLz0Ik1IcsPTTtGd197B8p?=
 =?us-ascii?Q?1BIL+Ze8ifjdhjAg0gVo7eCSvD18kWR85j+LPDXHY91KBWkUHVo8HLrgP3d9?=
 =?us-ascii?Q?QRLXzHDbEQnczS7F5uN8bawjv9OywHtSGtwOFl6yIhweH50AmwR3kE5f5NKK?=
 =?us-ascii?Q?JOCJ2ndaVME6LpR1N28QFIgoWB4ntY4Nvj2+SEhWyDc3dQa5G8HzS4+EubGb?=
 =?us-ascii?Q?fixHwcf/vbe4GFTDvIb+tBfupD7SbVpBi5JV/piwCMYsabNoqsqZJ1p4wSp+?=
 =?us-ascii?Q?fR2iv7NGIwkisgXJd98T2wrOx9ZZ1wCuBsMQaOzzKbvybQDErXmF8D5NRcPJ?=
 =?us-ascii?Q?kEX1URAXe72AbEA6nlVLafjrWyF9U8uBIDotDN9l854dQ/HjgVE6EhAV2Ahn?=
 =?us-ascii?Q?M+cQ11aGecQ9kbygCglkWiMsvnqmLAKvdYWR2OrYOXetE1rsuoqSTM3xjsvf?=
 =?us-ascii?Q?sAXh3dCEEviNFJTRa/zsdtjb39IokG0jF1Z92ZHDjkuEYi6oxkr9VxkmRh+0?=
 =?us-ascii?Q?5THEviJckunX06yAaQ3ui0lI+qDnijjvJ4NNLB+i8E+9QSREs6ErBpuF/8h6?=
 =?us-ascii?Q?AuC6veLeHZU90v9CI2KKICfTs2KPyOO3j2ileZ1MFyuGYbR9YiXD35YI6cT5?=
 =?us-ascii?Q?k08JgLDuWH0XubkEZP8awJXTXaPfppvjlvp+YxKS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8291a2-b08e-404c-cc4e-08dac39c6eff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:07.2168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvcUva0u6wMEHw2Splb8awU/3U5CTbFfjfTTXJSKAR2ldkvAgmAD8jOiTiS56QHDAJa+10yyJ0pIHD7fst2gJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: OBCfC4okHcOWlTDB0vyzypLkD0IaGLpC
X-Proofpoint-GUID: OBCfC4okHcOWlTDB0vyzypLkD0IaGLpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=765 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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

As Windows host does not have stat->st_rdev field, we use the first
3 characters of the root path to build a device id.

Add a helper qemu_stat_rdev() to use it to avoid direct access to
stat->st_rdev.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: "hw/9pfs: Add a helper qemu_stat_rdev()"

 hw/9pfs/9p-util.h       | 20 +++++++++++++++++---
 hw/9pfs/9p-util-win32.c | 15 +++++++++++++++
 hw/9pfs/9p.c            |  7 +++++--
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 892465b392..c424cb00ca 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,7 +19,7 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
-#if !defined(CONFIG_LINUX)
+#ifdef CONFIG_DARWIN
 
 /*
  * Generates a Linux device number (a.k.a. dev_t) for given device major
@@ -51,10 +51,12 @@ static inline uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
  */
 static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
 {
-#ifdef CONFIG_LINUX
+#if defined(CONFIG_LINUX) || defined(CONFIG_WIN32)
     return dev;
-#else
+#elif defined(CONFIG_DARWIN)
     return makedev_dotl(major(dev), minor(dev));
+#else
+#error Missing host_dev_to_dotl_dev() implementation for this host system
 #endif
 }
 
@@ -130,6 +132,7 @@ QemuFd_t openat_dir(QemuFd_t dirfd, const char *name);
 QemuFd_t openat_file(QemuFd_t dirfd, const char *name, int flags,
                      mode_t mode);
 off_t qemu_dirent_off_win32(void *s, void *fs);
+uint64_t qemu_stat_rdev_win32(void *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(QemuFd_t fd)
@@ -251,6 +254,17 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
     return g_memdup(dent, sz);
 }
 
+static inline uint64_t qemu_stat_rdev(const struct stat *stbuf, void *fs_ctx)
+{
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
+    return stbuf->st_rdev;
+#elif defined(CONFIG_WIN32)
+    return qemu_stat_rdev_win32(fs_ctx);
+#else
+#error Missing qemu_stat_rdev() implementation for this host system
+#endif
+}
+
 /*
  * As long as mknodat is not available on macOS, this workaround
  * using pthread_fchdir_np is needed. qemu_mknodat is defined in
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index a8b8b8c832..44c10370ae 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -939,3 +939,18 @@ off_t qemu_dirent_off_win32(void *s, void *fs)
 
     return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState *)fs);
 }
+
+uint64_t qemu_stat_rdev_win32(void *fs_ctx)
+{
+    uint64_t rdev = 0;
+    LocalData *data = ((FsContext *)fs_ctx)->private;
+
+    /*
+     * As Windows host does not have stat->st_rdev field, we use the first
+     * 3 characters of the root path to build a device id.
+     *
+     * (Windows root path always starts from a driver letter like "C:\")
+     */
+    memcpy(&rdev, data->root_path, 3);
+    return rdev;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index be247eeb30..7080503b97 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1266,7 +1266,8 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
     } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
         v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
                 S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
-                major(stbuf->st_rdev), minor(stbuf->st_rdev));
+                major(qemu_stat_rdev(stbuf, &pdu->s->ctx)),
+                minor(qemu_stat_rdev(stbuf, &pdu->s->ctx)));
     } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
         v9fs_string_sprintf(&v9stat->extension, "%s %lu",
                 "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
@@ -1340,13 +1341,15 @@ static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
                                 V9fsStatDotl *v9lstat)
 {
+    dev_t rdev = qemu_stat_rdev(stbuf, &pdu->s->ctx);
+
     memset(v9lstat, 0, sizeof(*v9lstat));
 
     v9lstat->st_mode = stbuf->st_mode;
     v9lstat->st_nlink = stbuf->st_nlink;
     v9lstat->st_uid = stbuf->st_uid;
     v9lstat->st_gid = stbuf->st_gid;
-    v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
+    v9lstat->st_rdev = host_dev_to_dotl_dev(rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
     v9lstat->st_blocks = stbuf->st_blocks;
-- 
2.25.1


