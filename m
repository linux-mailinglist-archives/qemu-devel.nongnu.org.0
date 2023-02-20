Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D969C84E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36a-00088z-Ml; Mon, 20 Feb 2023 05:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36Y-00088X-VH
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:06 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36W-00009G-Ud
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:06 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9f821020143; Mon, 20 Feb 2023 02:08:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=XCThB6U8JgGE3cSTEWUPuwhj2vNuXnFN9C7046coD7M=;
 b=czL5JLo8zqosfuYaqv3uwCRhPOR0HREo3Oh3nbm29wcizHhzAffPzLrzSO0kdzIAfCXL
 DLBcIz6e7SCMuXOYI+dVB9o9jkna713OFlKx+7hkSKNi/xd8R4c8LGmDYmS7gYeATNLP
 MFW4zjH53xY0JLWKR7A2bqG2HC6vyb/BEDbLgZpBuNl/K6q3ti3DieodQzLWj0upBdSv
 z4It3WJ6NFLgugfcTgoHOEjpj/rMk+5+nU2Z7OAaOEv+lpsUta5WdsCOS/q1lIfR7L+S
 4MVmT235YGv+U9r3QSKIL4xiwYB2QOmcIzPEORIk1iV5ep3nRAHQNI0x3OL9eCnml25r BA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psac0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9xL+TxWsAFEGcnk0u0kd2oHlsaspKBU9Yv1A5reaUF4cPNLet75UcYXGjf5lRs4Gce4iP5mukElpY4fcPfeBf11yM76jcNXwuTxROTsexyBCZuk3pL5Sx+gtLBCRBi/V16KQ9sDzxiR0JYIbKwhjv3KDIcH8JZydBIFHWM7L7OHUbOgqNbrJWTH4BfS13X3OGZ1Ckb+Tgx2P7sMdl6yIhwE2pRNhy84pNPr1iaMYY2M36EOojY/SJmxoMVpdRJg3cAHSE4Myk3qBJuv5Y9P/L0b9OYk2/UpKEqTRpybGrpnk3dLJVcy7z5bJ/ZGTn1WHdtj1XYt8N7as2cM5E+SXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCThB6U8JgGE3cSTEWUPuwhj2vNuXnFN9C7046coD7M=;
 b=n6Wi7hGuatK0M4S9ZQtg1Ldtvi04Ds9HAR0rUqK+Vl+7rQjIfHniDLBDyfmNB5/2pkXGS8/WMrYF6HTrW8loGmoWkd+Twuo4V5C6EAwmGenfNBB4rBqfJP4j8Iv4YfXaB7L6OhK/pQl3NeYK2zEjccNzvKXx+ymF8YtPXPFw2fcW9ih4RbdJJbiy1KH6d9gBxuydvCVYoHkAfSfoAeJKT/47naKgaJRzNu/Yl9GArB4qmZlEYK4xxMDh/jP+b4ycLrEC9Sp+3BQ8yxVL7MU/VcuiVaT3GqNowQlNf9IZ6Rb8xQB7hBGT6k7X81snZkeVmRMm0gXLLxX0yEbirSMS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:47 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:47 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Date: Mon, 20 Feb 2023 18:08:08 +0800
