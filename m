Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126745EF4D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 14:41:10 +0100 (CET)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqbTP-000393-DT
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 08:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1mqbRG-0001zU-3T
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 08:38:54 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:29586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1mqbRD-00010k-Mt
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 08:38:53 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AQC1A8d022240;
 Fri, 26 Nov 2021 05:38:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=proofpoint20171006; bh=4CBmETv2ouhNLRFnf4zZZl/nDKPQVezKLsP9yD9ZI00=;
 b=fe1muU5ki5000+VysUaScxUXLNv/xT/SpR3KYc9FhBFq7lFxxmR7WU5cA6MUqEGISVB6
 XV9IvFb/QbCKyi+Z84btqrtJY58O9xquSlKjXiVqDbLABJoEJ3AamSkq72Sk4+uC/WTi
 FwQWTHHsfnkk/HqsUO7TenaAoyKVneFCrniM0CheeBiHCdVcaXXqJJzUSm1+XnmV14vA
 nuu/BAOSFW2fcddI5Qd5qkZMxD5UDccpCj5iHKPoJm1cOFlA2ywjfwtRfL34ApcqrY3C
 CNJRYe/sSaUFjA9ZEwYD2fAgPFNOn9D5huIlcVcSDD7AO4/fbpBGVFFXs9a6heMEs5Xp LA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3cjkcnh65h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 05:38:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSNv7f2cNJFhc/kz4Nxuz+yGSv5ucdaljIXgHhr7TZC+/2r6dJ8vDIFgGBLKLDH83j8Lo/546wrIpaiCihbo01gdPwGoBjq81tRXUAbnEEdWX6glzLWdVJ8PwyHbtrnCUjjclh/4VvPPf2BlzQ3/kkxnl7SFUBRip1zbfCtUrfY4AZjQCBOGcb3TrHNaxCWP0fQCfgNF/H6GDpA1bcuTLSacDTwaKA1E/DkqGZnzhLYFaEFazO/yTPmBrCLO+8jvlkRmL266ytqSgu2PHgOema5EBIabIeSZ0gIPMvZ+Hc8b9QuXQlsloOPMT5fhGJY+lqSL5nNd6vIOzlhio8Lguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CBmETv2ouhNLRFnf4zZZl/nDKPQVezKLsP9yD9ZI00=;
 b=DKzbqNusCNDQT3ZjYmJUGLjHKy7ORum4G0D/Onjj6yn2HfKMu/QErFvzGjSXRkmnmfiQW7AApldDF2KZwou/8rYE00BAT8SGQK9Wt6JZDPu7LnqbTfUWEUcS1hamGMeLd0PpbbjsxT5eIVrGnSdHThMFzhUzQ02/v1rmeTaDiKUqpJlw1v5tI37I/p9HsL1nA2BLZpwDHi/iDae6VVmBYFFRltlAlu3PKEC/Zcv33FNjOTVgf0UaB5yqryNkBRlO8wdrDDvPkPjBwWOivuJd7/rLWNUKci9pOkwf6HeB0PA7Yq72ogU4myexW3G/xM6ReidfBbD7qbu7ZCFZb5Mcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7496.namprd02.prod.outlook.com (2603:10b6:510:16::12)
 by PH0PR02MB7815.namprd02.prod.outlook.com (2603:10b6:510:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 13:38:46 +0000
Received: from PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::f9e3:ac9c:d609:691d]) by PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::f9e3:ac9c:d609:691d%9]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 13:38:46 +0000
From: Priyankar Jain <priyankar.jain@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] dbus-vmstate: Restrict error checks to registered proxies
 in dbus_get_proxies
Date: Fri, 26 Nov 2021 13:38:31 +0000
Message-Id: <1637933911-37482-1-git-send-email-priyankar.jain@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To PH0PR02MB7496.namprd02.prod.outlook.com
 (2603:10b6:510:16::12)
