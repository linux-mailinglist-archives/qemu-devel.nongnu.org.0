Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2C69B110
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:37:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3ii-0006wZ-N2; Fri, 17 Feb 2023 11:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3if-0006wC-2w
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:22 -0500
Received: from mail-co1nam11on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::615]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3id-0007iT-5p
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et/o64PO1V7DixuA+fduGVxPqm7IH9d9ErMHHM1b26Qu1Gl8l7ddg1zqfibbAyoJUd8pfYHyESY+KmHRz8HQZlObYrnqVpipes0xn/e0v8wQv1zyiqkfqL7HQXZwFziSACV/wE5beH36McjuKCocL8n1VpQg7RF0u2oAiVHuJ2rEtohzU+UszOmoFSgN/CjbdycUli7YwHlxBaKX1EIu+I2iuKkbBjYparra5687XijDxWOV7LcR/x6OMjH+l50zz9QizAacCwmEF0KWEfymJBBOEJh77HExGUn0y3mnss8wp3cxoAz3zIFIOe4euM+jQAMFjokCfaGgx3Haut2y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pjLcBWB7cIR3RULHTMUw77zRUWcn8DISd9NOLRkQwA=;
 b=hsE4SuJgIqnHnRVtaEzUuU1gir5vYyhaaCdtdRGDuI7gahs8HHLfwrm8HCo12m99hxIYbzml5GKOeFzIOEI+jRkusySawJQBtC3BzeZWGhgqa7YDWK00k7fQivAZANMQFo2O2jtTpC7/1NzEni6W5ErbfV1ZER166Pg16XoNlWAYJ8NGt8H9q5xjCl0CtVYLBjPc+EXz8SMpceS0mTloY+EfLMyamMni7T278lng0LM3quj6Wnj6uncEKHAvaG6HQUzm3wPZAnhrJx68odjZ1tavbFBl3EBCq68UmtgxRdXp2RoPpblZTVZq9FRw3PMZq2hzIfsgpIoOZujxRf9YTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pjLcBWB7cIR3RULHTMUw77zRUWcn8DISd9NOLRkQwA=;
 b=SHp+t4wUm9E1MqYG2b3h+EVw+JRvM3PqrGP2POpUmiXXIrm/fzFDyy1pxCb5QHArJaoCoooDipjQD27mBCP2CyYqYm9cib1I7BzTezXqIUujCiqfoVwvKfA33gg1USbYOrMqf4nPAo2w5Dt8dCQH5J4hTr73v+1VNP3iCCqF9cY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB7497.namprd11.prod.outlook.com (2603:10b6:510:270::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 16:36:15 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:36:14 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v1 3/4] linux-user: add target to host netlink conversions