Message-Id: <20230220100815.1624266-10-bin.meng@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e12991-8e07-4528-6ced-08db132a74c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gAezlPa0IR3yx1aUNbQoOaMh+1UEqccJtkhQe0P/z2e6ngX+XP91VWAKax8fglxmovLGx6x1PkFXnhlwGGIwZYaXs/6GvhZOpya1NYFDe4NS75ALLWNQh8HSdegYiZ3UdJgOU1H3GpkEAnAc+A+HFb9w3ngN9x6mz41gD9xhmmHUP0Za9XmY91JnOCtUjR/9V2i7cvtgd1ZGpuJSspmxAEuwMViYxQuQ6ygy/7+099UI8ipgZIqLJKAqeM3ilU8YXwl+bgAdgn4QiSzV7ekHpXff7Ae2JMN5tAdQjf3WzvUGn94fPRH4u7s8hvYMo7kA10ITqZL36aK7sSu8H7uf3DdPed7xHodAs6XPHOrkeOCf2Wwge6XCKLx3QOGVX4FuORKLgonEdVgP1flBb0OxlG8kmM24VS0N+XyVd/U0AwvhKkjJHUQgr4GdFoVrnY0ERz4hnImXckhRT3wY86mnyx4UiEJ5gsFuWYlygFVdpalOSzGXJciHjBVWfhz0AAQrRfq0u/FiX/kbCCLGGHt2dnsSNZoJARw7CRytrA93AW5s251EICCuY1GuIVL4wEzyEcPOolY3UBM/fl9DgOaHCS66gmvvMjD9ZlOYZig1wUwEH72vShcBdubJdIiyvBKKTfgT+H61G0jl5c+ZaJLcoU9O/1CRh6/Bz7jswqdLbNQELTeQ/6g/gnG2cL9d8bRfJ9O4ALaigc4MsHjaGKV0Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(107886003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YGMgAmWTUrpvfeQrGNwKt3Ariv7A7ZvhezVQz5+NqsqBY0AXmvuv8zX1GIOY?=
 =?us-ascii?Q?+6ZPgZdsxXU4OVHOKasW/Dn7kouj7mATw8P2599KyWF92hCVyGYm+VCpsqo/?=
 =?us-ascii?Q?5sfV3FvSgheZ1dS2jeLKMUcBCPQlH0di2FSS0gobyGRn72p1EmVLgnGa1Rtu?=
 =?us-ascii?Q?Cj8JK5guT5cMqC6uxU+CKSZhxVSrOkWPwwq80NqSiN58ZNSmVt2I63OFjRVP?=
 =?us-ascii?Q?iGHkiSi49rh8OUbjAQwKV5c4/JHG0c+9U8i7zS/cyHr/LhpaFiFfVDtD9eD3?=
 =?us-ascii?Q?KwsxYthLKa6ws+nMQN2vHi0G+ndrxt/8+Tk0QTNKkAnr+seg4zw1+qfXIxOx?=
 =?us-ascii?Q?5teERszK/ZIJnefkMKNPtW2Z3P3JJAOCVzSP8/bGfsdAu90gFC1OZuw/oy4x?=
 =?us-ascii?Q?hvrZRHod7l0YCWFW53x82X81FL9FyosO4oYw5I0bXmO1KuKvexpgiY5EKlvK?=
 =?us-ascii?Q?ENuftMutF3jG+Hp3ExTTdMnBh8Cc1VeJjbgnu6PCyxRwchypmaTIJY4+ZFs7?=
 =?us-ascii?Q?984M9qiLwHuushjw/yU1bxhYxwjttby1DBPR/o+D+kZwuG65h8i9TJSt7jAg?=
 =?us-ascii?Q?yaDOgpGhD2qYbOmhTVSHURkoPucq3kxixq6RpKZRKlvrDx6yj0RhXCteD0lD?=
 =?us-ascii?Q?LH8Nif3tiqgMmiiHLIO7aSNr7md/any9oAcdA/dCFdlfOLoEU6fWYKopzADE?=
 =?us-ascii?Q?idczgW88I95KVNShImo6y9/1Apuo3Lcau/4gkQJmj/WlLwRjgHxXjHGeN+h+?=
 =?us-ascii?Q?6mAWRcyQg+tZq5wyzpAy2XO3oCo7+T2aFz5bg+4LWfotVsJMJHyiuisMesRK?=
 =?us-ascii?Q?GQvZQuFXFB7QG4wzwfPEBrl41hPe3a9NjeebrrE9xM+kykQWYlXjr7iMxL3L?=
 =?us-ascii?Q?zxvrjBubMjCKjk9jVPgP31peoKKdlnfi5bYeA5DYsRhCVEaytB9Lo9fLUvdA?=
 =?us-ascii?Q?TB+NXUrLDsysFuuQYrORP2iZVkElgWx6dmuA3oBkKBZ7hd0EhHNuQhLWxNn9?=
 =?us-ascii?Q?FaCTHfC1hNGJDmFrEcIhSROy+8wyzlObiD7OduJ0KYvzdE1gwcQih1mls/0X?=
 =?us-ascii?Q?ln4e4ZmL92hKFJTczjkLENZS5d5ZRMWZ5iGzkoVwaM/diTeFjoHNBmzWet2s?=
 =?us-ascii?Q?8Muv/vC0eb+e15sYRYUjc6O2Cob/aZhh9E3GCx0Ok4ZcKb1ElMHmR08BIQef?=
 =?us-ascii?Q?95/kZuRd9X/VAeWDsKkurnYV9jR5BrjpuOcEL7hlqv9z/lTIPTFMrtiZgk0S?=
 =?us-ascii?Q?QD13fwnbnvGVL7GL4IunQ80wsK+CoPEx0wdcR32zGnhYIeXKCrFSBVTe0n6D?=
 =?us-ascii?Q?OeKeJOX3HxfTOt3BnMUvaT3q3eOppo6D6kJv3Obnrc19vP9XvU9N/Hh87opc?=
 =?us-ascii?Q?SkYQrAyIbQkBwEY92pH+LEZK1uXnNriait5eeUMh2nX/KmjGPWE7fPCr5ueR?=
 =?us-ascii?Q?6dmsUWO4QRRXMXmvz+l5lDlat1Auc5Lu1w3Q1cX7L/dMMVbhtUzLOAhy5nAG?=
 =?us-ascii?Q?MfPVRX86Now/GDMBvmfUy6T3oNT0gHRKAfHSDWJ3qa/i6rIxolPzaopG01Te?=
 =?us-ascii?Q?YVv4MMArUhxvW9fHa45YpipysNeHVvN9OOhkK427But+0pQK/5RpcKxrqi5j?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e12991-8e07-4528-6ced-08db132a74c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:47.4297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2upy5PC3OqohFlptVFDGHa+kNvaT9gnevUuQm4ljkX/GJh3dtBGDKJeUOx6LVId48pemassrMkHVvE1Qz5+rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: wxLf5SjRhSERXdcduJhwjXYoEiuPIeGU
X-Proofpoint-GUID: wxLf5SjRhSERXdcduJhwjXYoEiuPIeGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Some flags and features are not supported on Windows, like mknod,
readlink, file mode, etc. Update the codes for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 8858d7574c..768f20f2ac 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -37,6 +37,11 @@
 #include "qemu/xxhash.h"
 #include <math.h>
 
+#ifdef CONFIG_WIN32
+#define UTIME_NOW   ((1l << 30) - 1l)
+#define UTIME_OMIT  ((1l << 30) - 2l)
+#endif
+
 int open_fd_hw;
 int total_open_fd;
 static int open_fd_rc;
@@ -130,13 +135,17 @@ static int dotl_to_open_flags(int flags)
     DotlOpenflagMap dotl_oflag_map[] = {
         { P9_DOTL_CREATE, O_CREAT },
         { P9_DOTL_EXCL, O_EXCL },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOCTTY , O_NOCTTY },
+#endif
         { P9_DOTL_TRUNC, O_TRUNC },
         { P9_DOTL_APPEND, O_APPEND },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
-#ifndef CONFIG_DARWIN
+#endif
+#if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
         { P9_DOTL_NOATIME, O_NOATIME },
         /*
          *  On Darwin, we could map to F_NOCACHE, which is
@@ -149,8 +158,10 @@ static int dotl_to_open_flags(int flags)
 #endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
         { P9_DOTL_SYNC, O_SYNC },
+#endif
     };
 
     for (i = 0; i < ARRAY_SIZE(dotl_oflag_map); i++) {
@@ -177,8 +188,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      * Filter the client open flags
      */
     flags = dotl_to_open_flags(oflags);
-    flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
-#ifndef CONFIG_DARWIN
+    flags &= ~(O_CREAT);
+#ifndef CONFIG_WIN32
+    flags &= ~(O_NOCTTY | O_ASYNC);
+#endif
+#if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
     /*
      * Ignore direct disk access hint until the server supports it.
      */
@@ -1115,12 +1129,14 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_SYMLINK) {
         ret |= S_IFLNK;
     }
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SOCKET) {
         ret |= S_IFSOCK;
     }
     if (mode & P9_STAT_MODE_NAMED_PIPE) {
         ret |= S_IFIFO;
     }
