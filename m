Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE39C625262
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZY-0000VC-Rw; Thu, 10 Nov 2022 23:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZX-0000Ud-1e
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:19 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZV-0001ZH-Gj
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:18 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iK024928; Fri, 11 Nov 2022 04:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=/uG133JgMTeEcLUb0aMTqUIK7dCdL9iQpNTDfZLiPAo=;
 b=fu0+dycVvny0iADlypkLwnkTrzgiz7vR4US/T23oaacpa9tFBeAukc7TWVBK8HNonIY/
 sjvUcuW/jeCDdB5YihQ8/aehwKHFM4sC+GdY547y8Zv0W1/ETROZ+RpTQLSU7I4ZP9Aa
 LaADBlrrNOR/XqP9oJKEr6JCFPnBsSb56VIVxoy55z5yBaSy4Hm5xJIoG5rG5kmsv/zl
 9msxYxU3IAyJR6ArnFwF2rjszM8vvEvSfN5WgZmiWx1CPUJRbMFlhQ8qTSS75dKtuLoR
 5Maej/v2OzCzxUDCXhvZ3PoSNBrN1EaoGtYB+GPEWSAJRN+z7lTsbY8U94Q/83039cm+ TQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuB/kqteNb1ih+5wrBi9VDFlDK0HQk3nerpR5fs+jKa9S2m5vNlXPU4XNTYnmGvQLhO67hiAGJTozJRcZAElipnk6h9iDE2EvO72YkSinuIoXH9tRm4KBn4r2nh+xFm44fQEpoOiWmjoVnYDm/KEgDaf7LeXh7694t6tSzBTyUbY2ezveO8A4tfc7DeWmhSJNkj+Nb9Hr7nglxozc32kYrDRU/r0f3JgawMPx0RU3NJPhLNLhpgVsriSxDDiFFCfNov+c3OAeteuF6QsCkv3JxVxzzw6ydidfZyZVI6xhCtb3eClvfa6xb4s1v5NfIaT6RecqED8FYzVBillD2VDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uG133JgMTeEcLUb0aMTqUIK7dCdL9iQpNTDfZLiPAo=;
 b=IZtdnmiertHxVHqt2oLdgmgfwvZ19icmz+3z6MIGca9UdoVAkJ81VUuBiAMPNan6ARfTlOSDyqQp1pZpIzAfgNlGffP9ccfI452y/ePBMedy4OAQQjLOXXvIOcp7YiPakF9dRHDbvPsjtWT+8PYcZAA1zDdRUDKa29YeGDmWZjC1Aa67nZfCQA8+rm5b303Mxx6nbfvLV/1/Cgjymd0KclXe1z8fpLL9ZznAHg9bswPpBMVPEwCxiyWCl4xFtoEO/MXVDUfR5koz/UjAN5PL1OJkNhJqyGxSinBvQRJpsckoDqamp2KQ9Z8QwUSD4G5WW1VPcIIuuK7IGedLUsBG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:50 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:50 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 02/19] hw/9pfs: Drop unnecessary *xattr wrapper API
 declarations
