Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2766592A6A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:42:20 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUjr-00029Q-NB
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXy-0008PL-FE
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:05 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com
 ([40.107.21.116]:36512 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXw-0000kD-9i
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G016jtZb9AjIx3aIFdaBI4Njk5Dx7hwPo9fn5KImJ5kyFxmENvzjgirqzfFLtayP1eU4a5+Vq6bcQTitHqQrWLqR1vfkIlv+I02kgsgTmOq+siJ5Yz3qAvMpzhd8uq9M/utvjLQixszeggFB1bih4ltKoNbNf4Aja2Oy4L7b6ueKHhTTBaGKxui/VQ4LBuOnm7BNK9keBFQbYWNnf35TemkB08JPoPugODZs0wjbmm/zWT9O2XF/P7s5bpAeg28OTQvy15DFpdTothZLOUjsH19kwc/rb/vgoxYlIFi6i2jLNZRJIucLxNa4WDWZD6g5wyF9VecmOjrk2mLNkDRQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB1tlcA51UX8Jo0Hz40optrHZdZdhEqzswVAembpymU=;
 b=Vl+EOuVyl3W/i2gdFUnD5rRmpXEQAGfURt2CXd3gUUG6S1/VE4oFTryBpnxZaFaNhpPsaQVYjpfURAa+PojpkfAYdLVf/+DQiUQuPS147tNNgjOXzZX/o/Dp9ObtliHKSIGAEfHVRDe12JU8Kpr9xURQC6dLbqqNaiFZMpZPrMeKp1DH/43wImek5aebinaKiGv7Xyyrds5QTfAVbeV/S5fCmn/IfaS29ieEiEGo+FQU7L2m+7MZzw1DPvU8l3cufukQAezs8T5IG7p+0mdInj+kqYcGIXBt+i5xDjKABScF+/ZShM9Po+5diJb4Wwvi4wHK/s2WZPIqsHW5cEr0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB1tlcA51UX8Jo0Hz40optrHZdZdhEqzswVAembpymU=;
 b=I7PLMEZ8TMpkKV74LYKjZyz5+6eV38LLv2k7a1TTmFNjOObE3xJL960Xy3NNVoz0yWx7Pk6JR4LUDN/B8fQH60FHsPsG1R+BHbwNPaQzFOGSOibj5rGm/Q/+M0nwLiqTukU6HvKsq+S5KvRs6AMvR7FcrSDvrGnnOyEP5RuSZ84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM0PR03MB4515.eurprd03.prod.outlook.com (2603:10a6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 07:29:58 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:29:58 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 11/20] disas/nanomips: Remove #inlcude <sstream>
Date: Mon, 15 Aug 2022 09:26:20 +0200
Message-Id: <20220815072629.12865-12-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95a044f8-ed61-4ebb-4ef8-08da7e8ff4f1
X-MS-TrafficTypeDiagnostic: AM0PR03MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kG4k/uVKoUic2OIVq6x6BQOaJxw7d46R3svK44QN/5eGZj/6+rWTbbCqeg1a2L+3JMqc3nUJP7lRidvixZHH1rP0hUCYFIfEfWedwSsALPqmX22nRMl8qkHojiJNiqmjw9TyATemitJZIqm3sQ7X7AOsV1okhQ1kqCIoItOHTxho6MFbxdpSmhL2DKdfiGMnlHsJxmJUQRIDhVacDbTIaAgGXktWa3x7fGxTYtdQY0U+eQV3R4Xl2Qra7BbiYX+K4GYINpLFi4X64DNSPhdm2TNzVxJDXnIr8ThIlBp37FOrIbxTJ1jv21g/HQLgCQdgCp+y3MZl854v9IAHZlTcUQy2kH5F2sVmzvL/0qnnYAfqNHHS1esW1DHtecdw7WSQv3JLolQRc0QT08Iu53LjpIqnk62Hux/GvNy3tN14UpDnpiogZUzUWQTAbEv8F4Cc7BImpJGXpm2QRcOoYAWXzR0CE0+W9QXStNK9aj89hgFJqssknEFLs1+9XKJm405KK11ZZ6DLFf5+bhw3NdYRmKnz39IPGX0VYIlS5mrcS13jg3EDkhlIngYLqZ/xZMyDV66UIuLd9bFtwSyhNPzoQAmeh98gD7i+sEWSlSnqSA8KgOThtGFh9Q2n3ooOFE2o/YIEgh74ardepXvYZUoCKFnnSAAK1g76vGtjTiqqTKJ9wkhS3MbMHfB4Bg3CejrrZZaCjo4U0iLrONEm6QKtJ/2P7EbKHDUGAdrGS1LoOv86gsipaPlnpqI2DsYgMdMhS1xUQNtrA7QdkkivsJKFOnHBhyYp2U6n5ub/wDs0uus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(366004)(136003)(346002)(376002)(396003)(86362001)(107886003)(186003)(1076003)(2616005)(38350700002)(83380400001)(38100700002)(5660300002)(8936002)(36756003)(66556008)(66476007)(8676002)(4326008)(66946007)(2906002)(4744005)(44832011)(478600001)(41300700001)(52116002)(26005)(6512007)(6506007)(6666004)(6486002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KoQ6hMJagQbkpIv40ojrmiSk0N5uHH+tFbkJzX0uzltOdluVFMeiKLmxGxtL?=
 =?us-ascii?Q?UDlI56Z2pSerybKsXzYlLON4B1jnJDpmAGvT4dmnNbKDgVwGzXeMA0s6fvan?=
 =?us-ascii?Q?n3qC/FNw0UWS7cz+lIyOByXQUMYJDL3X/3sxJIySNytKHqlRr3mL29+4+y2f?=
 =?us-ascii?Q?czDMaRCYi/AG9LcZ2lnjWzxVf9qJJ06RVyLwYG+9JU5Zm6FrjTsGUblEbqlQ?=
 =?us-ascii?Q?TIdcayZKrblkoNfeZU7XrdhGa8Twe8pKhwXw47o2pxRQ4GF0WFJTLHnaG+Vl?=
 =?us-ascii?Q?uvXhLfX9W4dM1tFIraSEL4uqwXsw2ou+oBi7TWRi4VVIMhHpgXro7Ndq+D/C?=
 =?us-ascii?Q?Z0822R4R684TlZO0B9nvKyVXoZXanSB9p0360RNjInm4Z6HLG5Ibetb/wre/?=
 =?us-ascii?Q?4ZrcevfALuOjqa/rZX/pvGyzJC36tsmZvpy420R1Nsm1J1GW8HtdtHPgSAFD?=
 =?us-ascii?Q?nJQopkeTKe2Mnr4MDMkxE6WewBi79tMn0Y6tKnEqv5B+FHjBE79gNVh2oclK?=
 =?us-ascii?Q?kYDznye753Ysrk207+U+a9erMSPBn6mVUvJ3uc2958pYn3s0kzZQ/MUdBumJ?=
 =?us-ascii?Q?5jnE0cZi6iLuHMNx4swzzrSZBtDNY7OlLfncPQUm042wM0c9eUwyRnMUdLvl?=
 =?us-ascii?Q?EcRZs+3TuaY8NVas/rNxI2cCSvenbkenlv1YmWOQQ3rkuQnnZhnXz03kLLUP?=
 =?us-ascii?Q?fLNtruT84jnVNzNIcp3u7mJpYH9P8ucle7FmCtvljp7YOb2+FVRl9W+/Jnva?=
 =?us-ascii?Q?wyEiJp4kgHlen/CbyS00ye3q1492DcteKmn1ECKhT9FdHdEZXPyiM7ss3AKG?=
 =?us-ascii?Q?AB1wVuzVqZ1ihywpPMDqLgVlYadhVew9sGDWmJyCf6f06FMSdVXDtE/e3UzY?=
 =?us-ascii?Q?vvaBsY3fc3a1DgLmgqzGK8V1U6LZFgUCAJJHP9H+z4wbx0tyLsMahK0te2+U?=
 =?us-ascii?Q?bzzYRt+8m+sOvOagP4StWL1ValxSwqitdgpadSSkBg+P0rx+NFbBKZsHoDR0?=
 =?us-ascii?Q?+me75q9u7h8l7m7J2itkShnLCqOCAqomlD3oWEukFuszYlTa52mJArOjqBGe?=
 =?us-ascii?Q?E1Zs5AJ9D1DhQ1dB+RMnqQI5OglqgHSHLo7dU5OgjH/iDF4cOUkC2xEGaeh0?=
 =?us-ascii?Q?jsvSvoO/nWnu3klyYxi6boDOO26cNyCfmcNFmpRPMu1wq4JXOUIh4irukNHT?=
 =?us-ascii?Q?RuLvAs67Wzj9bM7CuMxr8gONlKn7xGPvT97nGdYw3h/Tw4557Qw4wSz3609S?=
 =?us-ascii?Q?Ynhi1WEEfgIND9QD1gh73g9ajEuTnRLrCkvsCeTdDlw2LKB/8Mu9dytDDlOK?=
 =?us-ascii?Q?baiCNX7Jpf3MsK4cKCBBc7+BAcSWdHXqj8kEHVmMPyB4f7Eh0niETZwuJAUM?=
 =?us-ascii?Q?oZW25AW8tsXxhXnjpJOevSDTbRnb5Skc4ZLurV93ULnm3nvERHZXsflPzg+C?=
 =?us-ascii?Q?czG6s3PMGdExfp18ZZypSwg6XQiS+AkBNH3TLl3HdPAQdP4EDMdNf6+MVtrU?=
 =?us-ascii?Q?C9U10o/Gg3y6TsBccypQ5RIDtiodaGya/jxKxu5Ep8+hBehirqaRelMrS4+v?=
 =?us-ascii?Q?ygLGbY0v16IQ638pfbzjmP9LnSLVN8oK7g/cHVSpzKHyZotAnJMkk55v3hK/?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a044f8-ed61-4ebb-4ef8-08da7e8ff4f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:29:58.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vk+6FlGiCpy5gmkHAqkcYKkyhgWHMpu48pmII02zJd+akHgmx3fFqbde5AhvO/lfLpngBhETEWBvWSM1KMAvWr9FJlfqTpv01v1+5+ZdSOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4515
Received-SPF: pass client-ip=40.107.21.116;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<sstream> is a C++ library and it's not used by disassembler.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index cab53f482b..23db8177ef 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -32,7 +32,6 @@
 
 #include <cstring>
 #include <stdexcept>
-#include <sstream>
 #include <stdio.h>
 #include <stdarg.h>
 
-- 
2.25.1


