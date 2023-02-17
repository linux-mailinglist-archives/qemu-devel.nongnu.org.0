Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DF69B132
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:41:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3nV-0003pA-I6; Fri, 17 Feb 2023 11:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3nS-0003nf-QH
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:41:18 -0500
Received: from mail-dm6nam04on2063.outbound.protection.outlook.com
 ([40.107.102.63] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3nQ-0000MK-VZ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:41:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmZTuVIQdCfMBNIVbM380sUMRGQ3s9GFs1KAQ1fxWLU3wdN/DgRZ4nFEF68eHE2GKdKDXg6tjrYTecwa0XL+7Yml3/qDtI46dk/l+ajDS4oSmZPe7ebBqT4X/nHoL0m/6uSDrO5/Qz/5xFjGGU06I1TIupBGYqzleq8bVY5EKcoGi2nSO9OmcxQsONUGHvzHa8vfyRRv+Rj2xeYoV+PyJN1GaUC2Gr7jwey6o8zat5x6oNq0r38uGQy1RW+FzojfNqNuRHJPxqrtyii8E0qUZUuILRcISHlrxs6EdQ4Gu+FMlKKTTuOSuuI7Hip4Ekp7JDunUDt+sFRJ7l17Z9PoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2rMmG2IHIE3FkWFvIfnwvF3gplEvTAqRloWEcBM4kY=;
 b=H3E68hTx8SN4snWlD11CnPF12JhOf0IAYN1pWbO71VhWDuGZphKEbOMwZ7+iO5Bxj9Ir2ZGJWPOjTfvOWTgwNpSoE5kmKBnvsVLtapL+V5v8wQ/xUl4VHYKFmhAkeLLbGopdno9G6gxcP2IDX4EHXOoMPs6LuEyWVSF0V/sxsDq4M/sz6YVhJZbyvuDvWvmw36ovGvLovI56jNmQd3unyF2hSw6ER2+pxUW65GNwpustsovSVEHgvrMbdXh2z9b1MQLks/FsIMiHxTbw37aGAMaaE119KMRrnSoUf3JD5IOzilp8pGRaCnQM8c3jx/CSWXG+M/B+oUbVOxVdMpyW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2rMmG2IHIE3FkWFvIfnwvF3gplEvTAqRloWEcBM4kY=;
 b=l2ef153wxfCNj8/JhF2pEgVuOpJuPxhhqefN0Gx8iIIH2vbuBZF8qg5b7EuOI2O2m50TO0UewS9xkQiXJKAPHnyUmgkT84dBBvwPFrEQcHTrVlU+jbFT54HZe1wPjJRfXsIkOUB98ccCfqUDaZDWtwM3Ofh7t5FUnfu7oAGsEt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:36:11 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:36:11 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v1 0/4] Missing endianness conversions in user mode
