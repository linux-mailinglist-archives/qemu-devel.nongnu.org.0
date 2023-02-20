Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60069C720
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU21D-0003bf-OE; Mon, 20 Feb 2023 03:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU213-0003am-2S
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:23 -0500
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::609]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU211-0000uY-LQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwUOYQvwmGLNHkY+bK9itqSd1l3hPzFh1Lul9tqbnRXntIJxjntKG0n/NHrN2i/FHcELItnUQ2e4XY0uSxyMMk4zQLAdQpiS/BHzVrqxWAloQiJJfT777AV4NTSUgqVa3kTRNVNgikla919BUoKAh8H+ST2Sg9i5w9ZOA3yyuAxfEF6qh+j4BwHdEkqPs/snp3V6Ead1DwFkDiEYVj4ZPN0+29q2zD30LshplKDg0Fe9+Fc0G7W2hwrxvnsT8PdUFJblMKxr6LpXWHHgiBtJvKdIYf26bg4wirhxtLyRS1Cz4n4uWYQW8p1BXBDxg/WlNDNKvxTNuHPesSV70wbCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91nbNt9z3XQSKcbs4pcapNJppMXOJZTHCf01A0zYRIU=;
 b=PRO+fAGCgTeqUNipmnLUr79bsY0yfvY5+iVBUBkyBpAJclg/3FMBfOBNoT3FwPrBmQiXtAORiRPvIdibSjv5Y07tQNuXknUudOSVyJAZS6PJfKASGsWtdi9h0VxgKvq+WcSC62KvtDtN2zByzYD8AHlxiZA5O1d5Z4xDnJSlTMvqrnuO+oyMNRlYOycCZR0S+wPIUHg3X4ILOChGWOxzosdNuAdco6unQT4OY/zaen6tTvOKqGHDrubKkdMAnXcotdPkMGDIdqkPQNte8LvQvkYLxMuWiKkZNcgwiSefmijO9Jme4diRyBhicex0+jrWYSLkMLWUSbGjGeW2cMPcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91nbNt9z3XQSKcbs4pcapNJppMXOJZTHCf01A0zYRIU=;
 b=U/uvV9GQ56rAFGDBNlZL6w1Inue5vGuyHUZtevK9GijC8BFJwCrVYmwRZqJJac38Hj88FsNFxTeBKGy0ogG0GqfPHipeXyp2T9vi1/6gzTm11hxWQp6oh5TTM9LmrF5CV1uW04VetoVlUbYE7y0Hr8DWPH2riyh/KgSPXkBO1y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:59:10 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:59:10 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v2 4/4] linux-user: handle netlink flag NLA_F_NESTED
