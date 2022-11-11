Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B435562527B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZh-0000aJ-O7; Thu, 10 Nov 2022 23:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZg-0000Zo-0r
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:28 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZe-0001bv-3F
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:27 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4JruM011527; Thu, 10 Nov 2022 20:23:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=oE/jEJRyYyIld6FO/F1csjXJv6UzdqPxqp8YPSsk74E=;
 b=eLXmRgI896+b0/KPVUJXwitowAAZiUwNTe83RFlkhQ5SjNJkkPa3Op3pVo703UJnO2W4
 3JFFhUvyvEp3cNUCeggeRyayBeZ26R9H4IcWWN+wve8MoYs1XFq5pmZwN1Who/RFqJjq
 zgu81w+7wwIemh8sMb4dZZhfWU9vRdhJbccIuonFvX+ld2Nw+vypAHpxqbKu4lpfD0Jr
 y8Fr5RUm+W6IIXrne7sJ8CTtvawj3+oYyW/ipaFCg8x11nmOa3vFyFeSheFBC7hoWJES
 hly+Hh46l0+JtqVuEmU6NJD3PYCb77/dBcY+96LL6v7BMCEGGSFbWVU+9G1b32NsHIvr 3A== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knqbkn4dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/mfWejRqzd++UIG35zcW+h6WTwHHVlPVSHZwOUJfOKEymPN7dN9tpGMTY+wmohI6k/k4H1CHUdnwkX0ynAENf+aNVYF4HZCr1oJEsgg+/0wzpn+fFXkej3TixUBsRhnUk0pTspGAufW74YkmRDpEQgsUOSp8v8GU0dzLzlUksZXvNNhKcVCJHN6QdPM78RfRD3zRWa3gx13f+e8S4eDtJChuYQfOCEUvpQCyGoyJ3DpSB+PYOM0Tfinx+aErT/cpBr1V4W5E0LEjP9vcnd0jtPF2LKLdgKni4EBEsV458i06Mn8sBxX87FAVBL6IiOiMOgHnMe24pE5Fm1G5NEFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE/jEJRyYyIld6FO/F1csjXJv6UzdqPxqp8YPSsk74E=;
 b=MlsNORP0uw7T3vso9FPBFDDJVCeDkdCSUnd7QCqGjqOkoGw9ZFDk5EoefBCsQ1U5vf98reuc2vWsXogXG50cAMhpLpFbMLot2Ltu/RD4B8VU1O7eBPNdykX2v5xEByWwzF5XjWc3KWQAAObAjiRKZCwBOU+YjCtY3neI91nnGKqXkMz4EQXysnItR1O7cudry94CRyICxpQN5j4d95jGaDAzc87elxxaBcm47bpm6GMyd9wKVclgeKn3zorf477DoAVPd9FSIFSad4bvxy+CryoFhYf7oDCo9uEc2M8/6UWoFiJeRq2hv/ePalAIlMjZUMOa1JSjhy7RPo04EvP3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:11 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:11 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 12/19] hw/9pfs: Disable unsupported flags and features for
 Windows
