Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C1625267
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZf-0000Z8-0P; Thu, 10 Nov 2022 23:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZc-0000Y4-UX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:24 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZb-0001au-3F
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:24 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4CtKE030334; Thu, 10 Nov 2022 20:23:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=vsiZrQUtUBTAU4WuT6dlDDfQS+EyxZPRhMhDYhmH78c=;
 b=Lc4uOYIRgDL3c7nZQl0EGTj4JfCvBIVp/qvLY9cPuXMISPfY0v4ojvNg0TREL+XhxIAh
 rDRZ3O/6EWVm9kxhNL5aFgOJUGj+yqhIuamw1gMcticcp4bvtxnTF63mF+6LxALeLn8I
 ts9d+WBjg90cGVPq0pxDKKx4ZU1hL4cexNdTVrj3yBzHKFxoI2Jg6G8O3tg/3oDQvzIL
 AnWq64DzArFN4nIYVM92ZdRrKoLayQ24sOZtC3Ebl+AIv5knGybQHQsnPEDsMpN/KqOZ
 JLKITzvJVLPv1ZpKK14IG0aL27TQ6ee3neBx0v/mkfXoalyGe3q6oOU9PwzzRO/lt6Ko 8w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knqbkn4dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bW3UdsDtgMzEhGPtezXJEnl6X9dxSwbVKHK8OuIKD0Euy+AV57kL8D/rvqy5Y9+sb1ByZNPsRYC1rJVOJcpPFOsI9qkyBE9eqG3qkCQhMZrvtFeWVRrCrH+iZv24mrqpVpWGF2HjpQR5WgFwd0EBJGkMQGWfLlgSxFI7GEB0MHs1TzaC3YsT9Ir9qquH3zputonGSdXBNlajIqUcZ6E32hAwmWENNqDdpvxGutRZx8kmRW9+BS9j+x+whp9FLePLwjahjmujB5lgi3QzDAaeFbTQN42p9IBWr4Qeq9CTzDQhf4nxCknNfB2EPtrTMuJby0PlR+1X1UnEQjWbefZyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsiZrQUtUBTAU4WuT6dlDDfQS+EyxZPRhMhDYhmH78c=;
 b=WJJaeIkcb5MngxTuqJefQ77KhoDrt1kFSbFTtKXbzeq89gz4mrPuIBBL6aBoZSTkWMXp1ODZJX/3XNA1Bn56eUR/vmjeoW2i95S0FCLMUrfqJUuCJhBJAJEGBO61rQFpQVNUaNASNGxgfV4kBEz/KPS+Dv5iZZgU6Ug1baJgjbZ6QdNCojMqk6r/+8cVyIU4xPGfseYxliedUrj03aU/02wGEk5mQ3fOswczz2oghTMJOW8Lvwy3f3agp+bRAMH/qRd8E5EVOAmddP4uS7b1jBmYyiKhm+Iy3PaMr8Zia/sq+x6H6RTFl91uG/JNsg0MqtqArZjjrL80YZE4iauukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:09 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:09 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 11/19] hw/9pfs: Add a helper qemu_stat_blksize()
