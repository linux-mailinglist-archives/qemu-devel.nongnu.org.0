Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D5625263
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZf-0000Z9-1P; Thu, 10 Nov 2022 23:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZb-0000Wr-Gz
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:23 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZY-0001Zk-9b
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:23 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N5DN004957; Thu, 10 Nov 2022 20:23:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=z3rAyMTrdhdHyeeGQtwrC7054GNebIFHAns0B5YVblA=;
 b=G+FlcXP8QJF3MmYyeA807LETcQpZgRV5+x5opYVeiKvohKos7ITGhHs/3+LH5UCy7Rvo
 utmX1yyKLp7Ys/IhFSIMjb2t3kG6ZE80a+DoFV2DtVG7AWXec+Hmr3EzBls6OWAYINQk
 8BGKf4aBoS+9W7qaTh1QgubopWnMFBhdJd1MGXfYfGwZWsL0ftKfvcvWfWt8wNORdGgu
 X3NDgUL8DB6rPTUYz9225HcCT2uvx0pe7hQzD41G7qP91Cv5l6NvZ0xo1XzYs3/MU/hp
 fMS1Z8YC6iyvcIn3euLWSM6PMtH2kTt0qTfHN1tnoTH8HecZDC8x5LBrtsp1dkM8urXk Zw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9m3-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckNkBPhuP4oLGLQ5r26pm91umSaocivAg5J9QetWyz9+Fa2WW3dnbN4JHuCdY2KpFdxXhashUqtm+Lcjok73hza38ZOE7d/F1EFjDO7KB5PzC94MrF/MIOrkFC9k5z6c6TXHneMDnLZR9b+FnYRwv7TqZirz2KcGv91q90EmwDo0/pM6GK/ceXrmY1J3W4CrnVQU4AHP82YAdVZ14YPcUudn9iKr1Y+4qy7I4tgFmt4a0qziuOndD0tLdiLW9pgMhqFI7PQUR/OC4aBNdRxxMygjLST1mvMPNohT6su3faLJTZUUYqZuPY2zb162fo5evZF/mr729NHvbOlna/xv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3rAyMTrdhdHyeeGQtwrC7054GNebIFHAns0B5YVblA=;
 b=Ag6Rv4muWedItukdE1rwH9C510/sBbXMEPtQWSqj/DtUwsCUaD0Fd8CdMFBJaGRVVv1vPbgq4QcfxpXmeGTiJyR1pV27hI8J2Dqv1UwwH+n13CoTZAJQCOcycIRX1zLOVHGfMf/F2ce7uRcTV6fQUJcRGCzrOvvWCigFJI3Lzv2NswwEqLjklFhYT68RsnZYVcmlkvC9iFQRvLL9+E21gxPn+sEq0h71gLpPYMIurNH65V7uInCt8lCLh7Nd1A0c7sz8Fjq6tEb75QeM3WU9y/1lz6AGnPUgDGlPs3A6DhOz624m8qRIjAKKhG0SyCJknhuR4XLJlqcTzFkhecbCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:05 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:05 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 09/19] hw/9pfs: Support getting current directory offset
 for Windows