Date: Fri, 11 Nov 2022 12:22:18 +0800
Message-Id: <20221111042225.1115931-13-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d10076c4-96c6-4ef7-700a-08dac39c7154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ZBmpo/5U+KdvqTCW8CrgwhIRzyoYBAXC1dWN/wxepAZMGUdkCbLYi8UcYvDlH23Pdp/rF6RCEWihG6xkGG18+rJLDVoneZCQ7L6KemYhLXTFMfT1gPbT9Jk5hEL03HNUO9/y3N2aQZmITKASo+/8jqLaKEn3JjMl9MJc6nuR1brcaMKSaw54ucuAlxD3T/RKyRupYEoiDRyd/ZC6vcE9O0G/eJT6LBxmbf94vEofI3+R/q8iJWrOfbgR8q8CYJ8Jz7yRa6iyqwdeI0Kb0t4jDS+FLidZRN9yOhFBwAKvhxUCt6ZTz+1SyWtx8mKyEO2f7ZYCuEHvrQGP5YkT82O9TkCCzow/v/KnXtEvSmr9FYLJkPalrV6rST5g82RRVsbAPs15dPAhNrFXuJoFUgDK8DH2Ao1A5/7cu0YKUnb+DpcZZw6nmnqfZppw2GQHolJ8OYEB6pS2qeD+TCnKhrZZhzAO2moe41lT8lJlO2KY6YEJQz6JVxpnwCx8K+a8UmW3yh4WKzZhN9le6tBeAwC6dB98dmWo3faaSwdwVYKpKKCoG0pVWNB6gzSWcEDYbPu0NogYI0Gk3spbOEdQfQ6dCCpT5TKh5XqAyBME52wVVY3sYm0U8+YF/kV0fKQoii3PExt+bSLEE9KnnsvkURPdGcRx9Bo2fgKNSb+MnkKh7BMDbo8P2ONaniozxTCHYBbmjbFNasR2SFWb4S0JuUle2yMUXn8fHaXMKLV1ViBZLQXCyPjqE4McKHWWoMNZpy/98Turq6/9Q58spBfWO5D+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CdKCpGRk89wJzrsEIZptTk45bGZ89Ft/TWeSTSPNlEEZfU0QmMleWD5gby6F?=
 =?us-ascii?Q?BHISc52EszoT0yIFJF02IKe1vS1sAxkPmkNNT8GH7es40UVUh3EjUs6gp8mm?=
 =?us-ascii?Q?wPUeX2w/d4SpJWbtGQRqjJAmMtub8FXogCojataV0rxh9TihhjNwngF92C0c?=
 =?us-ascii?Q?+PHgWwu0oU9ZtoaFJQUjczrmTD3Ja9Zvel58bCluOG0sYMADxGi7GuR0D4RS?=
 =?us-ascii?Q?0Qd/hK8loTssumMnV3WBLQo2zaq83VhXKGexkOtpKFP54LeKnCoOUS01+IKT?=
 =?us-ascii?Q?m4Q/j5b8fSwmmVCKYAHqdsqVAstlxWzqtZBUg9ZmEeZJRswOX+nPXyjaIF0U?=
 =?us-ascii?Q?3m+EWPR32moJniTLqLXG2CWEFMNusEJr5xYAPhwsKo5SQEz5XmTeh58RVMmd?=
 =?us-ascii?Q?lupKE+qTgTJI/eqQaihniJwN9N65tSaLbl2cb1X17JiE2uU3zHycfeCDKRNp?=
 =?us-ascii?Q?r/VZLwyrYTfGdATnQQyju/nW3bQ17ssq2Av2o2tqQK2RAx5C2YbGpIjDvpZg?=
 =?us-ascii?Q?LAQG1t0bgEwC0awPTiKr9317E4KLmjtoi3mNA44Kd79Wdw3rGx8h7chNi2tn?=
 =?us-ascii?Q?d/4MQUimeeknoO9hRGvKsHQO0khPUaV0IFaB2uMgw/tLQ6mLekGP/JdR+CM9?=
 =?us-ascii?Q?bFaq+DwyDMWG/ARfXitnca/6sGtnT9nEUcPCCY8Dofjz/r8UoEEzIgz2EQK0?=
 =?us-ascii?Q?nWwp4ITu7k0x9Vb7Doj+Kz9TvmXwih4zzaeKu9BGdhZOnc69Ko0eMUQjy8Rv?=
 =?us-ascii?Q?Aa4xk63feIfNlzGPJPi6Mmkh81YVd5sDGFKkIIqCzPqLLcs/59KxwylR9a05?=
 =?us-ascii?Q?1xvz7QA4CiBMxL5rm2vADKUHdPZ9mpi3jFcjjY3E/HkW5E0bPZgKLohtAiYh?=
 =?us-ascii?Q?YKSUWWj0tMcxQfhOnmJ7eoZxLBZrcSeuqr+xnD0Qs1UjvwuA6ZaUAN1J5muY?=
 =?us-ascii?Q?FOx0l+J+dwWGhdryGwjJvUrMo3SQfSIeSn2C0pg2ttnZz9BtuPSIas9hx7B7?=
 =?us-ascii?Q?H6VO+q8S6OfhMHacvbN5Oh6hSvyogkmxHeNd/1OL8ffjzwBced89tgpFEqPg?=
 =?us-ascii?Q?0VeKu044H8dcm2dxx45lONOj4r4Yy98PfzJCi09LKYwfXy5siBGGnY03Gk1S?=
 =?us-ascii?Q?jDLTIt1fcrnV0nid6VQqiTXufBesLpABliliP7AjJ/tIoW7YmwKXfOgsLvoj?=
 =?us-ascii?Q?jbXs07CbZzZjKqug3heguGrIVP2aGyVYUPsBuaOonZwI2tXsjXSxL8tFP/uf?=
 =?us-ascii?Q?jZS0UyzC79RsZNx+gsLWVhxhVNfga3FzSflmjHhteqG26Fef3dDu6BR5Ru3f?=
 =?us-ascii?Q?1DAxvUw3GWM8/Y3MwFje/8duMqWsvS1C7H4L5fr2iBI8IrGcGcJBGhydkeff?=
 =?us-ascii?Q?+isaY7rgSiKb8Mj8/FrdeyBXnMVcJph3llktT1fITUn29Gwi09Z567fCIjMu?=
 =?us-ascii?Q?MKm3uLFETOA54oopnEaYoWbZf3zSSzhNOCbTVORZYYUK+AybXQ2L3znnDJhk?=
 =?us-ascii?Q?OTNoFc+d5FJ5C7tvG7kKFi6b9ICQhaNSTJlOuqsmtokaLAssyzhE+txm6T/4?=
 =?us-ascii?Q?OW+GM5jFKOLX+ilaq4ntMI5deazTW9aHo4vQJR3i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10076c4-96c6-4ef7-700a-08dac39c7154
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:11.1582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQLU3xyb2nuBSe9ocvm4d6KWy4TLnV343SgghzSvpDhNinpGdjyYx11bqh1lM/Rw6cXmppbjHSNJffbjij1fnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: ny6i8Zf_BYpRhP6uLe2RlNX78OATMrgf
X-Proofpoint-ORIG-GUID: ny6i8Zf_BYpRhP6uLe2RlNX78OATMrgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_02,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Some flags and features are not supported on Windows, like mknod,
readlink, file mode, etc. Update the codes for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Use precise platform check in ifdefs to avoid automatically
  opting-out other future platforms unintentionally

 hw/9pfs/9p.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 169578cc1d..0b5e1fa8d2 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -39,6 +39,11 @@
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
@@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
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
@@ -151,8 +160,10 @@ static int dotl_to_open_flags(int flags)
 #endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
         { P9_DOTL_SYNC, O_SYNC },