Date: Fri, 17 Feb 2023 17:35:23 +0100
Message-Id: <20230217163527.619486-1-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::21) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef596d5-867c-4eb1-1724-08db11051422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCU/XFDLlxl9V+oEfFE2jdSWeMuHhYD3/5WNpXQkFZO2FEy9TB26SuSwyrHF+5vzEv9Qp886QG4uks3lyJQUAjrsChQtGKioux2MiB2FTDKOpJnKjk1sQ0LRQgS2AN9WF9+hxfiQVV5JFp2/on5gHh+K2RzssPZU4oGi+gdm8TAgyGu5P09FD9dH/zS/8rKbq4DZTilIvYvmrjTvI4nkK0K70v6QOE8OZtKps73vw/eDyX69ROZJfNE0ohFMe/uC/fGuwJlj03sbTyDgEfgbZL4ceuRHJIAPDpziFzNmvOm0J2FiqIOmhb0oB8NpDokgHLdHioYXWyEBw5GQYImcEl5USOa3DF8C+QSKyV6cYW3RYp6LOH1p9rka5HeYomZO6Mok8fnvOf3qnWPNzMX1stHmiR4eXJ2ZLD/XpHY1qV+4lNUsnZH2dltSxcnEQwqDWUGzJGLnLr3kr+AUkA2PM+Hjw3gVs765xqRhbv2Qm/eoLhSHfL3FPmbPkjGT3lvclO/j7bhP8LApi3na+P3VLEohODmW3wM93DIHBRbaEJv/xmiUcXD+CsPHlKvUPKq2Id216JSu8p9WWJ34VeQbRDmNQe1yYooPATaKcbPiqE4bSw6Gcnz1bvjDF4XJ49KSAQun7ukWpKyW4/GgDuyPg/Ve3XWNyV6teOeu5qeJWui7QGhWFXUOWKEVQiRXoyXSiSJongAzx6oj73mKa13K5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(966005)(2616005)(83380400001)(2906002)(66574015)(36756003)(26005)(478600001)(6486002)(52116002)(186003)(107886003)(6666004)(6512007)(6506007)(1076003)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(6916009)(4326008)(41300700001)(4744005)(66946007)(66476007)(66556008)(8676002)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPteCyKiHnq4L98mT/0XOVju+Lf/0EYVI0Rgi4wQMqXDQTrqK4HLzoQsM6Zz?=
 =?us-ascii?Q?OBwbnmNNUeTUqriwgxcwjx6ZTa0iFfY9FFZF34X3LljMOv9E85lPPjnsOef6?=
 =?us-ascii?Q?8yyb/tZqDa/7em6x/SkknqSS6PEtpbLsEQ4ISjV3632u+2ixz5P3AClfxG/S?=
 =?us-ascii?Q?whwze8GPpYKWtG4Ormd9YMMJndUDJkiufyL1d6+J1I/nluxLUqakKUEwx/51?=
 =?us-ascii?Q?DjfV/qulD/8JpWvkRAB1qokpzuPo9UERr61KuM+2Q/0JEbFYBgWyp3DwuCtl?=
 =?us-ascii?Q?T6F+kwNuKNf1UJYg3WHrYy3Yy+JgaUoI6k3fDVjbzYjd5t/A+XCVo6pTb/7r?=
 =?us-ascii?Q?LycIBEvBUECt05rToxnbCVVr+Aog0pfhXDC/VBr87ARZAA65bl6JXTfCw3Po?=
 =?us-ascii?Q?5u55pfV35dWx9kEXd6945U+XVmeRCOKDyXMO2LSNG//zZRKp0VoofKYll/m2?=
 =?us-ascii?Q?VsPLdZ4yPx/2l046uIc+Cvn+PV5VffEck9K9PX2lijXUXb5LkU1M2u3I1EON?=
 =?us-ascii?Q?0sVy2j0urgvIJw0PGi9TgNPNqqaKQvHIAy0+IjuAcgIlsjq9JzQ4jUg4Bwgp?=
 =?us-ascii?Q?nv/TTBGV6Eo6HwGeDf55OcQaRgS+147I6VMDiX/nJPsFIoRtjstlnpHZp/Wu?=
 =?us-ascii?Q?e5wxcfyYY8YJsnycCyps9FpC4TbOfal9v+ASDjhMlVoIEOTU5TWrJ0eJt4nz?=
 =?us-ascii?Q?gQl1z7SA/HtfmejII8zAR9q2hmupCefQuYlSxzFlL2QhV1LpySJYPcD5TKla?=
 =?us-ascii?Q?vJZ4jjgO20tWt6CmX9DmNUCtmR4Xx1ikdnBuu78Egc0Z7S8p8z9X+NmR2stY?=
 =?us-ascii?Q?3FQ9+9CcVDZO8XO5E78Tb1FtgwMj0S2pIfm4SiucRxf9ZgtE+VAOzMvgvc2/?=
 =?us-ascii?Q?uR9/zJMsjEx2C84vCTn55iC5Nwrj0R6xFS45yfOpYn5is+MU5Dl9JVooUvtq?=
 =?us-ascii?Q?5JDa8/kEzUb4YOx9kw9a0GFVpoQfkG7W6JUxzGffxCH9q6ipa0Z01Ua0TkhO?=
 =?us-ascii?Q?hvvX0jLlqHqX2P5UNmJencZouHCt059JeBrQZRhhId4lTSsP6awRcOFVcLRh?=
 =?us-ascii?Q?YalkYx0/Py4efY2E5yPLmrdBrI7ZwXkdY9yllkOsROltcAONLGzEzt+qXlVt?=
 =?us-ascii?Q?be/FRfjCOnsed5yrTib6Eg/sTvaZAnxwqunse2DQuVcJ36RMXjqbdytWHvva?=
 =?us-ascii?Q?jIqrxkKvcurHpCSLqP0k+nvv2/WuJ/qpS8BooWJBJ2wxIog6kZilqQ3cPLFx?=
 =?us-ascii?Q?/IVRW1wLcrKZ6Xv+Je+D76i0xAKlu/u6VLHGy0CfAFB8DX+Yp/oV1zaHqott?=
 =?us-ascii?Q?8xRLrBUmzpqL9ApYmrqc9nEBi1yx9BM6a4OK36Py+uYt8+/cTiXL9UCtA5HA?=
 =?us-ascii?Q?BcjMSzWil/fDP4o7agxXwE+vsrGwfBFaOfdfFi+CqNbU+H/j0plBkrTzer3g?=
 =?us-ascii?Q?g7XT2HEFIWwit/UEeXEAIJJNC1v42yejil5lUzVX49cpwCoE0tZzn3mWG0yB?=
 =?us-ascii?Q?zdmPFhO6m+1swD3gyUSA9neMU/4ekLnWyeSisGBqV7R97eAyGoPj91+fNcmp?=
 =?us-ascii?Q?xD4gKucVR0qCkMgm2VFC4Keu7N0/sd5P+Joid/x3?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef596d5-867c-4eb1-1724-08db11051422
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:36:11.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBMbYbmR1/XVuFW3hhEghGA++cCTTuPToSRNqzxztWFQTMfCgGKLlmDDGWqAQMl1UVZp5OZstMpX0n2jlonR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
Received-SPF: pass client-ip=40.107.102.63;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKRm9yIGEgYml0
IG9mIGNvbnRleHQsIEkgd2FzIHRyeWluZyB0byB0ZXN0IGEgbmV0d29yayBib3JkZXIgcm91dGVy
IFsxXQpkYWVtb24gdXNpbmcgdGhlIE1JUFMgYXJjaGl0ZWN0dXJlIChzZWUgWzJdKS4gSSBkaWRu
J3QgaGF2ZSBhY2Nlc3MgdG8KcmVhbCBNSVBTIGhhcmR3YXJlIHNvIEkgZmlndXJlZCBJIHdvdWxk
IGVtdWxhdGUgaXQgdXNpbmcgUUVNVSB1c2VyIG1vZGUuCkkgcmFuIGludG8gYSBjb3VwbGUgb2Yg
cHJvYmxlbXMgYWxsIHJlbGF0ZWQgdG8gZW5kaWFubmVzcyBjb252ZXJzaW9uIGZvcgpzeXNjYWxs
cyBiZXR3ZWVuIGhvc3QgYW5kIHRhcmdldCBhcyBNSVBTIGlzIGJpZyBlbmRpYW4gYW5kIG15IHg4
NiBob3N0CmlzIGxpdHRsZS4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL1NpbGljb25MYWJzL3dp
c3VuLWJyLWxpbnV4ClsyXTogaHR0cHM6Ly9naXRodWIuY29tL1NpbGljb25MYWJzL3dpc3VuLWJy
LWxpbnV4L2lzc3Vlcy81CgpNYXRoaXMgTWFyaW9uICg0KToKICBsaW51eC11c2VyOiBmaXggdGlt
ZXJmZCByZWFkIGVuZGlhbm5lc3MgY29udmVyc2lvbgogIGxpbnV4LXVzZXI6IGZpeCBzb2NrYWRk
cl9pbjYgZW5kaWFubmVzcwogIGxpbnV4LXVzZXI6IGFkZCB0YXJnZXQgdG8gaG9zdCBuZXRsaW5r
IGNvbnZlcnNpb25zCiAgbGludXgtdXNlcjogaGFuZGxlIG5ldGxpbmsgZmxhZyBOTEFfRl9ORVNU
RUQKCiBsaW51eC11c2VyL2ZkLXRyYW5zLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tCiBsaW51eC11c2VyL2ZkLXRyYW5zLmggfCAgMSArCiBsaW51eC11
c2VyL3N5c2NhbGwuYyAgfCAxNCArKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMzkuMQoK

