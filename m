Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08162526B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZn-0000bp-9b; Thu, 10 Nov 2022 23:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZl-0000bP-GC
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:33 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZj-0001ck-Sl
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:33 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB40lZK022509; Thu, 10 Nov 2022 20:23:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Z1EFyfpJay7EWFwsfrL7SqhObwALqYEYSsSwfkLansw=;
 b=GxAtGtaTEh5WCgoQ59DSy7yIaM1Ekm62LmxrXJN4mDawPGK/KpVmoXxAvZwk7HrA01Es
 5sUThIrCgAeUF94XD5rv0esnHujoDOjE4o4DGFJaho3BSEnQ60bf0JsmNyDx9GdGKAHY
 RtwthXXJaGqqj367Onr6fyXEKzgjfdCPt9CxqgHTj7BOk2NwqeRu5qVfH93ep7bAO0wD
 pZOVBZStUFYZ4evvsFVTphDA6Mbdsh4AyCXNkKDhOKIkchUrcDIxn8crWJ6V4/uO6930
 pT+6v14CYnQVI1cJOQ4KvRCdHkobpwTRBcoXH1UwxXisR+9TfHmC+EnLZ0Nkj99x5iQV NQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9mb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6EVTWodOahbJ/Q2uS11qlzvDj5CnP+Qf6v3H0D4A7ZvL9CvolfYFcEaB++0yxamjwe4fJ4ffys8Ow5YdpWzO9Yh/AOBzgjljmL+M5gt9aFx0LRIGrH521zlqWbji4gmk6kNyN4Xgde08rH/ZnkjCa/Qdo4j6FqHuAGaIBLY8CaP8NhPl/54vRwlOOFFh9DLtGQSVFmVPnaro5etq6CADBWAWvWYqApvcQiDRXkWSg8XGfYmgTg95s/pHskUTQ0Dn6e82tSTNDJtOMlJmpVp+0shu3P9/seJGD4Nc3p5uotbQIZ0xHWdtDIO/9L3yrHBXJRRWzQqVWA6xeYh2xhoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1EFyfpJay7EWFwsfrL7SqhObwALqYEYSsSwfkLansw=;
 b=GcyvshqrX3RonRvnfEa33UMCNaBPRNsTMBgKAECplwZM5CCEKGLK6oCH9XEPiK35OGfmmx2qCFq7FQk41kNp1wVZt+Lea5MMAaMcaaE4749fcFjKsF81wQsqnikauK9lh3LhEaifqCDHjixs8Fnv284F4WafDY7bBXvuEDCt6kYSEjZfJPFd8569rxnPzBF5NqKK4plqNCNfZFl2IyAjH+2K8NrBZTq7qWGLwCQAnmxzUTkeNfjshLKAEstSd16G74umEwPolkwX8PUPhaIX9xPP9BXBaICks3Iv2G7czT3tRMKfO/86kfOVVrFm1eRAltV4SF+AuNxYO7nPuBv1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:17 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:17 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 15/19] hw/9pfs: Translate Windows errno to Linux value
