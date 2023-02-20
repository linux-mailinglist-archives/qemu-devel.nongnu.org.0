Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B369C859
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36h-0008Bd-JI; Mon, 20 Feb 2023 05:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36f-0008BH-Ek
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:13 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36d-0000Az-Up
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:13 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9VRAn027338; Mon, 20 Feb 2023 10:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3vCoOHxbCSjHUbC+8+fF0U3s0PhEtrD3RWGpqDkLTgw=;
 b=TPpag44Mh7aanljEecPrUi2ksRj9lGrAPRn1PvXemrKcGznutWE1QixYptsZLtzSwPQ9
 rH/2aOZjOPiVI5/jLzcH7S8H4GXuGk6wha3qoHgsMXrJ2QBx+vFqqm37XYY53SO3YOwO
 sH6l8kM6Ls66I0otvCprD90P1Cqs3ajs2/cZ9gtPQtTr4hTUaLOMLC2p/D3vymJG1Cqz
 t4+92ExDwevtBaV4emeaCI2JQRVw/u+XlEUuxoXy/vrjzeaxmkorTE0UDFLSLSnuHQNN
 xftmwuscXCC2T2JrRoaINjf6vvJe1kzu7bZdRAr6WfH/FJYaPKndRlYnbaS6/XxZijeA 9w== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem1kwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 10:09:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdfCIdTVhm1sZJiNJMa2l+CG39bbA5EGL8j482eWgBnYScnIw4DS9I2s4ajGYspjQPOOyVxh3fXUeFcqJMEwKw/R4CSEGR+YB7WUmDXYB83otIis/kqkOQyagHLi+PZYFsBKcCW+t+1695EUAOgrLB27KukMO//d8n4h99TAWl7us2/WF/ofv/BWE2rHhbYC9+qjBXrpMC+eOntQvxp+uv5+v063WKQ6NQYZ5u7pxbIvvsPcHeyrXlTvAvyy+5Cwyt8gHmV7mAVaBKjC4WrzIChAYavkg8OixGUNMzZ1WSx+2vhu8Y6d6SG+D+Pe2Y2rnz27CzI5M4C+S8BrF9riYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vCoOHxbCSjHUbC+8+fF0U3s0PhEtrD3RWGpqDkLTgw=;
 b=dqTFLs5KezynA1tj4ynCJeRU6Dd/EsviS8yImoKfIQkD6RDR79+EJro/RfgGocAf251ThrGQM0UapyLaL0C8SZZhi5ziUtGQrIPd4drjbjNPyjGyyhBmg5LEIu6mkcSC6T40Cv01G4ebinaTa1ZavKil8CJuXAids6xR1wGfs4oRr2NKdARFefh0VNJ0qTb0WwnhONAKqr3VuaCwVjO/xrrE3HF38s6nwdQJphNIZnEquOkuXAOHYWD44JyLw7JhWhuXWjiwCS4r963a5rwUKX9ifeLfpX02Ls9X+1ChmW3x88RNoxC26hPGkSEEf//sRdKMDVJJU3zdfiksrkcq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:59 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:59 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 15/16] tests/qtest: virtio-9p-test: Adapt the case for win32
