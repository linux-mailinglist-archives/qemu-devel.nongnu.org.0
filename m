Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D0680A04
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqK-000304-62; Mon, 30 Jan 2023 04:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqG-0002yf-SA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqD-00020Y-5b
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U7qdkm025000; Mon, 30 Jan 2023 09:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Ajqch1/tMp3Hvy9konbpmH0yUatw6197ofO1LywoORM=;
 b=RAX1h5mh68ZwcNFPlN9OdyyavFLbvVXyWmv3pJ4AnkKCxfIuYYJNQ5KmBNtZLBogl+XL
 kMnHoFRkz/CazKx+tLRzly+N4xmIKQW110sM5M1p42Z3Z3V5xnfjS5l24/Jm5N4CZeRm
 n5ADLvdGmvS7I75z1R9by2EAzcEg7pPpI8CkoWi0RZ+s+HIZ8op/oxXm2rMeJMSnQO3f
 3RuPgxYyXScfXQPVphSZA3NYgCOVhTKkyp0WNUnAqfPfWvpycCXutHmk2q0T13qeO+3r
 57HTAfQfHTTSQBp8UQ1OvADO5hfr9cdwRbndqkl1l9/sh2Zm7VyXC1cQ4J04mr1PkUTn Jw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3a45a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvNKRqHTrbrDk940nYpPHBDTG+q0bUTQXbnAV02vZStHZX0chGfsHHXpT+mwIwywND3qjFgGnr1GbDY0qtD4SquWpP34OoEZYpFP6lN6dHKiY3DIfsKHJwy7cE773akPzE5/yi3jap2PIo9LXYerqp65wFhp90jxy5eshzX2NzQMYsSLpYueXWRldrAp+RFKziY13n+RQOF+r63eQRoyom/e/vY3/jDfwRH4l7Jgi29RMIN63VLpAiaaNpkX0F7vKe4kXt4cWVjp6eIBNl8oTi5QiAodA8QM7nj7FdogPTflTDJ0PngUNTkIMIlVyCyQ4mkbjauhs+4lL3CDe0Biew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ajqch1/tMp3Hvy9konbpmH0yUatw6197ofO1LywoORM=;
 b=INSCroOAsR3Iujt7+8Nrom0P65nvYGoy7mnwrdybYLefgxI2Ms6wusloK90A+6vCVzP1KgRKJyOPjVYaoo8GfYFeWD0BUUccQfX1/1RVA6kubU/VKLCa8KttMp1IG5GwaZWAyqQAECwZz/t/YlJoYBh/3UPwp7CkbrFsZAJi9bkWZifOrhh1HlhxRVc2YXBMNs8KY3331XGSQ7V8sp2ibzcDSBBdcEwkVG3TON7/9JYQCh7C+y9NFQ4J6VYXI3CT2gUdPOB46rEDBIs37gXm9kTyJ2VIt1Fvg7k8zZC2VTrgZjJHIaubLly/alPG2mtN5Hv6FViSzHV9MBuINVaWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:32 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:31 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 06/16] hw/9pfs: Support getting current directory offset
 for Windows
