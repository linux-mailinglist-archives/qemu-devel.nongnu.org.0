Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D16AE554
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZXd-0007hU-Sb; Tue, 07 Mar 2023 10:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZZXa-0007fF-Sz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:47:50 -0500
Received: from mail-sn1nam02on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::61a]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZZXZ-0007NM-1I
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:47:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZDw/yrRXiU2pAm0siZ2l2FaDxSvYHiWPk0pTs9y2EExsjkWYDVTzgiR22+aYQ1tbMG46LURhaakEEEtna5iqt36nvu6yX4riwBm7Sr+16Old+gt+z64nIdEU073NSMBGKkR3Shg+BHOu6nwa4BWJX0g/rPtosmFBvq0n11lY69gKLRHafCHuPb2WPeplKzZWqs7PERXOReUV6JPv3rmyE2X5UDknQf/f7BMGQLWeV6zcMMbCbwKgCDlzF+tsDqnP5qYCio5Ay1j7c9xthJr1RZfrZl2f3WyQaX/GJ8Idy09OV0mUMk9tlxPrAdLSO4SWvLh5qCFlux18raBPC8BNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P8bn9+ftBFFsfh5Nwf1bHUhE+vpyE4FRfD4QtYU+j4=;
 b=L3XWLIbOGE9jv3T0DNGwCDGLsA4iYgPjizkbnzNngx1R6R2wmA0UsONl8cJxqyPpSKnbTCiyVnQBhHRqVJjUdxkugZ+8VbYEtIPFFDE89Ehq23+DRw9LIrwzSLv+VF3Kf8xRXHx/PsAsIfAxlwfkafBUR325dyeRA6aCq+RibMp0EugKNxfm3GgeKJAyTTQE9jHsxnS/jXJ6YyZkqKQcZwePlkLY4VP+BzWoefNLxvPtTA7oY0qkuU3t4pdv/qoAFJFlKUwQbKYmkJpy7iJlyTjY8+9bQEVgXxOty9QpwAPQvbZzUOAbe+mbjDC6YsHnKmVkSA6Te8Ot99YGWE1XgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P8bn9+ftBFFsfh5Nwf1bHUhE+vpyE4FRfD4QtYU+j4=;
 b=ao2tKzlJs6Z8+MKrezED/IAdJmdMyfxDbPhBoN/hSIKv1UrYnKyKciJ2BA1NSiyYmkqLRlqQYGXNNKbiam9l/ke1EeJ+0yinGCXlN1Yd9K6BcR7wf0oUAYM663tvDS/t2cwz9XTs2hoAHOl8T9LsKxMPyMvMRM64WGTwxJKLfEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Tue, 7 Mar
 2023 15:47:44 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74%3]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 15:47:44 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v3 0/2] Missing endianness conversions in user mode
