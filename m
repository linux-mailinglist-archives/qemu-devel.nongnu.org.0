Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FBF609A1B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:56:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYb-0004gI-5b; Mon, 24 Oct 2022 00:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY8-00048I-6a
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:56 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY6-0006C4-LM
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:55 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wibr017751; Mon, 24 Oct 2022 04:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=sdc1sBW+ClvCoAfMr2NakYHq4WgtRTi5ldHN/9cqbdI=;
 b=i1WV7XN4417ZmPl+DD9leukskdsnn/90hGG1EnhUD5hOnDPrjaIBWvc39r2NX+WDsuX2
 u0uY+TIlstapDlEG38hDWe4V+0ZSxCDD1gXE+X6oPGblParurPl69i3ynkukro3I4aIv
 1mRs6scZxshCZUobpJzIUki12WL9+eHUQhnw3zhlQoNFtccMRK0LLIpQNZLNLAc0HDMd
 MpuExgNcA0neQqgBfJIz228zxncnw38JfFJohxYYmSaEklEJNx5dCC+rtOcvjpuX/qO6
 +ETB/F+Egsa6jyFeA7+LLui74TUeRZCfLbuBNi9YvMekRSM5SsZ8ByP+Z9Oq2nPxiu3c PA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc5r2svrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWHlbTTk9VJBbPoCpP4qP3q71p1WdBy3I4/yeJztZ0uzKulva1pPD3cbrv1+o+PczClj2jccUfdlms83yF+9QhVFJbRt409Cf0LVPp8pHFL6UjDHhQx2JdtgYmLMiLtSQvxngGiDyeU683D37LfTHqbqKjE+CQgMjBOvFCKf5yV6ZRpoamZHTTHKJWDQ0fT+jkdXVjtnV9Lghf2VN760QrTRNwj7gDQ4ByblPmmxkEMPqVUyI0gCoAO9vlorygfxPRk+vvaO/CIp0qaTwVswQUFa0JEhcgnB0GcsMi9pqkUpimpeacL7RnQQNlWdpCo8qNGoCOJfLWHw8P/a5xFBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdc1sBW+ClvCoAfMr2NakYHq4WgtRTi5ldHN/9cqbdI=;
 b=VNmPN7huick9GEcTdjozaAu29wpJbHd7BSSDPeBOLGcMUfiAp3q+9BrUVEf5KYuKSmdEMQvIkd0zIzI7slSGeXEDURnb1CopmRZmGOVyNQAfAUyOEM+OBXsz5bh7+1yXXfKXTXzdrqY2WVuGyudR+W98U8Gl5L96kqYgzXgBJpO4tKeDtf1aV3NfYyWDrNO8QHrYCrOFjh84tB/EM7gouc7913B0E5fSDodHOaXH5tX5FWtZau02iOUvAM8/CXrfvBRFNriR2T84blz2d2YKnDiizx7tI4dmm8E/aNgNhIWNGFQB/Lz4MnRLsAvqDw2YX9r//B7hZPoDaQELskimzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:42 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:42 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 13/16] fsdev: Disable proxy fs driver on Windows
