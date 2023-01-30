Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193D6809FB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqr-0003Aq-Va; Mon, 30 Jan 2023 04:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqT-00038y-Ob
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:01 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqR-00023g-VE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:01 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U9iKOg022663; Mon, 30 Jan 2023 01:52:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qVi+cX+axJVFtj52FK6mlqj5ScHeG3UF/5wRyJEMVdk=;
 b=NVVaY7UX7Lg5+lL/ksQ5PGH+GmjkA4fL9VBmxIl92vRrSds9OIpQ2YYc6M0t7JWb5KjF
 NIxZVAap5FOcRKWOozxa3sIa4tCJ+6uBkD1jXSXffikjr1l938tUfe/TvXJ6qIH7pL3j
 7VPvYu2EoD++gP+JWBQe17uxfQyhDp5U1QLe7Ges+wozR5yJuahF0VXEReutBccDxKUS
 PsT0k9psP3QsPbo/a0d8Zs9BvBkLehtCPUxid2hxf58+CPBISt66hjvBcNLxiSBEtZwV
 PWLs39PKohsDo0S1Z6SSp24njuhd55hJnAvbj16NiuJ0lELk0ksI6R6/eKmvBDQSFaUi Rg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncyv89rk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ffy02g6IiBzAZWb0sl26iEbFXqKlkC0dYnTz02DRbVOYp9yH3yNVoSOst/bACUneKZCdpUTNZqLGE+FQsyd2wgqK8dg0nt+E9mwvIq/to5mXBLMW1atijygSjdXv4XrUZP7d/WeBWTwV9aLTLr1obEqCGjLJMTpQLqtyzbkiCF/u52OxIi4ubkYFQ+IZTiO6tJvl8O0SPix2IxFqx7I2vUB5BjcrkKs89h97eQy9K1RuQYU0UqJf0XEUW6btI2/PkALq+KMx4HR4kjLhmZaoZEV+2UX0DrY6Co92PVeWQa1Dl1Wl4mJewbyIek3fov3ZLr5NvZDjpMmoPlWKmryF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVi+cX+axJVFtj52FK6mlqj5ScHeG3UF/5wRyJEMVdk=;
 b=aGyABp3GKPwIO0+DKxzAzvpBA9kE6lha9WYskCHy4h22ilmnly5tdQWI5/CPP2BSb1E2jCxsZmEu34KKC3zZaY9rZJiBstkKznDtiXZ/nAUDN64gL9H6pAm0SKV7W8q96G2uj9WBCCXj256u0we4jT1paAZIshbHBqO8kMcMKFxFnw9uz6xK2fysKcmJ4n+zgDvASDtEARPCfpkG76q4z53LTLy9WcAFFnPkg8GLTUVX+IFfN0ZsHV05kWpfMZgq7bINbND6N8Tn/TAPcy553pQ4J3I0K3BswPwvY8otVq10aWjh9Jm6waQ/+duPGH34Sj5kwg8fFw0D/tQkG03AlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:44 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:44 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 12/16] hw/9pfs: Translate Windows errno to Linux value
