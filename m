Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418133F9E7F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:06:04 +0200 (CEST)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgEo-0005RF-9g
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3P-0005mH-Vb
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3N-0006xp-W9
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:11 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGNg5c002209; 
 Fri, 27 Aug 2021 17:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=u8L5/35yRc5TruaQI2q4JkE9W7gLuv713aXGPmw3Yp0=;
 b=bI+YdpuUi9wYOT6/aE80kYM6Uc5Gs4bXqVEkPUAqAQCQMTE+G/D2GJVA2jNZX6ulv5Ul
 dzuPgzWLxXq38ozSqWBDa9H0S2iPW0dkX3b5ugn5cv6rK3HvVQktpsC3WTJpf7zteqRN
 L4irDvITNLz1xOPG9WxVmnu+YWBNp0NfSEc0e4mnh8HWFRAcu3nI6vcsxsKabEL/pefN
 ox6kOdf+13u7CcdauOlPOybbr0FUe0d0B9buJ5+0lwBSnP/TaZX38ZnajQrMyKf2yQMJ
 OmlUSSzGDyJuIfACia8DZOJVlkjoC2JvJGPUCAH8RANcElLflXpeAVEqGvgYFUPdj22c Ew== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=u8L5/35yRc5TruaQI2q4JkE9W7gLuv713aXGPmw3Yp0=;
 b=WbKulZx9n/0XYLQpmvWXSF5VCyrffJj7m58eb0BhxwBqmMUP2TYGHWbaIlpDHITRHh+B
 i1EX+GmDRJwPRsXro8c5yHXQyALYVtaiIo222qZxiyM0y/4qbp5Xy8g0PIC3nII1cJ9y
 oRnV2v4wqEhq4PIu/d7LyScmokccT1OPTozFVS3MAXn2LNouBqJijyvH5pTtzEWGeY4z
 ru5MQnXgqsdPXkJv4lrVBrt/TaMnGPqoYsEMChEDRQgZ3DNOyF4PrcQaArc2/gfV2xsS
 sbd6cAAC87jhDUlVVwxsozJhpn2uI0ZXLJnmVYtyNMfs7bgv95BzvpHIMXJOgIlX2LOB uw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3apvjr19gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHo8jq037884;
 Fri, 27 Aug 2021 17:54:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3030.oracle.com with ESMTP id 3ajpm53hd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+RjjJhfAZf2sAvrX2Bez2C7/xdbfrWRfTjhpSOckABT2M+DPNw5v2VtNqncm4t0VH7/bd17X3TdR7zWXKr3KG5NXFgl1PEAcmslFsBhfOiC1jNZCp175ij4b7Ovo3rMCxRgT3xKzLxU+AsD8mXSGtHVsjkHaMFiLnDIWqkfUrBJQ96QV2zj8NSk+5RFv1uJ6vMrZTXhUv0xWhmV1xYl/a6aqh7WxGzF+BZHJCi6w5cK61e0F1vf2PJKiUVSMqfBo4pdyvEti/n5Qa3nTLQmNZSjL79YUU2gkfIEveN+7KhfN5N5+mNh9WT8D9a2vT8RryBBYvp54j7PGzzasyvyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8L5/35yRc5TruaQI2q4JkE9W7gLuv713aXGPmw3Yp0=;
 b=AS741uVlMtm5JfihgSYogrEytrvOM/gbc5YfqAfRnrnRixrQBO2abNUDwZD2Y9ByZQWL3rATguJU5fM/8Ja67kS0EqLwAhZzId6D5G7R+E4ie3h3v+Y6rQLzjDpOTuinVDURPmbn3M5tIjl+4UxApg0A6+veiCi8Fndn24R3N7u+H7UqZ8GYgPlnfnCbPXUQAyGRSsu8FkQi4ah82hi+qJfAeJGg1ZxzFcrc3/HuCRwX7Nlh5LeGImOh+YFtjkK+P4aTVTVhRC+Kn+8Y0c+5R6kwjsWeSdK3kiN8WsN6Fftk/CB62kVktgdKGK+7Ij1Z7vV/5mp8QjNrFDHZKjKfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8L5/35yRc5TruaQI2q4JkE9W7gLuv713aXGPmw3Yp0=;
 b=TT0X7lxpuSMqXQsjHNJYGhqvaExNydXG/Ih+Ru31Z/zakc/AUogdaACCYMCtU6boOKjI8zuM6rjnsJg5KJGbugKMd1K4OOubYo1Vq6eSB+2hMyPFLoUyMuqtDES1X1orpKZnR52oor60IEfipdWCr1SD31fDs/NEdBF8PIXkur4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:54:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:54:01 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 08/11] vfio-user: handle PCI BAR accesses