Date: Mon, 24 Oct 2022 12:57:56 +0800
Message-Id: <20221024045759.448014-14-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9611af09-8060-4f11-f8f7-08dab57c6c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OMe2PvdkMyZf4fBGiNjH/aoZmhQJkDqFbwpKmkZoSTrAYDfjaF6fA8bvHVJ+K7QmiH8Hp769Q8lu/XDNral1YvAEBs+TAlKkFK+8SyeTk/OKlToj/wPSSC7IS+hUxJpJnfOOU9x2NS8bmQbOYqXFHOriKk99jVcfRIuRX0/Fbs15rX3mkYBQUROQasIrV240aAGOeaS5CZPyKbiJ4IcasuMF9ZChSJczav5E53f3lmsp5KJG6cHy0uTJNOd5Tlr7K5v1TD5OtlEm8m3PSOWRNcB3Xz89lrJklSi1Doggltz8EqHdZ19IqlFpZ9mnVhMHB+7idhCjrfhxJvyOcl93nOrXeRgdP95ZyN4Ou+CefuRqmdPUKPiAj2QTCxA1znrSvkaztpBELOCcunvxaLsi3byZhTaDYIL3ggIrgVCkr7E5BHzmChb3dtKxtgbJcVup9L1tjukjrDV/c/uZm9YkQ0srJlPHOXLmOgqWGkui2/OO1vCw1sBJ3+KSjmH4MIpSw6J9g1Z0MdjCPtB9mxXaah43W3zVb17nUqLjgHH2Kl29vJKzTI64T7KqR/CnGq1d8BLLauyTXKnvozgqK74dWnp1Gwh3lT3R5m3ut00h5++mMwJI1JTsFvXc12yEoiAjWi7A5TDpfxe1nYKw0iN+FdV9bgq5DaZ/mkxbvB9e3gV7msCMxvdQc8KrlCkBVkzjBo9cUXsrqlCJOoUmMv07pTix7+kDdHWPddJHHqUEg2HzBCkOdraNm5Pha5SAmET3DIVo4iGIpp9IIEw27Fqvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(4744005)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T52xB8+q8sS0xt7ouPq3bcJpZHAVGZGVgOa+0Qubq2ojje04EmFEE4JJVdEG?=
 =?us-ascii?Q?rzmgWATT99cvu9J0GX+k2KgPviN0FFOHfcxK9fPmgnG/6oIniNP5Y3Fw0bDi?=
 =?us-ascii?Q?MmmX+x4KHgSA0BVcxBz+K8J1/z2ydoPU4KVYfvSTVt6fX1Ih52Pln6stmxk6?=
 =?us-ascii?Q?eYbMZSTLNjHnCwyk0fn9hCbTU8AQSiRBCaAPPywmkj3VRwtFoLJwY/iTXNYT?=
 =?us-ascii?Q?GFLriyzVu1gzA+bHixrIPYAF7bFuPfje+FBtCNfq6FBsr/YdGa9cRCPYm1V8?=
 =?us-ascii?Q?0j9BvFIIeiL7+TdcCUnKRMXHBWsiEk5B/7X+vDgE18Afy2QxunNPqBk3Ha2a?=
 =?us-ascii?Q?ItR9BxR9o24pQiFWuhB+UJjlOGMjq9OFbkeS5JmiXSUYhdKiqSXUVSH7pfRi?=
 =?us-ascii?Q?dKApUxW+SxaI92jJ6l8nNPZRnx/H9rV/wsr2B/nqa1Svak+BIunQlZZD2iiO?=
 =?us-ascii?Q?fKEZXCxyzBfIKMLfFHJVIciaPriywAobl19/Tw8dA7L24cu8ntHgS45kp1gU?=
 =?us-ascii?Q?/hUE4u1855Krh4bXUok2KuVl2rsk6xVXpJX2hxxsx1wL5UUI6uX4aIwop1NP?=
 =?us-ascii?Q?vvkiqqyRxj/a+o15uzcnGpJA/oMYPVJVKwY55fF1yK4lAyInwLRMg7dN+NeZ?=
 =?us-ascii?Q?33wY/6k6F6M6JoEPgqa0kNK0aTfS+PyfH29juD7te9xc51CU+OEJp+24hvTg?=
 =?us-ascii?Q?gYnWUxsb2tY0TD1H5hiG5IUQTg1hhFSNgmyRiESGlnz+vBYkroKuzCbgJMBt?=
 =?us-ascii?Q?q30r0jvCQFWffRt+Iz/YZI4QpwWyUDiAfV7wphE/p6J8/I8bfVQpwCL0kujs?=
 =?us-ascii?Q?ANan5FlpnHGKo4us3FYhRWnrmqc0+fRZk2kfHoVXvUgxdxH8/mnN6swIena4?=
 =?us-ascii?Q?eqwwczAtOG9B94Jmjv+zjNnhY1+A7glLcewvGUH9qsJuONkTjNCVh3dQE7Xs?=
 =?us-ascii?Q?EkO1ImTVESqxws7pAFX9vRO4GnA3jAX1fNPjzVy7JntnfXW0soHNvUmUHfh4?=
 =?us-ascii?Q?6jpIyKwxYej8BUBAxCo0kXL+63rjWq3cFGwJLVlNf+RIxtcgSSR/Egebz3lU?=
 =?us-ascii?Q?loqaiKdfl2VdcPG1t7yjallf8yk4Z5cM5izzzO13QmOW9m4BaPR+dAv0R8Hx?=
 =?us-ascii?Q?mJeMVVw4iOgBubtSuJgqQEQPahtnr6kwvQiZJEEWocz9W/Su+HE3niDhAgyY?=
 =?us-ascii?Q?A2idaG7uILkTVNgKypswijb6OLuaKPCqxGOgvTYYQlvme40Kkfkn6cVfxOZI?=
 =?us-ascii?Q?ssYcjgKVjDbKpbGF1K/AJx7T+fMFarHZ6QVbq5pTg2C/EqKOoTE7j9y7VusU?=
 =?us-ascii?Q?vWG/dZb8NGR2YgBk5Tzdagyz0Grd5AwQTe83QWn9ZJWtEq+N6YesrxjB4zUD?=
 =?us-ascii?Q?bZBxjegtLpflEjyjHO59Xz1k4owZjm9w9KrIzSri7PeCvxjx98hF/LjkoVk+?=
 =?us-ascii?Q?61uGXBpRzEZKRrgs/UNDOb73/idQWHXMuD5JaehewEL6iKLr26qcQmdokktF?=
 =?us-ascii?Q?9Rb61U3ArJIsQvDCE7aOVQ33aBqTKLRPGYgvY8e6uney2/yRuWVGHVOP5KBo?=
 =?us-ascii?Q?k2jcZMsYR3oZYR3n/KIcRMF/JxEG5IcB25b6tbFw8QLzSZD8EIqYAafK7Xtg?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9611af09-8060-4f11-f8f7-08dab57c6c44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:42.5565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzHZJ+yuhCeeCd7rtju5deF47H+fdWbW8e/tuaOsRfC1t6b85BkkEiAC/H+sD77XHINRgGW4tyBo6Z0E4ZtroA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: Z5roiwr25a1SrnU0dfToru1vmIaXyosr
X-Proofpoint-GUID: Z5roiwr25a1SrnU0dfToru1vmIaXyosr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=577 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

We don't plan to support 'proxy' file system driver for 9pfs on
Windows. Disable it for Windows build.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/qemu-fsdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
index 3da64e9f72..58e0710fbb 100644
--- a/fsdev/qemu-fsdev.c
+++ b/fsdev/qemu-fsdev.c
@@ -89,6 +89,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#ifndef CONFIG_WIN32
     {
         .name = "proxy",
         .ops = &proxy_ops,
@@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#endif
 };
 
 static int validate_opt(void *opaque, const char *name, const char *value,
-- 
2.25.1


