Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A854A3F9E69
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:59:34 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg8W-00067N-Lo
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3C-00059N-Sx
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg39-0006oo-BC
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:58 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RHD4RI025386; 
 Fri, 27 Aug 2021 17:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=YNNOWu2x49LZfAvAzV43p2VgWHitn4HIrGGwz36Kir8=;
 b=jsD4r8Ebq5/KtNAqhgp70H3Zc3ExtumHNk+J8YAbmsVvkDQLrt9gDxK42LUuO52sfdyE
 NEl2LRLhBqFpvKiKjoLVDy9L3S68hNU+V2pwu6rhHvUJW3ZtrsHWVur85p3ErPTNdqMD
 et6KrhalPiIWK5126JY46brQSEPPW8W3twIvQNiHVR09q+nxhKgsRA+aZ5KHJwKXzoNp
 vd/cG3fv+H7ZkLz9ep+VcgUDTEe6YpitPCaIBcuq9Xmc94UBU8N6DeYVubXL7e/RzMc5
 gB44KZGBj2VRlsW/NBXewj9/OU6O/hGoGzCrnb3hUihxwJE64mqcQFJlv7EvhTlGCKj8 lA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=YNNOWu2x49LZfAvAzV43p2VgWHitn4HIrGGwz36Kir8=;
 b=fvg4q32ad0IJg7AkesU2vRloMv8ehW1v0Vxl9d0t3I/R/P9Db3PGqMm51j+ZShW+A/jx
 ESYi9bCjBXtVxaZSYiy3SLECS3TcLEpwFGY2I2fRZlQfuPkndC8SzL11EIVJMzP7yzrf
 2QKRxP685Frr3Cr/uBJ5Tm+0bgfERsd4wQg3LDIQ8vhddzpUvp45SRLzZMtCTWnuVano
 uM4qTbQ0nD9zcWyvuQZF+Awmun7qg/ce5jL8cDcZkvCbVVAgX7y8T6MljGpcJlZXF6yy
 CGl8wtN2J7Prt1edIwn48QRip69sFjdd4mc44Jd5G/rwvkusfp+JOzUTFIM1/fAf9smv kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aq1kvgh84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHoAfG037930;
 Fri, 27 Aug 2021 17:53:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
 by userp3030.oracle.com with ESMTP id 3ajpm53h62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6hERN834jyUGB8qgAO/6inxK6ApztSF/ht0nOCvgXU6dIthIvllgoIbbLfvNtmeAhxYlDYtOvdHfXLIEVuDDrIZXyLoqZQmuFNDKnJMcF3ERsgPk4eSNOnUkFHynuiiNCTUJzT+PosnjWKlW9qjY/hMSQrff8X/xTVUqY7A0sPg1oaHQZnstbaqrfsrDPiElSgpLg1tJH1L4EXSjuuwH4O7Xx1vedWMNmI3jZOCT1C+fwweS0Ji8tafDtgQPl+LrUOs0eXzn6X/cjahXdLEdWBXa/7WcVIdB8X1OKpn3CBebSPc+oNdwb2tpYE0SA8Gvq/Oa0+90zjbRep/EqD+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNNOWu2x49LZfAvAzV43p2VgWHitn4HIrGGwz36Kir8=;
 b=lIXXWLqzSzYIv+wfOJDumjcPtZXvuQhARrY4uxrS+NpHM/060kipLfJaXQFzT+w3kv+5AIIRrpyuuk/YKuy09pA+7K9MW4S1HeVR8A1gTpvr/H6q5sQeznHiVK0IKA+MWbCslQfU9XzY1ADw24rykKCU7/G1ww8HEFYx4RwfKXOkrrQp3H3YCOKOMZSJWeorL9TNdMqeRTXUUimDkUvqFxROgoffxP+046+QFX9RHDddrOPdNXQm6x1qNwKMZoyWTfKERFXA2agH5UEBC6vgOp9Rm5SWrpnFANdaCIj1Fi7OlUw2ccUcfeUwqkMilKJzEr1doiW2aONmsb+o5+zQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNNOWu2x49LZfAvAzV43p2VgWHitn4HIrGGwz36Kir8=;
 b=n7xL8353pOus8gf2VcC9xx28QR/0nSgOe6t7/QJIdeeXKXZfrToPHeoJguF4+YcOnSIk6JnIRxG7Gf66qyJc+vQjatpJtKFrDAvQjUCyC+CiqOG0xG5SEcEO6tNpIo5GI32K8tkMnbqUwwrMsAupe6JOdPdmFggmR2WywHLSMEw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:53:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 03/11] vfio-user: instantiate vfio-user context
