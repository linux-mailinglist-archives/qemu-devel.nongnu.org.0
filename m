Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADE6809F7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqK-00030U-Lh; Mon, 30 Jan 2023 04:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqG-0002yg-Sm
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqE-00020q-Sq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U9qYwE013139; Mon, 30 Jan 2023 09:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=eID1K2fGtFaSsEv6+j+egSlY1Ky1o6R09v+FidCa4Is=;
 b=NmwcwkSCbCXBH7YdBHjDD8AbeXnxoz3yhRJGYjb6q1FMUexBX/9CxpMH99tT7qwAJhQR
 Q/crT8pfUFnqJ+Pfym+NGO4G7asU0MBr52oD7luUerzVQzECgfbpa91DW1IIe2T+paeB
 52BbgkELWkOqsI2NiaN9Kf+AbQ/55GQdw9kWJyOc32enkqImk2MEHdvZjH46bF4v8ZB3
 0KAvXyt2gaAxF2bjnRAzvYOl75fTAYb/ROWXfMX4ug07riDJ1ZB4sqNuUTwir8byET2I
 gma3Z4ZPCBLmZxXyj+FNhN+G0EkBvX5dkOaijPkWRaDPwUDzoyOFPYSP0SxvXu4m6Nfi zw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3a45d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgqKD4lb8RDotS2xpOWFqZrDMHRA1MrVP0kjlakew/wXP/son0jYHV5+FKaSMDVpRuttjZTsIuPW5WVKtRgzLidGaEEZXTz02SNSQQ7nIb5ZQgApFWFYnNudYoypnD62i7fT2a7jJAqXx9Z8l3rorfZ7cpOd2dgXcKbDgLlnDG4irM9jHxvYYmmxm2jIgftisZeW+94FHThUattw6J10hnYDgTt4nlRiPx9ijgcpTMXrQGRvaLrqyQhZl1KCUm5hjgqr9dmz41iTWKgzG64RhkWfjH4xpAub9HiTJi/41hj/W8ehbdWmvs8E/ofAQvGZSw51oQVRKuTdtJJAxTPdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eID1K2fGtFaSsEv6+j+egSlY1Ky1o6R09v+FidCa4Is=;
 b=kw/VrfJpy/9n7fJSviRosxr0gk1UFgLkAzMTcQAXmvs+AuLmmlPNro1hfaMsn0xoCzjq6XjVYrpi6Yd0wpQFA2yvwN3Y0q8Mb0Ck+ad7dieY8qxVIhNL6QzDWmkXG6Nn16kVLsN1voi4Sw1a7/1ecp0ilfRDiN9daAlfOvYAqtc98iOlxjM0IrDWfSRn7anSChAwj51YcYhkrwXuou0n3DllwvTEZ2svJxc+hx9afZnutZ0Un38MQgNn6Lsz+JQncQrDGTXBJ+JOmECS6KhzgHhu9TpHckGFJJftI9J3PmSicJv0EoWOOSR1DMW9vi14YATq6joVGp6X6gin23jkKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:34 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:34 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 07/16] hw/9pfs: Update helper qemu_stat_rdev()
