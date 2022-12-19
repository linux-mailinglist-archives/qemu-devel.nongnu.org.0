Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5D650A3C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHR-0003La-Rd; Mon, 19 Dec 2022 05:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DH0-0003Dv-68
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:31 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGy-0007Vx-Pz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:29 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9dUcY026145; Mon, 19 Dec 2022 10:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=M2j3E7ngWrmbtYmE4yi5nz0iPjbdn8UqvgKMNy/r2a4=;
 b=Oqo2cvKP1T+gbllOx5Q/TC5h3r2xybjwmOq+iRm1IRdh2MjQDF8enWGPsM+AgOEX2O+B
 z8X1PmhGRyp1SWhT8plvUxcer2PjxntqV7aBYizrIciR0moKTAARkaAwo/NgQivZCftx
 06tXJcieXIR0G6VkNMAeW2O3Fl2H+7YG+4rDsjxcmXR46MeGGr5hJymM9mNhbHuK67NE
 Fqp8oFveIzA7bXGySu5Du83CiO9ML/ZUp2ZwR8ov808DYDlpZxoZRAc3trRBsNgtq5Fq
 33qn08p9BbswIp4pVkuQLqB2+qu39SOE4Fu8OOqAH/lHKF2TZMw4jK/7dcVgEB7e+nNe dg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7e-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhouIMMEeDqVkh3LIFKpupPx4JIY1yeB5T7+gZYe45cMhxuIInEGWw9jbG95TsWw/EsqUzW/E8tlpU4muzUyB2p/YdAQlwdOp4+dldq3sMdSdxV2Jr0w/MXOoTfnk5sHETweA0J3W8o4k+53MAC0LEihvlBqFJQ5M49ojqQL36VFsxRd4nqX7icUd8bEXZ82MroK60r78O3jHRg33qAuSVP6tZY2sSa4Zvw+eW7tZ3PH1zuF5nv6/ch5RppB0K0eFTi+/USxbMgqs9nx0Ad/6aPue609irNURYzZQP5nHrqFkakf+7TWzdNGmYDGyhQYpC5pCUtqxNS2TvRM4tHvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2j3E7ngWrmbtYmE4yi5nz0iPjbdn8UqvgKMNy/r2a4=;
 b=lr4Nn948rcbNqhYb+sQ9nfbiXbBJ41BRjCZTxc8mUHxCMIppR3AprYQYCJNduSSU9uJN4Y39WniT+Ilgm5LLDO7xUBEdH/SU/3RoRN8yD/GjQd+SOKebZks9e27p7TNFOLSh1QIl9aHtzEymWMY+zdKKbWM2NvRCJywWj1Zpd7cykCSlg7PKQ67oa7SYorRY8t0ZjsRgfVUHOwAYmSEGswvA/DM69/DfC0g7z0MSbig5TF6y+b4bX1m4KFZ8N4s4nH0kGa3YkPfIuwN23/pCmF+dRmU5Er9sKUR9TINEm8VlCbQHiF2tznQ8PWVJD8T33ff0iai0nfKWerOBNktheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:13 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:13 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 14/17] fsdev: Disable proxy fs driver on Windows
