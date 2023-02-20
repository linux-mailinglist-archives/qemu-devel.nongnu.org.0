Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC569C84B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36T-0007zj-Pt; Mon, 20 Feb 2023 05:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36P-0007yU-NX
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:57 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36L-0008UM-1B
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:57 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9wFQp005915; Mon, 20 Feb 2023 02:08:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=VH6OaBhVmVJjWn4ieoJPa+RgwHCs2zhaUQGxo8+i7i4=;
 b=Bz8B4XxrZ4Z8NE5/nOZKYE1KbBy/duKhCJ4DDbpIC3vSO82SYfOjbYyvLnDcRxJQj2V3
 TcW3CCrqj7vvCTRpsCbA/ii89ZXZERvajSj1BoRcWyuH0eW4NkB+b26QDoYPOA8ehM4N
 3xYMLSlz5h3V20kU9qdVMoi3kKVRULZPw3kHStraZ+ziUgfcPxbzgg8IkaPA7LesqZyc
 Ie+e9RqmErBYban2/W68gfKpl/iv1Fc3ch+kOsHt+pf09rr6/CanikCIXllHfsLkI9wz
 vZXpMFfHU5OHTp1dG2T7lodf4dU2zW1rZfF+yiwTQpsyqVL89X50FLUxsX4OczUbaW7w cg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6sfs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9wJ5I9LmlPPP9bXptETbQcPYBy7BCKZtQRYZ6UJE1I3oD+8O2Xp6sDTwiBHyqwESU7Tic2Rn17J6g08sbEHYKyyTRktdfZz53Oucod2LvJ7SRI/PRCG+aiVc7gjmrCnFcI4RzOxWiEfhP0iQWawEkuC5SsPRDTR0TxVpP7tRZwMqzlZN0W/I2rwg21daoHQe5JWkWesyguYelV9ywFhZxLgywV8k3xJyWk7QivxFJhmxxNFeBnmc0NVUdtsWr4w3q4cd7yhBq5rnPTL4bANij7hbeP0CLAUZrklE4lIUwij8N6APDNVb5K5fgT6rSisOGSwY2Ie9bKDYwZpeXYhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH6OaBhVmVJjWn4ieoJPa+RgwHCs2zhaUQGxo8+i7i4=;
 b=CPTGUxpoz1rDOLLQ7H5ltycSVT5/2rSMEFvkcneqkeKZhOq59MksVN59bmIMTw4e/gNk0PBNNbtStm+k+dmY/rWtn0TMuqwnhiEcUzBHMgzmasSlpEDwqjnEcjYzs0bz/SYcGCHphFF1xBvwo0qMs14UUGDPqf9sYd/MmrJ/m2JCLprI5fkgfaKyjzPNlqQC3l+Y372eNKZmR/W3hyuC4lKjYpiB4dBDupGXtA8mlzDd1ChsOnuQCt46WGqjb+BWpt85cHWPZIBXuZO6lXZcv4a9UKbp3jkdJAmzrU2LWVFMCbPFv66LYjh3avAM+k9NitbdiGwgyXY7nzuCoo9qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:43 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:43 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 07/16] hw/9pfs: Update helper qemu_stat_rdev()
