Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295656099BC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:23:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYL-0004KF-NZ; Mon, 24 Oct 2022 00:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY2-0003yy-FE
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:50 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXz-0006AU-D9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:48 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wYbA001509; Sun, 23 Oct 2022 21:58:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3U3KU1/kIZJ+WxIAWSD9j1TgVnA4Rw8EBOumkxO+04Y=;
 b=R5+Sf2GawTkc56Qzt2JgKMlwVuc0AXI13B04excTE8rPXO9evfd0Q4vklJU1/7m7c5Qq
 rXuBnvpxG5PrPOUPd95MrHwAasn+ahP7glXRarOHz0hqLY4xQ6xad0Ag0/ZkZgjccY7V
 K9wNvI40tjCwjCeHpDoGsGUz2snrkZbQcwR1RygFOID3OJVjTeiL083sPfuGsNu9n2Gn
 Q7u0CHKNrbmVGYWfDvSkEdfYDwjnJb/SdYBpsMdUwXmfq97K239Gb0b024t9Ohmbh5kJ
 QE8zH1Me6PFZZ+bBlB0JRzixsI9eN2jmHwGRNX5pWw4lOmaN2p5l9KOTZmP/91/ZkwaB Zw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ksmac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAgrghJylMgIkBfY7EoJFHrHFhbK6/VPUrUtT/H4nHVrVUSS3zAQQ6HGlbOxXRdX97O4QXPVdbkkZlxNz8jwFABxpOkUbm0M1juQCeNUHLJHaR1ZkXq03VnJGueygAnnhXEwAunp00T8LOxUxPsf/a6ErCsVgRsyXLJALQWjNquqC/5yhcd0B3WFp3S+7Ctxi0paOIHlb3cUls0TZdRDXU3aYxVYOxyE5jhzCiBAKT2zXCJqhFptcM2QS2lB69nM8F2QvppOIFCZwASjcgGwx4DU5xrs7HCA7NxW7A/qHnjSx1EmVINYpLN9wecmLoRZsgn0w2bncV9+cx4GzvAQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U3KU1/kIZJ+WxIAWSD9j1TgVnA4Rw8EBOumkxO+04Y=;
 b=cdDfIGn1tihej7XMyv3sq2l+fE0+rhvSJe+sGgjYPtu00j8VKMX+jiIRgyefpuuO4sGAvsV2DiSJBFSkLWlzrfcrgv7PFAjDElBug3fF6BvpssRPpiQEf1pgowG/hGBTAGxhKHjLcacYhM9iuJ1cGolqzJyiEZiPAt7UR106HdjKgLzGHsg+Or8hYgaPc2761cg3R2+2SqfaStMi3xYZLHsSqm6vRCjn4TmOLke0W0127kyviVWaChi6091ACuzsjHkgt4vA0tVEbL4oSXZkgxtOtn10GloJ9M3xEWZHuw7JCoKrXaTxTwO4zTWuv0tdl/2fPpx3E7Ws3sOtFJbs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:32 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:32 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 08/16] hw/9pfs: Handle current directory offset for Windows