Date: Tue,  7 Mar 2023 16:42:54 +0100
Message-Id: <20230307154256.101528-1-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: PR3PR09CA0009.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::14) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a0325f-7348-498c-6d53-08db1f234aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36BMCZTh4GuUsrY9E3SSmlKb5Ez8uvgr0B2Y6QUHGwShWDbq3kjL/CYzFpLMn6TJPfb+mdK87tmvsOiGy1bHtBnIGl8JCed9uL5VFdLOGFxcKCyqkwe7i6BJVeM6dwrN/vl37GjAktdJOwqeWBk8DmPRrca4vXNsLGvksMqejGxT5aHiCa0p5NtWyMNSoA6M8A23fgiAblfoF/Q5YJUpddlS4JsmaTlmi84IL2+TQtX4WK9h8ONBEPZtMkYisDmQglnMGDI+aGVHeFEVFjEc5SIIFQuqecjquDKB4eNl3iF0Qdhu03cnRJvU5VswcbtsYWAqSxZl2x1kG1wxXTNkuFDL+qO1NTaTUU1zP7LNgqukH53Cnb+kj5sqJPoUgjGXRNXjpLHwAn1G0/05G/Xmfq1dEveSo6NWWEof2dyi/klC9nSVjT8ESW9Mlg7l6uUVmayYkDuINF5+yktpeNTRHZA0o/vmq6U8LJB+7vjjCvtm48dL2k0t8gdp0q8ZAonYrl0PHw713JMVsNzzI0qrLr+AOBUX60XTyP+8MLcLXY1GahHIhYbSIw1Mm6xvg3TDC2DUUBTR4g3xXebnHZ3Ylmy1HQ60BpVl7emLq/l7oVVtRRXF1lglwcIbvT99DpMb6KijpVaqcIhh7bofeZ0+JA9xccFMDlZKvUObdr+kRRrRsupk1MBXb4/wxppkvDMo03Gt3woRdl0yVdKY14Ec398c9YMd9/TBI99q3+R1ddM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199018)(38350700002)(5660300002)(36756003)(38100700002)(186003)(6512007)(478600001)(4326008)(52116002)(66476007)(66556008)(66946007)(6506007)(2616005)(41300700001)(8676002)(1076003)(26005)(8936002)(86362001)(66574015)(6666004)(54906003)(107886003)(316002)(110136005)(2906002)(966005)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3WYYpXO5rgz8QbtUPBlZhINeOO6iEmO1xFJlU7OCPUVPt9au4KLaSqiSw3N?=
 =?us-ascii?Q?4QlQtApgJk2IhjOO7TGbNcZFp//C4v0PQiRcYH6TD0MTFCVPxqGHYu25Akfn?=
 =?us-ascii?Q?6gzeWEo/hOWgP/M97koAJ9LTHxQWBPMIEt0CqCWrXqoRylM3X4LT7336t91h?=
 =?us-ascii?Q?Ga+nc+ThL30zz7zzVb0ygAgGlru60MxRpzh7ghGFhuiEQaU6NBCZNzZafedl?=
 =?us-ascii?Q?hC2u418OJXNWn04B3F4VMK5L6DnoWK0sKm41lSy/CR0QBD5sC3weJNuMFNWN?=
 =?us-ascii?Q?zGninCpd9L0D+APKVPhJoe7O3/vWoJthHvpy6VLFZpOoly8pA9uIh+ohrXlz?=
 =?us-ascii?Q?4n3LvdrZDXLjJOYPwaQ2D6PU2kfk+pak7wpDkKwQMNoSPfK/gJJpzeb7Btm7?=
 =?us-ascii?Q?/4wVMiuJKHD6MBUN0COIt16e5FMBAssd6GywXiUOt2cx82C0dpJGH7vLRrQ5?=
 =?us-ascii?Q?fgJmnDupIJVjIDOs3c0lnW5bef0qCNLEGD2yFp1vYkGVSESX+bduFnh6XiCL?=
 =?us-ascii?Q?R2WwAZVyCVsRjOgFg9XvGklKezc8mwTrvz4PfyLpkPeLhKUhF+tMLLX/wzMt?=
 =?us-ascii?Q?ja4o8hxlQSrAhhb/hjW+yNQYbpgdubLyHAUiwFr8K814KJsmGMSyDLWLtqAk?=
 =?us-ascii?Q?kWSx/jaynTYcI3OGHXTyJrAnDDngWPEgC3PpzAxAwrL+9ZC/OrGJTxu7yBnZ?=
 =?us-ascii?Q?0UyEOIlAS+943Nb8QwL+UDWjG87SGir4n+x16fgz7MulKdK8F+kyHJdhqjhX?=
 =?us-ascii?Q?p3q9Otdxh2tTRiC0/vK2KQp7FPbvoO5xBSQlhIxM6D8xS03hp42JpxWOdSHj?=
 =?us-ascii?Q?2X8XtRDuhi4cLGTkFqMzpFbHKbD7u/Ojy59vI9fcvNEX8F03OlQ/nW4ZYoF2?=
 =?us-ascii?Q?PQCgHknb9gbAqZpJJP9CQ06vTAAUqyxWci4rOE82/VcFfaYFL1n5GZH0cR9i?=
 =?us-ascii?Q?Z/KPkJmPasq08+Poh6svLtd4jWqQPkgUNlwkPAyfFCxg532AJeWUjJTKD4VL?=
 =?us-ascii?Q?b4dwstt8KDa0qRsX/6LTuj1EaC8WbB6lngj5ElKw5/EYWkM4NJMaNluSutW7?=
 =?us-ascii?Q?bawl98cfcYPRMBWX//kt3OJ2xdFNChTYG1uL98oWt8o9gfEG07kFyMmjSro3?=
 =?us-ascii?Q?qZCUNo1Qjd1WNIOMSyDrv/z7OD8LhNfGehgJpdrPpmrakgZxLDFVeADFrsDV?=
 =?us-ascii?Q?GDcxUWUvnCMTanWfb6fayt25bLfj1Wy0nuxZzr+u3roTfhyYoUDLFITnoRgF?=
 =?us-ascii?Q?nGtps4SsC0FS/D+xTdU537AlAZKHlO7kDnHHbi/sT58dZ5Y3Sv+CJFasxprZ?=
 =?us-ascii?Q?CWbxn0/7HzESnjkvNcjFn0eIMvA5DZ7PSge3ESlXLlTZJruE7AkHXQmjwcdV?=
 =?us-ascii?Q?VK5XHJ3tXqlInH9Nl+363jPSdhmbibnGtLkL6SfYintwEzjdZwC7vbBxuuRZ?=
 =?us-ascii?Q?sHE+CG0ElUiC+21br3Q7B5JcWTbEXYveF1b81Q9+4Luk/2kRHTSonAFhHwT4?=
 =?us-ascii?Q?1m6+CBHVGOdQFUFyfeg3OjGr3C56+uVx57UZ11DWv8KU8RYuPq5bVIETm026?=
 =?us-ascii?Q?lrkHWxp0eGujYSMyMjq4jW6GZ2NvrLMa+cFDEXPS?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a0325f-7348-498c-6d53-08db1f234aaa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:47:44.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1Foi+ug/uS1rAx0eaY/L25aMWudno1DfxcKFc8b6jLdaNyLbO5OVxCRsn4u55uteqReWXzC0YVljT+8nxUH8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