Date: Mon, 30 Jan 2023 17:51:52 +0800
Message-Id: <20230130095202.2773186-7-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ab5f9c-dadd-48d7-a321-08db02a7b49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yin8cNGeCXPYkRWko7rSArrK3fdfYzDKdMguafuoo2HMreH+yce+hKJLgm7RRSlZtT083VraGy+Rx7DBy95SD9V0h5vCpmcclqn6N2gAgluzO+sDLxZ1MaPo3q4Sq3OUZ2rDmJ/5CLqH5E1fpHbHoYPRr4FSgPisY8y3HIjV7PZ8Bj5k5evKjHMrrTpSe2xvWEtU6D+qfOPqSNVhd5IYZsx/8s1bHqWa1sgyD0l29aT7r3+5tOmw+JsQErCUHvmTQ1DR/JqKplVf7eERwfliPkgMdCbWOpAfAZX7rPfFLvW9yR89TVrhvGyA6QqkMe+OSgcFai5RsVx0aEOVPGJqTEanTTD4hzhQOJzz7aVoR4Sj2eXnPMintbbBIhDQZbrEOm92Fzp6Hw9++irDGwFkAtnTSoS/2nntwBajHjCZDNOcuMDF6B55Ax3W6rI7XSbsUMSEONFawHxpCckld5qU9U1enQagvawihv4kthN+T7DJlXNSDQE2QEs6ucuDFU0Kcs5y4e84B5ZVSVhWhdfCle3cPF2RMIN9MSslI+t4FicyN0MlZ0Q6t4lJzA2+0QlXjO7RZ4IOQZ6FU4mSqr90vG+rx+Vxp8NuhwoR50ym4km1sSu4dJnOwFCYcj453Zt58ArKOtePrWowJV0TNWG9ad0UlLNn8gsybySRfubg0FnqCcvGPf4K4sAc8q+asksbF0s9/fNC617d6h060EQ+fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/f5NW7XC2+XK2BUfRrKJhLlMe7JtOr9ZfRJ+i/LZNOla71xGJIvcLP8MR1ps?=
 =?us-ascii?Q?DCY+QCWZF85mlFSLAYDBFAul7JZ8EgARj5BsBDBz+EmXYRQ6Kg9X2cIT4+WP?=
 =?us-ascii?Q?FfcUor3zQKuyouRN0J1i4ruQ3ffSMDBiA90N+M1aHBdt7pVE/fI/1eo458ol?=
 =?us-ascii?Q?0gm4idQBRMe8xOwauXw9uxIRz/TuIywjrQFW4QU8Wf8BixJRgRgDPMJkAoW9?=
 =?us-ascii?Q?rP3/UOdPCB+p0J54OTx8ylEuFFoE64ewCo3lYYQRNylKPZv3jrNexNJN7l7+?=
 =?us-ascii?Q?VbwqbabUFQUARHCBCKJliW4m80c1hagSWqQTCkNBhrKwo0idTJh2QAIFQgHx?=
 =?us-ascii?Q?o/4kHnrMgbu8fJH6egAlwPsUorHDT8Zb5JPbWKilV1M8FEbfruV60lairBrX?=
 =?us-ascii?Q?xUCTppEBBiLUvtFcLDJew0X5GqL95oqaiUhqjNI27unChYXDEaN1TUSimpdh?=
 =?us-ascii?Q?YbW63zC/r8vXyEBVJFKtVsuopeTc3Z0Ugc9cacDVhvjcNFV6b+5lrwgOIh+T?=
 =?us-ascii?Q?/pWO8VTi3XUrEvzaaXgg56es0/jHZNJueOUIdJYO6zA4rEzuoKL0hT/K/FkG?=
 =?us-ascii?Q?Eb73hrpI1YLxnIBaPkS4YO96wX7dlXxg2GHOCr2cTGbhUCNToOs0XetoU0nr?=
 =?us-ascii?Q?SvqYSk+uEXCnOLgJ0QMbjOV69wWJR5GYhOkxVnO4AfdYj3QOiDq45k99VgZH?=
 =?us-ascii?Q?SR0XcVKcLCvQ5ggM2P+n+M+UkFMKs0XLFmZwtE0eL2ZkgUL7iq0vazHcDR5S?=
 =?us-ascii?Q?9FUmXGh7PSUwzthkS2M2qDHZm6Obyk7ZVjfJLIZp2TaY4E6j16NfD+EoHpg3?=
 =?us-ascii?Q?xbXlPXM0yQf3VB4FULVSbO2pFfz6IJ2TURscuhFutfn42AGt1VHWHQvcJ5m2?=
 =?us-ascii?Q?RR2k5gz8gF0Kh+tl6HGQtUASKn7MoR6kkY0PTdC7fdrgJUywRBUO+KgOpBmM?=
 =?us-ascii?Q?NC/lG2nMHr5MkmDXh5a13DeG6LxaF5uAxP490oNgKF8EIj8AqwXvmCrfxwPI?=
 =?us-ascii?Q?ZhwWC1s+GvKPZsS7qBAjmk7BmKqqNkAE6vnTILnlHacKv1BrZpgo5ND0RLyU?=
 =?us-ascii?Q?/wrmW6P85njFD1fZxt8CS0iA9bF0QMIDkcVMYDSi/SSmIE+woyprIY9iLkfO?=
 =?us-ascii?Q?/ft1TJcdANqGX/lCsXVdaVRgGRuwcB54/yyZ7IfXV3qoU4ZZJiHM+sZgdayL?=
 =?us-ascii?Q?eR0Fne1pLCobX+Gz7kakX8GialQ+7gJPF9DXXPiioTDQ0+KmOV/cm7HcPMze?=
 =?us-ascii?Q?kBUQOqM2Dj1/IpTcsNWI3aGSClBXpj08vpFD44NKZZRK6iWwICPLxcc9aT/g?=
 =?us-ascii?Q?dsCzftpl3tDD61eT4FF3yDzRpUHJIV3JYnoLOP71cwnE5zXUo7VVwmjaBmxn?=
 =?us-ascii?Q?7GTZEj+wQc/yoEX1DSsSUbUX9wDhsv9JiWmZT8rAXHa/JxMUsFhF2iXxIO/Z?=
 =?us-ascii?Q?PSJkun97Zpk/QtapwkIdQvfRIVmRh9Sx16NBfVP5V3xCEpywDIdioHOXv81Z?=
 =?us-ascii?Q?GOawc2xoz6LYTC+fDOa7WC7op3JcDfKYM1iesZvUBxaF3AjkIgqncXVBDeOx?=
 =?us-ascii?Q?VO9kaAiOtq9oDJzauuaaQemFe6yaRX/W7OjAsgzffx9GygL2hlveWEPuueGe?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ab5f9c-dadd-48d7-a321-08db02a7b49c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:31.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOIJbnV7XeUDfk2nBj1KEazdmfu1KeLUJ67iD58NJvEhyzPYY/81JzIN1omo7+5AnnERV1CJUfKTveXDDQMUPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-GUID: NitqZcDEcVqyVu157G339zvIkds4YKmn
