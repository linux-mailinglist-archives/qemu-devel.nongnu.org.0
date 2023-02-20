Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1669C723
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU215-0003aM-J9; Mon, 20 Feb 2023 03:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20w-0003Zn-A8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:14 -0500
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::609]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20t-0000uY-Qy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF48GCPDQtVe1YlzHp5q4HLxT1rAa8nS1QMHWaVenRY6VjSsS0ffdopCHaZr5v7jSy/0XGkzLrZ/zQGJ81BIoKXdtjcUPqMIFsYCCXoYLmqLz+OzMfbYPLuZRM9tk3PB6v6AyOm8TTQGsxRCvIQjIVGhPcD1vR9mAHKT9Snu6EWXwTW2HfcyMAwGA4WNArK5bGKReQkWdEcgCo/71kHTxQuYz57dT0uDZPKa4brTVk5HMrjmvie8yU7mHdY+Z6iXrXQUUk40uu8kQRQ7ZRcXQugJBCu/iZC1kUlOpzwHOgvuBctuZH0VrjdHazXKt31UK5IXLSGaTxHA5CiuuIjCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UknrdXCnEroFLiHAJ7si7pEx75Z2EBrAvCuBhhhjrn4=;
 b=OSTuB95LIidLQczZ9pnYf+FC6OzRTRezh/Tj2hzgtSBRUgL0aujX6/Vv6OUM7urRlooDfpR1cpsSKokloO5hIKdXmuzDlrkGe0KSBv+nrsPmPZk1rfocEq9m24idzSczSgRduEL8HwOC9vdGaG1+roI4M3GYdjFIOKdC+C6irb3pN2Rfm8kwLA6vdk8VjbR1ibv3UmFNFFnp7xR7zbJjwsJL6vyJPXZ7+FdIUjpQ6kTYkvv3o6Aq/x1i+DfeKkMY2H2j8P52h5rKjr8BX0HT4rnb5ovwPtXXJTHadkJLUe4+wRgGf4cOzzn9b0l8yFzK1FrEm1uK6tgK7Mu+Npx92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UknrdXCnEroFLiHAJ7si7pEx75Z2EBrAvCuBhhhjrn4=;
 b=AmlbgQbUuZrCnfWQWGtmMgumOAmw1m/GJ7FrgnFFxU+9Dv9YD6V3F+S52eLNB6nWtyMjge423QSuDAnyKXx0lIcQRYcP/boDjlfo6ngvCbuBlaULBXwHDFK2FlszEO3kYoknu91gu0dp4UIzjRvVIyrCKT8b5gsg0eKQia0oj9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:59:06 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:59:06 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v2 0/4] Missing endianness conversions in user mode
