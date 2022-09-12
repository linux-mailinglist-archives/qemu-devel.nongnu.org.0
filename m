Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128DC5B5ADB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:08:07 +0200 (CEST)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjAU-00066y-5E
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZG-0004uv-Ec
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:39 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:3222 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZF-0005vi-18
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oil5XNyM6XDXCBXlOwMa/wKQ7MFHKrMvQPdnJnsn50Ga57TgD9qX8xEW6gIYHRWud9R6UOEjWkrrcQbHKfk9RNchNktNg2mcBUjFpO34OT+5n+zFM6vNzXAfZxYUNkPwhmSflEvLNfx1nG9O5CG8N9G4QwqS25skGupRlclIod1YtiL31PhWnBwwSH8c/yK4A04NMwSq9A1XF0oDYdz4EVnTTs+4eSHygUpuls9yHxSNnagtrVOBdKbphiv9Uxgqnj6EhjaVRyTJ+/jx1fq/o7hpVHIS6n/vRPVUyYoJBAPvXr3IkGUgURxUKVHkb60TenOm1pF0F8y0BoHQ/swICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZlPXPYQzGp7az8fs/CtoXf+9zDswd4FF7GMCLWG7LQ=;
 b=NyXo4hyK8QmtxwymioWhhN/oPgEXLreDarMxC7ByhcUTJAMMuNRnH2Nxvovzew5vRUjq4bwF0iUCaMuQvJO1bjDWZudmS5hMTY7wZNUhXZMSie3n5/wC2+YPqnVpPXfJTDziP/17g64ZSm71EJGXqaEkifWQrxk1TChM2q6hOmnE84+wRIlMf/GuqGMQ2z4nSMKucZuSHoXBm8HFYWaWha7ttcqrBCToJ+oLqdYBhTmbKbk7Sk5n47aFibsVZELqI6m6DQSIC1pWv3rl3s2nTE5pu03Nkp/4dv0K+n/xvoY6m+FatHh7wma3wDn3BdWMQa6RBGE6N3kcZgzcExpZCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZlPXPYQzGp7az8fs/CtoXf+9zDswd4FF7GMCLWG7LQ=;
 b=Oe8q7rTBrWEZU55AkQCfvEdAdKg+qAXFAgz+4R0qPVsFvCe/q7Bd0llKa2H7IrAeDjL/ETB2eoPEN3+M3PPkIvIR6lwo9CzWil/oUCOW+ZQlWn3W1AA1yQdRS7d0ELYyKmGf0dKAAKGZQXtLTtGg6+d9fJgEm1r4JdhAeGn1DD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:29:32 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:29:32 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 12/24] disas/nanomips: Remove #inlcude <sstream>
