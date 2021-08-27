Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967293F9E61
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:58:39 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg7i-0004oj-Ll
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3L-0005Zl-JN
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3J-0006ve-Jk
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:07 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGOv6K002206; 
 Fri, 27 Aug 2021 17:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=mIBZZ+JBC/6kuNITpParbi6V7GjyEop1/dB8wZM86w4=;
 b=XzSERacrEI3tcyM7WppHWgO6StzpxsNkkKNicMYbdIn83P3OkVI8EMgN0b3re6NBfhAK
 QGSS2jjYEf1UpjYpQAuWO4BwwtTiepbOx2VabbE8apQwBZEaXJha1nW5eUDa3MWsj/K1
 Qi7IpToR+3A3cieRLtyefsoeEtAMykYnHAmut3X/KK/FU2IaSQtrz/rByo7dH3scObf3
 cZscjgUT/c0gzzMfSGhZyCXIVV1PsXYAP1Dl5/Zz+v5xB2dN+9EV/ilAPMp80I6kO8Pn
 34xhYwGrq783mhwv9co+hvdyNh98rEUaWGfATpoiEAPE2gLjXliQry3N/0XB0bAr6rl7 wQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mIBZZ+JBC/6kuNITpParbi6V7GjyEop1/dB8wZM86w4=;
 b=DxX7FwEfAOubRU+X26eevxRSzCcpQKyJ+j9PiDK8O+OSJP5V/RC6/l4P1fKPIur3pb6f
 yDQ1wTtz+9zXhKwVFxsM9d86DQ36Faa9ZAz4dyLF/hy62y6ktJhzGulIqdaYaWWpaMIN
 ncCiWxO/oetQ/hYmT0yD/Dc1QRMkyvI8cypKtGuDZigWJZeF4cea+YwNSA8zpqR1DbSQ
 89a31b7Nc31JhMrNH/GAUrzHioemHH1PQkgIKulpyF4xzbB5XBv3JAbrSGMlrpSEXA+A
 AjtnIwa2xnT7kGYq2N/Cb4Ep8t9ae0Uvd3BSG7JIQbgamFryPT4l8jgMOjRypKuqsABL dQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3apvjr19gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHnuc4179067;
 Fri, 27 Aug 2021 17:54:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3020.oracle.com with ESMTP id 3akb92hj7q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvb2Rvu5CNoUeP3AG/fYL5f6GblZUOxmpoZ2KF5ccXb/Q6yxFZEXKEJeU+xLqJCq8qxyUkT+Y5Lw1P0+fT9O8o12boAyJj85njUpH71Hg8zIeNXGLO03dfbf6XE90kphkFFWQFfxsFvjl697YdfM0Cql9kb2RLGfZS65GY+Jlss6AhPz6s6dbqCnD1HER+fzHkwdKYWdzFBBSie+sWExcZ+ET9zx2ehJv0M1pS0GcXf4pvEx4BxnAIA2CwQkq4Tr7dacFGgZqv5h8QZ6MsWfTPS04DyiXuTX2rfRrPULD1i+yKg00+v6VZWhwUHJCeGZu3vfKDQzDZuvANslgls9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIBZZ+JBC/6kuNITpParbi6V7GjyEop1/dB8wZM86w4=;
 b=MYtWpV0uI1arv9BXkDgLQ0j0T3zMoBaeIzjA2job8byWemKU+34dGJhwaQfxFW4JMKGgw1KWMFET3buJ3o61WwYIbnunxbmRBuMZhP7vGvIHX66WyeVyrzahsc6R4ULq8V9vRzFQmNu/C3LF9HwBaMKBThJgEXwAgnWJvgcqzp6z+dUMAiOcIb74/iydcD6DPj+qXYiKEyFGy+1DZNw40z1RYMzbiNSMX0TW2O8EptrhtvmBv8I2RkZA78wR62Fj6zWB+ose+U0TCmsQCCuvlU/Am4HAk8NpwgzbQ/ZEYHtnTo4k2NZiNaD2z9TIXIMNDiYs56FhvOx5pnQQgrIgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIBZZ+JBC/6kuNITpParbi6V7GjyEop1/dB8wZM86w4=;
 b=0G4c6CLfLkqU9J24tDzzF31JmLNvDGTjjA/7KrK+qbCGRh//uIvZfF6sUtRBkAmYaj8o6zAM/tt9AIdbbApaUc1N16L8Kia1B+RtXY70k1QXgebqsiwtoGrzBQwH6Ya/fWAw1hiwO/zkP4xLoGf1NT1TiUfzb8SintS1EUt0on0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:53:59 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:59 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 07/11] vfio-user: handle DMA mappings