Date: Mon, 20 Feb 2023 18:08:06 +0800
Message-Id: <20230220100815.1624266-8-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e217adc-6157-46ec-9843-08db132a7287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Il4gIIBazTUByI43CT6gKXjEOz2G5YU9GL0BG84WQGYgk9S686K0IJ6mtPySH1iVmGHl+cHyNaC/6LMelWglakADqPy3O+Hw3vhWnr70z0RVpzRd0VHTTqnKjajHC65TI/XsCA9yVrMzj9+qD84VPZb8C6Up/QClFNXkPqo6u5kHOLePkKq95syzc8Ym4t74Ry9IgOZ2sqJ30DcGht7EtFMPOpIizhcnb39q1/PAW3PvvSymKTC4vgjXBPhi/amUfTpW0kElr09sHz7G89D9o44v9Ov/sD2gIvGz8I/yQBS9LXLiuaMwcEOrKNyQNl6YhbC42Yq3SWGhR3/8ff8n/8K/q359dZRmaOb6UaklYZdhouNAKWUFOXd7yabzdK1OV7BGzg4+16OOpD4wXRPQs4IRv7rcaIa3lDtiHa0WFY5C4DRyvwRpwHXc7rxpd5J0f5vfE+gy3vkfchjXaAF6OBINNCuv+lAgLa85wuVH2ct/CgYunUcXzvKBNADmqbjr3c5kEJGvSY4gJ3KsKSBqvRK6aMD4ewa0wjJj9AdjaSvcdqiCO6xGrsWNPBFXZrwLn5RCi04CryEda0WxvD8mla+IlJfQbemwd3IoDQHkMiI8C/HVM5Ihyy3eFVAsqjXE1r5y3/YtCx9wNYvt/uS3sP8taaClUbd4/aJTtp6JjhEFS2P/YtCJvOXaTKOy7w5XXn2RH2BjGj42eRP+4TS1gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s7U/0nUyrnxGUcUroGJfSlZpe3jX2wncroWMUOPXAzCSNCeJ44u13IBjef6B?=
 =?us-ascii?Q?uwzxHE/ttGyiK79kLc4ZZ67Ufi+L8yjyTPHtL2f+q1g33WxaJb99w5Wyxl6Q?=
 =?us-ascii?Q?N4f2XET4Xwp5fzTR1kquxi7xrCnNxD+V/3I2uQx6MJk/fJoaZC1iysLFs5nK?=
 =?us-ascii?Q?uc1UJwC60APHRl3MYoNXysq3moYNJuIpefxS5NjqrQ0zu7dRz76mKVpl9Fgg?=
 =?us-ascii?Q?X+32VYXHPCY+KHxgGDQY+1NS+5TOCeiKycSbsVjL3D4F1dGzVkKoY7rsfa2C?=
 =?us-ascii?Q?q2y0UD/yXBAv/mf0zmzlPXyxR+latL2UuHL1oiH81UbXU5swNKkC41tC2vmD?=
 =?us-ascii?Q?cwRjv6n6/F3mZ3RCkjXzvfUkD/MpSfJXOVPLZ+Mv1UtUIdlfbG6XzmD1jJu9?=
 =?us-ascii?Q?zoSYSNxF98tM9aXzyYkjb58utVrpFPk4bTmNis5Zka7lDmbi0O2pvGKrfRxN?=
 =?us-ascii?Q?AjOit2A/xF09MNawrCje5Iew24Il9zTkyRMGkdICglJyF7LQXmbxpEqXrEo7?=
 =?us-ascii?Q?PshNztVOUHeVQbSYZvdH/vdThXIPeKl7Kre5E2JIcUa6jY/GhKeZJxpnafZI?=
 =?us-ascii?Q?7IlHovYKPCqBLFVFTa55j4FaUEv6dqagnJoef6JZdGnz2SJoX63zaba01GPB?=
 =?us-ascii?Q?KUoOfwDCGASd084auDphRWnPUqA189Af0/++1h2/TwN4ZPiNrXDrtCIDojCO?=
 =?us-ascii?Q?MhdvKol6mr1nxdLue359l6p/FC7guCn3EoWeLDJ2bPYxGX9dPioTnaO4yaCH?=
 =?us-ascii?Q?1DJJkZK897tQBLUEx4V/7a2Ar7Z6LllegTcH80F+nGOxzoaYg3JodL51HIbX?=
 =?us-ascii?Q?36GlpJ09Pq9N7sYj/eY6+b4jc7nEuWBgJWg5BXsSTqfvhRY1SMDXplWjaOMg?=
 =?us-ascii?Q?YLoSn41lbPrlCxRD61ZAh55ZRoz1j3LtrC8QT8OTZ6c+FLgV0XwWLuvL+HHp?=
 =?us-ascii?Q?KeForG9Sg5sxbWhCGt1eLx486vaksnm1SZApS8eEiJzZNO2Tmob8cm9QDIja?=
 =?us-ascii?Q?q++jdD+QhQmzFfRI6heqi48MOXJm7wZpV5DxlRKCyqfN91HHvetkGW+OxI9Q?=
 =?us-ascii?Q?qx9H9e3C7bAeIFVMutVA9PotutRnV2wjOZywUeIotjJhSOLDdsu0pHz+WDDd?=
 =?us-ascii?Q?5sK4y8HoocuDxJKIP4av6v/AC3lKMDNHnxUX3uVkRAiRYkFWqIivltBDCyj2?=
 =?us-ascii?Q?P4kJ+O42VernqTZ4EyQ5UzPKwxPzKvb2XBWCfnJo2MYlLByI5OSmubkGKzPO?=
 =?us-ascii?Q?A9ZdNqBzBd0FxPA8isyVl90T/jTuS0dbqw9wsLvjAd5Y51MRs2n7QbjtFOdx?=
 =?us-ascii?Q?UKrUQ+4TchuEYLogqO9SMLkz28p8DeXi3I5X5PNecXo4RKzjPyRwFLG35Say?=
 =?us-ascii?Q?pWWSz978MJdKuEcHn8Q9HXHfVjEP83ejvZWLBLnYQPsBqrB9gMdV9UY6vLcE?=
 =?us-ascii?Q?fMDLIhQYYJZA/FFBYXpqHerL299t29WsfPIMemS2vulq1DQhkRXWUj/BRBUG?=
 =?us-ascii?Q?Ru731vYxwmMhndqUy0/KbIOBI3FAcWQW3sWK3LQQSl+YwG1DpwdAwAQH+DR8?=
 =?us-ascii?Q?mKvnYIBrYOePnqr293JacdB2n3KthpdxEKszs1vcPHWX1/dknNfKRtFHCAyz?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e217adc-6157-46ec-9843-08db132a7287
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:43.7053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDKBGie7W9kP9xAya1KSYtMJ92I3Q6Oppi+F8Vrz7MbE46fXYo9VlO638lHq0P/uJkAE5QeOVJjVVqUn5MeVIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: W3BFgxI0L12Ri_hpqNz-9EwqjyF3oWXe
X-Proofpoint-GUID: W3BFgxI0L12Ri_hpqNz-9EwqjyF3oWXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200091
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