+#endif
     };
 
     for (i = 0; i < ARRAY_SIZE(dotl_oflag_map); i++) {
@@ -179,8 +190,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
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
@@ -1117,12 +1131,14 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
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
@@ -1203,6 +1219,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
         mode |= P9_STAT_MODE_SYMLINK;
     }
 
+#ifndef CONFIG_WIN32
     if (S_ISSOCK(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_SOCKET;
     }
@@ -1210,6 +1227,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (S_ISFIFO(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_NAMED_PIPE;
     }
+#endif
 
     if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_DEVICE;
@@ -1365,7 +1383,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
-#else
+#endif
+#ifdef CONFIG_LINUX
     v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
@@ -2488,6 +2507,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
+    unsigned char d_type = 0;
 
     /*
      * inode remapping requires the device id, which in turn might be
@@ -2549,10 +2569,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
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
 
@@ -2908,8 +2931,12 @@ static void coroutine_fn v9fs_create(void *opaque)
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
@@ -3979,7 +4006,7 @@ out_nofid:
 #if defined(CONFIG_LINUX)
 /* Currently, only Linux has XATTR_SIZE_MAX */
 #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
 /*
  * Darwin doesn't seem to define a maximum xattr size in its user
  * space header, so manually configure it across platforms as 64k.
@@ -3996,6 +4023,8 @@ out_nofid:
 
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
+    V9fsPDU *pdu = opaque;
+#ifndef CONFIG_WIN32
     int flags, rflags = 0;
     int32_t fid;
     uint64_t size;
@@ -4004,7 +4033,6 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
     size_t offset = 7;
     V9fsFidState *file_fidp;
     V9fsFidState *xattr_fidp;
-    V9fsPDU *pdu = opaque;
 
     v9fs_string_init(&name);
     err = pdu_unmarshal(pdu, offset, "dsqd", &fid, &name, &size, &flags);
@@ -4057,6 +4085,9 @@ out_put_fid:
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


