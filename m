Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F861097B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:05:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRw-0003nT-W4; Fri, 28 Oct 2022 00:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRu-0003mp-GX
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:30 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRs-00028l-Rz
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:30 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4bMw9021593; Thu, 27 Oct 2022 21:58:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Zrnkbyv3OWCddJ7JS8KEsxHIe9iT1VFezo0N+P9yM2E=;
 b=Z7ARBbDv9/sVcGyFnDMRO0gnz1tPvI1ckFtnYXwcu+YmcvEX1+JdLbA2sjhu7evwayKa
 LqeI83zg3c2YLJ9Tv8ceocafN6YIuBAw97WlgQLA0eYBGLasPnYYInID+6xJoyfD4zGD
 Zt5kvtelq8CUomOYIq+hYEup62A+wryf2UViVWWEmSEsi7gL22D2WUjTFmFHmvOvHC+e
 KoyBzlskEYdwnVBuCBUgfz5yLl00LbHuthEY1uBwSsk9NrwovjPrG7fsqDe89dVhFott
 /3n2yDIrA2wSFYC16DO4EV9Cb2k9ubTCig4FpADzrG5vqII7fdvUdCf1E6Ot6kkhyhH2 NQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg0r15kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 21:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgQS2/btlIGWxOuyY9A5A5CXv8UE+ZfQATYv2Snu29qw5nC/AL0C+NgPjPbDtibQA8Fo+6fMAab1nG3NsFP8p4ipBDuh/SL8vne4Uh3PSDyTIkKND0NG8Gn7XVkc1jpCiHi9YAy/njTvtRB2X9gxvjsUceUYlRzdzF5YLGNBlib4+LjtQd62J9jpNrp+IYz1Wz1qDkOTgN97JhyobKEcdY0gTt+qOynw9cm17DfAGy2liFNJnSErHErEneYM2gtrySxQsUQAHzfmwMVCHHvmGNdtgBH+uBzkPI4x1S6oc1CMY3fwbd5wn/69Wbzx9bEsaZp8rzER3gSEeIWz8IngVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrnkbyv3OWCddJ7JS8KEsxHIe9iT1VFezo0N+P9yM2E=;
 b=Oa+IFCGLIqHR7MDpZFNOHX1mdq7r+ogDO762mrDUwn6Rr+8OomJqlXBbkkjl3FHv6ptIAo3IrG5HnsEPqw6z6uSI1HF+qsgG+++EJmW0FleCQbLTn0e3aycHBmDn2okrFMXmWOoqXLOB4McfRiz+YHzYZUxVYnj7+9uHq/xoeu4MP75AKVEcCwIKoDYP44udhnBiQVYjDM9/HEJ4K28mWwBofb25Sd7IcbosDn4/PP8l5yc77+fN/qXP0IWzKTDnLo36vzQeGIgfg3N2rYwmAa0MA9Wr5DS9HsiHfudfoebvTJbV+vIYg+FKxnkfLxOTaAwgYevL58X5lakHvvJ0MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:26 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:26 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 08/11] tests/qtest: libqos: Do not build virtio-9p
 unconditionally
