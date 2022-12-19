Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34A650A0B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHI-0003Jl-E4; Mon, 19 Dec 2022 05:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGt-0003Bp-Qz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:25 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGs-0007Te-A0
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:23 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9dUcX026145; Mon, 19 Dec 2022 10:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4zL4466Iig+Ejjjyyw0zvP/MB6WqMx5USzaQ70doLGA=;
 b=EWjIGAM6piGXkMzzM8ePe+KgNbZbWTTeQQToxbomNT2m/Ibgl2mhTm+sav4Udq7idPOA
 Mf/rKa888tFFGUAAjjNT7Kyz38BLAYk9Z106JpF43F7ej65mnqUVk/pyBebyKFGMHpqa
 8FfPYgKRrCq9+H/haedYh3FcJGt9Mh8ClVBWRaa8wgX5diymVKRn5Mmtv772GsV2T7BT
 5lgZDLZ4ZDs0QpCOxBind/y62JNaY2YkFB8/fepkLjeYctvsK8yLUAXFVciINOq/J1u4
 sMd93sPmRUIpTfm1frSqZvYiWGwsTBXc36fJ+YODU7IKHA5ostioPA8EDJrIDenCuwHM JA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js17YSsAb77n76NHqgX5lxiqwZvrBmGvdYC0gt5Uu3M479XbiF7kl/X8oqZNE6AI1tPlcGFdgDltoRXgt/ugp1XEpGCSnKdPVvvMcUitPkbW9ByN3BjIMc0xODu5SUapSBaWjxckfIxQt8mMyVaj+5DgZAwvF5Wk27CefeHnJ/Qo+vgGqT3x5rZXsOsXb8paALJraP1D+zQFAgwAa9Da+77ImslszC4mzOhhxQYMWVsel7Cao00STFfkQekUPL0mgNgOvNRzUd2tN5wZ/440nQRMzEKtgv4YegMU4ydPiD9Ji5XhIb+beabXrQFStRwnxfKeUfRrjpPyWP2h0wPwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zL4466Iig+Ejjjyyw0zvP/MB6WqMx5USzaQ70doLGA=;
 b=Rh5+WkR4vTCmkQbpT3N3n+HfNVs0esRRfqc8EqHK1+9QQROFktD0KFyuZhNo8GYS5hdLtOLPgwI1VsV+5dti6/o3VV/xYJsMcNp3wwMqwuh0IOF36Pr5XsrpgKDB+krxTzhYZEqQZtxm6CTMuQtm5HPHxXHhCSNii13PZkBCz6uIahdfoORHLSflC+Yp6PnVUcj41FOm8XsE8lNalRWUIydnMWrFdoaMCFxpoDLaTcjXGafXBXBSVsVOeX4r6wtV4UvtBzGB3HtwpsRa7GewJDL92WfI+5q6XJalyIa5+LScz6C7FF8z+Vu+PwpkifzEfwXDmHblEIq6FVv1aVmceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:11 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:11 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 13/17] hw/9pfs: Translate Windows errno to Linux value
