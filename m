Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D55656025
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 06:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9g7g-0003uH-FE; Mon, 26 Dec 2022 00:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7d-0003tl-V8
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:01 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7b-00019T-Rt
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:01 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BQ0A5oU013196; Sun, 25 Dec 2022 21:33:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=m8atIBhdANZHvsFOCTgDAgWneoB97LfOThtRftkjl78=;
 b=2ONVOqPHQLKa9owHwGtAssmCYlVsyQUpNDQXfBjlGknVdV6VQrTf+ttBQvaYVIK9ybHV
 XS4s+CskI8mKNBWRaLwFHz7HphLMHM9F0t4j4l2wUnAa9ymKko4Qrbiq3XNsfyuihYYh
 nWgBf8PFN8idUJ1Iw4zGmX3R7XNq7xy/WVE0o4wOsDFXpv6971LgUn57rGmyP5M6XIpB
 +UUuU2vXyeX3l9Zvbni0n4+RFaHMBjB+/cJT897ns+fPpLPHfYLUoFm+2IXrHHZliDKS
 FaLvrA8RdtqsWwDoqEAFFnu8XceitU2HZQGLYuxDAmFPG2OrZarEC2EqVoEjqqVZx1O9 oA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mnx7dukw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Dec 2022 21:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUhuRBDuU4OzmtixeEPKodF5v3EYfBAAbgFR8Pcya2CSORAR0ujGlCG391I9diVcev/jyH++Pn3UVc/2QLSNfq7YUcTsKcWvxXsp8p8TN2FIhto27jFmbVaqjibyWjj0NbR7Dej2YmKMTJRtg75OdlZipp5TLq96RMYrwiVCFy4b6OlG3KqQSBruaCi0uxURZPKOXAnlhUo67gBByRkJy1oUqNDxloEt02lfcDzWDnUBPcW9mPnZZvtc2OpkY8jfkrkvMfB0qNdAB/Ojwx0XEIQW0wU+Y3ukWh/dcAoTbSEgx/XH3UePTaq699pPytaADDqxLoZQuyZdd7csGB3Oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8atIBhdANZHvsFOCTgDAgWneoB97LfOThtRftkjl78=;
 b=Tf3KjQPFB7KIm9P1XqwFUtfigQxFnbaNiHUE0b8iRwEjPwzdUbTGz/wgZFC5xQ0LmkHVm6cKg6VQs2Lcws4msmAuGOXLNFDR/KWOKByvzXP2OUmG4CPHeEu+DfdXHIwDUersffmluO3ww//hAiWgQ/7OwCtRM7g50d2uXsuqW3JrZslkiJU/wJ8V0D0YbdcNT3GA/7E0CbG5UeNmFsIgllw68FmISLgeShWCl50tlspDXPM0wj6LBXEybnksxkna8H+7SjSK/SNqFlyF6QEmN1EepR0r5lgyc/rFFq9kIpOu5gJnMAD3fqpxpZHoFXPi/W07Wq0U9FlCkhFyzD60bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8atIBhdANZHvsFOCTgDAgWneoB97LfOThtRftkjl78=;
 b=Y05bWu8z+mxnhd/zze24IKfv/0htViVazJvbNUL0AEmmnZ7TjRq28/fOnisNQXlblgsw85iOSAuzrJgac30GN2TSPuB3j0cHYOfQWVE247kz5rEBWsBRMhBjTU1RBu6s21vbyzH3CihtvMvyN8Q4pn6iAyNhxlTKhARx5irBzxfA2nc1CYArXJlij8SGGrFxJ6+N4B/AREat2I6M9ZLUdfAesjkWd9SR49997q2enswkXo3sMM6ZLG140/40HgBJJDPpRvDRGSTJMbnxlLjfYKvaBs4Dt5ef/tyqWXYVZz4BwAxqlz7OMNN8Snk6e8RnCF5yAqWIwRCGLAavfT1qNw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7655.namprd02.prod.outlook.com (2603:10b6:510:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:33:55 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:33:55 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Author Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu monitor
 command
Date: Mon, 26 Dec 2022 05:33:25 +0000
Message-Id: <20221226053329.157905-2-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221226053329.157905-1-het.gala@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e6787a-a706-4440-bec0-08dae702c723
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17X1vkeeeUU3UlHDBo+04vjd7lCdNvy24fOudwVf5EFlvS2LEHlfH0s8mHf9dxauuCtjyxRKtKwkSloJeWs4o73A6o98z9wmbtiKzkohbUc4BH3Q4rPMEj2x8+AMyCJVoabE3Kr9kEdEn5yK0gz/A5G2rCgRQvbUNeHAxDA4dsGRAIDIG8Gtf31XGpDzxoDq5iK38eiIVA4pyC/mLN9QIxIMFBYWgPZdZVcQlc4Xl4dqrvRqlr0BfHLk3w29LFbG3dK3xKFHuyUfXDnBhwkoWLc+SUGfOIv7q4dPHxis3bO+7+Je/LWgcgghADfYL2Zsj0GqrgBkuLkyIX9RW940Wgf61huRdT+zmsPP4t3F6dv+QQE2L0L1XXd1QDEtVhMgJ7GuF7yQCKkYEGK39u6kdq8pPMeLWcI7U1ccF+M0wJEhVo3i2k2M0+LkqkReiJQpoKPBgnZ5FQ+Sb3A3hG3GkE80UHavprkYO7bOlD2xxZ0gGRPov99fuwbTbgoRYOWdUi/rfEM4BeYWjXWLrItw4UfCIesj5SqhMuEmxu/TtMebZR/p7VoIqTCRy2kLGLKljXMUAl2WrxEsgjUEwq6QI8JAHJ1xeLbiUcQOaZkYveH8U5vd5nPcQ9OXx4UiJZusF1hl2/DR9TNoz1qOe0+TyC6r2x8eXDyrYwdDFLhiGDffk1qxzOendqaj/if1dgX/804HDasrDjNJ7Z1lXrC9DQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(86362001)(26005)(6486002)(478600001)(52116002)(6512007)(186003)(107886003)(6666004)(6506007)(8676002)(66556008)(66476007)(5660300002)(66946007)(41300700001)(8936002)(2906002)(6916009)(316002)(44832011)(54906003)(4326008)(38100700002)(38350700002)(1076003)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rgm/21Rn2UFuGOKo+Da8kvDyUl0gF0iUroEOGoY8zYbIGXQIJHKKXsxRf2wt?=
 =?us-ascii?Q?RyFAv+siCoSe6I9KSjmq9pQ/HatPt0VVXnZMw2xLVRnrmEwohtmZ3hZ9hujW?=
 =?us-ascii?Q?CCrgTUwqjNMkJzUyfuO5df9bTEVpJxd1nGpZFEspqtqofwijkju8Trbc1ZoE?=
 =?us-ascii?Q?0HitVnt5vsNI6aJdZnU84yoBTN++FvGWM1zxFm1x8iBsRxzN57ZAfq7zoazF?=
 =?us-ascii?Q?L8xhDZC8xAmJSW45UgusNJAqOE7hljrd7lSh7oGhEasjJI/YpVAvxjQb2ahA?=
 =?us-ascii?Q?zvrIbcyud9FRwIY/yTN4K3VnnDshvbbkXVg/jdB/8JC0+hAzoewTThqvL1Ik?=
 =?us-ascii?Q?tX3gSTmillW/4TxDI+sTIqOsX0KKVMcey8MM10pQwRiT2zGqzKPH0tApkgVj?=
 =?us-ascii?Q?dKDkhL/Y8GbOD6e0inrDIUa/jcxyqb6d/tWphgCqRswqFshqgRrCMDllTv5a?=
 =?us-ascii?Q?zhGfbzhzPXkUzJSro1n1mb+XwzBKRBUAKSuR2nU1CKisS/3UO3kkXAMDKVWK?=
 =?us-ascii?Q?QosFvz/ZzyuKZuecSogCVby7SI4ch2KGlfTPFEXBkGmfh2M9YTMttGB2rRji?=
 =?us-ascii?Q?dzrxKe4K58RgzN3BKTcZQYg07IjuNEm6Cww9FH6LxFnDqJn60B0p72Y9Dnj5?=
 =?us-ascii?Q?WR2IVtxDcKy8TAZUZOhhYyxIPspn4ggiW1kX+c4eP41jVGpXr6KvrzGFeIZQ?=
 =?us-ascii?Q?P1nRVwNE3VmZa2ZMKTrF8mPZDWzuIwRsyz5/y9M0cRqO4QeGMX3ksWUMu0kw?=
 =?us-ascii?Q?AN9uV91DjEHnYgwp52TNa6z4jx+8WX8vYVZPq9WrCss/MkojxXWNHz5HZ3qj?=
 =?us-ascii?Q?0eWsGhGLLjk2SeqOwVDS7d3KIYLDmHXVjV2sxZN+yLk1+8H0rd2nNFm0kSDZ?=
 =?us-ascii?Q?JvMNXUwrO8jK28Ffwlr1SRFhFVtKU9f00gXBkFhU9BK7Zq3/Vv9KGGlIUlz6?=
 =?us-ascii?Q?CBoKWYf18Fn8V37w0B4pPezDeYuYeY6ZF4v728nuiPRflDi3jKsso/sEaFFX?=
 =?us-ascii?Q?B0RCGGxKULT6e45anZQzc/cTEBM8QlYU5121s3yXmtdbd+Qzc1k+Z9tWFi8V?=
 =?us-ascii?Q?0DvHyNbDDYSDG2ZfqZGxqfx9nVXdhc2wVUmYjwbv2zAAkJqoiOPwOoB7LQpI?=
 =?us-ascii?Q?cv3cw9tLsqkRH3hTM+lpH4N/jADdhlESmzRE+nz/cvOIAmaLp2MJ05WH/L3K?=
 =?us-ascii?Q?bnGek9zGfK/ojkWZDwc1Jl01Ji3WB7xF1XdbL6hCUQsR/TYF4XniVaL/5+Zf?=
 =?us-ascii?Q?WG6uF0Nr3oJzOZuWV0SdT115BnCldTJR82053FZ3gsg9xAGYeDS2haOOXDEU?=
 =?us-ascii?Q?9P0/xWES85Wu2XMSrKEOtshl29GEP9YL0fe/ZH8NVDB7N/GNNfLqfLnqkit4?=
 =?us-ascii?Q?IWnyZb0hKEO6naLuV566uymKR5aYkAYMBVGTSVt7XyZUtwFTry22VLAh9m/8?=
 =?us-ascii?Q?Eyekas5fwon7Wn//aZMzkaK9kV3uBmB82ZifDGlNt7jE1Ma0uKKO1d0GcKZl?=
 =?us-ascii?Q?Mboy9tqVLSVuB6MlxgErxYfbJO7lcZTvqHo2qtxBLDuBua50GlCjaMwdCQYm?=
 =?us-ascii?Q?dTlefhfeNPhelzSw/bwa3FGkhSisS6pFAyffS1s4nxB3r+5/WOBouJtWHW0e?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6787a-a706-4440-bec0-08dae702c723
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:33:55.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nr59i877oxA0PMSkFlnSp6lc2cIoJx/2BgF0A3LVOdWZnCKj950pFMfRETCFv7jeOEYgiOsRxC29Nb8JSAeYPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7655
X-Proofpoint-GUID: vB9-mVzz_PrebQVaoc0X-cka69UZOsLK
X-Proofpoint-ORIG-GUID: vB9-mVzz_PrebQVaoc0X-cka69UZOsLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_02,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Author Het Gala <het.gala@nutanix.com>

Existing 'migrate' QAPI design enforces transport mechanism, ip address
of destination interface and corresponding port number in the form
of a unified string 'uri' parameter. This scheme does seem to have an issue
in it, i.e. double-level encoding of URIs.

The current patch maps existing QAPI design into a well-defined data
structure - 'MigrateChannel' only from the design perspective. Please note that
the existing 'uri' parameter is kept untouched for backward compatibility.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 qapi/migration.json | 121 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..753e187ce2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,108 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrateTransport:
+#
+# The supported communication transport mechanisms for migration
+#
+# @socket: Supported communication type between two devices for migration.
+#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
+#          'fd' already
+#
+# @exec: Supported communication type to redirect migration stream into file.
+#
+# @rdma: Supported communication type to redirect rdma type migration stream.
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateTransport',
+  'data': ['socket', 'exec', 'rdma'] }
+
+##
+# @MigrateSocketAddr:
+#
+# To support different type of socket.
+#
+# @socket-type: Different type of socket connections.
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateSocketAddr',
+  'data': {'socket-type': 'SocketAddress' } }
+
+##
+# @MigrateExecAddr:
+ #
+ # Since 8.0
+ ##
+{ 'struct': 'MigrateExecAddr',
+   'data' : {'exec-str': 'str' } }
+
+##
+# @MigrateRdmaAddr:
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateRdmaAddr',
+   'data' : {'rdma-str': 'str' } }
+
+##
+# @MigrateAddress:
+#
+# The options available for communication transport mechanisms for migration
+#
+# Since 8.0
+##
+{ 'union' : 'MigrateAddress',
+  'base' : { 'transport' : 'MigrateTransport'},
+  'discriminator' : 'transport',
+  'data' : {
+    'socket' : 'MigrateSocketAddr',
+    'exec' : 'MigrateExecAddr',
+    'rdma': 'MigrateRdmaAddr' } }
+
+##
+# @MigrateChannelType:
+#
+# The supported options for migration channel type requests
+#
+# @main: Support request for main outbound migration control channel
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateChannelType',
+  'data': [ 'main'] }
+
+##
+# @MigrateChannel:
+#
+# Information regarding migration Channel-type for transferring packets,
+# source and corresponding destination interface for socket connection
+# and number of multifd channels over the interface.
+#
+# @channeltype: Name of Channel type for transfering packet information
+#
+# @addr: SocketAddress of destination interface
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateChannel',
+  'data' : {
+	'channeltype' : 'MigrateChannelType',
+	'addr' : 'MigrateAddress' } }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @channel: Struct containing migration channel type, along with all
+#           the details of destination interface required for initiating
+#           a migration stream.
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1479,15 +1575,36 @@
 # 3. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
+# 4. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
+#
+# 5. Both 'uri' and 'channel' arguments, are mututally exclusive but, atleast
+#    one of the two arguments should be present.
+#
 # Example:
 #
 # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
 # <- { "return": {} }
 #
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                        "addr": { "transport": "socket",
+#                                  "socket-type": { "type': "inet',
+#                                                   "host": "10.12.34.9",
+#                                                   "port": "1050" } } } } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": { "channel": { "channeltype": "main",
+#                                  "addr": { "transport": "exec",
+#                                            "exec-str": "/tmp/exec" } } } }
+# <- { "return": {} }
+#
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
+           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.22.3