Date: Fri, 27 Aug 2021 13:53:22 -0400
Message-Id: <4bf892091b1c08c79907ee2460f5f7aa797139af.1630084211.git.jag.raman@oracle.com>
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
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eea084f4-8045-401c-32eb-08d969839f20
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB486514EFD7D70A41A0CCB5FE90C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:57;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICbuV/BjXPnprFaqI/loIjv2TOUORPd2JRaMr1ADSiLVPJqO9DNQxoGlBI74DJizPz45s9JdWGtw2BnvVz3LtAEytR30wJefJGZjUbmadzE11LTLSZwTaGvEp8qHOkHpZCYs8QpbpvSICuslIaUQjwAGfK+Z//PYcp9GRhlYu4e98BJK/HXC+nhiNqE8KJm8sEJM9YpXWI1QKO1353k809vjfrADIFwcN+n3zLnF5a6ass6M4UxeHbeUHypBoGDgUWH4ySBaQKnkHUo8AnL5supA1X8y/etdCLD5CVL7lnZj9cwklo0bl/ur5FVY+96ThgRs4OY1LvQ8myxjfVZXUCUx/PWlu+9lq8kUAy/TEa2FxHFN6+Jr5ivW5htmwsS+qzK9iPFItQDXRHlZKjR2NbGJGTkx3jI+oRfU94h7piSd3BvrCzKJF6lHd75sYWf53rtGg8VtNaQpNk3uA3jl+M+4fL6Nswz/MVefsq2s7/TZCtZtZlS6gZBBObf0EgxfavVsyn9maJO4SN+oV8sWK/1vEIoxG00IihArUxkY9WYN7WnZfZ/DweJcWZbaNIYno1nyO32qIxKu8BKVH68CthHtUWdAet6P5AnGejQyqsDXVoRv/V80utSptar4VFEoJgt0dcsf4dpMbciXNQilV9Q3npfXa6BsSt4T9UcVoIKwSNp5wcz8zGVUNPsDolN9tMF93wEVj2cSXnj5Bxe12g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rWrG+vC2fqwuNCcCtX34l9tKl+EEDa2kV6JizPdstcquhjntDeSyfL7zz7xG?=
 =?us-ascii?Q?piALWzvU1ZkN2pPtoVC1uq8EzOhHUDl/ZYt0vDH1/EUWOQrsNr7F3wYP6Ymd?=
 =?us-ascii?Q?jXgGQvm3Dm/Wqh2dT08xhFivp0SbeSd0O4pcfyLmh5yH4sXzUoX6FavBjsQk?=
 =?us-ascii?Q?1sq4otK5e/NcaH9HwaLhkq5UzhAHqSz4pQh7sGsPZ32LBuDmL1e0gKu9HaNJ?=
 =?us-ascii?Q?AbSJvx7mEMnaylV1Pt3N4bKPacd98BjipRfUF4PxhQ5EGFTl5vukpy4uM7vL?=
 =?us-ascii?Q?DzY9Sdpu1D+Jue06+cpYvul6b2CRm6EN8ST6IDlnr2GjTNIB88YJw8AlUNod?=
 =?us-ascii?Q?HDw4kGn1Ryr/yHCAw0q5T0MWAXXpNeKuG5Zrr6DjDP05w069XRffeFW3fqKG?=
 =?us-ascii?Q?nsqDPoUMMR3kt4PI3QVr+Q/VO1nEC7+Q4/Yj0tPEsmvROouf8phHUW1zTV/2?=
 =?us-ascii?Q?bqCGW3Um8QbBfFU852CQunT32k5DnOULKNsuz/V1XorvHYnLeWaoNyrmjet8?=
 =?us-ascii?Q?fOh2mWDNx09aRX9kN8fuBbZi8lZRUYunhbbbp4+Iu4Z9eEBen2G4XD48WZ4I?=
 =?us-ascii?Q?A+hJNX86LzZZ98KDlYLd9kCT2GNUNa5u3odIEkNvXENdrBZ/3HKvWEZjG4An?=
 =?us-ascii?Q?y7zUIj9dmPH7CSp7er3/2qXKPf6lV/JD2APASTEnJSumwvwktiE7rm70Xv5H?=
 =?us-ascii?Q?HzULDB3AXF24XchyJtVRAO5TNahniyS0wbHueOwQodA0FxhvDvol+PS4YRAu?=
 =?us-ascii?Q?irUkN++9hdRJQQyaJY8IdSYYB7a4iTDonuZS3f6otF4Kp86TMP+uxsRA7XDA?=
 =?us-ascii?Q?YpfZhCHwmSrFdSnTZG0RAYPi+9+dWT3xyGlauv86v9Y06VeB4eIKOWekCfAn?=
 =?us-ascii?Q?p6Ew1DWBwJk8BOKohnrBEK2/Z9Kng1Zlbeb6EJaNu1Qk3GeTb7x1UI7ssIp1?=
 =?us-ascii?Q?7N8hGgehq7muozwCHzj8v75U1hkvFzIOMf7FbsZ5Tq+4Loq45Z1oznvK+eD6?=
 =?us-ascii?Q?vzmtqTkU4Nmd6hz4dd3kboBkCmf7Rxp5ADIJooTA/MlI3KcSbjOd0B56Bwrb?=
 =?us-ascii?Q?A6/+rd9gblmGPceDGtyNcQ36zzAOssw8ZyJdSlOsRSuGtKnvxyNldP8YIUm6?=
 =?us-ascii?Q?KCCFe3naVjbCq4FVXl36Zy5JH07omNpsG6wDjFJlJTIGBNbKVYYu+qD/OKUu?=
 =?us-ascii?Q?icTwx6AVrfbXgHCNdB4zuSBWe/z94HIOpxFv3YaGAzkjbsnzdAnMFj8bR9z2?=
 =?us-ascii?Q?0vaUW0V7/WuC1yxKGu/YtmwTZZyH9DVSUW9if5lRRu+WBWQ3ZNLLEhtzU8Wp?=
 =?us-ascii?Q?gRv4e+0PHGxETbm6m+iM+1Su?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea084f4-8045-401c-32eb-08d969839f20
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:48.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGPBhqESqMRMeYj5H/ahHqNWK/Unt5zp8sXh5Nqdlo2b0Xb+VRBUGhkf6dT7mLVRRClSZkOXMMwmtwxxeLJ16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: yVBxvBxiW7_9AY6fWDY_HMovlBPE4B09
X-Proofpoint-ORIG-GUID: yVBxvBxiW7_9AY6fWDY_HMovlBPE4B09
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

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 4a1e297..99d3dd1 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,11 +27,17 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 
+#include <errno.h>
+
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "sysemu/runstate.h"
+#include "qemu/notify.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "vfio-user"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -51,6 +57,10 @@ struct VfuObject {
 
     char *socket;
     char *devid;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -75,9 +85,23 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("devid", str);
 }
 
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(&error_abort, "vfu: Failed to create context - %s",
+                   strerror(errno));
+        return;
+    }
+}
+
 static void vfu_object_init(Object *obj)
 {
     VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
 
     if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
         error_report("vfu: %s only compatible with %s machine",
@@ -92,6 +116,9 @@ static void vfu_object_init(Object *obj)
     }
 
     k->nr_devs++;
+
+    o->machine_done.notify = vfu_object_machine_done;
+    qemu_add_machine_init_done_notifier(&o->machine_done);
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -101,6 +128,8 @@ static void vfu_object_finalize(Object *obj)
 
     k->nr_devs--;
 
+    vfu_destroy_ctx(o->vfu_ctx);
+
     g_free(o->socket);
     g_free(o->devid);
 
-- 
1.8.3.1