Date: Mon, 30 Jan 2023 17:51:53 +0800
Message-Id: <20230130095202.2773186-8-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: bcc51f99-b417-43dc-c79d-08db02a7b5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOOehaQ7j8XLw/PqmdDUqcbmYYwI+OWPJ8ThHuX1WgpMpaXczcr0VlVHO/htQ6AdRh6cmRkQVTyFSTrI3l/e1OLD0+zAZBAaA84bURf1/QzSpZZMiPSNU8+pPZDCV6Gj/IurrGgBYKGCQoA5mSxsLXJ8UGWo192WKFhqgfitlieR4Z4/yB7cwA6L64B5/A7f1w7P1+mt8cfRfL8KqP9Z2nobPRgO2Jh2n517wahHNkD+Io6Je7LpIyWefst2cIFkGXTZ/r00sQR4AmXpalCZN28b/mdFHGzMH/E8HaMyLDBSEeMODVqYA/NnvqWa1Tc/EtiW3eGrSYEeFS+bCaIOuDJquvT1OO8gSOVYPfflLtKF9KtnEnijzz2PT6h2fsqZg8gjOehRwStz2qmKIMpGhDIWK/l9jJP6Aulf8icUkjjPRGcfVuhNu9iJmjm7vttk32nfZKCnG9uXY9cuBXSoB8UAzfPHNYMJ+64Vagr2MD0YqVpQsGyMOK/gcY7O85Cx9s8rfPkZj7B/J+L0k/wtHlLjJq7RkE09DbAyQOdnbHVPTr/E44nl0e0h9Kvy0eoC/6pEb14Ih84Z4uvw38WDoXiXcPYTyUAEz1a4yC14jzNlJpwlIGPnxbXk3+7Ty+ZT2SeUfuedpFG6mtyE/9gyn+P6AfkdFCGahM2CvY++xD5F33xgqvPm2UXxB/VhoV08I0K7YVyYM9ubcBS+v825Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4FHavViznTQ8MeQvUHwMTo9MBKPCu2I2tCENlnFNAFfMFMA2d1YP3OaIeyTS?=
 =?us-ascii?Q?4vPzyK4vBduKbPGYy80ecKnr6m1yOhCouVKrBWG8uSRZU9KuMcXrhpcbXpHs?=
 =?us-ascii?Q?PvQuwTIWBmovT1U/Bm1H5Y82ENzpNGK6c4aDYIqW6T+LolsDXtB7TgjsqiiL?=
 =?us-ascii?Q?dGumsOGRaX0OJUd1I+hRQx93511Gdao00wikCK+TS2tI0fLJ1NaaVbe5Z/2I?=
 =?us-ascii?Q?CL0Xh5AXnS3BOXsStr6UXvigQ61W/7zd+R149I/cCx8YwHsP8i/EolX6D2Ey?=
 =?us-ascii?Q?criunpMaDJmo/2Y9mfPEf5U4wzncsD3RL58owhd0WNJEodugWN0h/iCCYc+B?=
 =?us-ascii?Q?Sfm1mL0c2G152FQFWIsFSyRxZfOjqVQfsTjw5TljtdjGd03rPWJ7rztShIt1?=
 =?us-ascii?Q?6jkUg1Sm9XfPwMWaQscWXDUloV72WsEqRn5yqK857gmtTL0Me275Ak0BrPD9?=
 =?us-ascii?Q?PAlDSNe/TTiK69jXqvO/LLCzHNF1/qtYto5BvVeEW/WRn2tsOQpysSrUF4S3?=
 =?us-ascii?Q?WNL7pq85E3jG6iv0MJxrTy/DzgLMOhifUO0zA4Ru9zY0CpbrVOvGa7YHO48U?=
 =?us-ascii?Q?goyzHY/Vr3GgfUK0FDtGZafC6R7Zu/jFIzLgBLlfRXNPmVk8gN8NY2MHQ8k9?=
 =?us-ascii?Q?zIa8EuUwLoe1hR0mUXIqJQdKnQEJ8R3V+0Y5deCsL2KZGlNDrGND8020tGCD?=
 =?us-ascii?Q?MQNV+1KbswTWJJ91NW503J/0a/UG0MdXzstmyr+kL+TqMn2I8/IUvEul7UmH?=
 =?us-ascii?Q?/RDrmm+mjeI/+mXNHP8l7Zu/ee6sZtYRNTTk+5AIBRR+2GcTDnXKjDZT/vsW?=
 =?us-ascii?Q?K/R6gB9n4QAJk9qLCVlFNc7bXxNmwpn5nWUlOPR3ILyTWUhZOmLhWGsIVPis?=
 =?us-ascii?Q?yvKi40tVSUKFqugBH6qoBYmnwA9TQTb7hOPHmPpGdnmlhayi8dwYMxglMnit?=
 =?us-ascii?Q?QuIuvpVnbnww/c1tr0a/yyhoNhPKgDQCeN0AU1oADsfn3M0yq8xe4vhtZ3se?=
 =?us-ascii?Q?lVrotugsVuKEWVZIWKgPG4kptq3u9mU8UB82GAl43ZsAJ7NMG1pVsB1W6PM5?=
 =?us-ascii?Q?TGURZJmjzeMUUUDpvYiUijPRs6rKuuj1Mb6rv5/Vo5cgc+612UzvWQSu0/Ze?=
 =?us-ascii?Q?jhm4cmh+2THQEVkqPNlhTZDTvvsbkESa/5l+aF8A639q1DewrZEvGMItA9Pq?=
 =?us-ascii?Q?NO5c4WRo5TqMPXWFXqnEAtPahKBdS7+924SOTr8L8AYthNTxngJE9QJz+Y42?=
 =?us-ascii?Q?A4f5Kj4HKw54wpvdBs9M22kWm4E9+puTMRdjROR7g7Op6AjVUTRUm/tfat2a?=
 =?us-ascii?Q?nlyHYMPXyiiEQLZ2lrl8U0lvfxSMnMgnaeFwv0HKAR0LxHaMv5LtfJ1xasy8?=
 =?us-ascii?Q?zoUMhu4zqYUV+oJaiSTO0XIufyWduXWKqPyfZ3TqnHFU7zWzhOVMTjBff/1N?=
 =?us-ascii?Q?Gcdk3J6jGg1fTNsIrbXXq1Li42vSAR9E+fKrnL5Zlf9YCBNEvdPA4EGLf+bl?=
 =?us-ascii?Q?7YBPJUYeIhe2A/0tTb43CWjjda0QRSI7CZY6plt+BVfFJOHrXX527L+JDXLB?=
 =?us-ascii?Q?JZAGjO4Xg9dzBqq6jDuRrqEl9R6EfE1Vii/7HHMNEZF4p3nMDTz4vdnCoPXS?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc51f99-b417-43dc-c79d-08db02a7b5d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:33.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+ktV4laJPx16UpgqoPVFFXey9Ku+XPx9eMODxkjGFV/dbXNUChbUj515RWEyWh6Z84uxCxs8xjDOar/GaThzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-GUID: L267bUFytw2q0ycZd7-4OyqZqBROfD5c
X-Proofpoint-ORIG-GUID: L267bUFytw2q0ycZd7-4OyqZqBROfD5c
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
index 050c177d0c..5f6d43b62c 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -1278,3 +1278,21 @@ off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs)
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
index be247eeb30..36916fe581 100644
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
@@ -1346,7 +1347,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
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