Date: Mon, 12 Sep 2022 14:26:23 +0200
Message-Id: <20220912122635.74032-13-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c00302-448d-47f5-351f-08da94ba71db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TzKguXe//rUSbOSagzFZVeuxYyJpUv8wVuiP8JhejcUA5SjB44lpwpup8KEuESyDqJFzqvgzPsdpNYiPDKSL3AXTTP8+N2f4H0cKmFGW3hehjmQIViMsdNZUcghdmbOUL/3ZeBhwAWZ9Mz+JriBz8y6abLdDWLxYD7wXdNWd1/ldAK/x4iEM60faz/OkyDgzoNuM6oZfpsyCuSS5pz/+rWPT2VIhMvGDy7TfZXH8I3owU5V8n/9zu6lRJOAzUs6ZkQmzb9EckZm19ALj5oJNfeoBMmx+Hp9OoiPu2TogOyXyzsEbyg0ffPo2BefGQsS88gQ1TkEveIHBKuJ2W/ytgZ5qcowuZqQ5ehNeoGqMhIbRRh3G14zfXbmJuAy76KcN8t9RYJjNC2vyWgVSg7Ne+SOlUmDpM8YxODDmGOggmSyRgXnpZh+tMYqEjNdM9Y7KQhGzISrMLHlrQLbPrwxeD3miXBdQ0d8tYMRPnPjzYlVB9TlYTTt9f9aIdbNz8Tv8rOrzJs6eeQSqj8shrZLSp6jvsXix6dhOadQbKc7JSCK3euQ2YqTgKgumbatgPICnyZ3LFeDt7Wr0gDOZ/7ihA874lnHWdDaL88MPkk099Nr6RWj65CVW2rDx7VZjuEAkVIIuDD1EQ7BR06pzi7m3kHW7gKLqsP0XISs8Kzsmm9VMjCsWqaC/MrtefvGsCFqfOatwJjI+fs6YekkHbz04oPGQjVWBcfhpX3b/emSoL6t6KYmVMDWWteK5f1j4oAP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(4744005)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(5660300002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+g9QbSbszkoH0F3hn0gCJxSdWXKLcMD1UK+ZIFJaD3MJ5tRsyS51hc3Qpir?=
 =?us-ascii?Q?6ktMxfnUBk7BqmDRaYtB0P/MHIKOAj+8U1G6wfUOIx6teNSUfmf1enpP3iCM?=
 =?us-ascii?Q?4nKcGXe5Au7Vxi/m3O6vj5+rX+q6vFDIZUtBuHHRvWuuBNSbzTQCyT3+VxjW?=
 =?us-ascii?Q?hJbA0IG4Ho+UrmtOflpLWWIP87SeyE9gtd7A7AIzgLTslloz7lV18CDeABAg?=
 =?us-ascii?Q?H0D+agn1wGapcwmIMvIaRIc52bc3DzjUvTV970An4gD2MEf2hwe4vLkCnhTn?=
 =?us-ascii?Q?PWbbdVwaLlNQv8fEzXs1OWQquAPyeIOTZCzeJbz9UANXTqB5uuwP5uEtOqNH?=
 =?us-ascii?Q?wSxsZUXKMHX9JDpmyY9KioBRvGH8YZtSwLi5cvZFnuT9jlKtPLHqH5vZYeHk?=
 =?us-ascii?Q?ZA+boZQaL2gEazhu3MHInm+xWpg8N6QFAc4fZAy262qEnv5V2c+yKmya+bdZ?=
 =?us-ascii?Q?nSKdg4XO1F9L5NPEbdKlHGmUHMwD+SqJnFOzT1EzqknfzkQzMnvWKXuNHyTv?=
 =?us-ascii?Q?wLNO0SnOh13rIK10w04jA4o+dfPMoN/QhmWfwEU+LkWOoWYIFH6ecSAHEYfx?=
 =?us-ascii?Q?CJd6Nk2Z6xaClZFtwaTNum6MY50BNSkfOqX5TaIuQ6dXyNUGAJ02WYNGvlQr?=
 =?us-ascii?Q?WUoSRAWXIg/SAjiOW7Lb+mLoAxdFrh8mA7URym4I4QnqLYRxz4h0kHggF0vY?=
 =?us-ascii?Q?9uqUKxRQLDEQmb77DXpNIgExO9ntFhJDXV3g2wQ9a2qoZth36Cr/z2p6XYEl?=
 =?us-ascii?Q?yvx3WCNHH3swwQj9K1uEXgx7GrHnXSNc80Vv6zPh8cjSlMEjOwSmfdp5z1ed?=
 =?us-ascii?Q?Nk3ULbuIFpejRplLudTUughmxG/yD1JM/ozjsYZf/LaDwUnDZtuZtEnJxHN2?=
 =?us-ascii?Q?KAOsxJhE00Ch0Yvckj29rTTAW7fJHez/qM6zmocN+TDs6tDC1gpo8JclK4kH?=
 =?us-ascii?Q?O913rkEI/2ZrfIk8Fj39T3bJgQLfZEMbpdwGRkaW+FbVcq34T5Gv4gpZyqU0?=
 =?us-ascii?Q?gnObCPW2i59JrzChr6ZjFh8hVASAt69rEHP/4hnP2rQVcaHl1D/6fgAusyPs?=
 =?us-ascii?Q?3SMNrZunY7AdK+T2nWu9EoT8kA6EbzKxfyQs2z/I0k/+ULIsNGP+KaayJiq1?=
 =?us-ascii?Q?d13a+z0dbEp4X3drRrlWc0WajaxGoxmOYYbfgpXb+UV0HJHUKpDggEp+dyEQ?=
 =?us-ascii?Q?OIUauMf4EIcciJ+45uVd4/6y+WENZ2muPkt9hA/VvdVsWI/IySYWWKfWeqfj?=
 =?us-ascii?Q?3TawWM2wnVy/TwvNOBOpeKlrAjqNpUpV4UAWerwk6Q1ADTJagVaJth4XgcuJ?=
 =?us-ascii?Q?t9UZzzftjwiSdqYDRt2nX7oXCnEVYc0iG+DTCyl/Sz0gozruW7xq1JJs3RwH?=
 =?us-ascii?Q?PQlbza2L+LwY7wxMlQFGuax10HGNTERsNfu5Nq0dybywVyZ0wjCQSxGAqazm?=
 =?us-ascii?Q?irYfKd35/58jXg3d5pxl53Zre3/B6C+xCCuBDQxK9RGQdE//yce+Sliiy4qu?=
 =?us-ascii?Q?8FggmqZ2NCyY5gBU9TP/US4Fi2gCVvrTlrgjBDl8u2/mBZue/tiV2YQ8vOiL?=
 =?us-ascii?Q?M5PZQLBkZ7l5V2hivju6KHZFw3i+42u5C7ryKhp2xE+jfPKw/lVFg02c5csh?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c00302-448d-47f5-351f-08da94ba71db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:29:32.2928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +306unpqVX2STAz5UWUTTvnuTUQZxEMw7Y7h18LyWoM3L8b4T59BgtaT9ALTJT7rOYgy86goxDfWF9N3ZCN124OrNoBOI8wHxvdUo4i+CzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 7fed1abff0..e3c5c51db1 100644
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


