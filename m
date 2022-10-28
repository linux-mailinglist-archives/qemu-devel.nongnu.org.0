Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E86610968
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:00:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRk-0003kR-L4; Fri, 28 Oct 2022 00:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRh-0003jM-6l
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:17 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRe-000267-SL
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:16 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4vKLG032280; Fri, 28 Oct 2022 04:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=i+Usbd+a6oRewrulcMrF8NEbi8yhqxZBZBGbbVZPgtM=;
 b=UsWIjmDAsDzTBo9rrUbf89hyjIwb0T6uF7bD6Zf8btiyVz3ekm61+7sBBTuxvzpudTUx
 evArzeyGs45Qll0cqSYtRArE/MIwK3cSvb3l4QPoqof1FLlAB6PBJ8CVoERgTKR28ri6
 c/hJBmnz+a0hGeBuVnu18tjzlNZg1O3gbKNgG4/GXVPUN10kxuGa5YBy8JTmsnz4212W
 LdhoIfhsNkj4dp7txe7bGWj0CyM11BMpitG0nGz4kYNSUPgfDnohTbHIbJHfusNCTNqF
 dMcSx7QTmhuvUmpsDQr35NLQN+llECQdjndhb0yLg0USuSqIMnl1y6o71cfOCRllZ1ub 2w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56h33t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRsFQOZ6yCPTPaDa0BEkF2H0OHNxa1VzIb2L3RELEbZqTrClnpOi/rZx9qrAAf4TxYDu0Bw/AQf71cAJR3kwRzldCMMtTT/XvNGS4AkA6Opk1zvU2KreBr96kVQR1dElHnQOrhkfj4DoR4N7Grg1ZyYmRAkt8f6vYMy/jA5wdbj/D3UGl8RwGf6ZnVflUmN/ntgb1cfeCXX6wi5lwRqD0aPRswrPChBy7euRyrfq7eth+IB9MVbBu5OFqx9ZFJj2OP+aWT1TrIJgqBtIRSHcn2lWMFezOyd6fjpiiuf6BeSj5B/J+7UpiRQpr1OOm1CxioHWXVdcvuiUyFTHS7Ua2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+Usbd+a6oRewrulcMrF8NEbi8yhqxZBZBGbbVZPgtM=;
 b=b8TjSwsx74eHHnNLbHa0iT7UfL8ByXJjU4of7g8u+Sa9X2LtGgfjd4fxWjWgdxdn7UWvNMCW3bjd3PcF3VDhnMlphrQawEq5ZJd1zDmhkkeQWXF/3MoEAUDgS2MZU1iRQ8eBbYVX55cQY4l6npxOB6igmf4NQJeiijg++/73IZNluYwty2seOnZ7iqhrcYoM0nF+CKybflUHjmg/9iid0CVqv34cja8kx9aLokTahbd9oU1hq4/TPRe02fiio9wzuaG8UglOkL0vnHr4Nak8D+jGZOV4+ZYhfvyK1WNAlBRcBHVDWXlzEyr97OLy/4QYYNyRMJZxxAFryWj1vPVCpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:12 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:12 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 04/11] tests/qtest: device-plug-test: Reverse the usage of
 double/single quotes