Received-SPF: permerror client-ip=2a01:111:f400:7ea9::61a;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=0.001, MIME_BASE64_TEXT=1.741,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
LWxpbnV4L2lzc3Vlcy81Cgp2MzoKLSByZW1vdmUgcGF0Y2hlcyAibGludXgtdXNlcjogZml4IHRp
bWVyZmQgcmVhZCBlbmRpYW5uZXNzIGNvbnZlcnNpb24iCiAgYW5kICJsaW51eC11c2VyOiBhZGQg
dGFyZ2V0IHRvIGhvc3QgbmV0bGluayBjb252ZXJzaW9ucyIgYXMgdGhleSB3ZXJlCiAgaW50ZWdy
YXRlZC4KLSByZW1vdmUgc2luNl9mbG93aW5mbyBlbmRpYW5uZXNzIGNvbnZlcnNpb24KLSB1c2Ug
TkxBX1RZUEVfTUFTSyBpbnN0ZWFkIG9mIH5OTEFfRl9ORVNURUQKCnYyOgotIHJlbW92ZSBjb250
ZXh0IGZyb20gdGFyZ2V0X3RvX2hvc3RfZm9yX2VhY2hfbmxhdHRyKCkKCk1hdGhpcyBNYXJpb24g
KDIpOgogIGxpbnV4LXVzZXI6IGZpeCBzb2NrYWRkcl9pbjYgZW5kaWFubmVzcwogIGxpbnV4LXVz
ZXI6IGhhbmRsZSBuZXRsaW5rIGZsYWcgTkxBX0ZfTkVTVEVECgogbGludXgtdXNlci9mZC10cmFu
cy5jIHwgNCArKy0tCiBsaW51eC11c2VyL3N5c2NhbGwuYyAgfCA1ICsrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjM5LjIKCg==