Date: Fri, 11 Nov 2022 12:22:17 +0800
Message-Id: <20221111042225.1115931-12-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb173cf3-1aa3-40ab-ce4a-08dac39c7027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8Zc3lYhpQAFegh6UE1rOaNb7PsuE+XmPJDvhMKtfmEQ4DHKPE3FsrhTK3OzvfN8Qs1jWI9KKUjp/hN+sSzNRp9AIIxkK1FBZAq27gc6HtZwoJ3AlRS1GjGl7MBXaGgYugec2giqgwZwT60swGbdnBP7x3rZ3ceiM19KMcHAMbFK1frLXC934EqfgbscYG15E0uSVfJqvAkdLHiNxtn/Scj0FuIkgsGvR4FtaiiygYnUi3PSPUixXRg1S8huUm0Wi1SEuv6nAmpb0toY/+WrQ81+4h6AVsTH1uh73c1Nn6qTfXSh/TUDx3i5ZoBgAXxJNZEk5/dd0ZQI1NJtWcWC9Q6eSinq1qoQehjIztvQNmsVIEfo8Z5GMcr7+mkeoLBIopdEG2HzJaDx29LBXUY1rxtUlF4dLMVnNT2A7aoJnH90EpveSTAygdCiLwX2SyouOuf80xLxSMpyAj13bNxNcW5FXdPb6qB5PUFrjVunuc1Xk/3HRGPdPCd5/tfWbl131uNpaVYYg7z687z8iAoCgeAyC9LupKtnSH5TgEC12jfL67MSyrFT+xWWJEiXrXLY9l5aUItraOXhcfHxMVt51YSd0nDDQreOWj0liOJ3sKHffgvRPeorZFpeW5O3IBAC7vqbJZ17XpTFHsb2MBXqaDpvne7ayXlryRNItCob+4t0QambCyGqHAzCMb7pFZKodBbJKe99wBVehY/GmI8soWmlt4AcBSkNkZQu6IFpJe5nOFBog8DqLqua0h0bjPryPpuyq6XBXuPLIOUKq3kHeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Em+47rLHY+klanWxWV2j4FgoEqjTSvNfmGfz9xLi7AXIx4i0+RrWdUyXLhQS?=
 =?us-ascii?Q?sSBOxcTO36oT3snkkxRKsJtsqtr6yTu/vjSF4ZMaAx0nRGM3adr+zgUww5ER?=
 =?us-ascii?Q?yqIJf7cLbo/kQ9M7zfcVGJp+lu5DRyIFRjy6DmMDF2oDJQm9yy2J3Fl98oJf?=
 =?us-ascii?Q?DyLOyspreHxoV717zuOAtO5KgZts/+nLOgYTxWR9cwnGptRpBHHcUHUeK5pO?=
 =?us-ascii?Q?E7MZOrR4kU5GHPQUR+vGkWb1Mk+EEy5X1y3ZviTI4VfbF++0kHNjGOEUr8aH?=
 =?us-ascii?Q?erNYrg9AE9DvQFu+OlrfdoICAjRKs5pWlpOvuRPext7c8yMd+RShxI2CtiwQ?=
 =?us-ascii?Q?NujUjpRoQsH96C1yBdacESLHQKFtvmsgt9jfTP0hHhkuF5k1n6dSJSDJE2Oz?=
 =?us-ascii?Q?hr7+d55Km46BWhGuc9wBH3rO0l3zgUsKaxqLGslEHmiYg6Evda3cuzvfCnsD?=
 =?us-ascii?Q?6LxwGwUmALMoATr9qWBnh4Ozmz0MaZrsW6pJKkiFI1HZWIPznp4Cjd5jWB75?=
 =?us-ascii?Q?raMxwwCbyI4NFeclPhXL/HUMEKIpH8QAiog7velt1BQpWwPoGdohbe2Wwt/T?=
 =?us-ascii?Q?Tz9+iuWA29nPdChKQpfPxqy2x0hEe63ANHfJKmzVwjJYjqO/1UVKVR1H+O2T?=
 =?us-ascii?Q?G9tQ5JkK5rxn5sivfCYg/uVw6P1i0pRNfMP1ug1b66db/3AB+pOB8jX8larv?=
 =?us-ascii?Q?iM4CVq65zhsw1hywd4ERznhyg05ltbX1cKnWVBDyoDUhZlcsmHmL8i76BzM+?=
 =?us-ascii?Q?bL6MYQYW00np2cgSrD9vcC0gIs5DpbVqTumFULpjKA3ozbIyPduML5nBQWEJ?=
 =?us-ascii?Q?AY1Z59PmNagvjxdmQdhfAgRUSK4X9BhcvHMnOkr89IfLPo1LCnAkA9CNmvF3?=
 =?us-ascii?Q?x79wQ/8BsLbFJ7XEFObTXRbXNl7zV1taQ/LWZlOnlhDQ86smyPTmQkPR11w6?=
 =?us-ascii?Q?obL8fPVw4qJ1albRtBnY08eRV/f9i+MGSZT6G0tFKsA1rDDhqLOpVuN2qn7V?=
 =?us-ascii?Q?NXz5k7ixBWdynZZVJ3otslwSi7vXEIOt0EM9aHQqBbZGstu8V792NksMEMA+?=
 =?us-ascii?Q?0TEaXyf6j0wvasqOvhpXjPgEpGJUYYIC7qKoVDIBnbmXJuHwe+Np+4uXg11r?=
 =?us-ascii?Q?mWSJKVUF7FgfWCJKjZ5VWpXQzZQJ3TXH/B/M8ZxNN3KIjU/GhoalOSPjjd2+?=
 =?us-ascii?Q?BIFeHgEwg3x4nx3IlMjPiAvPeentM5Tgw/eCR9p83vLo0IS17DEvNV5lZmXY?=
 =?us-ascii?Q?d0KHvbYqGs6o9rgPbXL45Sja6SgC13GTJd9WCYNiAfmuy62j+7Z0xhJr6w2I?=
 =?us-ascii?Q?hQQbvax4HVflOzlVPbyxyyGpAYVwSj0yMKP/AjFxOqFFAGmwLcrUmmgc37zz?=
 =?us-ascii?Q?/fSFTvxNwvI6MDcu6M9XJd1I/IMRPg+iKdimJLDtqGUfoFmTjvFZHNhqzQU6?=
 =?us-ascii?Q?tVVyonrDL5LUAOQo8AuX/tOZXmcnB8ce4c6cWSUkH0oll5b3mwES8RRhHIcM?=
 =?us-ascii?Q?Ojokdtt7BnZpPPs3QSbxIlfsoh6gzP0XwrXbHOIpuo+oVjRKUH3/BcBhDzuq?=
 =?us-ascii?Q?OL3cn1VgvDgXWErttLktTWzBZ4XvYCraqH7lJJxe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb173cf3-1aa3-40ab-ce4a-08dac39c7027
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:09.1567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTcHv4qHEjEK7WPoiUkZKXMI9WOW4SQEYxCF6aRGEX+NERxAuZpisRHmCyEzPi2cdKDHBTuWAi68MxDRbwCW4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: lQBsYuNd7BF1-sP5PLSKGq4tbH-jxYqf
X-Proofpoint-ORIG-GUID: lQBsYuNd7BF1-sP5PLSKGq4tbH-jxYqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_02,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=784
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