Date: Fri, 11 Nov 2022 12:22:08 +0800
Message-Id: <20221111042225.1115931-3-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: dbb24cf6-d6d5-4685-daa8-08dac39c6521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NjjrpruNY4ysBjlrQXzLp86AZaaSWCSOM9ph/Yz5A4T7SGmTVWfd7UFFsLz8hYXx4AZCrpOcKfM/AnYMIp3CLXj3KgQxDE3ocHedoo+AusodAiXPGZWNM92Dvx8jmhhdYYOLGvNvIu6MiExNYUQ1DB19OI4E4NG6b5OT2HxGQzDORfMNQK8GMlCcjwjvZ9RSqsHVwIqyoxq8ph8qjSJRTn3uRWOfbV2z08fKI1m+w5UFMj+ve8a6lO3SLgjmxLgMP56aExSMX3/eq7CMrbAD9kE+YqjhOHKIS0zwukGpWOirwYRKjVN9KNAGo63Nd/vAlwHIaiGxT4tctbwfu/1ZfdTyN9ZfXbjpQC+ZseOHa7u0OPhL1N5fdZGi6xtlGYXiC+QVZcsoESlI4/F9p4xJeSXvdtaaxujj9f/iZmR9h2BxmEJDzVoLIlPhnJNhnrwGn1o88ahJqZvJYt5VZTRCwu7Gok941R0w5Ov86pca1coSZ1nZ5BEqOsaG5X4+5f4L4Zyzg4nta7jy1NGt8lowT1hh45p7XCtcIDjTzzLwFeNvO32uMhwB4KZE+0+4Lw8rGzYcKTsXFlPv5jtUrS2WYT4ugWG+7JTPhOGfAE4qUBorLH7jgjd+kghzwXVgipsGSyh+oWr8UgU2dasGdpqCrAJBRTeUrafoWcaKCDf7YpEXzobcrCI43KeNWofzVxTGu5mlKBHGesGRJSUZMOZ++lLbMRtL/lzAs/MIkLaRYrOM7AyoA+P/DDy56T9rOclq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19LgT4ywt8rMhkiZonbHIMsqpLODriz/Ze6hxRzCwv1y5M1QT3HuCAUsVN6S?=
 =?us-ascii?Q?/o59i6SVjl1wK52th2t2jqY5En4p7Lz4AwHje+hPLKM6fYFkbG792Tnysxuu?=
 =?us-ascii?Q?ZS+SuytOKA/1xzB+K33doXz0ugdfAfTfqxNNbd6DLchmXfP16B6C7BTRX+/4?=
 =?us-ascii?Q?Q3wluWwU4jUhXfzjfbXnahSDRtD24BpuNqR6E82fK9Apa6QQ2kfFZmHq9Btx?=
 =?us-ascii?Q?bi5DqVbkIWYHQZQsaNCxvB46Mpfx4cWjnt9RPZWYR8GVrgxpRI2+++McgXPj?=
 =?us-ascii?Q?CL6pn+8rkdaOxKCeL5nyfWVCrFz/mlhqjy8xlaHRVLxMrCvZ8bdfkvxr2xAS?=
 =?us-ascii?Q?2Bj3v+aV3l3u6ebsWKa/4bqut1A+t7VmkshtsMLfFVf3Wzmim91VCXINkIoP?=
 =?us-ascii?Q?REDqkT8IuuvzP+ScjiEse/lSTpJJZj1a9vl+1akZ//9dS1n4QLi4H0IydAlz?=
 =?us-ascii?Q?mh8H0HjLe84GOLoCium/J9tGuBZnOcrEO+F7/w5edb7nvyJ4GfrbYlaPqofH?=
 =?us-ascii?Q?AGexpWh0F5uOkxej4q2tE1NAFCHHYoOwnILoDwOdoKFu+XuG2t5GoBZtoIG0?=
 =?us-ascii?Q?cCZ2rqq8sckDZxbMwBkf0lBRFFeE6HaQcEh3i8zFBG2WBiZxEa+8Zq9GCCHB?=
 =?us-ascii?Q?8/j2WODvzgCyAl/DPn9BhTGCLhjL8X1RsXhctEcILFdl+b6XAzr1nQD379py?=
 =?us-ascii?Q?Sv0C4IuaJ5SM+jfgNfauuB2FKvK7JJVEwZ/X7WA2Zk2rvpoQjkR6Z4G9LJxm?=
 =?us-ascii?Q?x9BYtvZSFvATow6LLMMO7mOKNF8Qsot2I9oe7f9QGE87OvQcHUWm01tDTvPv?=
 =?us-ascii?Q?DY1I3BaLmT+J9AeiDbLlrQinKcTFlf1kg9z58QMg1qAUrvltW76insRTc27r?=
 =?us-ascii?Q?bTWIUC3NvF0yS6NY5m3wed1OQYtCQVPM73zVNgponJ1DI5E1jAfBsYxGRaY9?=
 =?us-ascii?Q?JKbE/6GMMiHOs3kyrdT5jk2k2N85zOTEJTl5I8gGE9RLQsY9ZdrCJgVmHtC3?=
 =?us-ascii?Q?ppds6bYTo3BWY9eGplXCAAZQLcnXvDJLxxoDaFgqvm+4kMqCC05UZXKy8Ior?=
 =?us-ascii?Q?hGxduWgmwtcmK+iUuupe+hWXRs0qmrf1uEh1l/5CRotYTbqX7Pl+5TVKnR8p?=
 =?us-ascii?Q?u7w5WX5/ihzWG8/RpbtsRKe7T0FYC8oUBu00xjOqpPqcEr2q0X8qyoHf/k2g?=
 =?us-ascii?Q?2BZSb+Sle2tPPi/AkQ1CtETBgsD+xqhBaqVTOrOkzoUInBwg7kVFE0KhUPPe?=
 =?us-ascii?Q?HeFVsOSM2MUmzhLx/79zemQRJTVrqSJ7Ba88evH2M+TSJeTLYt3bOKeRRVok?=
 =?us-ascii?Q?6GfaxC6jy7VugrX3iZGT20f405GGopyxcKVV3cHicaMWPgzbUVFEuR/NOX1Y?=
 =?us-ascii?Q?9A8qvfzK0r27E82gobKlspOA+NiQ5JlxgNpmArlgZGe76XDCHHaERNCrTMi5?=
 =?us-ascii?Q?t20Rh/kQbeNn2c/ncjAgAW1RM60X9wF7SipH/sn9aZKXq5ZZmp9YCm0w8CnV?=
 =?us-ascii?Q?np6+9tPe67FaC+3FNEQL/bn3BHb8U6OdaR5u9ZV/cLQjmVsmgmkQbOcAwixZ?=
 =?us-ascii?Q?TJTic/9wkddD1QwnYvUHt9ZqZdZeMb9uonO3J4su?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb24cf6-d6d5-4685-daa8-08dac39c6521
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:50.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avef87tCw3zD5alIVoKYnSbWwyNKOyzPLUOQpfAhHgn4C2pMTP5NJ/TK6xbscFIyPdHdghzaVpnggk+WjDifPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: zVqecsJl7wN0ilygiCparkhzCC9JS2u6
X-Proofpoint-ORIG-GUID: zVqecsJl7wN0ilygiCparkhzCC9JS2u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=707 classifier=spam adjust=0 reason=mlx scancount=1
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

These are not used anywhere in the source tree. Drop them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p-util.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c3526144c9..ccfc8b1cb3 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -90,19 +90,8 @@ static inline int errno_to_dotl(int err) {
 
 #ifdef CONFIG_DARWIN
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
-#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
-#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
-#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
-static inline int qemu_lsetxattr(const char *path, const char *name,
-                                 const void *value, size_t size, int flags) {
-    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
-}
 #else
 #define qemu_fgetxattr fgetxattr
-#define qemu_lgetxattr lgetxattr
-#define qemu_llistxattr llistxattr
-#define qemu_lremovexattr lremovexattr
-#define qemu_lsetxattr lsetxattr
 #endif
 
 static inline void close_preserve_errno(int fd)
-- 
2.25.1