+#endif
     if (mode & P9_STAT_MODE_DEVICE) {
         if (extension->size && extension->data[0] == 'c') {
             ret |= S_IFCHR;
@@ -1201,6 +1217,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
         mode |= P9_STAT_MODE_SYMLINK;
     }
 
+#ifndef CONFIG_WIN32
     if (S_ISSOCK(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_SOCKET;
     }
@@ -1208,6 +1225,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (S_ISFIFO(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_NAMED_PIPE;
     }
+#endif
 
     if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_DEVICE;
@@ -1367,7 +1385,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
-#else
+#endif
+#ifdef CONFIG_LINUX
     v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
@@ -2490,6 +2509,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
+    unsigned char d_type = 0;
 
     /*
      * inode remapping requires the device id, which in turn might be
@@ -2551,10 +2571,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
+#ifndef CONFIG_WIN32
+        d_type = dent->d_type;
+#endif
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
                           &qid, off,
-                          dent->d_type, &name);
+                          d_type, &name);
 
         v9fs_string_free(&name);
 
@@ -2910,8 +2933,12 @@ static void coroutine_fn v9fs_create(void *opaque)
         v9fs_path_copy(&fidp->path, &path);
         v9fs_path_unlock(s);
     } else if (perm & P9_STAT_MODE_SOCKET) {
+#ifndef CONFIG_WIN32
         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
                             0, S_IFSOCK | (perm & 0777), &stbuf);
+#else
+        err = -ENOTSUP;
+#endif
         if (err < 0) {
             goto out;
         }
@@ -3981,7 +4008,7 @@ out_nofid:
 #if defined(CONFIG_LINUX)
 /* Currently, only Linux has XATTR_SIZE_MAX */
 #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
 /*
  * Darwin doesn't seem to define a maximum xattr size in its user
  * space header, so manually configure it across platforms as 64k.
@@ -3998,6 +4025,8 @@ out_nofid:
 
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
+    V9fsPDU *pdu = opaque;
+#ifndef CONFIG_WIN32
     int flags, rflags = 0;
     int32_t fid;
     uint64_t size;
@@ -4006,7 +4035,6 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
     size_t offset = 7;
     V9fsFidState *file_fidp;
     V9fsFidState *xattr_fidp;
-    V9fsPDU *pdu = opaque;
 
     v9fs_string_init(&name);
     err = pdu_unmarshal(pdu, offset, "dsqd", &fid, &name, &size, &flags);
@@ -4059,6 +4087,9 @@ out_put_fid:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static void coroutine_fn v9fs_readlink(void *opaque)
-- 
2.25.1