As Windows host does not have stat->st_blksize field, we use the one
we calculated in init_win32_root_directory().

Add a helper qemu_stat_blksize() and use it to avoid direct access to
stat->st_blksize.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: "hw/9pfs: Add a helper qemu_stat_blksize()"

 hw/9pfs/9p-util.h       | 12 ++++++++++++
 hw/9pfs/9p-util-win32.c |  7 +++++++
 hw/9pfs/9p.c            |  7 ++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c424cb00ca..df84374b78 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -133,6 +133,7 @@ QemuFd_t openat_file(QemuFd_t dirfd, const char *name, int flags,
                      mode_t mode);
 off_t qemu_dirent_off_win32(void *s, void *fs);
 uint64_t qemu_stat_rdev_win32(void *fs_ctx);
+uint64_t qemu_stat_blksize_win32(void *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(QemuFd_t fd)
@@ -265,6 +266,17 @@ static inline uint64_t qemu_stat_rdev(const struct stat *stbuf, void *fs_ctx)
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
index 44c10370ae..064f878e5e 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -954,3 +954,10 @@ uint64_t qemu_stat_rdev_win32(void *fs_ctx)
     memcpy(&rdev, data->root_path, 3);
     return rdev;
 }
+
+uint64_t qemu_stat_blksize_win32(void *fs_ctx)
+{
+    LocalData *data = ((FsContext *)fs_ctx)->private;
+
+    return (uint64_t)data->block_size;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 7080503b97..169578cc1d 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1335,7 +1335,7 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 
 static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
 {
-    return blksize_to_iounit(pdu, stbuf->st_blksize);
+    return blksize_to_iounit(pdu, qemu_stat_blksize(stbuf, &pdu->s->ctx));
 }
 
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
@@ -1352,7 +1352,12 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_rdev = host_dev_to_dotl_dev(rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
     v9lstat->st_blocks = stbuf->st_blocks;
+#elif defined(CONFIG_WIN32)
+    v9lstat->st_blocks = ROUND_UP(v9lstat->st_size / v9lstat->st_blksize,
+                                  v9lstat->st_blksize);
+#endif
     v9lstat->st_atime_sec = stbuf->st_atime;
     v9lstat->st_mtime_sec = stbuf->st_mtime;
     v9lstat->st_ctime_sec = stbuf->st_ctime;
-- 
2.25.1


