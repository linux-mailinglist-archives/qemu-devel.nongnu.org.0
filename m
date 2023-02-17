Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109C69B113
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:37:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3jC-0007YG-VK; Fri, 17 Feb 2023 11:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3jA-0007Uj-ME
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:52 -0500
Received: from mail-bn7nam10on20608.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::608]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3j9-0007zs-7B
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9r3wZvjHXK67hXmm7K172fzQLi1NA3R+t/EFjlPutwWHpahzjPwsXEsdm5hxBsCD3VYyEYvOMPM0V17ug0rruBFs0pR+qiKfLFvXAPEc7+YwLgbZeNif1e3eQoUodl5yZmqtL+DgP8wJ6yoMMt72j/oCkQZwU+YUhs2P6ZzALtsh08jg2TyC6DF1XMf+MrkclmPoW6vKSX4n6qvMfNbXivCmkKHZt/ISkUe2mDIBd5nMxAbtdmV0vp9TULF+2l4CReTvX7uO77cH6Tu56fDLuQsbAEhymkYMc619ajBXYwF94PNtElAk+As4bzeN+o7J9/C2mKUoWP2XkMeeeKsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp7Ib6kQxJG1/ofxYXkisi9FeYc2Y/YD1iNiyk2hxH8=;
 b=U6BixS+5J2FpiJA8RoAfX8P8VJ7v8WKLlz8vQB+SRuuDs0Clg/u+LEEXy/x/n5f0e90mL/wc9sdMaLsO8cRc/hrM480eAXoDgvoCdqADVpVjpouQmZhSrud6chOhPU1YWt9dQDW7APO7BXIs4xme9UJA5sGGsGD5H7KIlIKWD5s99Sw7HtunqRfmVd0hJDTlacTg4gLXKZ+3xdue9bHsgy26yjiGr5nBTZGG+XSgAjXkrv7btxZi3kGuBcnbWz+qXlsnsMYYNRhWDu5geTEnSAadPiS32Q5v0Jpinb/IhrkN+2Y7+9Y3OJamRvtFje5eMQSWJD00Ryylt4bQLXpb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp7Ib6kQxJG1/ofxYXkisi9FeYc2Y/YD1iNiyk2hxH8=;
 b=WS1VuW72ZUuOeDmc4aHqc/i+cKvqzEcvivJVvqnsVtd9+9ULZYr8o+IUp99MSdwH3iXiv/g8/Ma3ytLV3NLvlJpIjflaPknYQIj97jr2m+SU4M8gTIhPHRJrN/GFGamzENGnafFunXIfx9PGwLIOTH90eckFvwdc169tKUtPdMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:36:16 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:36:16 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v1 4/4] linux-user: handle netlink flag NLA_F_NESTED