Date: Mon, 20 Feb 2023 09:58:18 +0100
Message-Id: <20230220085822.626798-1-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::19) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: c4341e53-89b0-43f8-0a6b-08db1320b888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eG19WRKk/1bRRCTifWfLuHwuYAI6EdWOxGXDINoTuRf3ewmKytWGMMhPPR4P2J4boM7ptEbJokdwN50hS6sqY53DS6LDhOdd0+S8QDqPYlW8lQSmQJG4JOQ2rp5yM4wXMKU3QlgWWKBN9IBu9MAWjbPd83WOKNkYakB8ZwjlWSg7H+dfpatg5J8qI5I7nVHBowVehWGoLNeyEQKc8wjdramA5yJNkUPYEY5c1QsM5sIaSZ2jlhnY08qpXSnly9KQKfQDF1IwSOD7HBepRwcnl96pHZSBfkBOc9wrjxYz1Wi2jk/TOj9SQ4acM/ztxECyfCnCQGLbUto7emNctOtVDKre+znTKKUlw983BJP2z2uczwsxsEvgsWRZtbZjrp039yaBeSeIULFJT5zG23yffIn3vqIHtc2dL0AsuwrF5n8oxB00EX/daBBZzHRW/OUu8+99KyBtUF78D3OD4N0yS0N3l6MAgu1+CfN5kdK91xtpLiZntbfcjmOoYr5KK7DCFKFx8k0fhfYHgzDXNhIxWe+RUS9e9m0sy5fIIObpF/0wtrjNkSpwS2//ak1eajG5iqDKt3HIEmhu6/q56HuFQ0gjwEGpl7R6X9tIvutStRAJ6CYG/4yi1dHsWMPzbE99GYBFS62RbCvQ0UeUeFe5sWRuu1UWLiHMhgU0WKLA3uEfNiET+fUY4zG7PsnM3InDEqyXx0xMjgXcqg8FuJB0PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199018)(186003)(2616005)(6506007)(6512007)(6486002)(4326008)(66476007)(8676002)(5660300002)(83380400001)(66946007)(966005)(8936002)(66556008)(26005)(52116002)(1076003)(107886003)(36756003)(6666004)(478600001)(66574015)(110136005)(54906003)(41300700001)(316002)(38100700002)(38350700002)(86362001)(2906002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJt8+33coIZRKwh4+3HvKWErdEKmzlNnH5geMQcFvCAPeNdVOvIzPrCZRDr0?=
 =?us-ascii?Q?816Ik9HkCgFUSEZQOrSZ7rovEMUt4AZEcAHC6Z9s0yLUzzVVBX3cnL/BliCy?=
 =?us-ascii?Q?bqmE/FeUrKZBMiIQDXIG/C1Aplz6Nd6zxAhfKQ21/+SQZuCzb+LWDu3kIgVi?=
 =?us-ascii?Q?nxN1PPCl5fwm0Yn6X1jbttXLF14QfoOxIeessg+k2OWpxArdgdbquFxKe/2n?=
 =?us-ascii?Q?eWnIRw6tPT1KYjkNTtiRhISIw0F+ShJyJdZ2DR/0BQSGAQCxKLCJhZAeIK43?=
 =?us-ascii?Q?8Be0/cuaubK4zVMpoGzqMOhhlwQ7q8hktP2XrUISnsZpHJoh6tHWwb8Vxerb?=
 =?us-ascii?Q?9HXHKcK12nau2ZgIUjagCZ1AsS397idKhbaO3EFMuTTHQb0u151tm7DM+w7C?=
 =?us-ascii?Q?jVAziB2l9kln/64SWMo6nASxkqqdKn5N/T07/wl+AfZMEHZpzo7Uo0MLskWk?=
 =?us-ascii?Q?JzOZAJtCYKip3NGm0ZUEtLnhheUbuwNBoU+WsN2KiPrhOeyye5B1oX+O68Sh?=
 =?us-ascii?Q?HyqLkYOuqV+lqW17p57TYfg5KFovN3BxMIryHdyZnCTUlb+3zY5GPRmDut1k?=
 =?us-ascii?Q?O393Ko9GnBCerr+i7M3IttPPlEzxHHYPbkY2lD+ViL0CHTHU/XNE0fCuvoXE?=
 =?us-ascii?Q?HNt4BeddEUBFogFUTYFrv53tGtWonhl6K93JjAfZ2ZDRJhAhD4mOetSsB46D?=
 =?us-ascii?Q?yeEcpvCDlBK/v4WctaQCVG+qCPkcw01GkWprdT7tXai8p+yZFyEBwbnhqHku?=
 =?us-ascii?Q?VkZ4WnTu6gzHxonONmquFjaBMFc4oi/VIoctoguwEjCIxlsRDsbTcVsPxdWS?=
 =?us-ascii?Q?AP8npeCddgXq69w7AUSc8Eur5IdGi1d8F8LYqoxkJ47eCaaiHuPQ599FRJmV?=
 =?us-ascii?Q?19SPMJhhAZCDklOpbgisauqw9G2apMLRCqx/2pZzfYh5+mhlQ6A7k/oFmlct?=
 =?us-ascii?Q?teWqeQckl/4eOdERGGSmSQi0OWWEIcj1cVTxTTHefAi7wqK2dr0ftwPSpjG+?=
 =?us-ascii?Q?8IBpp0sTsDI/fGR3PO2BFkhDz6EtH/zyo9qyTIxVwo28US7izD0KEoz6RUE0?=
 =?us-ascii?Q?xfUyYY9SCw+ilxq44R5qDQZ/B7HhxQvCiop+sHNew5e1z5DYz9o0RswlB6h0?=
 =?us-ascii?Q?ao4pBg6Bu62ExJs0EcuYHOD3IrOxziNIMqWkIXseQdqkzZlw7T377YrTCgNK?=
 =?us-ascii?Q?J5BG9xY/u+YwxZQm6xccSGdmj81cAw26qrPXsDUX6HzjNed6zHkuAg7b2I6o?=
 =?us-ascii?Q?wphKSTTdsciq0f1snXppJka8PpvA4c3MsgswzL98SWezC2rtcEcXj3e8kCVm?=
 =?us-ascii?Q?0h8AUth2vi+hjSP0L7Ercd1OC+RV/5W+C7muujwfguJgmEtfC0GS7fgNNubL?=
 =?us-ascii?Q?e4Vevd3erbRCcovJ17tlzafAXaDaK/ejZjm8qZOHPKgSAU9hwz820EpaRMd5?=
 =?us-ascii?Q?7o4Plu42jMBobQZh/0bRYn1bpkymjYKBDgWFcxRImX7/TQkPs1k/DFMmyRxZ?=
 =?us-ascii?Q?tDA7gHkrHZa37Ic0wi03ci85RvoYKKx1lvkV9aje+QAE+skBTLdTS+qiUJNd?=
 =?us-ascii?Q?4aG3QmvaWR04K7RhATHDrA3IqeCOgb5luxP+Inji?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4341e53-89b0-43f8-0a6b-08db1320b888
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:59:06.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvqHf7BljJ2mZOFRcdCcMCI+e7o0+0vLeO3YDL0TqmB4pshC8/IaZ1Fii4FfFfnaQC41PqO7Eg1iask9IH7sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
Received-SPF: permerror client-ip=2a01:111:f400:fe5b::609;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_SPF_HELO=0.756, MIME_BASE64_TEXT=1.741, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKRm9yIGEgYml0
IG9mIGNvbnRleHQsIEkgd2FzIHRyeWluZyB0byB0ZXN0IGEgbmV0d29yayBib3JkZXIgcm91dGVy
IFsxXQpkYWVtb24gdXNpbmcgdGhlIE1JUFMgYXJjaGl0ZWN0dXJlIChzZWUgWzJdKS4gSSBkaWRu
J3QgaGF2ZSBhY2Nlc3MgdG8KcmVhbCBNSVBTIGhhcmR3YXJlIHNvIEkgZmlndXJlZCBJIHdvdWxk
IGVtdWxhdGUgaXQgdXNpbmcgUUVNVSB1c2VyIG1vZGUuCkkgcmFuIGludG8gYSBjb3VwbGUgb2Yg
cHJvYmxlbXMgYWxsIHJlbGF0ZWQgdG8gZW5kaWFubmVzcyBjb252ZXJzaW9uIGZvcgpzeXNjYWxs
cyBiZXR3ZWVuIGhvc3QgYW5kIHRhcmdldCBhcyBNSVBTIGlzIGJpZyBlbmRpYW4gYW5kIG15IHg4
NiBob3N0CmlzIGxpdHRsZS4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL1NpbGljb25MYWJzL3dp
c3VuLWJyLWxpbnV4ClsyXTogaHR0cHM6Ly9naXRodWIuY29tL1NpbGljb25MYWJzL3dpc3VuLWJy
LWxpbnV4L2lzc3Vlcy81Cgp2MjoKLSByZW1vdmUgY29udGV4dCBmcm9tIHRhcmdldF90b19ob3N0
X2Zvcl9lYWNoX25sYXR0cigpCgpNYXRoaXMgTWFyaW9uICg0KToKICBsaW51eC11c2VyOiBmaXgg
dGltZXJmZCByZWFkIGVuZGlhbm5lc3MgY29udmVyc2lvbgogIGxpbnV4LXVzZXI6IGZpeCBzb2Nr
YWRkcl9pbjYgZW5kaWFubmVzcwogIGxpbnV4LXVzZXI6IGFkZCB0YXJnZXQgdG8gaG9zdCBuZXRs
aW5rIGNvbnZlcnNpb25zCiAgbGludXgtdXNlcjogaGFuZGxlIG5ldGxpbmsgZmxhZyBOTEFfRl9O
RVNURUQKCiBsaW51eC11c2VyL2ZkLXRyYW5zLmMgfCA3NCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tCiBsaW51eC11c2VyL2ZkLXRyYW5zLmggfCAgMSArCiBsaW51
eC11c2VyL3N5c2NhbGwuYyAgfCAxNCArKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMzkuMQoK

