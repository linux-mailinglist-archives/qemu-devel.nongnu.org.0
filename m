Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCC1592AFE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:35:27 +0200 (CEST)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNVZG-0004Am-8W
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUaD-0001NV-6q
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:26 -0400
Received: from mail-eopbgr130101.outbound.protection.outlook.com
 ([40.107.13.101]:9382 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZv-0001Ew-FI
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja8/ydMAou94zw/y5vDcdZnw7z4Sa2xj1eGx029HQSsT9MOBKv3VP7gneB2WzGJCzB2vm9CtyjaPyUyJxx2rFh17Ure4+VMnTcOzrKXmABjfht2Qwr34bzdP1pWyHVlg2PLXl0uN1sLF97Kq2bHj+znWZtISVhi2FbCitojT6cL59BQH5oyJeLiq/HTh6AlQO3/qO4MqqctVwz9CKjM/TKuKYbU/QqiXdRK/BiX922gv4l13X8dFMn4tuiP9dH/Il+7MzFIz3kU1LvUL2YuxJSMfiG6MnDNXZSoslqi0pzScX6WyDuvz5X0CG3tnvh1fDa2L2/nGkJ8K1gVe3mhdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8OJU3rJZoa/pMIsrfD8bai9v6W7HqgZirV1PrqHZAE=;
 b=Lpa1/Z7uUMV9qeN62ihbDiU+geFpXrSmEUCuIcYjUOY7aLUUqIwL4TIWXIQOoY8j3xKQLIBe9fOWo5wI/bb2k/aqlSq5iPMtbkz6VCLc+XM8CNfaAWB6Xvdk9a2qu8laW4JlvJ3MEFsHgFVA5O/eUROqBFgcajumEl8oAZm+G9yxhovcL5fm2NzKKoYhRFAKa7u+8wSUYBKzOa19qlvz6o0wlfBHdRk9frFpM+WdBibYP42fR5iyg2BkoVaKIXs7WIE5ExOdHJS3hRFCe3IA8Z1IkQqm6ZGIJUtbg0a489QE4Yky34OZKzdfq6zsHY6PYvPJ8vEChCKGFqQb5OOrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8OJU3rJZoa/pMIsrfD8bai9v6W7HqgZirV1PrqHZAE=;
 b=JKEFRMc8WKXga6bGjFWVJ4LwZzvxCfACf1c7TqDdvpAMRg2FRp+1ZhIg//5C3c/VC0c45BxrP6lSkmt51nlg6kXmcRwXu9tRFiPF0whbivSZfYxHj27CtJzICJ/Pw3cD+76ZwC76oGQqya83ROWe4xhUsMRiddl3zWpjgSpJ5o4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:32:01 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:32:01 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 18/20] disas/nanomips: Add struct keyword
Date: Mon, 15 Aug 2022 09:26:27 +0200
Message-Id: <20220815072629.12865-19-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3d1133e9-8a55-42b7-4d9b-08da7e903e4c
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCla+FA/AMTBPqKr/2+SSg2ecJ/I3NzVIwMmGQ0+mnu5zuYWhZ7Cpo5Wx0L+/RpmhYjuAfyQV3X6cMVOpcPY8Joy1nuJ1PAN93GHc2Js7ChzZtS6boF9DhA74i7KR4IwI6KLaoohM+kiIJnwBrPADDtGO8/isvxWMsJgxk0Ohh6WLWoTWximbd6qGFcd3TAIcBgYRd9bAkQy0xliUKOiAoVBEtm3WWovGze7G8LG9Nj3OXTEj6QzNKMLL13TuLOEh0dq3sC3D/GBWmJXqngBwX/oDF9Jp8UN7fnJcS7ufmM/gWR3TTXhzDpDDWR8BoO1xCe4Hg9OGDA2KKBVd0pbbZC4wUQtkqJc0pzz3vWN5/EKIGlR55nzf76GLX03puf88slwzvO5dU6uEw3HloiMWxYtE6jvw5j97lww48yiEdRNdT4n5uh7Lphyy4f8ngr4J8JYKKCXJq2qB6ipueUH2DUPywXEfWlczstl7dGI/fGvyxg35FSl+WeW3KaktQkw+QKFcPtX6ifUY9AbBVrN9D8cgqenBmXsvg/eSvR/UU2xZ9hbiYk9CKF/ULqXuIfxMr7wpUK819u3N8ZkaF/31L1I1TwRXIZGmV3eLmfduA1spu9jr+VVKGREdWPl8h9jAetA7BnVCczS5RpgCTclFIRRQ/CwvBOrtcJxfaqItc1dKCe6jumyI4eguZEw6A2P4PWi6FiMi2aa93jaImKRTf6nX952yDn/4+zc2L6nt5JkTAW/NBBg8jP6ThudrI8Y+SDQR/eqlsZ6suGUuMsEm4/Gi8zaOexHUKKW0AGr/eE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(4744005)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HEdy1zn+IkzqiUZhiHDH2/u4nmz2G47xB9FXIyZI76QB0ZqjKfrHqxom7C6M?=
 =?us-ascii?Q?CkQs0uPBgxN2m3eviklR4CN1qMMr/5K8lWRwnBNujnhc1ZO2QLxJY725NLuW?=
 =?us-ascii?Q?cxYR7g3GPYx/kXIxvMgDQlld0Nb7YFD5WnhAchDF8Dr5rPWUkSqLsHBH5LdI?=
 =?us-ascii?Q?hy70cTwmY36NRPh2b/qCI18SM9K9qamDfTvf6H3VC6dX9tbRC0kQf6JDojsC?=
 =?us-ascii?Q?ijGD+OPaEng1twxXCJCvQypPNZS60QeIXrL/cPE4EV86Mb6IzBKr+TL0Qg0Q?=
 =?us-ascii?Q?WZ79PQFaVZBcrS2SJQbdnaIaLRImxQL7TFDAysJC7gtctgNVKVV2aYG4vBcH?=
 =?us-ascii?Q?RBVq+ZOnLJVRfRxk12xZYYIdnwU7kBeYXFWHvWBV/GNiteQzF28JF3x3mAbl?=
 =?us-ascii?Q?B3kxIY+y3RaahC6JaYmnZRKGrb73VLy7xRKbxve9Rb1ydGVzbOfd3dZhhFX0?=
 =?us-ascii?Q?9KAPr47+RJmQutdjjhaiHVeqxKJfWEF1nqx1rfvMQgJYxZZbLPBWZmmLWT7h?=
 =?us-ascii?Q?94KtlCN5EYE/4f9bmQjzB0Ac9MG6nJMLI3RCIlANas0a4W9c4XTg6o/w7WnE?=
 =?us-ascii?Q?o8EBlfAENt0+m3HDoew3UTg6HCp55bHhPQG77aFezdI8SLjDuCYcPXNBSwtu?=
 =?us-ascii?Q?NNv1snTdWVub9D1selWWWIa8idGJBMKvC5whB0GQTQ8KtPJqG9C4s85p8Uq7?=
 =?us-ascii?Q?uBUkRSN+bkagx9N94u7KeoC7GTVg4mKfe5w4O40hdQxrg6fEIemG9u5sHxuc?=
 =?us-ascii?Q?hBg+zYhkRI4Q17V2fqUdmUr2FL0yYMEZYVyjIQ2t5JZZeDmITZVvQx1AVqX/?=
 =?us-ascii?Q?N6J25OA6jCRyzVyBrmj0PYUKnEMUlCiwBDoLp2FSCs0jLZuuKhN6N/mGW+RL?=
 =?us-ascii?Q?1cTAPqXG9gT6qrRJEzWpi5PpOOTAMl/3EujzYyfWBWHQD+VJ4IWrURiL+Pxx?=
 =?us-ascii?Q?VNLuI+SIWel3HCmLrEXBXVSqGu9BHbnGwZlyhhzGGj/h81ghMWB1+4595Hff?=
 =?us-ascii?Q?FBs+gidJhF9D8PUjQZqBw78LRjAWoJDB0MjiF+NxrqANi2ZMYZ/HEF83s+kT?=
 =?us-ascii?Q?7s8j6FAgjrfXwE6zn/soMcIDOk3TVySUM6s1KU4pNNamtzGQ8jv50sl/tFc3?=
 =?us-ascii?Q?AqmNti0AtY9qrXPE7o5gKwUwQCJEuhWpny/vfuJjfalDrzuO8/F5HbNumejU?=
 =?us-ascii?Q?Pi4uo4QeDxBtUVJOZkzhvP3VtVL/BI+h+wZmB4jC389FAFrPtIdtfX2yBGYj?=
 =?us-ascii?Q?PobSyfBVGedVlvt0mKybwqskgNqLEEQ1dkGK4/nSz+ymiSKDiMyKpea4dEyj?=
 =?us-ascii?Q?+wLgs8QzAXh01Cm+Qv59fUqcI9+JrG3q9RURxdM5IVDCGzw1Ojf9Zo1MNeFZ?=
 =?us-ascii?Q?bpX821hyn7BrI/TLWlGHuRgeX8TlkHiVWPiwoC2TTeKez8UPAOeKnJLLnmY+?=
 =?us-ascii?Q?5efpLH9xySIOswNHONnYIUKj2APnEse9QIrSV1WiLSUaYVOaqE72lVqBLsQL?=
 =?us-ascii?Q?8wmGy/5l9/W6Dap1F6lDm/1UnbjsK/6DGsD/6C6ki4AhLVphJ5irkFyymV48?=
 =?us-ascii?Q?EnRjioAxuKc65260afb2cgyqNH0NdFztEJSqPNQHj5O6CMLbkYkU4zafNcAT?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1133e9-8a55-42b7-4d9b-08da7e903e4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:32:01.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOfqWpHUbfCl2mLABopaLDt0u6wnOjv+FRSBKwxp+0tRe9+rqSlrO5kofMHUUV7ylloj0JDNlR4zfjvE9YKdhm6mwfqyV/oGA4Z/GH0UCYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.13.101;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Changed the type of the table parameter in Disassemble function:
- from const Pool *
- to const struct Pool *

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 7dfefdc5ed..e7d6bffe84 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -638,7 +638,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      disassembly string  - on error will constain error string
  */
 static int Disassemble(const uint16 *data, char *dis,
-                       TABLE_ENTRY_TYPE *type, const Pool *table,
+                       TABLE_ENTRY_TYPE *type, const struct Pool *table,
                        int table_size)
 {
     for (int i = 0; i < table_size; i++) {
-- 
2.25.1