As Windows host does not have stat->st_rdev field, we use the first
3 characters of the root path to build a device id.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h       | 22 +++++++++++++++++++---
 hw/9pfs/9p-util-win32.c | 18 ++++++++++++++++++
 hw/9pfs/9p.c            |  5 +++--
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 91f70a4c38..1fb54d0b97 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -22,8 +22,9 @@
 /* forward declaration */
 union V9fsFidOpenState;
 struct V9fsState;
+struct FsContext;
 
-#if !defined(CONFIG_LINUX)
+#ifdef CONFIG_DARWIN
 
 /*
  * Generates a Linux device number (a.k.a. dev_t) for given device major
@@ -55,10 +56,12 @@ static inline uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
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
 
@@ -152,6 +155,7 @@ void rewinddir_win32(DIR *pDir);
 void seekdir_win32(DIR *pDir, long pos);
 long telldir_win32(DIR *pDir);
 off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs);
+uint64_t qemu_stat_rdev_win32(struct FsContext *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -269,6 +273,18 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
     return g_memdup(dent, sz);
 }
 
+static inline uint64_t qemu_stat_rdev(const struct stat *stbuf,
+                                      struct FsContext *fs_ctx)
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
index 37d98a3e63..61bb572261 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -1425,3 +1425,21 @@ off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs)
 {
     return s->ops->telldir(&s->ctx, fs);
 }
+
+uint64_t qemu_stat_rdev_win32(struct FsContext *fs_ctx)
+{
+    uint64_t rdev = 0;
+    LocalData *data = fs_ctx->private;
+
+    /*
+     * As Windows host does not have stat->st_rdev field, we use the first
+     * 3 characters of the root path to build a device id.
+     *
+     * (Windows root path always starts from a driver letter like "C:\")
+     */
+    if (data) {
+        memcpy(&rdev, data->root_path, 3);
+    }
+
+    return rdev;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 1b252c6eaf..ead727a12b 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1264,7 +1264,8 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
     } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
         v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
                 S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
-                major(stbuf->st_rdev), minor(stbuf->st_rdev));
+                major(qemu_stat_rdev(stbuf, &pdu->s->ctx)),
+                minor(qemu_stat_rdev(stbuf, &pdu->s->ctx)));
     } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
         v9fs_string_sprintf(&v9stat->extension, "%s %lu",
                 "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
@@ -1344,7 +1345,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
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