Date: Fri, 27 Aug 2021 13:53:27 -0400
Message-Id: <8dde83642333cbe5e616a619507697dcfd315a10.1630084211.git.jag.raman@oracle.com>
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
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b426828b-3c37-4915-670d-08d96983a73a
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4865AA540EAE355418C8BE2390C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iFxLxPIu+pIuvV4GjqSJ4ZNUhyjKmdZ1uanYCv0t861JKtMPSWtJ7mSJe8hSjzVih6ptmyqKIUU677QbtyZLgZTlQfZ+Ewkjyvu6hur7eoNXXguABiT6U0oyfDA9MOvBUwHXv1gQRaQj+jKEtgTa0VKR0l66IjNfxuBr40qYsvc5pPENUNb6TD8EpY4tttJQacfAnmBFsdrhCD5Ju7bRENdePOJOCRkdUZF+oyaKYbBA4CITra3VpevfzeVKq8CLPmjl2kMSQF47TREwBCRSryXVwmZIQgczgRXBUlSE2Jk6LU9ky0g4XWpW5+ProGJFlBYJslZRCZA7jM3XV6bJboVXR3IR+aG2xHRCXcgIwkn0hxHDSE4+djoP18bezZRSUUq/18y2apLTTgKxbX8qW+qRdVo4AypJuSrLavxf4a+WztIYleHO3gkSjDYGGkXa3Pl4p1C73Zxx0WK1LaILa7fx521eRFYSKOir1+HOD+s3XFMjM6xnXMsG6VGwkEJejsaS3EBTksKX5UeLlh5/SJIjrjeUQU1+qCYF0epkUU+7bwdMTQ9vZgq5xnua6BFA8hZznsOuVgBWGhZG9xd6Nq1/lalRZNx6wBsJsl1Esukn/1ObRAhGUzm2bb8bedTyDduP1SlKXOqS4ymqfK99VEEiInN+I4y2JlKI5Wpxv9QV8cKmUEoV7tfXI9ydyo7UL3XxmVNoPnbgFTr/ymGrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BSC9FLZWC5HlLtACQgi5BaS2ie+ZaiTsQOfUZh0EK9JK6i7PO/L5bF13wSz3?=
 =?us-ascii?Q?Tst5G5mkjqBeGzzTMbbFs6TJ9WY3D4s6B5Yrvv3vTF37zDYBZYelJbWbKOdR?=
 =?us-ascii?Q?piaAEs06w6E4e4MJTPgs/kJa7NULAJWP52LfuxVIBW3ILtJsY3KbKWj2c1mE?=
 =?us-ascii?Q?lRWBj90vwya6JM9c2KaFnuFgK2NG3bIHNuPZUwTA/OFSxf7Y2rBvIjfcRDw1?=
 =?us-ascii?Q?r2/NmFuoqP0M+BIPLGQZBRRs4B6q92sqHWLH8umAYIC+FPPQ8GVU04JuO6A8?=
 =?us-ascii?Q?8VU5j2tW0cZF5GThzdlXtCwUaR9s3EsiJDsQDvauuVgrKmr7tt02BxdsY9wn?=
 =?us-ascii?Q?1/qLKNhE+qrTbbfPZlZahSY4ErCWDTee7gr5uLe6B7dV11iHhBdSq01WpE68?=
 =?us-ascii?Q?jVo3amCuaYHuzd+fyleahdl1ei13oEBIgL415Ld+kMo/ri607UbPxSJhEJ+o?=
 =?us-ascii?Q?vOsEF3pyWq/3qmh9WEmKrpQjpOkpBbEMYwSdmMYCjnVjDtdaC18yVHWtY9sJ?=
 =?us-ascii?Q?PQRu8Z15JWdTEdk0hxgWzdZqM9uHLVPM+xL1g386X5dfRd3247kx5+VZ2sAu?=
 =?us-ascii?Q?hXG+lJHxGIU13iPwK2aFR/yPYOeVJ2DOMqny+Nd8nGRngvrHLrLk/KWKSbXP?=
 =?us-ascii?Q?/dywEfQbEMyTQAYMK2tMr+68oeKCXxVjMGtPLD4VWXcFF/GISkP/mcnWKxcS?=
 =?us-ascii?Q?Iy+ogzb04s0dng8ASnRx0E1uxfBhWAj3f+kmZSEHE3ijdrPjeFR9D8b7GJIg?=
 =?us-ascii?Q?oTlsTKKQ8iSiNUKhQBSXH30MFyNjDEgwxbXnMJjEgLgdMZ1L8e9Wh6bPlxL0?=
 =?us-ascii?Q?UoAUZ/oLSpIB9dZzpiljX8m5k3f+davpryC5oCpBwa9KVdNPOJmbi+HduhEz?=
 =?us-ascii?Q?lWcDhxi4Zo7eGqaotpN+kKVFFHZbV39wrdu3gUbgqB0Z0cNbA9QFxHjdoMhZ?=
 =?us-ascii?Q?6zWggkbKAZcOZDSHkIfkwWot93iNB0nOh019qEaavScb1ZaQj5YeQs37vcGD?=
 =?us-ascii?Q?FERYWpAb6aQaOA0iLN93P8kT3CwptwLUNze+YQJ2HZViIokJwqJH/0CxjI5u?=
 =?us-ascii?Q?Qp+rtIwkavnyVhJd+N54kNZ2oPX26Ir5HAo1n6lnh9uz1ceSOBjYzmoVlp/9?=
 =?us-ascii?Q?//rnE0QJ9EKufzXw5tyB/GEch/BaGUze2f/J1utjJ+VDD6LbhIP6UBb71q0A?=
 =?us-ascii?Q?5MFb2wA2tYqjXwQgoyY+aD7SJJy7C/qgWJbTT8N2p08Or+5KiJVzTK4kOMXX?=
 =?us-ascii?Q?QxoSebzrMDAfNFjMo1r82ZE5NslDc+n8dmmavZtaIVERcud5dbttnZy8ipLr?=
 =?us-ascii?Q?Ad+e7N88tS7LQEBU+Ctk1ytI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b426828b-3c37-4915-670d-08d96983a73a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:54:01.8469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/kEG+3xm0ulhcQ/i/pk6Aimken6Q47xq10qNrhNxSgpTWTGG7vJiejPkAcJVbKGnrcOgybdO+iWPMyeS46VUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: fNcCROrJLt0PmoLKVu9pGVRvb1tWS5v7