Date: Mon, 19 Dec 2022 18:20:17 +0800
Message-Id: <20221219102022.2167736-14-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f5fcda-9454-4d2d-a416-08dae1aac03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRwhj5MZzTPDCwbGUGfXYMB9oOiWu9p9LxjCGUTh9Z1h1+TKC8hPE144VomAZm77EtEIrJDloG6D3oVojDu6MkIpCQivbIksQqZwSCSHgqefhJ3riCJKjhnN+R6g3D2+C97w/CvCSW0uZ/vEjMuw3xlh+7p2DgxhqaWJT/JaFH6CxMV09sBoWRVAHXXT1aHbyB96FrVpF6JZ9acIOcS/1xumOwcsszppQa7x1yHGfpHBq+s5nZzeeprHFVz20fMynK0QxKf8k2LwjFxYwA8pLlUEj/BfOm8gohwa1PoYptSQPRH4iFSU5aStAmRfe7d7kkVhavDyRHWfBfyJChyI0d6Kf6tQDOoHmdaDGk/LoSBrStcQ/krDueziF4y+DLCfQAr3+VcOBi8qWpTetSkUPo4bEVCHF//dqEHodOeon2adYIGTVzZr2F+ItTBhI6F+FuZggGf54DSl0eU5425zMDC4+vdb74Rvv7Cnsg9eNC6h/wOzUw8wwaJtjW4c1CYRqoQU3HAyIlz3u+lE/x13lxh7ZMcbLmjshQYWR2pcquNYWlUZwilXhptUCa81PgK+5XaK6iWac2VsYgUgDJM2980DI+S3n5BV0RoJSTLCDLMqasrmJLTyavoTD6tzAVRI3C66dLZNuXRmMJyyvtzHg7wkGMwfPeJODl4/pIoccy7weHRPAaTOO/mTHtx2dwY1NYuM0jSozHRfhC3W5hGIjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bK2iB3vITOrun0/POuA8ZQGJoIcWUkkSiBpoV8c5xC6aMHyFxji6wg+VgBl/?=
 =?us-ascii?Q?3v64GLUysBeu4BntbXRbkIIfDQ8NIOyz/3YJlKHauIgWhrxgZo6Z9nA3d+YW?=
 =?us-ascii?Q?Ym91l+HXE0yyvxjhj9ixpDKSitxREHmv5TXibvFJwUWXoBbBIbYNILsrz0vv?=
 =?us-ascii?Q?VJYvLzv5xnGU0tL0ree9xbrA6yN3o3YykJ31LA3KeVFoe+ojgBpx7298Wsmv?=
 =?us-ascii?Q?CKXzrMc7xbhVRJsw0p/fcqEYCbFD0R+wBNUBGRfoeoCw1IQR3VSUPTAs2Rim?=
 =?us-ascii?Q?lq1KekJZh3tISbm7di/ECn0auP36GhoA+cB4RQ6u1gD5TYQPH2/so2rwlxa/?=
 =?us-ascii?Q?8SmWEWmBRpYzgSCPMKk1fGyzOMkwRRGnm6PklW4mmjLsblJjQV5r0AtDTcbu?=
 =?us-ascii?Q?ltkGwnwA7IfpWXTFb1bmTmwIlH4zKCtMDojIDUDqWgQOo+z8xm6NS1sl+zPO?=
 =?us-ascii?Q?br6fZCgkazDt8KfXY7JuhBig7a4pIRY15ZAJPZ8s9fNAoDoENTiDO1KWiBkQ?=
 =?us-ascii?Q?cb3erI4ozV5DKyjl6eR0b+8Q1bRdQsDUnsG8sO0oVB0xDMR6jLOhY6mtJK7Z?=
 =?us-ascii?Q?JqAbNJUGxlYdw/CwUxzVNQ4IJV5Lgrkcg/EgY+cD8mtbyX82cgNMgQvRzLoF?=
 =?us-ascii?Q?MkIGB5A+6pe/wOk5IDHxy6PfAYAedvU7LxY0tcy+B37rAjjYZTLMibQ2or0G?=
 =?us-ascii?Q?xHUueDwj8wyTsBfA24yuf8b7fWHi6jOKKst9+MUMU8E0YnHJIGcQmfAT3X0v?=
 =?us-ascii?Q?PSLo2aEGJ+7tM7QUT4hhYVOIegGxbGnQw0dJu9MQ4sJ+UW9TRci/5QHxgSb4?=
 =?us-ascii?Q?TD3d8pTxgbXY/NHTIk1GCyQRr7BAAg0I45plzAWof8SmKuCSpD8tlUkIuGRd?=
 =?us-ascii?Q?sOOc7CzDApNsH26EPpnzJ+rThcIHAeirt4VVs16/2ZMfiUewC6lUGlr5atfa?=
 =?us-ascii?Q?6PF15h0hj8s15535dRmlYmPF4JOGphPu9emUbmrLdgrSVJG49YpouBMa9hRx?=
 =?us-ascii?Q?XkXnbC0LOwCEjO6zpwDyhzDFlH7h3Yf4jboYGO/BMEMCaQEs3n7YswClOeu8?=
 =?us-ascii?Q?wYnzXf+yQOScMx39rmjueSg2+Doih2pI00iDQy0QKS4O7wPWLZKErv9I2WiX?=
 =?us-ascii?Q?QGCLUncSmwEdPk9znZgxj5QKqbdslH4vlL+IVyAA07nFQwOmXzxDZtxTF5ly?=
 =?us-ascii?Q?aTcZdaPJLohcW4bHsuyO41jCXbkq6uky1K9t3JINRjIGCaBhXvfi5yRtZJK0?=
 =?us-ascii?Q?+G/VQUOQrWp9fj45oaMmL10Dju2mOL8B9GmNzB0lGvQV8TfsysH3o9Mqnw7o?=
 =?us-ascii?Q?lRosb3LNhm56UciGVqxuagynQUn/M1PFtr5Unmppf7/F1KqpGcQlOxR0oWHG?=
 =?us-ascii?Q?crjZVQ1bM2+K7h0MOtc6S1m5A2hpZaMPpQtC0NBBa6jHowjwAvenjUVm/fy2?=
 =?us-ascii?Q?aqCKIh2gpwYuozFMsffiHLHZGB6KQ1szSJFrqITfSYA5Bd/xMhwvEr9G6o4K?=
 =?us-ascii?Q?faD5NBjcGt1oL5S3NFJb9WX/cg/sCYm5bCF+GqaQFQfDxDWLqy7Z2z7MroLQ?=
 =?us-ascii?Q?sJkxYPgC3EQ9HSKqvs7aUAZoifMm4bI+aQXZaVLv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f5fcda-9454-4d2d-a416-08dae1aac03f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:11.3838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n6PXo2SU13MElaSrFCUm+u98xZkWjVyzqMXc5vKTxTA4/oUCtcEIQZdrDhstPrPtNIV9+YkVffUaHEo1p0vLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: aVc3XwcCiWqRGhqBST1znutXzQXVInqP