Date: Fri, 11 Nov 2022 12:22:15 +0800
Message-Id: <20221111042225.1115931-10-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d81e8cf0-4fd2-478d-0528-08dac39c6dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbwEu2biGRf+B/fWSbtQ/ZAPQGNxa+sb/eQb5h3hIh6rAHlxJ346Hm/cMrVE3aBf7wPLvfQooUMhGtSkmE3346Nd1ztGZOtkXy/odh3csA2Arzx8i0M7MhvZNxjqI3rML966NfHv0yQgU0koRQPNqKq7oYljquzBzDSJ/tDvjAJmV6+hV9tHd4RqEEw3BbE9CE52H9jRUkJGy5IIPMhvkWdfZUBWTL6mpHz9Ap8vpb0sZ81uDSv/tDKZC9kVcwp5gBvQywZORH3Dk8lfUYLtoVJaX97lcU7gYUfmOkqw6No6hSqoWEzPorWuSd5GaM1+z0GkUnDiOvTopcg8QA+ZUlhSoTB0Z78HQljmySTBX3aMnHeHE9YLF2zooiaw+0fm/9ZamPtlTyzEROtQ24XanXEJw77B4K6phey4sM4NIm8y7qPdQ0T8yOBrhsKqYHJIe0t9/ZrEelsKNLQktLFaQyC97j1O/DDTChxpLinlERHCnZ9mEjDfu7/09QPpQrrSUg4q/Ss7znLTnWb6TzLA23dUZaHU6it40QpfJDkvmCrKdRIAtwIcPHl4Ah6HYoY033lVzX+GXv0KoxbwznMdfiPrIUv+RpN9EdI4Sqwic5EksDX6i0x36a/Z1rmlL5S0Hj35Jiyqs7InpukGZP37TPAcpFmiiQtMD3s4lrctC37WaVdK9oDJ4x+xf2w603YCwee9NwNfv3Yt/dvcZeE/e5QWOtxNF6fOy9q1nu+c3ozxQhU5x7gYhNR5ozp+xqsDciXss19eB1EKkMXTT+TOBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NXaXoHG/AfTMfyTXqc7yRvvRl6mLfxxi/HY9DECg0DUh92TYYPGTFnIyFErI?=
 =?us-ascii?Q?IoBkw+pkFG+zowhHn+EP/znB2rJgrezUliQf8zYGhvzGmqq0ivxGMwRIu4xA?=
 =?us-ascii?Q?HTRz3fjTj7shDN9S62rU1aHEHJw1B4wcFUje5qq9k78SYBK0G+LPBHu+g5UT?=
 =?us-ascii?Q?hkdhqUonUA6mEGbOOrHnBnPBDikuE6e10ACX53NmSu1mcG/UqcJLaZoEjEOz?=
 =?us-ascii?Q?FSkX2Z6l0qbPrb3wdBDxKnPBLY+mhLawndJ5QCjAjyhp+O6EpjwQ2VGkuVkf?=
 =?us-ascii?Q?SJUJKXqcosEvB8365z+/lo3df6F35+AfJsDhdQZfEBrR88ac1Bzpc4KlAT3g?=
 =?us-ascii?Q?4WtQR0VhkRz1ahMACOiJbg8tJ5hE5SLcF6gkCTqpiK1MxEhkQfToncxYdeNW?=
 =?us-ascii?Q?MFaVQsfM1SFlMawgzgKWEvUzACUJIvNbMyOGtTdIMNUhB68Ua/mcJg/GZ32i?=
 =?us-ascii?Q?R6dO9pA/uVjZARsJQDiFfQzSuI6Traq9C+Z1G7RWUWtgUrSUUI33SzotO21i?=
 =?us-ascii?Q?QQoSM31L8imQP94Q2cqUioAnv5qzbiFxCcbJqMmSu/xzbV2JRax89YEt6uP1?=
 =?us-ascii?Q?rY6SR0+wrPxkhFdo4qo+/RuTqEf2d0bWq6JH5QFWj7k68kpEm4eWn6Ehh4gC?=
 =?us-ascii?Q?GVRFMewEb/916Mx95r0iXDvuZnqOuDDSMDl/hq0MD71UKClkZWCRcPVRTbko?=
 =?us-ascii?Q?/tgGdMTYATmWZoCC9kUDXByDuc4hmTIFzI31nAtKm+MoB1G5bzyACTYHcpfM?=
 =?us-ascii?Q?nCMBpz9WfYARDUb0TEAKZdHRq8S4b1Z4Tcz5KWB08tDYe1vaMh/4GflgIO71?=
 =?us-ascii?Q?7c1rBS+9JwHHShV5eFv4NsF743QQPBb+a3m9yv++kwgHJd9TNDIXGJLa4g22?=
 =?us-ascii?Q?4De0GgNoBoQipTlLYBkh7v0zk6bptJt/8g6zkx+mCKN2y6kMgavk7w41jmyb?=
 =?us-ascii?Q?gKh6nciNM4FaDsCBtn+y39RqIneTR/uHoQGGGKoO2gDmKYr9YTIeLV6XLToa?=
 =?us-ascii?Q?f08CRfw7Ou2u7XgoNraO2y73XlKosU1K041wPK3HbSAeT46TEeOhaZSyvfj0?=
 =?us-ascii?Q?Trg5MSwcq9ZlKVAw4S38MpjOn54ph81gczU2L0kiAdvi8OvSoeKl4+3txf+V?=
 =?us-ascii?Q?j9tfTTwhaGARcpCX9cjvhm1G16vbK9AZw2SPNSaxyAGqxTaebLtNfrkRnrc/?=
 =?us-ascii?Q?OAZ/QiyC3570eKsXCRprdxTwLJ92DUtaGVdGsZjG+zG5ysMiT2kQPOjdagMP?=
 =?us-ascii?Q?QRkYxmxU2PYfea5DhY7S5jng3OJ2twNMMatusWoKGGq7Q/Dciw6UXWKyHrcl?=
 =?us-ascii?Q?tirU4x4RpBTfq3GLWfFMlN9vWEOFluHxd6AVfKTb6KUEYWF8zZaUrXKMr+qd?=
 =?us-ascii?Q?OfqQoRsG11kV4VWf++LiTqW0yye73KoV5WzJ5mOgjhSohjuoyPFbM5tsLtX1?=
 =?us-ascii?Q?vLfBAJj3tAJ+C/Gf57paM8e+q0eqIMVujztnnVTbwRjljdTweSi6BmOQ8TQ6?=
 =?us-ascii?Q?S2IeBVhb6LgkLVz4jwWOF+rtqoz24OdV+fDsVEfmH2qR8uncdK2OrPHAjlHW?=
 =?us-ascii?Q?MRwtqbZReXDPCi0dBW1T2cm193lMcp9B77gx1G9+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81e8cf0-4fd2-478d-0528-08dac39c6dd1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:05.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ow5INxa3EGC10b7j/W9Pnyb09ZM07AyJG5/EWDXemDRAD/Tdb8sEXoJ4oGQxniuCI2MQ6l4BEqSVj4J+/oYhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: cfmogL9k35A_b86nCjOWnuKetLx9D8lP