Date: Mon, 20 Feb 2023 09:58:22 +0100
Message-Id: <20230220085822.626798-5-Mathis.Marion@silabs.com>
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
X-MS-Office365-Filtering-Correlation-Id: b7d46f3d-ec1d-4685-b893-08db1320bb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvppGmvKNXFj4dGMIdQ6CLRhI6HVDOOVTEI3UPM6GdPfkZj/PYhi9QIs+SxlQSAKrvvjTLHOW2azRffzIFgA9S5RtYVB+X1H42vKeCcAoIh9U4c0S95W0in8HZUyTSUR8CoafQPHRPRqcueSfsY92HkbBqMQDlFHJLDDQlLFZGtJNTEYg3hAlvn7sDuTcNoSgFbrgtlUB7JGUxtaiz5VvEjVZl2DcE/rtwgTvu32sF5YR+csMMBEg/D1QXgQYmMLurexYdwPMaWjRUnvB1NVg51BbnPeEVpwEIWq0OCAvV+Fr+e/XbHu5C34IrsefhvD5gDj5wgxkS3aqVoBFypLzhFGq/O1hWhhC/ic43bCmMmfK+VJbBy25090kQ9ozaDkY3KQwT8X/ixW+sMrZ1QNleMI3CAyKaCG6ttrET+uQyeskhA4T1F1Q00zQ7pAqICqctvHj5kjaA4k5vLRGtnePpmFKvag1dF/dTHziYv4H6c8mhtn9JQnexMe8sMBs7nSg4agRHKGN5hwqZJcQR3se0hHMFSibeStmYvczB2q/ZNLpMhdru0ytPMvPA4JRWTj1uTj//TcI3aMkEk5rD540fN1+dYZIDhGQZwKjQgPuvrJ88Pk5ju2IWywzS01Qx/PHWkut7bxbBS983e43fN50bE+0BqOSiWu7akLYQhMt8RQO3QYxp1c/9DxuQYCx87XzRB+XZFTcZ6BqGh224Zfeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199018)(186003)(2616005)(6506007)(6512007)(6486002)(4326008)(66476007)(8676002)(5660300002)(83380400001)(66946007)(8936002)(66556008)(26005)(52116002)(1076003)(107886003)(36756003)(6666004)(478600001)(110136005)(54906003)(41300700001)(316002)(38100700002)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZS++HNeVZnq1tfrW99L2e48lA+wX6tV4YI4FPbvwVNDSCdbC2qldQu1rtWD?=
 =?us-ascii?Q?d/0y5TvuYCZQ1OqAAdN3XnasUY+/EJi8adr4YPaTSktRdc8sWtj24hSx2/y5?=
 =?us-ascii?Q?DXB8X0mvP491ByxyW3wvVuh0Voukz/vz6y/f2kfRI+pU5KRqNok6OpQZaz2I?=
 =?us-ascii?Q?O5Kye6KeBxa+3xazNgmRdadd+tnyUXmVB6d8Av+hI59lqGAPjgUtL/qktFlR?=
 =?us-ascii?Q?6D7LQ0BviTJgwnS9Gejrbgbw02AY8iN6JBDlB5lGzYWyYg5RiwzDjxpoMjdk?=
 =?us-ascii?Q?3HrUwiEwdcASVuHCE+y3Ppcp9Go10+BWJiekUW3c+ARGIoL02XA6JUqOCj0r?=
 =?us-ascii?Q?Syjt/pDRG9l2viRViHroUJXs84EDUmosUVYfT0fPQeYSBDhvf6b0YvDVw69L?=
 =?us-ascii?Q?mi32S+SwVFbVTqaQ9ldmTKtCWOBwVMosXUgOiyzyg7LA+yW0FW9pu3Qhpdie?=
 =?us-ascii?Q?PLJCxDZXjGHyXgTaC3WeJAtvHZD7UdlsCcTYj/LYwr6TjkBqAZhJ7z/bzvcQ?=
 =?us-ascii?Q?9VPw63fQrUTAKE8+H+C0SKOH83Hlu/XoUvMH8Bsv/ftxvcVx29RyafeRSfqe?=
 =?us-ascii?Q?+8h496y5JTQmimUZsvBcdYKdjKM1/H1gxdfELgEVCapPwzdBykD1xa49RAUP?=
 =?us-ascii?Q?EHMXpDmvP2uy+CnMcbTOsYhiNA2p6Qd+xMiSFtoMYrjbFRvSEENygcwtMwdU?=
 =?us-ascii?Q?CiYmftmJg9jTM0xfZOeZe2tVnJfMmS2Z7QPMpognfLrBQpyqhIwZrimek6iA?=
 =?us-ascii?Q?G1vthydFKV6iPKzJTdtJRMS6M4/8UCL1canuxfAIIMGU4z9Mgidshx0kfaAN?=
 =?us-ascii?Q?6KWNyMsmbH6BKvEvBoVrRLnTMMBAjD/mg7agyyA8phe5yX2BF9IismkMNx1Y?=
 =?us-ascii?Q?Mur3BoGyFNHrMEBXO7LSz8HHVg4By9A18kU+5yVZL/x0JZ0+LSeOtdfJltul?=
 =?us-ascii?Q?GbIJhwWUVTBUtz6mnXlVE+N5LSOIzubfshtRkbPMX6g/bJBBG6fVLWQNxS6s?=
 =?us-ascii?Q?VAZRUS8VHZT3pPAeSM9eeW2yZSnYbIDKnRsSdv9qR2aw6rQSds83mS90MSZV?=
 =?us-ascii?Q?Dw3l6VuEFNmwwfuVXYSQhXtKuUU8bJlf+NJgIJ8fQjHhUxXWo5fRxRUAviv4?=
 =?us-ascii?Q?pyKFinQ8kYAJUBzb9d4t9bdzPhvRUJalco0sTiHyj4NmG+7nSdEqf+LF4e7o?=
 =?us-ascii?Q?g18i5nzdsvAa7mTtmpt3/+wE5oOSkDtq64T8GNYjojEG0WoOzQbhHnAk6zH4?=
 =?us-ascii?Q?pAx5Wan3nzIdRgatNs53gFT43KBqulYkzPFX9hSxFtEIijrwx2gTAw3CE1+T?=
 =?us-ascii?Q?kLjKPp9iqkWyakDsPy8I8sQKaqZWF2IeisOlQTzCRMryj7hqlCG1uZBjvKL8?=
 =?us-ascii?Q?A4ioT7W9o8RsG9wJRTyqYb+DUkEGkjWs7GJlil3exML2Wasv2JR1BzjjA6CF?=
 =?us-ascii?Q?N7xhIhCwK6YiJSAQUs0848nBQibqMrNxuEMhKN6R+IdT+HuVf9G4B8Od/kLF?=
 =?us-ascii?Q?CHo0rqpbWCEfSxWALexOMjb3Qjt+/hMzFHZ3D6fIQuHYGwRGIoAjiqmYFcx7?=
 =?us-ascii?Q?owV3ww+yQ4E5SIrTi5YgCOqFupJ531PjhhYrNRyW?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d46f3d-ec1d-4685-b893-08db1320bb5c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:59:10.7760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLQ9e/0BntA5OaBSYjuoLue19AFnQ+ifSt5s7x/lR0QSgNL4w/SQU4NbFKgv0fDSdnxn9nrLHyp7+QZR+RmZ2w==
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKTmV3ZXIga2Vy
bmVsIHZlcnNpb25zIHJlcXVpcmUgdGhpcyBmbGFnIHRvIGJlIHByZXNlbnQgY29udHJhcnkgdG8g
b2xkZXIKb25lcy4gRGVwZW5kaW5nIG9uIHRoZSBsaWJubCB2ZXJzaW9uIGl0IGlzIGFkZGVkIG9y
IG5vdC4KClR5cGljYWxseSB3aGVuIHVzaW5nIHJ0bmxfbGlua19pbmV0Nl9zZXRfYWRkcl9nZW5f
bW9kZSwgdGhlIG5ldGxpbmsKcGFja2V0IGdlbmVyYXRlZCBtYXkgY29udGFpbiB0aGUgZm9sbG93
aW5nIGF0dHJpYnV0ZToKCndpdGggbGlibmwgMy40CgogIHtubGFfbGVuPTE2LCBubGFfdHlwZT1J
RkxBX0FGX1NQRUN9LAogIFsKICAgIHtubGFfbGVuPTEyLCBubGFfdHlwZT1BRl9JTkVUNn0sCiAg
ICBbe25sYV9sZW49NSwgbmxhX3R5cGU9SUZMQV9JTkVUNl9BRERSX0dFTl9NT0RFfSwgSU42X0FE
RFJfR0VOX01PREVfTk9ORV0KICBdCgp3aXRoIGxpYm5sIDMuNwoKICB7bmxhX2xlbj0xNiwgbmxh
X3R5cGU9TkxBX0ZfTkVTVEVEfElGTEFfQUZfU1BFQ30sCiAgWwogICAge25sYV9sZW49MTIsIG5s
YV90eXBlPU5MQV9GX05FU1RFRHxBRl9JTkVUNn0sCiAgICBbe25sYV9sZW49NSwgbmxhX3R5cGU9
SUZMQV9JTkVUNl9BRERSX0dFTl9NT0RFfSwgSU42X0FERFJfR0VOX01PREVfTk9ORV1dCiAgXQoK
U2lnbmVkLW9mZi1ieTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgot
LS0KIGxpbnV4LXVzZXIvZmQtdHJhbnMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saW51eC11c2VyL2ZkLXRy
YW5zLmMgYi9saW51eC11c2VyL2ZkLXRyYW5zLmMKaW5kZXggNDg1MmE3NWQ5ZC4uMWZiOGVmOWQ0
ZSAxMDA2NDQKLS0tIGEvbGludXgtdXNlci9mZC10cmFucy5jCisrKyBiL2xpbnV4LXVzZXIvZmQt
dHJhbnMuYwpAQCAtMTM1OSw3ICsxMzU5LDcgQEAgc3RhdGljIGFiaV9sb25nIHRhcmdldF90b19o
b3N0X2Zvcl9lYWNoX3J0YXR0cihzdHJ1Y3QgcnRhdHRyICpydGF0dHIsCiAKIHN0YXRpYyBhYmlf
bG9uZyB0YXJnZXRfdG9faG9zdF9kYXRhX3NwZWNfbmxhdHRyKHN0cnVjdCBubGF0dHIgKm5sYXR0
cikKIHsKLSAgICBzd2l0Y2ggKG5sYXR0ci0+bmxhX3R5cGUpIHsKKyAgICBzd2l0Y2ggKG5sYXR0
ci0+bmxhX3R5cGUgJiB+TkxBX0ZfTkVTVEVEKSB7CiAgICAgY2FzZSBBRl9JTkVUNjoKICAgICAg
ICAgcmV0dXJuIHRhcmdldF90b19ob3N0X2Zvcl9lYWNoX25sYXR0cihOTEFfREFUQShubGF0dHIp
LCBubGF0dHItPm5sYV9sZW4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGFyZ2V0X3RvX2hvc3RfZGF0YV9pbmV0Nl9ubGF0dHIpOwpAQCAtMTM3NSw3ICsx
Mzc1LDcgQEAgc3RhdGljIGFiaV9sb25nIHRhcmdldF90b19ob3N0X2RhdGFfbGlua19ydGF0dHIo
c3RydWN0IHJ0YXR0ciAqcnRhdHRyKQogewogICAgIHVpbnQzMl90ICp1MzI7CiAKLSAgICBzd2l0
Y2ggKHJ0YXR0ci0+cnRhX3R5cGUpIHsKKyAgICBzd2l0Y2ggKHJ0YXR0ci0+cnRhX3R5cGUgJiB+
TkxBX0ZfTkVTVEVEKSB7CiAgICAgLyogdWludDMyX3QgKi8KICAgICBjYXNlIFFFTVVfSUZMQV9N
VFU6CiAgICAgY2FzZSBRRU1VX0lGTEFfVFhRTEVOOgotLSAKMi4zOS4xCgo=