Date: Fri, 17 Feb 2023 17:35:27 +0100
Message-Id: <20230217163527.619486-5-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217163527.619486-1-Mathis.Marion@silabs.com>
References: <20230217163527.619486-1-Mathis.Marion@silabs.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::21) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8abd06-94da-4c0c-2faa-08db110516cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0SEfHZp1wE692bSQYhjPYRwwUHj87VEEu8cteZMsIJeEIdxLBlIaQzJlVVMbK7WvTM6pMaYSMc9/YmpcFY+QgXSgSetGoFerThsJUlJLaQ7LAht9F7zM2u0rvJ61C++BqrnQKe8s+vALlUCIrRAYHFXIGGb3caBXv38Vki0WUc08q0/OhRNY6DBkZqHkqM5dTqu1mweFQb+++klO+Ff0dxDhnQ61LjSFHX26QkssVlTyx6d3rQzodNKjX+QQNhqZBEG33fZXHmN4c2aZ3Oh4Vaq8Lay9FLzbs7CkVMmmSwMg4P9AUNvW1JFtMa6iydwTf2qcy/bGINF39TIw9qqu521lIeEKMJW8KVjKbxUnXgQ06DMdZXfweNiGZz9r1vE2v409nahKzZeNw8/uXpbxTCTGAmFKYYDNxZyKkD++LnDfb4U/bk75GE1wZjIKDPL6+Ns2Vhz5MJ0Rn2MHY7kncT6uhVEk3qZzqPH2Hqm4nurJMVqSPi50PM/dFqDjhm+xsj0fXqbY/Bj3r7GOoK5Ka4NznpY6lwa0moi4ZK/x6umz5vfmNi6fTB1tI6LISdi72kWdf1KYpnJCeTnrENDDVR7WlP/cjJF601UKFTbPrVbRIJT9s8oHQFdF7+6FqGC0MAiuXiK/cINL/1YwA8gY/Hr89L6Wq5lreBvT56Tr9rSBw1L4OTJB97Ef8DZS4Lx0MkxhHlDKC3m+MrZPUqYNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(2616005)(83380400001)(2906002)(36756003)(26005)(478600001)(6486002)(52116002)(186003)(107886003)(6666004)(6512007)(6506007)(1076003)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(6916009)(4326008)(41300700001)(66946007)(66476007)(66556008)(8676002)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3/VdE64f/EF2ljNh7pAyLMGQhmZyokrKb4ti+qiVcfmwa5O1oVdCSozjtO3F?=
 =?us-ascii?Q?vUFdp87Hh4qImzloOepf1TO6e5bSUHvEABZQ0QtNRuu3T4tQK/k93Qd90WbA?=
 =?us-ascii?Q?Tg4z3rchSnFL8UlPLZtXz4lVpD6rvShNisogy/OJGbnUSVBP0fXfO5sKV0lZ?=
 =?us-ascii?Q?4OhmTglHAjDse6efINbrGYbqnpJGXstcY/mt/WD2T2kNMvhP6yqVgo1Fvijc?=
 =?us-ascii?Q?/EGEeOlcE2e8eWcQMLTnGR5XW91oUyTCHFtWw4qxygE3J6raUW/lksR7GLwf?=
 =?us-ascii?Q?HhOsjJGLx3xeeRDld5PgKvSyB4M212NOIf534tShfoSkYtG1IUsVvwFM+/Hq?=
 =?us-ascii?Q?M8duzMlMLmh+qLxgE8urpzyqSoIV+lrS9uzf+nUAm7l+LyYQoX1wTZKR7xys?=
 =?us-ascii?Q?TdwAAk0+JmI5Gtne9Dp9BwvwAV95aK9qFsMgPtFTI8IUaOhsDRGQMGpxsa0O?=
 =?us-ascii?Q?56aOHSxt8Dee2MDm4JxsgxQIpDl1F/DKbV8DdLeIgdhVbV4zSDQREW13dEPI?=
 =?us-ascii?Q?CJQONFrIbT7vmYu31RalvOumO9+Heu6L+ORxzvxnXb7ep/IGu7Nper/Jew/f?=
 =?us-ascii?Q?1S3K+4jWnBJECLNJBMh47PLyt2e7SJdCPHx9rOr194mYziVq9p18lTMI+SsX?=
 =?us-ascii?Q?06FMHh8WdE7jhoHN3WP29faoXN+kcNkrHhJ1vucv5TK26ZCkeqG3/uWVCDhx?=
 =?us-ascii?Q?zYLgyXiUuwOC97y1dGF89lsCVfYPUvlWsjHS3GGYIn2hsq77hvVdEhOX/Y+G?=
 =?us-ascii?Q?gRkUWj3UrElGEpI5SKHL8b/cVag75WMx7ddfxoDKn7ftIuHvKTBAktGwOJap?=
 =?us-ascii?Q?4Kk/p9IY5+Peg7nmAlZoqjuUax5DB79UIZwmkpcixN19stBvcCbZN+SHSYW/?=
 =?us-ascii?Q?XIDSgDjrHt8JcjAn4oRB3MV7uddOsU+YtH07s0IQ7AG/edqfMCXtSCjw5z/A?=
 =?us-ascii?Q?v+FequsTrEXZGwNdWMcRL8ge37a8ADpAoF4Jk9ASKZkOrBaM7USlfzvVTo6f?=
 =?us-ascii?Q?LCBEmd5xuBJ8LtthpabKEVrsloh5TnRpujIONIjLFQ5nCEGWIWBbRykD2o75?=
 =?us-ascii?Q?AkZJyvhcDlwv38x3y2L3RguSqwubsGRol+HurMhi6AyrXMChpAwIt4eRb3Ct?=
 =?us-ascii?Q?rLoHblECe8JrMbfWqE4rcx8gnPhVqitJY05Vwn/K1/7PwYk8fUEqKzd3psIW?=
 =?us-ascii?Q?oXFCpZuazU/c3DWQgVKF+RlRST5y/e0+uyAn/7fS3Bg01hH0VS7HJiaDLNZe?=
 =?us-ascii?Q?UQeP8ieuN3xzOWu9GRLgLpgUIq9/waMk+WjBl4QxE2mapPpRu7zy2KC/eVBT?=
 =?us-ascii?Q?xQRqc1MKWIY5nS+rsqaEwNSdnv6GQrET7OgiaKdGHEiTTRvBhWhhwsFu2ZbN?=
 =?us-ascii?Q?m4WE9Z20Kl7M1fVtkC2QVau4hMeRvRIsiHphgkyMJIOhw6CXmRr7oUrG/vAg?=
 =?us-ascii?Q?p1NHyBw8hu1xJemxrfXzZNTA7ImAn9/mXHL3yZcXVYT7yvQ8MiAqPxmO+DJv?=
 =?us-ascii?Q?mKXai/9miBkr+jfW01KtOv3Y5nl1pQ3Lk+3I3+NBZdBin0RNB6P+3iizr/pG?=
 =?us-ascii?Q?X5jp7b9boJiCwD7dF192A4M6l6vnrXgfvExOdWu9?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8abd06-94da-4c0c-2faa-08db110516cc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:36:15.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0ce1W5+hPAEQSw7AMdjcHYpC79qillrV5Hb6SjFyxND2C9ajFdWcrdGCdQsSpjcSJ1VJJ+EpW4dl0/iToM5XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