X-Proofpoint-ORIG-GUID: NitqZcDEcVqyVu157G339zvIkds4YKmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

 hw/9pfs/9p-util.h       | 16 +++++++++++++---
 hw/9pfs/9p-util-win32.c |  5 +++++
 hw/9pfs/9p.c            |  4 ++--
 hw/9pfs/codir.c         |  2 +-
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c1c251fbd1..91f70a4c38 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,6 +19,10 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
+/* forward declaration */
+union V9fsFidOpenState;
+struct V9fsState;
+
 #if !defined(CONFIG_LINUX)
 
 /*
@@ -147,6 +151,7 @@ struct dirent *readdir_win32(DIR *pDir);
 void rewinddir_win32(DIR *pDir);
 void seekdir_win32(DIR *pDir, long pos);
 long telldir_win32(DIR *pDir);
+off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -220,12 +225,17 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
  * so ensure it is manually injected earlier and call here when
  * needed.
  */
-static inline off_t qemu_dirent_off(struct dirent *dent)
+static inline off_t qemu_dirent_off(struct dirent *dent, struct V9fsState *s,
+                                    union V9fsFidOpenState *fs)
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
index 5503199300..050c177d0c 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -1273,3 +1273,8 @@ long telldir_win32(DIR *pDir)
 
     return (long)stream->offset;
 }
+
+off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs)
+{
+    return s->ops->telldir(&s->ctx, fs);
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
index 7ba63be489..6d96e2d72b 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -167,7 +167,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
-        saved_dir_pos = qemu_dirent_off(dent);
+        saved_dir_pos = qemu_dirent_off(dent, s, &fidp->fs);
     }
 
     /* restore (last) saved position */
-- 
2.25.1


