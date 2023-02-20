Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CB69C722
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU21D-0003bY-LI; Mon, 20 Feb 2023 03:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU211-0003aR-On
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:23 -0500
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::609]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20z-0000uY-SS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROpi62KsJeGt5YF5lp1yoCzejo0Ihtxu0YFt5WTGbbyMuboyooe48ihS+xz/e3BQTk81qlB3TUamSpPFt6/ZZY6YuhFQk2S6SbOUb+mDhaIE6KI4xCjG95y5e47+Ww9ElzxyT6+eHHGhNpprcjkhSJ7s6j8ePnhXiubdGPe6FILf79tOaK28/Fz819zDrsr2yTRsy8TKcSG/vjZ3Nef2bkYCHdr0W61gaSLM29sD2D4NGkrFSDopTV8ZZGZVZimtuE5rqn0F/ZSe84/dWrJgQEEQyKkkvWAZ0tFT/wXpPN5sRhsDHsjp6lyAD3U/VOWw5tWkHfwMYS4SAvCrFuZvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDQOqJTlRn9ySESndOqW7lgSRHaQdjulaKrEvbeReFU=;
 b=Cis4Irtww4F9qjXDPxeChW5OZTrPl0lXiG0GGqEz1JIsY9vIbdvZQl5UBMDAQczTO7/XzSR+ossXNo1BI5MBwA6LAF2CYfBcSlAfLNxbf/UI5iS7iH5UF/fHwNBH2RTfstggsT0TH+XevKDKSe4fstcrYaGssAApvidgdkbTynyobLdx53C6l6HpapfGEOoUqS+BLw63suuY2llxYZGvUaGOHQ8c0xcFaNHwBjkVIoNH9Y/kurDyQ1o85w0hQFmqcldBNpA45e64RnrZSAwR88IIh+sQ3rTj+4zFTzUJov7rxxgh+BUED+ti7u4uYrcOA+8j9dzm5+fgnjPNKn4qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDQOqJTlRn9ySESndOqW7lgSRHaQdjulaKrEvbeReFU=;
 b=OHVoGyOsthMcCnjkCCVVLzQLqfH2slIph6kMVCXA17oI2x86L1n7m0dOs56c26xa5j57vcx1Bk5a/IgkgFCHc50NaRxfu0hp0kirEyi4GGcqYxr0Ax3HEH3dgMgjA/2tqQhnrj0KGGR4fe1ImRyp7EyT2/HozUGWGIjGeSr+9Fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:59:09 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:59:09 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v2 3/4] linux-user: add target to host netlink conversions