Date: Fri, 17 Feb 2023 17:35:26 +0100
Message-Id: <20230217163527.619486-4-Mathis.Marion@silabs.com>
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
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 57562158-a7a7-4102-5e09-08db11051631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBY1D4ZmqB8JUU57FxDtgdTGgh2zEx4urECdShhWZKY7YHKCjS02Cn7Fx+0ci6A5Hhc8eg3HdqhGo4lDKF3TGnpXcH693AFc2HKNwwpLsrvIA5j/ue3yogT4q4gzKZ0h2RmratKZEfSqwiig240EcetQcw8RK6nPoraFrE09Ub++pOwcZRJRJl/L91jzBRJZAeaPnV0wW2da5K8jGRwvOL2Z6HBPTjiHbWdIz6U3BUUZ0tZLqcGrhJVaZLqXBJgX+r3scui2N9uuZF5c2jbqSXW6ipiv8Z0jJM/V0WElGQoqyOubWnxsMFMj3pA3TM5IvEkOR14Ae2kCbXqix/OU55t2LCj+7zehqkhn4GeYQkETN8TkPYym9qtPc5T5VBk6NQw4fYS1NfbS6+qDrOhghw0PVMQBKOvLMH38FjMRPGT7ADbZocb2tkvEmcoF6ocnIdMAUf5cgIR2H2dXYONBR9L5YZCGrbQreXsNmx3Wmo3H3Jwh87eM1mpC8m26RjGi1cRPZuQIPEpWLkgsc9phzjCh/7LCRZyyeKU39wQQJIgHm+uZWtBEACRHLGlVRHQZIvVT7FSdqUvs3disYIRWF0KZN1e0u2+EwkAUJOP8+UfK9SNbniWgjAYuAK2RDllXyOkl5bwckab7kcWJXroDvwpj+BGowM0jsDD4Uh5D22F+2uU8eOEdqDnA3slKFPNaMmgIW9U6ns3pQNIWbMG2qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199018)(2616005)(86362001)(5660300002)(41300700001)(6486002)(36756003)(66946007)(66476007)(66556008)(4326008)(8676002)(6916009)(316002)(54906003)(478600001)(52116002)(8936002)(2906002)(107886003)(38350700002)(38100700002)(6512007)(6666004)(186003)(26005)(1076003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VTaFwXTPPyjfCCwUyxF+sJwwLc6MYnofGVitdX00Bf/WF1R4e4RbzD+kRlwm?=
 =?us-ascii?Q?QkuperKbBZZfqEqQLFhHUVQlC+29x2j1wCgO2kR1gQ3iXhG+uamgTRR3ojri?=
 =?us-ascii?Q?ewRISL3V+qEyNT/SmaNhopGgbTQkm1Unn1ImGUCXAUrIGZfsznFtSuOzeIgi?=
 =?us-ascii?Q?69rHiI+tmYCQsLXTlX3JR8vQat5gqXezLsSoG29fGl2tbmrUR0BFp4rdHvQ+?=
 =?us-ascii?Q?vNQ4pYGYp0Qrml3kqMKyP4Fy3LnoEJdhlMpODe42bwpH+ry+x+eRaA6BqY2p?=
 =?us-ascii?Q?9io/RKpVlPymx9IUomy2/SuFT5q/Yn0rS3p5YGtqUtAu/ScmQH7P8gB8VM2o?=
 =?us-ascii?Q?m+0SeUhkrLcFNw6KsHHDHelPDYJ/5IyNujqDbntBnL7OHc1rLsuzFfFupjo7?=
 =?us-ascii?Q?cJebLlPdjUm7Dr6lNO5cCRZX1azymoazj7PokEuZwwl/M1XPaSRQBZNv46t0?=
 =?us-ascii?Q?34ve+KaWR/V9n5NiK4CwEgOH7lwMqQoWeAUIpDs62ob0fulSKXoZmoyWvNIp?=
 =?us-ascii?Q?Huk00PRFy3/k70ZeTkOO9UV8JMz6KHLvvt+KoiD6bDFaclVOH2Xc7knU/g7x?=
 =?us-ascii?Q?UbbWAHCkYjFv71BS7bXyrPcSIDWYKZn5VR76B3gDCA7Ums445C3/nczb+jLR?=
 =?us-ascii?Q?tgJIx6m9yvaSEOAtGzSH/7LRxDUcPrPdBtIkMtjh2I9m8Z8UybWuUBnvi2gr?=
 =?us-ascii?Q?d9p1Y+4nIVS4jvtJvgGmKCNkORYnbBUh0n4aTU8/zEROjUTn9s3mWlUowSuS?=
 =?us-ascii?Q?RcwXh2XnMQDSCT/r0EIIXCX/ZYHK7miXc49OKX3iQO44rTpWQLa+Rl4KY2re?=
 =?us-ascii?Q?88NYWO5DBqaY0V/Lrk3EZDZYiI3rWPWvIsYOZKlbzoB0K3CWckCOCFKQR85u?=
 =?us-ascii?Q?kd4nS5XUz/wWulRU5IC0zEGtnMUVkGgpkQsoUc/b3rk09R2vwoMx5etNv/uz?=
 =?us-ascii?Q?D9cLMMHSl0T8i2QistjAeqExiVCa2lEkITUpJR/JlPrUfF3pSzbss6iWA+J0?=
 =?us-ascii?Q?rzHwlWeBK0qWzHjkKPsr9uKC7M5LTbR01ZOZJZy5a/zI/jxqSCc2rX7o5puE?=
 =?us-ascii?Q?vD50R6hTkXjaQkSlBwYRDO71JcSBa1rrLgXSo7aKKZA04R0aLymVpu68MPlF?=
 =?us-ascii?Q?z7gp+SpSvMxhL/iH36rQXXzPQ6nb33e54+7lx6Ri/tTbHNP6jLp3QryBKsyu?=
 =?us-ascii?Q?JRLCXvqLdKOS6GaOpX6nO9/7S7tInYnx5XYM3sG8C0laOy9bohbBfNw4lRTb?=
 =?us-ascii?Q?thVOJ+6Y2DRd9IVRYf8UhOO58vhCRmGxaYXM/Hcr7nYz/1Wic9fkRJS6IsH5?=
 =?us-ascii?Q?hqt72l1yhgA1x4Z5ycTxx2oDh4ZJs/Pm4m2wZLSPhbkHJcDcpkXhsSNU6srM?=
 =?us-ascii?Q?7qoq0u3Pux0byxDu+iRi6cjaJHqvhXhrT5Pen4ZR89thv9oFU6ylU3kl3cVv?=
 =?us-ascii?Q?jvvsqP/IX8pnRXl/QDYODZdh10KhXFPILFah1iNGTvbHhSRvZXyhe134Uxet?=
 =?us-ascii?Q?dBAqY+NN4a1YRX5XNKGI5eqFJX9c0WTls5HderQ3jipc1/Pv+WGtsh9uxlOh?=
 =?us-ascii?Q?rw/3Ayhza18Nx2UWxSUceIHZ2izOVlBXuY16ZxYg?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57562158-a7a7-4102-5e09-08db11051631
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:36:14.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwEazc3rR2vYem21m/5q2G5h2MqCbOm/RMhY6p6DeqAu1xAT5/uR3ysStT3pQv5cMO8Nb5r2+EqB6lXcHwP7eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7497
Received-SPF: permerror client-ip=2a01:111:f400:7eab::615;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKQWRkZWQgY29u
dmVyc2lvbnMgZm9yOgotIElGTEFfTVRVCi0gSUZMQV9UWFFMRU4KLSBJRkxBX0FGX1NQRUMgQUZf
SU5FVDYgSUZMQV9JTkVUNl9BRERSX0dFTl9NT0RFClRoZXNlIHJlbGF0ZSB0byB0aGUgbGlibmwg
ZnVuY3Rpb25zIHJ0bmxfbGlua19zZXRfbXR1LApydG5sX2xpbmtfc2V0X3R4cWxlbiwgYW5kIHJ0
bmxfbGlua19pbmV0Nl9zZXRfYWRkcl9nZW5fbW9kZS4KClNpZ25lZC1vZmYtYnk6IE1hdGhpcyBN
YXJpb24gPG1hdGhpcy5tYXJpb25Ac2lsYWJzLmNvbT4KLS0tCiBsaW51eC11c2VyL2ZkLXRyYW5z
LmMgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvZmQt
dHJhbnMuYyBiL2xpbnV4LXVzZXIvZmQtdHJhbnMuYwppbmRleCAxNDZhYWFhZmFhLi5hYTM5ODA5
OGVjIDEwMDY0NAotLS0gYS9saW51eC11c2VyL2ZkLXRyYW5zLmMKKysrIGIvbGludXgtdXNlci9m
ZC10cmFucy5jCkBAIC0xMjg0LDYgKzEyODQsNDkgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBo
b3N0X3RvX3RhcmdldF9ubG1zZ19yb3V0ZShzdHJ1Y3Qgbmxtc2doZHIgKm5saCwKICAgICByZXR1
cm4gaG9zdF90b190YXJnZXRfZm9yX2VhY2hfbmxtc2cobmxoLCBsZW4sIGhvc3RfdG9fdGFyZ2V0
X2RhdGFfcm91dGUpOwogfQogCitzdGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZm9yX2Vh
Y2hfbmxhdHRyKHN0cnVjdCBubGF0dHIgKm5sYXR0ciwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxlbiwgdm9pZCAqY29udGV4dCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWJpX2xvbmcgKCp0YXJn
ZXRfdG9faG9zdF9ubGF0dHIpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChzdHJ1Y3QgbmxhdHRyICopKQoreworICAgIHVuc2lnbmVkIHNo
b3J0IGFsaWduZWRfbmxhX2xlbjsKKyAgICBhYmlfbG9uZyByZXQ7CisKKyAgICB3aGlsZSAobGVu
ID4gc2l6ZW9mKHN0cnVjdCBubGF0dHIpKSB7CisgICAgICAgIGlmICh0c3dhcDE2KG5sYXR0ci0+
bmxhX2xlbikgPCBzaXplb2Yoc3RydWN0IHJ0YXR0cikgfHwKKyAgICAgICAgICAgIHRzd2FwMTYo
bmxhdHRyLT5ubGFfbGVuKSA+IGxlbikgeworICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0K
KyAgICAgICAgbmxhdHRyLT5ubGFfbGVuID0gdHN3YXAxNihubGF0dHItPm5sYV9sZW4pOworICAg
ICAgICBubGF0dHItPm5sYV90eXBlID0gdHN3YXAxNihubGF0dHItPm5sYV90eXBlKTsKKyAgICAg
ICAgcmV0ID0gdGFyZ2V0X3RvX2hvc3RfbmxhdHRyKG5sYXR0cik7CisgICAgICAgIGlmIChyZXQg
PCAwKSB7CisgICAgICAgICAgICByZXR1cm4gcmV0OworICAgICAgICB9CisKKyAgICAgICAgYWxp
Z25lZF9ubGFfbGVuID0gTkxBX0FMSUdOKG5sYXR0ci0+bmxhX2xlbik7CisgICAgICAgIGlmIChh
bGlnbmVkX25sYV9sZW4gPj0gbGVuKSB7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQor
ICAgICAgICBsZW4gLT0gYWxpZ25lZF9ubGFfbGVuOworICAgICAgICBubGF0dHIgPSAoc3RydWN0
IG5sYXR0ciAqKSgoKGNoYXIgKilubGF0dHIpICsgYWxpZ25lZF9ubGFfbGVuKTsKKyAgICB9Cisg
ICAgcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBhYmlfbG9uZyB0YXJnZXRfdG9faG9zdF9kYXRhX2lu
ZXQ2X25sYXR0cihzdHJ1Y3QgbmxhdHRyICpubGF0dHIpCit7CisgICAgc3dpdGNoIChubGF0dHIt
Pm5sYV90eXBlKSB7CisgICAgLyogdWludDhfdCAqLworICAgIGNhc2UgUUVNVV9JRkxBX0lORVQ2
X0FERFJfR0VOX01PREU6CisgICAgICAgIGJyZWFrOworICAgIGRlZmF1bHQ6CisgICAgICAgIHFl
bXVfbG9nX21hc2soTE9HX1VOSU1QLCAiVW5rbm93biB0YXJnZXQgQUZfSU5FVDYgdHlwZTogJWRc
biIsCisgICAgICAgICAgICAgICAgICAgICAgbmxhdHRyLT5ubGFfdHlwZSk7CisgICAgfQorICAg
IHJldHVybiAwOworfQorCiBzdGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZm9yX2VhY2hf
cnRhdHRyKHN0cnVjdCBydGF0dHIgKnJ0YXR0ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxlbiwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYWJpX2xvbmcgKCp0YXJnZXRfdG9faG9zdF9ydGF0dHIp
CkBAIC0xMzE0LDE2ICsxMzU3LDM3IEBAIHN0YXRpYyBhYmlfbG9uZyB0YXJnZXRfdG9faG9zdF9m
b3JfZWFjaF9ydGF0dHIoc3RydWN0IHJ0YXR0ciAqcnRhdHRyLAogICAgIHJldHVybiAwOwogfQog
CitzdGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZGF0YV9zcGVjX25sYXR0cihzdHJ1Y3Qg
bmxhdHRyICpubGF0dHIpCit7CisgICAgc3dpdGNoIChubGF0dHItPm5sYV90eXBlKSB7CisgICAg
Y2FzZSBBRl9JTkVUNjoKKyAgICAgICAgcmV0dXJuIHRhcmdldF90b19ob3N0X2Zvcl9lYWNoX25s
YXR0cihOTEFfREFUQShubGF0dHIpLCBubGF0dHItPm5sYV9sZW4sCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdG9faG9zdF9kYXRhX2luZXQ2X25sYXR0
cik7CisgICAgZGVmYXVsdDoKKyAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfVU5JTVAsICJVbmtu
b3duIHRhcmdldCBBRl9TUEVDIHR5cGU6ICVkXG4iLAorICAgICAgICAgICAgICAgICAgICAgIG5s
YXR0ci0+bmxhX3R5cGUpOworICAgICAgICBicmVhazsKKyAgICB9CisgICAgcmV0dXJuIDA7Cit9
CisKIHN0YXRpYyBhYmlfbG9uZyB0YXJnZXRfdG9faG9zdF9kYXRhX2xpbmtfcnRhdHRyKHN0cnVj
dCBydGF0dHIgKnJ0YXR0cikKIHsKICAgICB1aW50MzJfdCAqdTMyOwogCiAgICAgc3dpdGNoIChy
dGF0dHItPnJ0YV90eXBlKSB7CiAgICAgLyogdWludDMyX3QgKi8KKyAgICBjYXNlIFFFTVVfSUZM
QV9NVFU6CisgICAgY2FzZSBRRU1VX0lGTEFfVFhRTEVOOgogICAgIGNhc2UgUUVNVV9JRkxBX0VY
VF9NQVNLOgogICAgICAgICB1MzIgPSBSVEFfREFUQShydGF0dHIpOwogICAgICAgICAqdTMyID0g
dHN3YXAzMigqdTMyKTsKICAgICAgICAgYnJlYWs7CisgICAgY2FzZSBRRU1VX0lGTEFfQUZfU1BF
QzoKKyAgICAgICAgcmV0dXJuIHRhcmdldF90b19ob3N0X2Zvcl9lYWNoX25sYXR0cihSVEFfREFU
QShydGF0dHIpLCBydGF0dHItPnJ0YV9sZW4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0YXJnZXRfdG9faG9zdF9kYXRhX3NwZWNfbmxhdHRyKTsKICAgICBkZWZh
dWx0OgogICAgICAgICBxZW11X2xvZ19tYXNrKExPR19VTklNUCwgIlVua25vd24gdGFyZ2V0IFFF
TVVfSUZMQSB0eXBlOiAlZFxuIiwKICAgICAgICAgICAgICAgICAgICAgICBydGF0dHItPnJ0YV90
eXBlKTsKLS0gCjIuMzkuMQoK