Date: Mon, 20 Feb 2023 18:08:14 +0800
Message-Id: <20230220100815.1624266-16-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: fa672b89-7bc4-43a0-b048-08db132a7bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5pF8aNvTOiQXtz1twzE4AZDOQ/lsind1K/L6VIj378nD7wE1uEozbEvRuwZx0lvvxLVgUT3NsJUy0f8iWdsHMlCXkaXB+/7q02nNZM86e1UtmMHIA3G5lv+fTnQloA2l2jau6iw5bt8PESSDlWumePl4YGtHTQ9C9e6/Z8UDeeFuFWsp0kGLITep4XIEUy7vrrLiMgY9UQFKX+aA5rvyOEgQK70dTqKvmsNo3P27FsukXRXQ8ZKdfMK6Ggru1jLB/hq0YlP81cVPl261pZiMnisjvT8/vupOzQmY4Xmr4JsmTFnNzAc/oinrbRIbiYycAi6emvCYMSs1oK632veyrKcXXY89JPAVsPvwmwAdn0c8mJ50DJ1E6LgIw7iFHBP9QvD1+9bmVKAvgHMXtGU8WL4vgQuF7yIAXbSDPs/eTqPnJQDFAompfGRHIMZnHiSzsytJRjo20kbmxBSVgutBTWHaCnjV3AmCOUEJx5iSiMjhFbJ4X/gPAqxYpRsXuBGHUJlBMv0Ah7Q/27K6Tu09j6sSbAQvci5YeFam17gYibgfW4PvP0j4HABAMVqdpdAJTyscFK7z2X5SuC9PBJS7Ppol8UX+X8ahRqospW8kyyN5CIzM7B+1fl24ooiJdM9u4v10TVa0Ge5cco84/scTt78qM9NAvLSp6XOOVBilpmEsNPgMj/mIjrAu8R4S8JnL36FUb5BrbGLqVr1v8vw4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(4744005)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(54906003)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b6aa22Gboce3tDJnb86FICarjE67bbRLlvw71e0nuQNNvDv2/ikHENhRHDVi?=
 =?us-ascii?Q?pHi0eb/l3uK4m9A3IE+P1CdluKYH9zYz0wC0TbQaqmxacw2+uZbehojmyDOV?=
 =?us-ascii?Q?SxtTvYltPSrZVaiX3qXIIv1BnAd00WNcngOU7g++liIncWiPxO0qzCA9AHyu?=
 =?us-ascii?Q?AFrRxUswI7OSOdFVRMgGlcD7s/ZwFtxy4flWWcFfIIw5Lh5tlmR+elS7XEIc?=
 =?us-ascii?Q?a2UrLMYEPr4vZiu/W0sgyuT/4KjCMLKbfXDNDQ5T2C6gq5cpz93hdgHSevht?=
 =?us-ascii?Q?JR1FFbPrjxVo+mVDc9E1Uu1R2ubWw8FZdRNDGvH3IlOuwAQYMeEKw5RIkGLE?=
 =?us-ascii?Q?Kczh45GkVHALeYvWuwgOdwjI2flKXj6NZEAygiEmQIqHPrEyh07AkGYPk+1F?=
 =?us-ascii?Q?NVBJnArHc9ScPHYSlrgn9uBXNKuuru4scS9A+TDHxOMm2nfdy0kUN+SM5Bn2?=
 =?us-ascii?Q?lUqQJtVhQdvlo4EdSc/yhsZ8t08fFg47Ds96utA0+VCKXuuNL6EvNWO7GEnr?=
 =?us-ascii?Q?jnRCCTk7pJsk9fULvQHu84o0H1Mw8eSet9UJQ4TNl5e7MnY84eeg/bKceS9K?=
 =?us-ascii?Q?TUky720YLthuG05B3Yu/mhhU0ylicGYRIG8uHhwSdsESp6nNF3yLSHLKdryy?=
 =?us-ascii?Q?0O15/Fhf54gHOBFbSuDn2SkTYy74laP1oH+LBFtAhkYBjhqOD4i3Q8hj+XQR?=
 =?us-ascii?Q?zYqNxzkut9rM6F3i7e0tsRx+d1uyIlbSbR1xe3RSdWke1g9YxawdwF57vgcw?=
 =?us-ascii?Q?u7j2QBM6TFWQ2H0ZjL1zd+Hs7rlI/4+iyK/CgTWTAn58qXzAtxcWdeBpAc2M?=
 =?us-ascii?Q?+oUTdshve9lMICg7ZIcfQfI8CJ9sNXP6/kk1d35Lh0kZPJqW/VMfCQTGvSpG?=
 =?us-ascii?Q?ToTi88kMxpPja4cZUraUJvxQhH2wFMoRfTrzrFMUUNMUgJLl42asQaguT6i7?=
 =?us-ascii?Q?QgKtyMiqn0vrVRSpAzUEu82sblGsiMrSmSEcYscqlLVmNuoFw+tt4q+nQyZv?=
 =?us-ascii?Q?MVR6S2cWfAj9o1NznH3dAL9roqzqXTXtVeMrXLwba15nVHNHTX0oTT5Sm2rD?=
 =?us-ascii?Q?2clYtf94mGXeWmZh40jTTZdiBmPbGe0IIZoQyKtpR726RknEfopWrS0FjnWl?=
 =?us-ascii?Q?gGq5aisoyBVGmPZEnS7aatx/qQUgGHXeUSc6DPrE+intGgx8/V9ZXyEjFBZG?=
 =?us-ascii?Q?CBTYuvBch6gO6j+td6f6bA36gTHJZFRDJcZVrPynLz6m1JZvpg86pcfeWVCD?=
 =?us-ascii?Q?iOxlyfgExU2ec1x4fRnLxEg03hDfcFs5XuKs5nbhCjxnmzc5o7zeGO8i0q6I?=
 =?us-ascii?Q?aJpclvw+0GOyMTrWz5wBcf9zvfbhJXvAcrkH5+Yz+4UUSViN0N/2F08ElQcT?=
 =?us-ascii?Q?PvJO3mPV/XcnTpPpn46Bq6c9GhaWXI7x4vPOi0jTZiH71EeOmLsHCuxuK1od?=
 =?us-ascii?Q?9DPok02INU43QPhjFuU0m5wCcqTur55u76b/t0U1XO147VJGTZmxeqZq3js8?=
 =?us-ascii?Q?PIbqqF2ebDfZWXM7/EfR0OIgtr+UorEJm1T7NFTtgQs5ASWuS9or7hNTl5q7?=
 =?us-ascii?Q?jYHde9S8s1XblcnRQEeL90mwOT3/wv+NyhKwECudTNEKNLhd8O01X+f3dJpa?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa672b89-7bc4-43a0-b048-08db132a7bcc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:59.2605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3VGu9gdaXaBp5C6Mv/DgIlhSQKgZmVKM45/bmtIWB9luevwccynFForay3IbrMRnFqN+0reT+7vkFj+L8s4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: LdCfv12mULttuyVHjqp4CCaZVCghvoUN
X-Proofpoint-GUID: LdCfv12mULttuyVHjqp4CCaZVCghvoUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200089
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Windows does not provide the getuid() API. Let's create a local
one and return a fixed value 0 as the uid for testing.

Co-developed-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

 tests/qtest/libqos/virtio-9p-client.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 78228eb97d..a5c0107580 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -491,4 +491,11 @@ void v9fs_rlink(P9Req *req);
 TunlinkatRes v9fs_tunlinkat(TunlinkatOpt);
 void v9fs_runlinkat(P9Req *req);
 
+#ifdef CONFIG_WIN32
+static inline uint32_t getuid(void)
+{
+    return 0;
+}
+#endif
+
 #endif
-- 
2.25.1