X-Proofpoint-GUID: cfmogL9k35A_b86nCjOWnuKetLx9D8lP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=886 lowpriorityscore=0 suspectscore=0 priorityscore=1501
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

From: Guohuai Shi <guohuai.shi@windriver.com>

On Windows 'struct dirent' does not have current directory offset.
Update qemu_dirent_off() to support Windows.

While we are here, add a build time check to error out if a new
host does not implement this helper.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Use qemu_dirent_off() directly instead of coroutine

 hw/9pfs/9p-util.h       | 11 ++++++++---
 hw/9pfs/9p-util-win32.c |  7 +++++++
 hw/9pfs/9p.c            |  4 ++--
 hw/9pfs/codir.c         |  2 +-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 5fb854bf61..892465b392 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -129,6 +129,7 @@ int statfs_win32(const char *root_path, struct statfs *stbuf);
 QemuFd_t openat_dir(QemuFd_t dirfd, const char *name);
 QemuFd_t openat_file(QemuFd_t dirfd, const char *name, int flags,
                      mode_t mode);
+off_t qemu_dirent_off_win32(void *s, void *fs);
 #endif
 
 static inline void close_preserve_errno(QemuFd_t fd)
@@ -207,12 +208,16 @@ ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
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
index ed3d519937..a8b8b8c832 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -932,3 +932,10 @@ int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_t dev)
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