Date: Fri, 28 Oct 2022 12:57:29 +0800
Message-Id: <20221028045736.679903-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f1d7af-481b-4a75-9b9f-08dab8a103d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rXCexNT652/ZLRUZBcbpCvI+oiol6gLhhe0RZiC4bS4Ha3awo3MqdcqjBPH1rMOhAPvveYIaGx5VlT2xJnXn6ScuFNeuVrLzSMFeHfq/fhHexCIRAm2/WySKcf9kb/BUJ4TN4WFL18BXml3BFKOF1/p+GixLA3TE6aCJu07KgjsAjIs/uBE/NPJNh/uKU6Ik9EPdnLkdLxYXBOKPM1IwzJ+wM5Y7lBc0Xlq6B5eHCuhkQNI/AmOTAMr/Gw9dyumGDJtqXntOEogTCSqoREqjb4fvyYfduXkVs6F7BrUn0gWmGzrcvKHaJEO7R8r5Pq+GBzkMXb4t2H9IoOCxMMSU9P0kFemDc7BBxUjQZTmSb/hXfyK6ZoGEcZNk+C2CVz6HFgkz5LPSri3DA/swlb5yTUIAyKXkezs5YJGZqEl6AZIfQqX8tJPYslLBqznA9U/Ekv5xa4zaWH94vUR/k6iZKGIWF3SiTywxIAFHT1NnP2F+sxSZD/3Rp6X0g+F8rVCVSBe8lY2vjU5bvcJzQLsr6HFOXb/b62etNBL51CXCvUGkPItsnpy8itpz+ILtMQM0D1E+nxwBVuvprFkWMVf+7GuLWlnocm1HsQ8axo0C20oDhVd+IfNDhSUwUNmeAg1bvR57vT4BSOuiz2hEUY704lrlTZsdoYvG1e8eH+S54tvYlJwAqjF3PberET0m5pKhHEw5evCqcD9TRvXhvDVU3B5BaL4+bmO1HCEkJCtQDgaA/AbzMY2AIhYYMJJ+tA5RL8HSHtbkI2DNqbk5IZZfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X660BtMEtR46HY4XKSp9XsGXn9b8TezRFC8R4e7mNghNJ/ZbhkZpQ3/vwT2X?=
 =?us-ascii?Q?lSHXBLwvIqU4XJL83/4SZX3q51lIoeZOxXOM4Db6gnKAncpSY4R1laR3Hu8r?=
 =?us-ascii?Q?ctmWx/F0aXi6ndwjIwvP/0ORCDnrXsD+0SXccy5KRwInVziBsYz2vZEJ5uSW?=
 =?us-ascii?Q?76Hk4KtCd5TVXRmMxYN3jtENgAPe1iZxWqIg4Bc59HeSOtyzL9WkFPzO66ai?=
 =?us-ascii?Q?7m2rGxX1BXnWOz3BS36qt+XwD51MbU6xwezSzpO7Eb4MjAlEOwJb33gQoQdG?=
 =?us-ascii?Q?ysOZu8jeCE+t86zBruk1JQWQonujTWIFkvTV9FRivPTDVL5ASnOQ+sAw03af?=
 =?us-ascii?Q?/LWvgD95myXb3PxrbBPn/5raBNG9mIkQW+KrOopc2IeXk0ZXiBpolA+5SoCy?=
 =?us-ascii?Q?ryjJxzOWqMCakMPDzO6veUdW6ZaA2g7RHDRyV9aQa5C4yd3tBOOW40MtSh0Y?=
 =?us-ascii?Q?Zxt51f43HUYYfpKoW9/kmZKezDCVtC5zOOnAla3yIhc8PFDGjlZBaWEKeWNA?=
 =?us-ascii?Q?diP9ciI00NHbbm8dliINNmVdNHO5Di4JIVBCE4uIYgHMFWcDWIk+nKqiSkq5?=
 =?us-ascii?Q?NAVHyzJrddNE9biIIOvFXgUbbVEWdDkWQ2/hgvHdApKA/L6gsBQZT62z6ORh?=
 =?us-ascii?Q?BhUB8RXNDNE/vHJ1706npXrSzUWKfknr3WywSOnmfxiE3E69KCBe9YQjk6vw?=
 =?us-ascii?Q?X1q61JGviLmRMmFEnZ9BI5HhsGrJ5r0DK/E0HNmpcvat4W0bkwpzTWaFQT7v?=
 =?us-ascii?Q?ES2Fa/o45OG0jEEpEIsC85qOHQoN1f6Pk0JMUTYnz1OpQXIAEFsVcCGX0fww?=
 =?us-ascii?Q?qM69RtzKlniPby+Lng7g6h4LsLyPh3NUY0e4BO9lqtxIw+eIzdKaChGic2W4?=
 =?us-ascii?Q?syjKvo2/FvbhRFlzqeLOucoJK2Z6BH0SZ3WJB4a8bDgGYdOMXp9LekBTDZsX?=
 =?us-ascii?Q?8x9v6pB+Ntt/n+v5lIgjNDf7tmPnr1LIDyZd6N61zgFtN3qnTAyNZ6LTfUNN?=
 =?us-ascii?Q?mqnJ6qYtBo4/NurD9D6ZfikSX8ba7T6J5mOaMMECmWoGIWOYzHo1Wf++fZXT?=
 =?us-ascii?Q?ECCwKL/mCmRAqqeU7VXiTIQQeSxEuLUK6vv3Ev9nF95NoDo7yxbNKJnM4s04?=
 =?us-ascii?Q?FHOsuSUcxlwHt8ngGrYCfM8HTu2N4Uir41EvodoIOQCsqMsSqTVMup0N20bK?=
 =?us-ascii?Q?vkYVN46novRNYAI4dAwblNWrcuSkwtNEMWzvBFCu1Uyp7C1GOkGd2e9+26fz?=
 =?us-ascii?Q?j8VSqsTqgPLbuHT8c+Vxq7YrxmQokcS6Att36YFOW+NDBzaTtWPpHwfPzkYh?=
 =?us-ascii?Q?eKGr3AJzvQY3j2+bE4m+bCHQ23uY3BLdsSgMPOBgjOIPOHQH0W/8Gq3QnzE/?=
 =?us-ascii?Q?vyoWZy5f4zWbk6pmuLxthLyxvYMMCSB/ztkN9HggEikRkFOvf1Ya0DrFVCog?=
 =?us-ascii?Q?Uk4NCYL9bMVfCJEA1yX4nUM/16o9uQDK4tp658XPr7sr2LXO71OVG3KCMu8d?=
 =?us-ascii?Q?De89lQQXmbX17eVuKrDUrVQix7npamk7gFd3Aad0PBiuoV5Sf3YHBcSkBKOG?=
 =?us-ascii?Q?OVnJfl/JcMKPDBqiuRjt/IH0YkqUY/FETeDzyubU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f1d7af-481b-4a75-9b9f-08dab8a103d4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:12.7187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/oGBgA3FrzdMXtt/Xxq3iCGHq/RQdgT57yS6x3UFg9k5kWtOled+gyzLAzGbMVHHhSGLOQizck3RCCEsTOoYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: R6yzT_EOKzExrJrct_d91ExVHl-8WAv7