Received-SPF: permerror client-ip=2a01:111:f400:7e8a::608;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_SPF_HELO=1, MIME_BASE64_TEXT=1.741, SPF_HELO_PASS=-0.001,
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
YW5zLmMgYi9saW51eC11c2VyL2ZkLXRyYW5zLmMKaW5kZXggYWEzOTgwOThlYy4uNzkwZjhiYmNm
NCAxMDA2NDQKLS0tIGEvbGludXgtdXNlci9mZC10cmFucy5jCisrKyBiL2xpbnV4LXVzZXIvZmQt
dHJhbnMuYwpAQCAtMTM1OSw3ICsxMzU5LDcgQEAgc3RhdGljIGFiaV9sb25nIHRhcmdldF90b19o
b3N0X2Zvcl9lYWNoX3J0YXR0cihzdHJ1Y3QgcnRhdHRyICpydGF0dHIsCiAKIHN0YXRpYyBhYmlf
bG9uZyB0YXJnZXRfdG9faG9zdF9kYXRhX3NwZWNfbmxhdHRyKHN0cnVjdCBubGF0dHIgKm5sYXR0
cikKIHsKLSAgICBzd2l0Y2ggKG5sYXR0ci0+bmxhX3R5cGUpIHsKKyAgICBzd2l0Y2ggKG5sYXR0
ci0+bmxhX3R5cGUgJiB+TkxBX0ZfTkVTVEVEKSB7CiAgICAgY2FzZSBBRl9JTkVUNjoKICAgICAg
ICAgcmV0dXJuIHRhcmdldF90b19ob3N0X2Zvcl9lYWNoX25sYXR0cihOTEFfREFUQShubGF0dHIp
LCBubGF0dHItPm5sYV9sZW4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTlVMTCwKQEAgLTEzNzYsNyArMTM3Niw3IEBAIHN0YXRpYyBhYmlfbG9uZyB0YXJn
ZXRfdG9faG9zdF9kYXRhX2xpbmtfcnRhdHRyKHN0cnVjdCBydGF0dHIgKnJ0YXR0cikKIHsKICAg
ICB1aW50MzJfdCAqdTMyOwogCi0gICAgc3dpdGNoIChydGF0dHItPnJ0YV90eXBlKSB7CisgICAg
c3dpdGNoIChydGF0dHItPnJ0YV90eXBlICYgfk5MQV9GX05FU1RFRCkgewogICAgIC8qIHVpbnQz
Ml90ICovCiAgICAgY2FzZSBRRU1VX0lGTEFfTVRVOgogICAgIGNhc2UgUUVNVV9JRkxBX1RYUUxF
TjoKLS0gCjIuMzkuMQoK