Date: Mon, 20 Feb 2023 09:58:21 +0100
Message-Id: <20230220085822.626798-4-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220085822.626798-1-Mathis.Marion@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::19) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: a18dbc38-8329-44bf-88b7-08db1320baae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LODJcotHPNNxtLJpnZ8YnCQwcqxHvy2yuKPN4l0y1dRVb7PI37jDd3nUZoltpUJAgGP5fL+aiWXV4/YqN+DotDl9DSF7USQvnrMWnzlu0D0UN6/07HFFbWUp5rH5kGSD4lhd7l3rrjbr9S1zKcJGSzgzmgm2GZpj1jmnNP0QeDbdbM0ws58Dh2fB2v4xSi6YYlSbG3BuM84SyrFr62N12n7nfpt6rDT3aBDvwQ5bMBEUrhF/Itki1uvUX5lIEMpqlGngHnwGf+MDoIFZPMiwjaIYnQESvH9swldiCo61yPvhq7F1p1pZX/qZ2ZW7NU2HBYGzwA80+fFsBA6yByQSYB5OhMUlD8nQz1D7GtXCgpFUoB49AwdJ/oy2zDTCHpn/TY5PawajNK8svnE8eO9zIMNgXWh4DdIDLQ1032/gpz65F4KVbksVgrXJ7FGR+9C7tOLyApq/RWMcHPU2m1/waXUmqguv5nzhSoPq6xOlf7MO8eb3qAzyGKyQwv2wH19NOY0hSgHYtmJyUj0iqEUeU8iIpdCsrY0OfY2W6tfhArgl/rPqtRgZ603o5CGA4ui4BZbM6Dosx+JsIn8jsqbIz0IffEQF/zemwoR++qMgA4orIfigVj4jDHoW9M5IfgrbBBXFAD3k2hJKJI00XH09bX6P2yXmIzhSNJRKNnE85THH2aiOf636aapuhxpfktXQAn0aLFRGX6rwnul2Oz3grg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199018)(186003)(2616005)(6506007)(6512007)(6486002)(4326008)(66476007)(8676002)(5660300002)(66946007)(8936002)(66556008)(26005)(52116002)(1076003)(107886003)(36756003)(6666004)(478600001)(110136005)(54906003)(41300700001)(316002)(38100700002)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Efsd0YefCcrPv+FM3CDqi6Q8MSKaeqbroork7AZMxS3BJ3hbKyzIiWZ28aH?=
 =?us-ascii?Q?bU9OkRBUcuQMVykoCLYj+uBDblfZ3/98Pa1guLMr/L8fzY0eG7naULO+fVgb?=
 =?us-ascii?Q?BPmHjFbCL+z6siZSOkVtAx5uLbGDxPd76z6QOLGonldx9NFiUwbJwScGPu83?=
 =?us-ascii?Q?II/MgwtdVk7tl4GIRJPwSk0JRBFOfOUslY+4gSdyu2PI5wwxKMvM0EqdnSFC?=
 =?us-ascii?Q?EJ0ohAU7XemG357vAqoY7fCV3t92a7dDcD7o7Rk6b34JB4SKaE/f8yWmu16J?=
 =?us-ascii?Q?KvgwP09C3hJov+gmUkpMdGQKpgriifkslo21z2trbBu+vHmsWzkG6sioUDsk?=
 =?us-ascii?Q?YHOq5sAXRyr8MIq43uWjcBGjJNaaCdya6lAis+2KIBm3QJGjtf25drQDy7dT?=
 =?us-ascii?Q?xGEmmhy0qu1tB1WGrumY1LGqjrtsXBZxRowLCYAcKEcH36WjP3Xns6/XZKck?=
 =?us-ascii?Q?n1/xXvSQa0WssyqB1MuNaEDGRjbmuqvGUKsMz2Pfz52ZA3BueYuGB7NV3buN?=
 =?us-ascii?Q?X9PQ0U4PL0/MPusuHfP7CmvtxkcGQyyMQ9c7KOTSvlgefaugMcrxDv2YaC22?=
 =?us-ascii?Q?eGeFY7rbXuTUFSO/Mfs7R8Ryr11j+VckATqo3tGdGlLMk6nREBOC1Gchk1bL?=
 =?us-ascii?Q?yYNvNiOr7jTfr7smOkfpVh/xJyo2MdXY87lL4JbhgRFwdRg/bet4i0qIltjZ?=
 =?us-ascii?Q?+6mG7ZeqdY58LPZsEoyb8H3SnvgyFd7fLQj/Og6Q6x/fF2tMd4HIkG6OedPo?=
 =?us-ascii?Q?7yDLEDIKyUdsdu7TYiccVaILZAoqsDFlNZer+fVrmEAwsViDnnpS0p1JM0uH?=
 =?us-ascii?Q?MNHWzitkwi1Au205bHrmCXFeuvnSFafAkYUO4joB9sa3u5X3ZnrwQ9kYtkOC?=
 =?us-ascii?Q?QmepfnDIJDQ/wLwUX/lbERLgou5M7kEmNLM2koUqT6NMMYZj8KhK/yoWTon5?=
 =?us-ascii?Q?TnAgCJWtvjkgbRsu+OK9MFocon5AbZCLQZOFcDkRyKaLz9v/A3dIz3MOl0X/?=
 =?us-ascii?Q?wPkhMjm0r8VjLQX+4+TY1Paxb+CvbutLCBVfp1xxxlG2BTld6F42Pk8lGQm7?=
 =?us-ascii?Q?g6xY3lSQtXKxObNcw60WEvvNolqvArEKlkLwRJgnDCzApNSPzCF5CHRnT4d4?=
 =?us-ascii?Q?Ayp29Y6tMPzqSTYMcwEKgrZ0mvBkPLTLPJ5w6hFGPy+jXj+cXmDmI/sF0gQH?=
 =?us-ascii?Q?L9Gw+sOYscfZOeKrYKX0rJaHbaYDBOpith0vSOTAlgnB+hCBvq6bmzDxt3P3?=
 =?us-ascii?Q?9HPIR/DhsunntdAtR34UvJAaiefIQsZNZwpMj7PEaqSiZi8pvUuUJkt7FEsH?=
 =?us-ascii?Q?Ccr7OnjyYYrRI2bEvI64vAEQmqL3HgpO1+GhGZEVysXvcIoREQ6/ebygzgcI?=
 =?us-ascii?Q?fGpebJPpawKbb+KKSE2W5WmQZuf4fbQOuv8MKhXG/56J8D3KWIOhC1PS50/Q?=
 =?us-ascii?Q?BU99bmjGp/jGNMqtKl6V39N3z/cKiq7bu3UStYnODGrjTZTY2jxX232TyLGl?=
 =?us-ascii?Q?sJEuaKXmLTtnPrOfmBlVo0lLqGpQ/bX9Sf4OPrKtyAfrd2iyT+P6WzJA9mIk?=
 =?us-ascii?Q?SoJ5wwPOBeSeMl+etWEJLoq6aHYhPiKRIFlCNFFH?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18dbc38-8329-44bf-88b7-08db1320baae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:59:09.5876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XK51ysaqpYYZ+1SXkabM4poWlGvBr2HUutttZc5K07ApGeI5MacE8HpZHe06NOeihXa8wlvWdt/8x2EFY2akvg==
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKQWRkZWQgY29u
dmVyc2lvbnMgZm9yOgotIElGTEFfTVRVCi0gSUZMQV9UWFFMRU4KLSBJRkxBX0FGX1NQRUMgQUZf
SU5FVDYgSUZMQV9JTkVUNl9BRERSX0dFTl9NT0RFClRoZXNlIHJlbGF0ZSB0byB0aGUgbGlibmwg
ZnVuY3Rpb25zIHJ0bmxfbGlua19zZXRfbXR1LApydG5sX2xpbmtfc2V0X3R4cWxlbiwgYW5kIHJ0
bmxfbGlua19pbmV0Nl9zZXRfYWRkcl9nZW5fbW9kZS4KClNpZ25lZC1vZmYtYnk6IE1hdGhpcyBN
YXJpb24gPG1hdGhpcy5tYXJpb25Ac2lsYWJzLmNvbT4KLS0tCiBsaW51eC11c2VyL2ZkLXRyYW5z
LmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvZmQt
dHJhbnMuYyBiL2xpbnV4LXVzZXIvZmQtdHJhbnMuYwppbmRleCAxNDZhYWFhZmFhLi40ODUyYTc1
ZDlkIDEwMDY0NAotLS0gYS9saW51eC11c2VyL2ZkLXRyYW5zLmMKKysrIGIvbGludXgtdXNlci9m
ZC10cmFucy5jCkBAIC0xMjg0LDYgKzEyODQsNDkgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBo
b3N0X3RvX3RhcmdldF9ubG1zZ19yb3V0ZShzdHJ1Y3Qgbmxtc2doZHIgKm5saCwKICAgICByZXR1
cm4gaG9zdF90b190YXJnZXRfZm9yX2VhY2hfbmxtc2cobmxoLCBsZW4sIGhvc3RfdG9fdGFyZ2V0
X2RhdGFfcm91dGUpOwogfQogCitzdGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZm9yX2Vh
Y2hfbmxhdHRyKHN0cnVjdCBubGF0dHIgKm5sYXR0ciwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxlbiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYWJpX2xvbmcgKCp0YXJnZXRfdG9faG9zdF9ubGF0
dHIpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIChzdHJ1Y3QgbmxhdHRyICopKQoreworICAgIHVuc2lnbmVkIHNob3J0IGFsaWduZWRfbmxh
X2xlbjsKKyAgICBhYmlfbG9uZyByZXQ7CisKKyAgICB3aGlsZSAobGVuID4gc2l6ZW9mKHN0cnVj
dCBubGF0dHIpKSB7CisgICAgICAgIGlmICh0c3dhcDE2KG5sYXR0ci0+bmxhX2xlbikgPCBzaXpl
b2Yoc3RydWN0IHJ0YXR0cikgfHwKKyAgICAgICAgICAgIHRzd2FwMTYobmxhdHRyLT5ubGFfbGVu
KSA+IGxlbikgeworICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KKyAgICAgICAgbmxhdHRy
LT5ubGFfbGVuID0gdHN3YXAxNihubGF0dHItPm5sYV9sZW4pOworICAgICAgICBubGF0dHItPm5s
YV90eXBlID0gdHN3YXAxNihubGF0dHItPm5sYV90eXBlKTsKKyAgICAgICAgcmV0ID0gdGFyZ2V0
X3RvX2hvc3RfbmxhdHRyKG5sYXR0cik7CisgICAgICAgIGlmIChyZXQgPCAwKSB7CisgICAgICAg
ICAgICByZXR1cm4gcmV0OworICAgICAgICB9CisKKyAgICAgICAgYWxpZ25lZF9ubGFfbGVuID0g
TkxBX0FMSUdOKG5sYXR0ci0+bmxhX2xlbik7CisgICAgICAgIGlmIChhbGlnbmVkX25sYV9sZW4g
Pj0gbGVuKSB7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorICAgICAgICBsZW4gLT0g
YWxpZ25lZF9ubGFfbGVuOworICAgICAgICBubGF0dHIgPSAoc3RydWN0IG5sYXR0ciAqKSgoKGNo
YXIgKilubGF0dHIpICsgYWxpZ25lZF9ubGFfbGVuKTsKKyAgICB9CisgICAgcmV0dXJuIDA7Cit9
CisKK3N0YXRpYyBhYmlfbG9uZyB0YXJnZXRfdG9faG9zdF9kYXRhX2luZXQ2X25sYXR0cihzdHJ1
Y3QgbmxhdHRyICpubGF0dHIpCit7CisgICAgc3dpdGNoIChubGF0dHItPm5sYV90eXBlKSB7Cisg
ICAgLyogdWludDhfdCAqLworICAgIGNhc2UgUUVNVV9JRkxBX0lORVQ2X0FERFJfR0VOX01PREU6
CisgICAgICAgIGJyZWFrOworICAgIGRlZmF1bHQ6CisgICAgICAgIHFlbXVfbG9nX21hc2soTE9H
X1VOSU1QLCAiVW5rbm93biB0YXJnZXQgQUZfSU5FVDYgdHlwZTogJWRcbiIsCisgICAgICAgICAg
ICAgICAgICAgICAgbmxhdHRyLT5ubGFfdHlwZSk7CisgICAgfQorICAgIHJldHVybiAwOworfQor
CiBzdGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZm9yX2VhY2hfcnRhdHRyKHN0cnVjdCBy
dGF0dHIgKnJ0YXR0ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZV90IGxlbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYWJpX2xvbmcgKCp0YXJnZXRfdG9faG9zdF9ydGF0dHIpCkBAIC0xMzE0LDE2ICsx
MzU3LDM1IEBAIHN0YXRpYyBhYmlfbG9uZyB0YXJnZXRfdG9faG9zdF9mb3JfZWFjaF9ydGF0dHIo
c3RydWN0IHJ0YXR0ciAqcnRhdHRyLAogICAgIHJldHVybiAwOwogfQogCitzdGF0aWMgYWJpX2xv
bmcgdGFyZ2V0X3RvX2hvc3RfZGF0YV9zcGVjX25sYXR0cihzdHJ1Y3QgbmxhdHRyICpubGF0dHIp
Cit7CisgICAgc3dpdGNoIChubGF0dHItPm5sYV90eXBlKSB7CisgICAgY2FzZSBBRl9JTkVUNjoK
KyAgICAgICAgcmV0dXJuIHRhcmdldF90b19ob3N0X2Zvcl9lYWNoX25sYXR0cihOTEFfREFUQShu
bGF0dHIpLCBubGF0dHItPm5sYV9sZW4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGFyZ2V0X3RvX2hvc3RfZGF0YV9pbmV0Nl9ubGF0dHIpOworICAgIGRl
ZmF1bHQ6CisgICAgICAgIHFlbXVfbG9nX21hc2soTE9HX1VOSU1QLCAiVW5rbm93biB0YXJnZXQg
QUZfU1BFQyB0eXBlOiAlZFxuIiwKKyAgICAgICAgICAgICAgICAgICAgICBubGF0dHItPm5sYV90
eXBlKTsKKyAgICAgICAgYnJlYWs7CisgICAgfQorICAgIHJldHVybiAwOworfQorCiBzdGF0aWMg
YWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZGF0YV9saW5rX3J0YXR0cihzdHJ1Y3QgcnRhdHRyICpy
dGF0dHIpCiB7CiAgICAgdWludDMyX3QgKnUzMjsKIAogICAgIHN3aXRjaCAocnRhdHRyLT5ydGFf
dHlwZSkgewogICAgIC8qIHVpbnQzMl90ICovCisgICAgY2FzZSBRRU1VX0lGTEFfTVRVOgorICAg
IGNhc2UgUUVNVV9JRkxBX1RYUUxFTjoKICAgICBjYXNlIFFFTVVfSUZMQV9FWFRfTUFTSzoKICAg
ICAgICAgdTMyID0gUlRBX0RBVEEocnRhdHRyKTsKICAgICAgICAgKnUzMiA9IHRzd2FwMzIoKnUz
Mik7CiAgICAgICAgIGJyZWFrOworICAgIGNhc2UgUUVNVV9JRkxBX0FGX1NQRUM6CisgICAgICAg
IHJldHVybiB0YXJnZXRfdG9faG9zdF9mb3JfZWFjaF9ubGF0dHIoUlRBX0RBVEEocnRhdHRyKSwg
cnRhdHRyLT5ydGFfbGVuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRhcmdldF90b19ob3N0X2RhdGFfc3BlY19ubGF0dHIpOwogICAgIGRlZmF1bHQ6CiAg
ICAgICAgIHFlbXVfbG9nX21hc2soTE9HX1VOSU1QLCAiVW5rbm93biB0YXJnZXQgUUVNVV9JRkxB
IHR5cGU6ICVkXG4iLAogICAgICAgICAgICAgICAgICAgICAgIHJ0YXR0ci0+cnRhX3R5cGUpOwot
LSAKMi4zOS4xCgo=