Date: Fri, 11 Nov 2022 12:22:21 +0800
Message-Id: <20221111042225.1115931-16-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5e00c2cf-4df3-40d3-02b3-08dac39c74f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I640c3OTYecY6N/UaqREwrVr/LggXVXvHk+yyDHn+urAz5oQ/Pu0YHqrm8n6btrEp0UP6L7j77mY4/RqycaBo9OSAPAEV1HRO+9rjItdXMv4vo9Iv8lvSnytH7xAEoZodD3s2ZsEqI9wVL0bWfE1v7osbXHWhXJVoTb4rVn5KCkss4XePvv1RU9ItZA4HHPiTyfM1ot2TYb5eIqk+MuSDGFNNd3CE59h8D0KkF5Eg7CkOKsk0QJgd7m+ymvSgYEs69DSjQGqMYXFGKUTbXpU8d8MfQQjQEcyrJklCWXlO9fO3SMdnJlxNFRVhhgtoJoUkJfNiCs8o6/oV/aPh6MxTIrRiQNIFZbXVM8yNjfvoSFs4McapcYLi1ezlnV8jDHNqKtVK+Jzgk/g9jQ343rdv/PdMYV4UvW94EorPtdyh5LR5MMbcfjHUwPf4owHq+Oppg262SvxSiMoDZ1wAQJ1+g9Sbwd8NpHzIq4hphl0lwVqZdHP6j/bNNyGJ8vlNG4oaLsaYXVFu9TP/DIg2DUWIENcwrIOIccixjlzm0vcnfz5lB2S6fQbebvJ4Vo1IA3XFTGw4RmCnX9jxiy+21IYhOfx6UwlPvc6jHReUTNrO0B88O8HqEDtc23yq9nqmpFO6hHM832rgrWhoMdX0HrCIAAcduH0DHXcE231QyD0+ha4iCs8VFEaQwQtIQo9Io4LsTiemW4AfHDbPvSbadzHaq9o1h+9QZFN/Sn+kdMDWdgvnwv0W3ZmxuVzolRqhEsRAbjJLwUHksCTnCB7iQU2Sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHlQR9ws9mEn7woPOcZyYbYp70teHuy7H3/ikhNiFVRIT41YkzCdal/VDofQ?=
 =?us-ascii?Q?E7MlLHk3sG6MNxLQ4LyJ/ZJJ887xMbbKIrBa1OFGgULYigAV5t0EFz6gc8hl?=
 =?us-ascii?Q?EHGO5NZOkxMYYGWcW/muTnByhyfJqXJpbte9v5DU8mjH81biRfT6o9xF3Czv?=
 =?us-ascii?Q?Rriaj+eQS+vKPqDoj+1yW7p2BpsMnuuG2yMV7OO3EBZSurpq+aWTYvJRKc+i?=
 =?us-ascii?Q?pyGo+bYKpgZga7w88wyrqzpnmYjjADBs807USCLQFnTiM7gfqKsTaK0JsAxT?=
 =?us-ascii?Q?0LSlQ0aQ1naqGTar3Irybt5VdlyYUKNBBhUqWKPl3q35SdJhcG0lCEbC2nLS?=
 =?us-ascii?Q?rZJnuDeL2nXh7/LMiuKiMZAQVgDq3o+kDSh3Iro/LhNTwScstnjFqyIJRBdR?=
 =?us-ascii?Q?18r23V1p6b1IxLGlNA04FAqt3IsX68Gj3/kQb3/WP73zbBuurGAmC6V40fpx?=
 =?us-ascii?Q?IE0bYYcv5RfEoH0Pn15HCa6n9OQsI083w3wYITE3IxR5vf0HpELT/NR6gpRC?=
 =?us-ascii?Q?ucrYEIHX2EvAf+VEl1wQEHoY+41VreJSIKcFvziu2ssjvEKhsQ/BgMKE5Hxw?=
 =?us-ascii?Q?9hitkf1hXTlTHjM6DBJntrXU5WKctJLL5ayuIHiK2KpVvQhc/bZKosCeNku7?=
 =?us-ascii?Q?div7NmrDU7/gtov7ESgt0FncJCyIS5EDnOFSNhTmSdW9XyymW3HjpLVWDM+e?=
 =?us-ascii?Q?xbKVhKdCOgL0rBVCmCq7oeh5yEsSeCHHPYtzdC2IyeNym4wtTVjMINJvtl3t?=
 =?us-ascii?Q?4OnzlvDg1AHRhAPjHv0y1tjwXOGpiiYqsmcMLtuoZQzrx5Jtoak0MqP5Itj2?=
 =?us-ascii?Q?LNvAdbCsmIc7fpBh9dxBjyyj8xe2xVcne8PnbjfNRd8Q/BBSM4PHr6rstHBo?=
 =?us-ascii?Q?+oGcDOyAmvYsR4IIMxkUO/GoDKvpMzzzooMKaUl2KRmrbjUAvjrlma1CJ1Bt?=
 =?us-ascii?Q?Y6UR//S1o6lmcf4Y9BiVPgFl/BFRfjcR1wJSKmpiq0yaeIX1H+E4Sez07WKF?=
 =?us-ascii?Q?szIL2xID2D96e6p8PM5i++c3LJhXfAFVUTyV2ZlblUL/gln/hLcdGCADM0iN?=
 =?us-ascii?Q?9lWBjosjvYWGsKT8jjSjf74k3gnS5zqd4E6kLeOnm4YUZt9DHUmc8EoaYdvI?=
 =?us-ascii?Q?4Ty6tTsLv63d8/b2d9uBr5bqQDsyz1mzWDN6iGYkcKQfYy8zaar2yzeKvknO?=
 =?us-ascii?Q?SA2wAV1UZmJ6KFK7OfC0xBSsl31NzQTC1ABp8q+F9LL0iK7y1GL69oA0mucV?=
 =?us-ascii?Q?XrkqP4zqrxZHBrsMlxpwjPvedSKc+krQNhKsSllNJ+30zz/nReZ/yQ7+ONPz?=
 =?us-ascii?Q?PHe1E1heOQXtVLmgmChzVNLwrphuRXXSMtqPx/SsfDTvW4q9eTioH3yrzGya?=
 =?us-ascii?Q?7bDsI6wKxzk26rwjcmiNZx3+Y6mEVjceZiciwuM4mUtdwqszpf+9gwquy0VN?=
 =?us-ascii?Q?LoOlQWC8D9TGHO6DlJwxLs0IoAMmFgTqJLExfdJ9pFXTXt5BIeJu/+tEDeQk?=
 =?us-ascii?Q?rpHLFzlrkIbc9WUyXrtXpLxz+Sw8Icf4X+ZD5iUot6/XqUFrl1vncnBjrFsV?=
 =?us-ascii?Q?Co6MtJ+crC9pQrFGouhVSEeyZOiWZxvf0TPf753n?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e00c2cf-4df3-40d3-02b3-08dac39c74f4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:17.2215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWpK8xb1gih06q/xcteT6prL83h/4frV2nH3jXjRPzDLBcc2bZUuKOgNzmAIPGsBz2J0liHWbIvSxX3IZtEYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: D1eY8fKQEqr1TPajbr8NneuadcrEEqvT
X-Proofpoint-GUID: D1eY8fKQEqr1TPajbr8NneuadcrEEqvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=567 lowpriorityscore=0 suspectscore=0 priorityscore=1501
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
index c76a53f2a8..598e2980e1 100644
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
     default:            g_assert_not_reached();
     }
 #else
-- 
2.25.1