Date: Mon, 30 Jan 2023 17:51:58 +0800
Message-Id: <20230130095202.2773186-13-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5d401cbd-bd08-493f-988f-08db02a7bc12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HppBHrh+3q2md8KWg8P/PFDei1nrD2co3gQHIV0yQ7cNbLJi1yk3V47m25soc0YGHKUhwRtmg3n9XEKqxDM9OtIlg6R5jrlh/fQ0gh8Kl52c0CIRYxwRV6wEUFmwKd+09siTSysXsD2bp8yHTlEO+kZ9vKOWysFO5J62f+DOSc3J46fvgZRXeI3IDcyWpgbBKfIP0yp5NQg24jb9TZxsnlKan0mGf+KNc4YulT47SI9G4RqpL36vV2vZyj+zBG2Py0gTQyEGjI4rpcW27+xLd+7dXjQBf+2oZl9YWEWEQTUe79qq8IqAM92grUhFtZsF8xIoVu0f2F1izZUqxo7KNrIkWDQ6wvirObQY68Bmp2nmmSdQMtsmvNtpgVzBEnSkYn8n08+JIia5qVT3DZiKuNYRz6f4wLcACQI4IvbklX6rct78ShYOt+khyWViJC6LqFRzxbwtrf7J9pAiKvFvl/nQPnnPJg55mboMqYVosYnzZDKK/wlF6HZINcKnbpg57i/gSXuDFBIrZzR5NrYeurQtk+LzqMhCVslpFzTLcGTjfoUH5nGrr9sl2DwWE6CFLdBUyQq9jj9D5SlXqWS4GZSHz+6Ynk864bZ4E0qOk34dLDGW4FMw3KeRght6WlJgsk4xiiCzW/YhqrBsokVA2GPxo2NRzC1dPxwi3GtCzHxgaacODF4VOOwQjh+ZTNkAHpcdXYHD8sUcj5rJ9Vk95A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dd/zWTJ2cR6FoRHgE2lf1ZJRo0zru8qldrez1o34Z8VLQcOhdmfHMX1ZXSyc?=
 =?us-ascii?Q?3EVcWhk3+CqCM9qnR2IASoKyxRMJkwFBiIga1lH4dH0/ag1qeoIo5Apzj3LP?=
 =?us-ascii?Q?DksdvS1+X99aP6o6w4A8wwluL6wuXKGx5tnr8FWvYKnD+fStZ/42r4axPIvT?=
 =?us-ascii?Q?DGpmeGByGLcbhpURlVUe4tWJq1F+2FYMeqQfoVVVP1DM3CxqFIAt9Aqb5X3J?=
 =?us-ascii?Q?BxknGHbFzOJ/QcbkhhJMH6sixd3VRQH4MUrJbMixwB1o2wLERT96kP20AGNq?=
 =?us-ascii?Q?atQT3vUUAlIzg6YgypRhatUMjcMJ+BsoqXY8xRFjVhpDJFDvAoou/gYB65Ia?=
 =?us-ascii?Q?iLBsOE4wNRpKAQhK11QuPo/s9yHcDhaCNa9aSoVYSOfLNO1xmJynY1DE7MjA?=
 =?us-ascii?Q?v2daRGB429xv4nS723y2YyYlu37EY1BzzCuqofLOy+sLx8RQkdVlX8I/enOi?=
 =?us-ascii?Q?oI9KO0qR/3vBLztsXmVo4D4jVGaz2+oTyWmPbJpoQZvn0VohI//C8v9XtwTS?=
 =?us-ascii?Q?JDkr6PXiPQpEIXMujfnDzPAsNEYos41GS85RtFwuDJ8MKAWSPUM/gJEid1aO?=
 =?us-ascii?Q?4TY8+Dn4Zb3ntyKpKNQSttkErZ3TWmXMX++R815TqOH0SZ5liKeyJyqi6SJS?=
 =?us-ascii?Q?HoNtEXe3f6qdOG+GoHk19C8d8OfYPj1AdQ/4Q34XChR/zieFf4eiDB/0fGlP?=
 =?us-ascii?Q?cuPdmeAsxf9oS18gP2oujBcon1PM4uyf2tI2KKzbuyiPdM4rsrV+8IGzqrgL?=
 =?us-ascii?Q?y/tAjrmTUKHSrtt2MxIsQbkJbJWU/dd9AlwBTCwE+HMjTEHy/Ebsh0EfRzKM?=
 =?us-ascii?Q?AHtKR+cHv4bFhSg2vpTxpSuvQD6V+AwZaV8PPPs7JLZh9grgyLCS5Mq89SvK?=
 =?us-ascii?Q?UzTJS0dP3L5glLy6CwfRE1DkSKnSFWka7ZOoK+z5CXImiuQgfyZU9kjkREyk?=
 =?us-ascii?Q?TzrO3pq3AaqSVePNsbdrxcE+tHhkeagGrugp+ydzrI78Vr/FTh31a39xLjiy?=
 =?us-ascii?Q?b4HP8kWmXLbtNQWmST+NKr9FQFWUNUfi9uck+jATTeB+wujYlGE5wUWyooUd?=
 =?us-ascii?Q?gY2Drc3HZ60rLu3hqTHC9POfajn5rg8/SzGNSuuk1Pe/yCkehyz1JJPQKPMK?=
 =?us-ascii?Q?+LeMQBwo8XwMocOa9yJF6oDcdupFYCaERlc3jdWaDa5TaOAGi7Bcpir2GsVG?=
 =?us-ascii?Q?3LASHVtHr0mppR5KYELuFAnSzWCsakF/GHONEPEUZK4KR4mECryiBTiZvR7l?=
 =?us-ascii?Q?85HYrQOfZoqKFdWxUeCODtggllDziPeHk2uMo7Yk2Q7KLssNSHVMOmo5TiRj?=
 =?us-ascii?Q?xmtpMlmw901WltI2agrhgBOh3CD5OZnrHJ/qPBvM5XCLezInmcYAMWNjJ51b?=
 =?us-ascii?Q?coaunHJnoh+6XRfivlfZUv+noPLmZ9iPnjV8eewUrU6zNbTotMbX7vNbGjsC?=
 =?us-ascii?Q?KFYv+5lTxCfIW1QW699yNNCY2Olpmthaz4w4SZBFu+Wk9tYjWtZNza2lDGna?=
 =?us-ascii?Q?JPOXV7VaXXi+GLofOX/+qDATzUsVSjl9oSU4fHna6ApYTYy2EwrES1aAk2D2?=
 =?us-ascii?Q?MWGJjKTFooGIPE5oGOVHzP+jh19vO0ATR54oToFchjI9pZnsE6T4+8rGxPAl?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d401cbd-bd08-493f-988f-08db02a7bc12
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:44.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YD8jUiEDo2GT4C08ayD2fm2R7h7SUwapEoJeqzEoZAw+0BYTyVhnnYR0pHxULRYdnHPZRhXTZtQeICcNgvGzbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-GUID: vagcdxnEzmk3WoqgBlHKdH6dZohn2hGU
X-Proofpoint-ORIG-GUID: vagcdxnEzmk3WoqgBlHKdH6dZohn2hGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=703 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
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

 hw/9pfs/9p-util.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 778352b8ec..824ac81ad3 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -72,9 +72,9 @@ static inline int errno_to_dotl(int err)
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
@@ -83,9 +83,17 @@ static inline int errno_to_dotl(int err)
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