Date: Fri, 28 Oct 2022 12:57:33 +0800
Message-Id: <20221028045736.679903-9-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 39a5cd0a-7269-466c-29f8-08dab8a10bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YqBKwhohr9pUSTndyx9nmsP9+3LGdCmbrs8z7mqUmpoljXVCtx+eXyt5ROSN5rxKGQZEXGhOTVcc+ljECQ0cOZiP8CDWKnAohk427yv2DJq77zeeOz2sZIha/o1WSmCwO0RuQ96WuM1XeKJyzTN8a+MYkGeqq3R1spP/IUPFQL0iE7NuFK2s8kXqrnqCbBFn7ZGLQ1asU1izXNfQg7Bt67p/fshNfS6KU9tM6KTpIrbnQCYywQXDTl6CxIjloeSnkVn0wzfIMjNJYNTZo2pBMJZYualbxxOrlQqPS1Qb3Rc/12cDG8kCN8yuJH20i7aqG136BKfarSHt03eXngtGCL+3vjezD9kgE51FZAAmKOV8mWj5mjnu4AM6Lc5U0mrJUAbbOtDbU4yVAzjQucAexPtjahhlt4gJIgwVGxLZT5IhAHSat3pfw+N7dNm9FIWhO60Q49y/VIfMzM70Zx/G99RNmLLc1QG5O0TZ2iIs2yyqlZQa2FzHe5rYM9sg33UBiYt1dFhT4O13WlBeHtSaCrJbr+cy5G0da3Kbm8CHPQbq6GME2j1nWXSN4uJ4n9mLjYJnTEOXUQwW8eERscajDc+yRsYv+Pr9xMCq2NMAAxO7d/QSienAvC7njt7aL6NuOI9WM15V+pzAEqlEBtCFXqQ8iheehk5cDrIcdzJ4WH/wagm4NmHmNPA7i8YXMvVOPXN2zphwvX630N3WveG3izm/A32yIL+DjlDNxNN4s375TZaG1lBYTh/w24b5hUTWfz5mxr5WGXADPFUA83/pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HS6Ri+vRPBzHpFFb6YdwkTAwDHP+4hrwqrTITxaMFvdMwliFWoq3x6n6MU59?=
 =?us-ascii?Q?JTRsiyVuZyUh7U0ABTmzP25sEyQz5mQn2TyDQjDWHKZAT3h2v5XpE51mT7Hv?=
 =?us-ascii?Q?DksnERRk6t8cvMibxhbbmmetzB4YYK8OD+ZZNBqRwhS87/tFdbqb2VTCfCSj?=
 =?us-ascii?Q?5eqq0uBkHszYM0OQ/rjGexrI2E/Odrh7Q2l9+EU4SFbU8Ox/M94voVloHrGu?=
 =?us-ascii?Q?hSqN4Q9uoXK51WwHYw0ATGc8U8UyoaM2lXVUeJwrurPdaT45cldf7HNsKJAw?=
 =?us-ascii?Q?M537Aq2AiRlJPIuZTtAlJeZFu9hZLQnRb9UiISWpjVz7o+H5WD1YYUV8HlWG?=
 =?us-ascii?Q?inhGyv/Ap0bTsYhdnpdFWJZa3umzeh8jrFA11TEcn5cMyDMhBN/8H0DHlsvb?=
 =?us-ascii?Q?xh8Jr89daVPcJj6sekle9SeLgthOZB0l1QzTDQqujtpBJQ86qxDmm9rSy6gq?=
 =?us-ascii?Q?sVEkGV94QAQHIRESBYuV1R2idf7UP8ioCGNuhd7Esc38/rp6PY2XeA18djWJ?=
 =?us-ascii?Q?3d83DyOq9KsMcEeKSiwsY6OBSqSJmY6m0kpdyHY1q+82TPzf5rwD6RSSyB4p?=
 =?us-ascii?Q?eh6MRl5JrbyYwwBKwodtdO9+2ymYMYggFrm4VcoDUWCTkH87zkipi+dRGnaJ?=
 =?us-ascii?Q?K16csinVppSeT8XsOTbYvInp4t2lKO8Smlv9Fr4hTWVZC24bHBpH6BIOeTIT?=
 =?us-ascii?Q?rCajV1Q6DMm62gdF+O0kNaoz34DVQEi0nDRaUFVUB2UQnrSWewZ2khiQKMw8?=
 =?us-ascii?Q?7oODAl5WmX2he8ewto+yalS4MTbfj/w5Jnph9rBWldgf8KzIT5m4HG8lAxDK?=
 =?us-ascii?Q?BrO6mn+hcv8IRUzBjkpT+ovYCywvIjuz9Em2LTwzCJ6EQbrkDs8QkMAzQfZN?=
 =?us-ascii?Q?4J7M2oDnYKcjsusipT/4BEU8EsNoC6b2didhkd5hnYdB1bwYjFBMSTvb4V21?=
 =?us-ascii?Q?vacXM11yU+hHrntazpPSX5C/mO7bCePljUb5javFiAFl+P9Es/MXX4zkxWRe?=
 =?us-ascii?Q?tnL9xN0ROMYiNEydB+SKseI5ewuPn873v+cQI2THk3v0RLTahmyUKTeN1tKC?=
 =?us-ascii?Q?oTruMT9sMV9ddHPZ+t1pn79rAAJPZXnHYx+hdwW+XxscMJEOjkrFBmKFxYci?=
 =?us-ascii?Q?3nC1z7+P4KkSOzWm5YsEtLB0DDQy8aaNg0wcIOCR7zP3fcgfwISYeOTJBBKY?=
 =?us-ascii?Q?gRsQWCyWrmPj0szsXtwGJHUWOm2TH8W5Df4jhmSXQBpE9c2pqjmDXMyUfR/4?=
 =?us-ascii?Q?uxHKZm57n91F0AuD3JCE+Tc9oPR4FptPjen2N+WonGn79gm8fCl3jVU2ye96?=
 =?us-ascii?Q?xc5/7qUKnIHpHiTI+T6RDxR62G46EUS2hfl5XVQUIebZ2QCe9u/lkh+Mieuc?=
 =?us-ascii?Q?lxQGlh8uvWiOIEGQfysVc1vobmhEFSNwkK6u93kDq9ZF6AcshNgvH2z4x4jc?=
 =?us-ascii?Q?L1d9gVYJqXD6IMnDPGTdNgFKefM2vWarOcDE6q4zuShiOzPeABa2WzuNcyDh?=
 =?us-ascii?Q?C5FtWz7qUxWfkYKZh7E1RxJ5sWLIzhMc5R5JU+JKt0dheAaXojllWlovlswq?=
 =?us-ascii?Q?WGLUv/kXSAjoh4ZZvjM/xw5qTSFaBi8QelusKpB8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a5cd0a-7269-466c-29f8-08dab8a10bf4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:26.2234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmgfQAPwEqL0gD3jzsa2ilcI0u7gnVJPJinL2/XdvwycpnuZiAL1H4O0/3Bqsk/fM25MpbOM647BpZyaAjyQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: BdesoCrorj5q3RB5kqquYw3BjIk0A9-U
X-Proofpoint-ORIG-GUID: BdesoCrorj5q3RB5kqquYw3BjIk0A9-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=762
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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

At present the virtio-9p related codes are built into libqos
unconditionally. Change to build them conditionally by testing
the 'virtfs' config option.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v6:
- new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p unconditionally"

 tests/qtest/libqos/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 113c80b4e4..32f028872c 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -33,8 +33,6 @@ libqos_srcs = files(
         'sdhci.c',
         'tpci200.c',
         'virtio.c',
-        'virtio-9p.c',
-        'virtio-9p-client.c',
         'virtio-balloon.c',
         'virtio-blk.c',
         'vhost-user-blk.c',
@@ -62,6 +60,10 @@ libqos_srcs = files(
         'x86_64_pc-machine.c',
 )
 
+if have_virtfs
+  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
+endif
+
 libqos = static_library('qos', libqos_srcs + genh,
                         name_suffix: 'fa',
                         build_by_default: false)
-- 
2.25.1