Date: Mon, 24 Oct 2022 12:57:51 +0800
Message-Id: <20221024045759.448014-9-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bb1661-74b2-457c-cb51-08dab57c6612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZflbNViBIM9Kch8uNmO/VA3n/RYz2TRBm7JUGZAyN7iDwkppyet3hQJbMlqglrmtcCco8EdrBgmLHYLXa8gSVAPuNG9qGpqZo5HBd8bK8s808WAZPbK5eJy+1vbNJr9SRvcc8SQPIFynazPXastPufF+tJqhNYgZtd2prU2Gzj59zqIZe0ayzk/PgZhC4BtyPPosPOWUzzmK4KaQFyHuHSaKkPMC1MEX/aqYO6m5++mXQtQfIoSE25yNDXkfypG7NWD3XmKojw4CMvE33Zco9fY5db8VIZUyp/2Zq98J4mCgrbqQFkjmULkny1aWTRbCfjRfR1EahxlfTMTXyR8OwIIClQQ3jKQmoPfdVBLLruOIlfE5u9Nk2r+YCKE+5pPP1arMyRhPzptbzM+iWCGkSFYSQ1cqELHWkyUqeyfR5NV77S4SnmVP23qRBdGY97TIZcAoLm48Aa4QgBFiZBD70amAIcQvASY9aP8OGBu3a3K1SBPj3k3GfHth5OHlzu0mG2l38PboqFs66BjSa92+aftb+TfZY/3EZzGlIBb3ZCN8L4X4FVQ9GitguwMBzq0aWrbYjpumO0zybDYG6Ekw8C3Juc+JJXTB4CFE8MnGO98Z2MQWl8uhx2XDgU7WlGOFOEqic7W5KpTzHOscTq+gthX/IvzURNEwNRa+cDBSLtofk5tp1ekWURLTm65+y6LyHXgwcG+dyIz8DRIeO85J0r4thtsiLrJHz0+VaAck8JrqMsxa0qqR+LaqiH1sXJtmidu174BukgR71n9C7komA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gzBddoOYQ2/e5N9d8Ktnk+ENIYmdd1LuxNnOJ+gjS6V/mvNjqGqSA3ij9fDL?=
 =?us-ascii?Q?vZrPty+DgiPaSjasR4KZCUIRXTR1QnxcTmEGVonELG83+2VpzY67guT1n5L2?=
 =?us-ascii?Q?E+iXVSc9NYUNYmWVmW7XaLiKqcKFmDGO7VStK80twj8DJJ0xh0P34gmY/P0S?=
 =?us-ascii?Q?7DPPpx+0+IF2XS1ewciTR93Rq71pgm0ipeUBDG52QA6yapPA1A4zNwn0UIg0?=
 =?us-ascii?Q?YmkvmMBeG9Qa9oR/Se9iHxBQIZE1dTi04EoxzcLoec1ESLCC3nItnt36nfd+?=
 =?us-ascii?Q?Z0qOZ8Mucs1R00QH7hds8LiaCJ4R8EJeFA+awlfLZ5OPZ9l4w8pA3ySDoKC9?=
 =?us-ascii?Q?ooFu+duthtp3EZz2e/mUqsFIT6BoTg8lodEdcwoomHzayPGQ9MbNCBKRbAzG?=
 =?us-ascii?Q?61fiybBwwdDs816uIhlqgVP0VHV0TLgGjFnsbvpbSajI2/CBNIL7PY/Sk8rK?=
 =?us-ascii?Q?IGKXx9QxgZdwETMGoOAdJnXjMFQGx3mG0xzyAvhDbEyG5lUe8ZLaL/4JkWDJ?=
 =?us-ascii?Q?Oc/gRR9pG/HJ0yzwP07Ds75tj1du9PZV3/W1f1JD8TjGdBpShUG+exIW62dq?=
 =?us-ascii?Q?5lLbOBgLIzepr5HSfrb3UjkxM8vEduYejjLWRhjY8Ojpy9DllzXB8YESrp9l?=
 =?us-ascii?Q?8qDCPmskR2Of77PdLIXAne2R+X9b5Pe2ihi4icTiVr9Z37iJvZ5OkyDHgEbr?=
 =?us-ascii?Q?Kn20GUGiuCvb1tBF5kxIFqmQ/Hiw8P04Zw1U9+DPLyrqDWxRn6H8jB19/IO4?=
 =?us-ascii?Q?bQOyolY5jqopdbZ7ryFlmAFTouReJvHnuRi3CnClSMjYjzMXhfjQR13jDfeh?=
 =?us-ascii?Q?2ZBvutzh6rO0NAjrCev0TO0+vvevowbYz/GMqzu1CrMEgJvJa5eN6FiRTORu?=
 =?us-ascii?Q?aik1T0cs+EoHuMm/xy1H+L/ydjIdEdu+pCEtcKyhpSqokse3fjoXSihrCeGJ?=
 =?us-ascii?Q?D6WUxqW5zHrirI2HPfLeUYZ7F3XxK+zlGvn8sR3fzU5Axjz3OveojHqHev/5?=
 =?us-ascii?Q?sdzhc+iBcHLaZ9GV+mkCmyh0Je48AtbJcEZy9HwalToSEiA3f95iB8JxXbUc?=
 =?us-ascii?Q?SGPy/FFRqkb/qSRpL3K+ioAj2Kv3P1y/pbjpdpt+cBE4n18VszkDDsWsUjxR?=
 =?us-ascii?Q?QdnaCA8ALNw36+WM19Mo+xtemkAJ1x8haVNxFwX9sedpDIrWEJqi/+fqvM9m?=
 =?us-ascii?Q?D7uiBqW52iUQpceCNK4qDXwYr1M6OyNT+L7ivZarM/+m3+OHm7atqmeQ9UA+?=
 =?us-ascii?Q?M4DpOEoM6611HlJY+W+FY8UVYHKDuUxHAVCc3npgJnBQBtxtWwV26s0/Oqm6?=
 =?us-ascii?Q?dM2V3XjRz9oNiPUk9irJZcNT701USKantMTHUbGov5+bhUjr0vdXWnwdU5II?=
 =?us-ascii?Q?P3Xh1Niec3I5gWnx2XUPgDpK8Io0Nd7+gNTqkUFozhfQXt0/Ky+CpNOqxvN0?=
 =?us-ascii?Q?t0GaJWgegSfMIVrWJyBCAnoR7uarGq8XBg7DnYaxRbp926cY3EwGrLCBE+3q?=
 =?us-ascii?Q?yBpy5Wt15Aq5+LkdWkpadHVwQDeVt2D8wHZZL+tPZPcg/YrNRuiATZ4cnCy4?=
 =?us-ascii?Q?FVuvSfk2NAEWSmd1m4Q+FA8AB+7IlJqtNO6juJlTBQZJrTOkM674OWkhRpm4?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bb1661-74b2-457c-cb51-08dab57c6612
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:32.0844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m0cB+Sb+/k/hsEeZdyZdLpMcmitOzR9oTy/TAOk8nWYUxT1guyuzSoDHuizJNAkGcOnztBPo5uGvSDJqUpK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: zbn_FH_RkY_fg9mIviFmH_jExSoMLiQa
X-Proofpoint-GUID: zbn_FH_RkY_fg9mIviFmH_jExSoMLiQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=734 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