X-Proofpoint-ORIG-GUID: R6yzT_EOKzExrJrct_d91ExVHl-8WAv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
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

The usage of double/single quotes in test_q35_pci_unplug_json_request()
should be reversed to work on both win32 and non-win32 platforms:

- The value of -device parameter needs to be surrounded by "" as
  Windows does not drop '' when passing it to QEMU which causes
  QEMU command line option parser failure.
- The JSON key/value pairs need to be surrounded by '' to make the
  JSON parser happy on Windows.

Fixes: a12f1a7e56b7 ("tests/x86: Add subtest with 'q35' machine type to device-plug-test")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v6:
- new patch: "tests/qtest: device-plug-test: Reverse the usage of double/single quotes"

 tests/qtest/device-plug-test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 3f44f731d1..5a6afa2b57 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -112,16 +112,16 @@ static void test_pci_unplug_json_request(void)
 
 static void test_q35_pci_unplug_json_request(void)
 {
-    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
-                                      "\"id\": \"p1\"}'";
+    const char *port = "-device \"{'driver': 'pcie-root-port', "
+                                  "'id': 'p1'}\"";
 
-    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
-                                   "\"id\": \"b1\", "
-                                   "\"bus\": \"p1\"}'";
+    const char *bridge = "-device \"{'driver': 'pcie-pci-bridge', "
+                                    "'id': 'b1', "
+                                    "'bus': 'p1'}\"";
 
-    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
-                                   "\"bus\": \"b1\", "
-                                   "\"id\": \"dev0\"}'";
+    const char *device = "-device \"{'driver': 'virtio-mouse-pci', "
+                                    "'bus': 'b1', "
+                                    "'id': 'dev0'}\"";
 
     QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
                                     port, bridge, device);
-- 
2.25.1