Date: Mon, 19 Dec 2022 18:20:18 +0800
Message-Id: <20221219102022.2167736-15-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e9a920ba-a8f7-489e-5331-08dae1aac173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBGQa6tlj+wg/FwCM2Bh63dMzZ0OZIP4svgO16oeiSoAD3CwXQuKr9Gek10XTuiaOk1NXss5udkqj8WnWlQgKJKcBj/b/NicaSkLF0TcmL6v2jRYNRvpQTlYJJ2YDW7I2Y0JmW/XyVBLB5xeRBcU4gVxseXkgaDhsRTop6g99qZsu4GwRsfw9VS9KXG+C6Qrpvj6cMOkEyO5SiYFcKySWeEG3Y+uVQBkm0tztUgHWApI0hsNl8TfcKik5AAb9sGCddKCc4ihRbTHSKFyEeJEG1DiHnMCFTUkcRFPROIvuQ7v9hDqcq59OG4em40ceK2oK9eL4sX7fusVmxDBu9+4ZZTTHg3D/skE61s4WYtHBI9WAAA2ChrBN2jbI3Stqka3B8pKUFSuFRUaLXp/eswslAKkMBTvL0PezjGZHaXZi3H7jKiW/mo2NBsPTxHyaF9mMO4sSskkvYWtN9p6YQee9OcYL6u53Ys5ENGLwJVjlVNyG8KAZuUHvcOIv3Dab/ggUtowD+qh/a9U42QrbTAxisbw0roK1uCGhSDiVX81mVnq43nh6Pa3+xyEAaUCyjQ7XXcbQMXyPs3+KwL6H0/9jfatAYz/pnjgLgJn7R4z1B2d5Gdwp6L0W4vT6JymlgSypqjzhigT2adguxCMb1ZH5iMtBkZMnMtT/2bV5uaLhVAS4ZGP+xmoMsRDMAhXUB7/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(107886003)(8936002)(4744005)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Om2fG7wwNUSGMq22SFsT2OMzOQ5Y/QUvT2IBmHmHlVBuw60qHifHOZHuFQLK?=
 =?us-ascii?Q?fJwhaUq9RaG9V2TD/d6rw9e+fwB4RXA660xLfix+EEHnMLs99s7shogvrpnt?=
 =?us-ascii?Q?0jL6eN0eKpmMK/vr9lO+szQxiRihu/88n/uHf4eHKE/GSAEqj7kqbNhEcvMp?=
 =?us-ascii?Q?fyCSYTPEE7XV4nTSFdua6YXTOstVouxtRm95nnfmDPKWTbNzJ/ZPXFbbOxHT?=
 =?us-ascii?Q?bJWSFk+Jt6HNABIzTbmO9fCGfvIfE0vFWKs9X8df2JDyVxByvH4qdGUg55Wz?=
 =?us-ascii?Q?YELs9D6L94q3PoyeLzph3WURZpPPCIeFqdRWw0Cnl2XVstL4TBZvCeB9ceMp?=
 =?us-ascii?Q?y5DduvgBHp51rpY2ZFB0B9Aovwgx9HiqU60lqdcYXRCzNdUOpLWEoVTlpG0u?=
 =?us-ascii?Q?TX1HdcYYlOBJwEvoisXZwaZdrUbp/cWlqjawaClZCg7b0GjrvRZGji4OWBx9?=
 =?us-ascii?Q?bbCgrBc4UmZ6ue4icf8Fhsj1HwaTIotc7JbDgT572MWqbud//tZ8fbiy/B2I?=
 =?us-ascii?Q?bbZKHqg9qJXInzAoxWRunSPZZTMUt6vLyuq4vPiIKE/TYw9lS3QRl1jo/A+M?=
 =?us-ascii?Q?UFGPhDEfPSayhifSrxHACBos/oXkO2RXpRgJSdEoDUXtLTQ58KNCptWvSdfC?=
 =?us-ascii?Q?gyAmT4NJ2WA71KUvFu7DVibVDz8MEIfWcwFLEFexNMiJlQLeSUHfkPrXsS6M?=
 =?us-ascii?Q?WNMNRm7y7+DPd3CB0KwWCpfr7o+gndHT4YDEnuqE6Sxsog5NrqLvXjne60wi?=
 =?us-ascii?Q?ymYnBSpI+7unnX+RToXmFjKCAa9i5Lfxpn++IsU78m/hVBCfCJ89L+C7HQuL?=
 =?us-ascii?Q?cHi6g3SdD4AxNxCItOOoSygMWZSg15TBas+m/uvK19aeFGiS+JRa9BIKTr7i?=
 =?us-ascii?Q?Snzht6CcyZKIcFZoZmwPVDqkSOxBbnq2CL/XIoHJuGk8ipTB7wGQnqni3Qp3?=
 =?us-ascii?Q?xUpZVCdQAAgZtcELGl4CL9aYvuSnyUT0F1MIa9L3P+2YXKgO0TL+5yMeJoez?=
 =?us-ascii?Q?nMh108x/52TBsKgFu9w131K8pFQsC6gPfx36AZ7710VTDupHLGnkrpW3DyBe?=
 =?us-ascii?Q?FeSSgIRMC1cZ2i/4SiJ5qV/V/OgprWzEbWCJm4KOZhQ4yZZFwHt8uPHn2/Lp?=
 =?us-ascii?Q?Z0csduLmnnbpikpzCAb4qqPEvw3DuVrQ0LcEl5aF4J+zugHK0xBW4pkrFdA3?=
 =?us-ascii?Q?sXWhOtSUNpQJZmIRnv7VuhU5B4s9x8/kTKJKmY6MFblUltsLGuxgSjCy8Hph?=
 =?us-ascii?Q?gbrEd5mf3S9amXvOoWQ9dG6JXayHgyPpVJZojDNzoVimEs9VBChzheROlu7Z?=
 =?us-ascii?Q?OjGFeXjb3C156OanSejbJe1+Dr6zTbJcxtpDM9bjqDkZ7v4+xHktq7EIRVFD?=
 =?us-ascii?Q?B4UirqjbyreqDWgkvqUE4zQsZiFaW3BrWtXBuhAcUBNTqX0esOm33X9z+vcz?=
 =?us-ascii?Q?G5V9uxEEjWFwpDTvp5RO5ZDD1JyeNmsU5Mm6VIhsU72Rf3ZkzH5UtVaYT7eq?=
 =?us-ascii?Q?M4/az+oRdHbuUI/AxAK+j1ik6A6N4TJuT6+azVwuG386QJfakLCjNAgVEXKc?=
 =?us-ascii?Q?qJmMD+FNfNRm+a+0IZxfwlGkd5SjwbEwRw4yAycJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a920ba-a8f7-489e-5331-08dae1aac173
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:13.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwYsc8t6QO0+t03W9W5Xgk14YpVlfjMeqyo4pae+yXNnDfvtAwnW/475ji/Ft6/NVUrItolHJA0/w0RBAzl2SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: 0xERC2_gDiVAnoX6A5f3BDvRgrqOt4rJ
X-Proofpoint-ORIG-GUID: 0xERC2_gDiVAnoX6A5f3BDvRgrqOt4rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=752 priorityscore=1501 clxscore=1015 phishscore=0
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

We don't plan to support 'proxy' file system driver for 9pfs on
Windows. Disable it for Windows build.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

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