On Windows 'struct dirent' does not have current directory offset.
We have to save current directory offset and update offset when
reading directory.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p.c    | 16 ++++++++++++++++
 hw/9pfs/codir.c | 15 +++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index aebadeaa03..6c4af86240 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2319,7 +2319,15 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
+#ifndef CONFIG_WIN32
         saved_dir_pos = qemu_dirent_off(dent);
+#else
+        /*
+         * Get offset by calling telldir() manually,
+         * as Windows does not have dent->d_off.
+         */
+        saved_dir_pos = v9fs_co_telldir(pdu, fidp);
+#endif
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2520,7 +2528,15 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
+#ifndef CONFIG_WIN32
         off = qemu_dirent_off(dent);
+#else
+        /*
+         * Get offset by calling telldir() manually,
+         * as Windows does not have dent->d_off.
+         */
+        off = v9fs_co_telldir(pdu, fidp);
+#endif
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 93ba44fb75..2fbe7b831b 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -78,6 +78,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
     int len, err = 0;
     int32_t size = 0;
     off_t saved_dir_pos;
+#ifdef CONFIG_WIN32
+    off_t next_dir_pos;
+#endif
     struct dirent *dent;
     struct V9fsDirEnt *e = NULL;
     V9fsPath path;
@@ -124,6 +127,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
             break;
         }
 
+#ifdef CONFIG_WIN32
+        next_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
+        if (next_dir_pos < 0) {
+            err = next_dir_pos;
+            goto out;
+        }
+#endif
+
         /*
          * stop this loop as soon as it would exceed the allowed maximum
          * response message size for the directory entries collected so far,
@@ -168,7 +179,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
+#ifndef CONFIG_WIN32
         saved_dir_pos = qemu_dirent_off(dent);
+#else
+        saved_dir_pos = next_dir_pos;
+#endif
     }
 
     /* restore (last) saved position */
-- 
2.25.1