X-Proofpoint-ORIG-GUID: aVc3XwcCiWqRGhqBST1znutXzQXVInqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=709 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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

Some of Windows error numbers have different value from Linux ones.
For example, ENOTEMPTY is defined to 39 in Linux, but is defined to
41 in Windows. So deleting a directory from a Linux guest on top
of QEMU from a Windows host complains:

  # rmdir tmp
  rmdir: 'tmp': Unknown error 41

This commit provides error number translation from Windows to Linux.
It can make Linux guest OS happy with the error number when running
on top of QEMU from a Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p-util.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 0ef67a53ce..4f386f40f2 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -67,9 +67,9 @@ static inline int errno_to_dotl(int err)
 {
 #if defined(CONFIG_LINUX)
     /* nothing to translate (Linux -> Linux) */
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
     /*
-     * translation mandatory for macOS hosts
+     * translation mandatory for different hosts
      *
      * FIXME: Only most important errnos translated here yet, this should be
      * extended to as many errnos being translated as possible in future.
@@ -78,9 +78,17 @@ static inline int errno_to_dotl(int err)
     case ENAMETOOLONG:  return L_ENAMETOOLONG;
     case ENOTEMPTY:     return L_ENOTEMPTY;
     case ELOOP:         return L_ELOOP;
+#ifdef CONFIG_DARWIN
     case ENOATTR:       return L_ENODATA;
     case ENOTSUP        return L_EOPNOTSUPP;
     case EOPNOTSUPP:    return L_EOPNOTSUPP;
+#endif
+#ifdef CONFIG_WIN32
+    case EDEADLK:       return L_EDEADLK;
+    case ENOLCK:        return L_ENOLCK;
+    case ENOSYS:        return L_ENOSYS;
+    case EILSEQ:        return L_EILSEQ;
+#endif
     }
 #else
 #error Missing errno translation to Linux for this host system
-- 
2.25.1