MIME-Version: 1.0
Received: from priyankar-jain.dev.nutanix.com (192.146.154.242) by
 BY5PR13CA0025.namprd13.prod.outlook.com (2603:10b6:a03:180::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Fri, 26 Nov 2021 13:38:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d97cd1c-9243-4b17-dfc8-08d9b0e2123c
X-MS-TrafficTypeDiagnostic: PH0PR02MB7815:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7815C3E12697D4DFBFDA4E7483639@PH0PR02MB7815.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QrVl2U3fR3dkTdc+zusL/CHDNC7i87wLB9MvC0835LVAcADv4r308+OQC0nhg2++n8B7KysjpABwvlBSigvp9pt1rNxz+/62Hc5zRYqel416QqPgN3D/mv4Xc9mnmUDI9q18cdc6dKdzkoEYuF4T4Yf7MRQMwYg8kT+pB2QFxmxMULB62oey/WxDFoK1PGVkTl5WCn98chM/QPd7DpEeCs/veek1KuTAk4VMkTTbOCoZ1fmnC6XLTWTnVwdEr2Pg1+1V1VHBlL0hOQ6GHbHhB3lCAU+D+EeBVlgUE9VAxubGIfE+pl4SCzHn9pHR8aGZ8S2tkIgZQrx4JcHq3Sor2FkUZv/rTNCRLzZW92Uff2AL+zJwtgb/5XeYw4+2AiHlZu8erRwUVBBLWM/1ip43YMgoYNyLcdl3++NWz/0y1mJLdyavY4Gj80BXWLZPAxDJFSOyowCY8Nqdr37SJLXHmWsCd2fiiIXqWlxN1CNzyVZl4rtwAJJivfWVKH0LdpS8IZRXjt/C+NVUUf6BLjhp96nWLbLDsIcr/S7l4GdQ1F2WpFHa1m7+HvCGd/KQBtuDRnIFJhMVRh01iL67bERHcEfjCphWlmWD26lm0YJUWvxSqf3EX1gCtsvFpaZSJ0iLHBQ3HfpbYUUfqCPNmbJuv/UinXS5/qzGmQFeZ6hDDAvYtNumt06vO1jLvQT56N6SX9FXrVsPdWphEGtTEwMjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7496.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(36756003)(508600001)(8936002)(54906003)(6666004)(86362001)(2906002)(38100700002)(83380400001)(38350700002)(5660300002)(6916009)(8676002)(2616005)(316002)(7696005)(956004)(4326008)(52116002)(66476007)(66946007)(66556008)(6486002)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oSFv9wxC0Via7OakT8zYscQA3rUY+2kVDCTIN5MVarPse09km2ivP712HLRU?=
 =?us-ascii?Q?g7d7elURc61TsGOZRMDxal9zTdTG5Xo2wY1p3rGasSozH2RieG4u0tcmDE7Z?=
 =?us-ascii?Q?baYZxkl7mVKOAs7Jq/9m6DOtH+Rk9TbpNOPvBxaEzzxBC0TYOGUCYZkjW7DT?=
 =?us-ascii?Q?HcNI9UNaoDyBDXHI9OdK0XPFf8ah0KVhYHTJUV9DANNGUJoGOUmJf7yN6UGj?=
 =?us-ascii?Q?rFDTm+vcMw0/32ABLi4+EdGdAxiCAq0jHUzfsGOgFFR51sRk1jHR546BHPjY?=
 =?us-ascii?Q?5XRCZTad/iin4IVLQCEqil9mCVtYoPxMDmt126TkbXhSS2RPyMGymWQjPkxj?=
 =?us-ascii?Q?WGVWBJfQ/hangkFNhFN2jPWX1qoupZDYTO5yiS3D2FZwD37K/sF7HOMB2TKV?=
 =?us-ascii?Q?Tf2vgkOPNbA7x1ja8WDtUnN4R6V110NzJtZtBVIOcgoufHIZ22VNcrRXoABk?=
 =?us-ascii?Q?GbSgp2hdzvVPX52E7sbPZut95cQiqn0NhDRdcQnLwokjrObvQooeRHxq+ks9?=
 =?us-ascii?Q?sNTgR3cINZQbMDSw0h3x+tW4WCYe4zkWycczaisLthKtz7UqF7Pd1x0qgCXX?=
 =?us-ascii?Q?H/VGVQfdAC0atswVCbYRmpGX/sJWBla/hkndlERwqwt9ZJpuqRxmKbGRi9NX?=
 =?us-ascii?Q?ZGAqHySzIvG/A6tHxMAGpKZdpa9+hZll+VXhspY5qs88y2u78EbduU2DJNX/?=
 =?us-ascii?Q?7A82RSzPy0iZC2EqIig5xln+3PVZB+oCtXqCzOO+FbpOSmTvRrfDK6+E5S5p?=
 =?us-ascii?Q?I35nE7YJn13TNUpJuf9KP9vSWEnkl6zpyw3iGPWnMpHmdCTxuIwALZ0Kb2Vo?=
 =?us-ascii?Q?WSvgJL9qO9knj7VwLXTjJQT+ddRa8+LMBjXty8gBq6Jt+cpKNnjThIQHpmN9?=
 =?us-ascii?Q?16pX7KnIDZplCpAPT766TLFXkdsHEuvM4i700PoYytaUVxWiUBNkW5WxAHf8?=
 =?us-ascii?Q?kMJo4CdEyqMgkcJ/wa/CvTozsQB09ZgX8XS1lMxnlkA/3ml4ex2TNQRXnwEk?=
 =?us-ascii?Q?x11yiO9z3ahVIvkJdft0BMn4231xpKBBCKAbRKxPQOv1pwTcMBSFKkNBRo1n?=
 =?us-ascii?Q?uNg3ZicpzXdbZyFgAb1wECBWC1jK009hucCGN+jLHhNANfia1lp0NvN/GdAV?=
 =?us-ascii?Q?xoC3y6LiznImTprxB8AVmk7JdPONvSgoc8lEr2WL5WhX0eFeUud0HCkVYYXp?=
 =?us-ascii?Q?LDLgUmLN19XXAQsuVBYI0+WAqTmhFe3DOjJ0eX59as1AwSpP+f4ZzdzNinXS?=
 =?us-ascii?Q?+vaX600tFx6hRfN8mQOR7tC41RM0gvQhwYZgAavBSvpx9SIYsz2N2ksZvRby?=
 =?us-ascii?Q?VUxWg+dTQyFqfgsgrY/sQMnHREr5lu/oF0HvK6DiXIScO1ANfsruvanDk/FX?=
 =?us-ascii?Q?CzEKFKfBbwszxhRsj/nJ3sIvKGoeuj4zuh3FQCeH3DJjzNR2YNsts1fkYrLI?=
 =?us-ascii?Q?s+33liuKshkd2bSAu6mCMzM2jqYc2nsl+Pc1uC66aYWTiwrzp/gGFNw6uwgf?=
 =?us-ascii?Q?iAOetBxId3SCmSbVOV5EmeY+qMyhKn3wxXZDg3MZKDcEvjp6NHxXernFFAw2?=
 =?us-ascii?Q?j0exBhsQYMSF6DsOG+f0DBt3A7AySujl9zcO7QwOTI96+1gstOoU9CvCKlz8?=
 =?us-ascii?Q?KsMKDtlzGIO0ZucsleytL0pUjdVRRqEMy68Aqt8Orav0joXZOwgLPpsqqlM3?=
 =?us-ascii?Q?Bc3iQ2PlNeh0XtoXsAk4vGtfroQ=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d97cd1c-9243-4b17-dfc8-08d9b0e2123c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7496.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 13:38:46.7062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nero0Rd5HeRYJCVfAWWL0ddg3qvdZHnVpgIxQ/wDJcUUyLyihsGCuiiSNSg2p+FFhVQIAo904sWPMG6oGSfyvx0G3MAtTJ8lMjy4N5ei3ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7815
X-Proofpoint-ORIG-GUID: Z7zXaxwcgpBUXUz5rM9riSYOfE4cOhIl
X-Proofpoint-GUID: Z7zXaxwcgpBUXUz5rM9riSYOfE4cOhIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Priyankar Jain <priyankar.jain@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of dbus_get_proxies to construct the proxies corresponding to the
IDs registered to dbus-vmstate.

Currenty, this function returns an error in case there is any failure
while instantiating proxy for "all" the names on dbus.

Ideally this function should error out only if it is not able to find and
validate the proxies registered to the backend otherwise any offending
process(for eg: the process purposefully may not export its Id property on
the dbus) may connect to the dbus and can lead to migration failures.

This commit ensures that dbus_get_proxies returns an error if it is not
able to find and validate the proxies of interest(the IDs registered
during the dbus-vmstate instantiation).

Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
---
 backends/dbus-vmstate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 9cfd758c42..57369ec0f2 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -114,14 +114,19 @@ dbus_get_proxies(DBusVMState *self, GError **err)
                     "org.qemu.VMState1",
                     NULL, err);
         if (!proxy) {
-            return NULL;
+            if (err != NULL && *err != NULL) {
+                warn_report("%s: Failed to create proxy: %s",
+                            __func__, (*err)->message);
+                g_clear_error(err);
+            }
+            continue;
         }
 
         result = g_dbus_proxy_get_cached_property(proxy, "Id");
         if (!result) {
-            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
-                                "VMState Id property is missing.");
-            return NULL;
+            warn_report("%s: VMState Id property is missing.", __func__);
+            g_clear_object(&proxy);
+            continue;
         }
 
         id = g_variant_dup_string(result, &size);
-- 
2.30.1 (Apple Git-130)