X-Proofpoint-ORIG-GUID: fNcCROrJLt0PmoLKVu9pGVRvb1tWS5v7
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 +
 2 files changed, 97 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 76fb2d4..299c938 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -220,6 +220,99 @@ static int dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     return 0;
 }
 
+static ssize_t vfu_object_bar_rw(PCIDevice *pci_dev, hwaddr addr, size_t count,
+                                 char * const buf, const bool is_write,
+                                 uint8_t type)
+{
+    AddressSpace *as = NULL;
+    MemTxResult res;
+
+    if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
+        as = pci_device_iommu_address_space(pci_dev);
+    } else {
+        as = &address_space_io;
+    }
+
+    trace_vfu_bar_rw_enter(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    res = address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED, (void *)buf,
+                           (hwaddr)count, is_write);
+    if (res != MEMTX_OK) {
+        warn_report("vfu: failed to %s 0x%"PRIx64"",
+                    is_write ? "write to" : "read from",
+                    addr);
+        return -1;
+    }
+
+    trace_vfu_bar_rw_exit(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    return count;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        hwaddr addr = (hwaddr)(pci_get_long(o->pci_dev->config +               \
+                                            PCI_BASE_ADDRESS_0 +               \
+                                            (4 * BAR_NO)) + offset);           \
+                                                                               \
+        return vfu_object_bar_rw(o->pci_dev, addr, count, buf, is_write,       \
+                                 o->pci_dev->io_regions[BAR_NO].type);         \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    uint32_t orig_val, new_val;
+    int i, size;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        orig_val = pci_default_read_config(pdev,
+                                           PCI_BASE_ADDRESS_0 + (4 * i), 4);
+        new_val = 0xffffffff;
+        pci_default_write_config(pdev,
+                                 PCI_BASE_ADDRESS_0 + (4 * i), new_val, 4);
+        new_val = pci_default_read_config(pdev,
+                                          PCI_BASE_ADDRESS_0 + (4 * i), 4);
+        size = (~(new_val & 0xFFFFFFF0)) + 1;
+        pci_default_write_config(pdev, PCI_BASE_ADDRESS_0 + (4 * i),
+                                 orig_val, 4);
+        if (size) {
+            vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i, size,
+                             vfu_object_bar_handlers[i], VFU_REGION_FLAG_RW,
+                             NULL, 0, -1, 0);
+        }
+    }
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -276,6 +369,8 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e..f3f65e2 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,5 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
1.8.3.1