Date: Fri, 27 Aug 2021 13:53:26 -0400
Message-Id: <9fe8660c83c290e8985add3bd7e6a1e57631891f.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da957e4f-225d-480f-7691-08d96983a5ac
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4865D483251BBF235ABBEDB190C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLzl79Az4Ra/oIKWHvP7pN/5QL/CvkP0dqnomqmabUJUN/I9vTiG+i7oSx+Ryq7FKcqb1jUR3Mj1C487kZByDthKcQFrP+3WDpMFSHuh2U2gi8pVEMPdLw/RXVqr7sMfckEutC7gtJYIA1lRClWj1exBnIV7BffL5lc6KJxDcBFbBV2fKoCIA9zSiwyDZSbfdarpHgprHdxEmOZmVuMkJYRlVmayLp6/uAAnPR7A8fA+Ey0mJw8ivgbiIT8/h1QZg2Qay+pSnP6676M8qwrjV4mNJMKy8QVAxAN5V7A8MvIgipjMt1nxdaTUPzmRvrtseun/M76G7f0Rwme/5Q4eGfPvIDxIwz/C2s+PWZMPzrwy4o5TmUPQ592W5L8tfd+SWFZK5aP8N7KJplvwCiwVPPNDHadbjNNCHOh7zWmClgnRkxw+Xl0zSpE6X415moMnwjAQ04n0ZtjX68yheKvM2znYbsTY0HLmAt6sml9MK1s5z9PyL+p1u5iatgek/VKGjo2x94FLbhDW0lu1PhpnTRn3eD7OXwwhONHPPqMO0jiKx9NGd76TMjzxMslWajFVgSaxllDfjxBBgnHOMelzMwdC6HtMl4XfH/SncL3yfoVDupyykqgUeQchQ18/7smEio4du3Xeov9Fc0ycp/gebpOxlzA2QAY4YgDnsURK5NEFbR6uapnwbm2LzXkGlqQLWHt3w9s2bwDZs0Wiyg/ihw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CE2ypwT3OJomDCe7xvAcyk6XTnOApXzXc1fP3Bmi+aetQYod9+pdS2/C8o3+?=
 =?us-ascii?Q?kydo1y0c+sTR6MsBtD99aoT9MVnGOFZqoT26RnqBb5LNhWSF87QTkT98xMBX?=
 =?us-ascii?Q?Xl5G2TUy+7gVUutH6huosEpDry+WBy9KHQLqQfdP3ysmSuQo3JQy9YkXJK1d?=
 =?us-ascii?Q?Qg2Q6N2caG5egLBclqMhNV6uzXwfafBRbtGYXbCeBwQybSaxCCqWSbFCM7Ln?=
 =?us-ascii?Q?Wl3OmjONcjUgDZzTimTxun5PAuw9fm85zk7ZJZPW+nntRvODZAvk5lU/azOz?=
 =?us-ascii?Q?ukx19c/7XWONwYxWnx+mRDFDCrAxDdlBc6k80O5jATNAXfY4T64N0WdRQCLv?=
 =?us-ascii?Q?y0MMEl7P3ubpkBSgn50717Fw0u61I4Ji0BTGxzhCQlUKc/N08keIqx4DPKjV?=
 =?us-ascii?Q?t6r37FhsNhr3qhMJYicXP6hezujOqR5uaA5vgAk5jlKZ138evlFegCZvYozy?=
 =?us-ascii?Q?y6BmDzhlAz/4GZewQKiljbdCW7HN6EvsZXBSGm0ZMPMgZyHCn8x6ddzWDgRr?=
 =?us-ascii?Q?N1KllsAC1OrsUXVsDbYyPdb5RXrCl0Osi9aqEc5VYSQuJaCiwAmMQNIqI2Se?=
 =?us-ascii?Q?vg8WhYdmGnyJiPdCMAVJMkz1Ry/mBul1DwudKG/U/NlHYtL09Wm1pKxP4NTT?=
 =?us-ascii?Q?RPYuOKiiYI31AaMRDT6BGzvPHqPdOT+gX4UQf6ntW7tM4zjonlcr/qN34m3X?=
 =?us-ascii?Q?ntNfCN4+LvmirvdyQ0CP7ACi26kyuC7Gf8HcxBfW9KersF+SJ1pm+dDIhGLm?=
 =?us-ascii?Q?UmdADhJahtC300Gs2tcdjm05TkJxjYfKFwmhU2OKWyJmUzfaJLEPicZ9qIbL?=
 =?us-ascii?Q?jkSdeCe63YMF/TfCgMFmmRhQFo0hP8fMDEtcCe3RuPp1BL+tMaKIWFNvFEmT?=
 =?us-ascii?Q?/uFYjVgxGTBOdvo1F5niQXg+SS+9vxe695QUC5w8NREk9LetoyrRaUbIKHjw?=
 =?us-ascii?Q?/wrD+T+f6yaCb4V3bwJqrWNJCryAcluqG7XKBltDpm8VgAWKS4evb2RO+tPw?=
 =?us-ascii?Q?viSOy3pCbSnNseyzNsqNoNQrM4ADun4zeAdgcZuB9FK8xKw0El73fg5CUXeq?=
 =?us-ascii?Q?gPgf8JWjM3hYv/zeGFiSRkWdpgA428sKmPIpsyZfE6Gc52VURgwiu3SoD6wg?=
 =?us-ascii?Q?qzyXdfEAPR/8mx+Sb9jomGj7RunEW5gcypGHxuPjqTTyUW1GqNrW+vp8DP6F?=
 =?us-ascii?Q?i7/WU9TZ3No52yfk7po3HHhnvsN9lREC7P+kJn4kxU3z9XpUfhCnxORu0Fcb?=
 =?us-ascii?Q?bCCDHGnSyp+lpfjAqbl+2Grlo3gPIqngxvrxGVmnxbZfxiPCmLD1rB1rew9G?=
 =?us-ascii?Q?tPm3kfWMs2JE67Q7Fd+u/tUT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da957e4f-225d-480f-7691-08d96983a5ac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:59.2770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf+BaNfhzl4yF2C5ZgiVk2xU9qq3bCGOxbZaVFu5s3TSX/udhKjlRMLfTus5uObPEju7DRleAJ3xWyu5a+hFNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: gifVbBt1_4aMS7Ciep4xLFc6iKod0lGG
X-Proofpoint-ORIG-GUID: gifVbBt1_4aMS7Ciep4xLFc6iKod0lGG
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 13011ce..76fb2d4 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -177,6 +177,49 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    static unsigned int suffix;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("remote-mem-%u", suffix++);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_base,
+                                subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static int dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return 0;
+    }
+
+    memory_region_del_subregion(get_system_memory(), mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+
+    return 0;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -226,6 +269,13 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup DMA handlers for %s",
+                   o->devid);
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884..f945c7e 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
1.8.3.1


