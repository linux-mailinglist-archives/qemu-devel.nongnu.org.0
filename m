Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FDD5EEFCE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:58:29 +0200 (CEST)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoRA-0002Pk-OV
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoLt-00050r-Lq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:03 -0400
Received: from mail-eopbgr50137.outbound.protection.outlook.com
 ([40.107.5.137]:58243 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoLs-0000hg-66
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf6kPZIOX0oq9rj8p/ztAkX7JyErjjucD5akR54+6/BwyXUXoa6y9FYyQAqJ0LT9EZjzgr4Nc7eezhqDP+J3wV8rCAUvkR00zLquXFzZI+hT/Ndlxtew4JJQ4ma1LGI3DpSwOcqi36N538iCKAr50F5SG+v/OoDj9+2fZQ371XvUlfucmHF181fC3qPSaK9v4EgPimaRqmolsMRES7I4xnpjI66Bg27cq7uLyjB4UxQOr3hSl8VH1oedUo2yRK162+6pms4K+Cwrk8a+3ZF6phe8TJNSp3g3VYNgHMs8XuOaaHwLX5Eam39A9L/mOZWAJHjWeZ555HG2El1Z5Fl6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDuHrHOpjnvbR81Z5wHjnGTZSs+7jewXbm4TYdlL0tY=;
 b=QN4t9rUbn19mfvrfDSx8YOgI1EFADnLM9cMxH5FOLuguIr+01QIR/ZEkSgvpICnVb7oX52C6/cDf3d4bqQ92OxlhqLqK6Q7k3EDmyceFS+6t4xpolm902QFn9Elrt6JW41PkuAWJEG7lioWgR5EGr435Nx1QGdFeUu2d70lcc+9cZqtna/H70jeWFIyYdh3zZswmaKPJu+NnOxVjHB4YDWcXU4+kvgTPnBLtQxzJQygtdG226o7rmbxN11oMLk3VrTOQp8H1bHBC5Vkeord7ZStA7X8vaaOL34Uo4scOPrSQ4pJcoTcUZhmbvS7vztTU9P8tA813GnrkNJYJusQdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDuHrHOpjnvbR81Z5wHjnGTZSs+7jewXbm4TYdlL0tY=;
 b=tCRB2k4OAutMl9iET/Z146S7oU6LoMHhmHDaLiwsHB0Myd0LrGUhUnJMdn42amaFEZJtGl2z+QfakHzpGdCVsPdvh42L0W2Doges/Lw77YFvtqkxL3EZy2PoNA6XBOJQ6k8mdRWy7BfJK3/1z3lqxhWu6QTs35zmeNkC43JyRfHKR49RSUhmwRx0GBiGbhqD3QEhYJEW3flA5W8lwSolW9fPDOH2/pymi0T4Kt7g0TFafOtIo+oMvt8oGQzo1bOxj6CaWPy2qkSllTjKHQ16X5HN8gqFkKP8FChb2Mtf0AYO5jw6cjfwu/cGsrHSkjhiiGDfI1/xzQRyE5oxRwBosQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 07:52:50 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:50 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 7/7] qga: Add HW address getting for FreeBSD
Date: Thu, 29 Sep 2022 09:52:39 +0200
Message-Id: <20220929075239.1675374-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: da4d66c5-871a-4092-76f9-08daa1ef9b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ag4Mkq2rz0gvhF+Na1mthlHP7Vw2aXnuWiPvrUBNpOfV4qXcJSwtzqThGo5QSWwLziExZFOwxlx2xWrOBMNVx38a2+Kb6Hrsx8jlW9hz18NUOfF4X+Zv49kpMP7JHapSALEEzYJdoQVX7fRl4T2CxYxwNnmaK5NfCHgjc1yymxu25MF6hEQzZq3mTqgmpQelER0ie5s9qVBZXFTmY8jzO9TAFiZI/cwrtiPS2pBAGczRFNuVuLW+kzMwNZqpMLBh/4YSVjhNn4G6/WKnywAXZXxLWCc1wPPo2OJdNsQH7eoSPIFMdS5/fGrve0X9XY0FTcojbH0BTJopEamTj5QSXuElJ+qQyoSwvUf38yrY6oSqcuYOBF92RnGiACF1UBBKAidM03BRtZysgQe/SF12tiWBu+CFLPC5wKxNXqplKlyy3O8wQLbhPFHHbJbjKTEk0CwXkMkjN9OsGTNtqhtx3jSqHruW7+0DC+7meieHJ+FgCUcopEms/aG/hYiBfrwgNqUoDxiqjGMlbuHqxGeidhKtp0MAdSYEguAw147Zw+nb86k7N66kwGO6XCN0lfVrdFiAQZ6uPE36oj9kO6BaLFWNytLFu8rbNbr6h+wH+YPB3Ubfk6Bt4yIi73iC46Tm44QcYzSG+KzcYCjF2lMaLgvoL4Q51EJRcTBeaKzE0bJbNPZUVUPoG1PHfHHLGJR/tk6BY+TFdiE0iCh3rol0JT0PG/T7SUPTd7xxPH20wIaSTp1sA+2xvfeiKqxwVoXG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199015)(38350700002)(41300700001)(38100700002)(6666004)(6506007)(478600001)(26005)(186003)(316002)(36756003)(6512007)(44832011)(86362001)(2616005)(52116002)(83380400001)(8936002)(6916009)(6486002)(8676002)(1076003)(5660300002)(4326008)(66556008)(2906002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dhmZy0rHZV0biZln1Cu8Zl2Ux/PfI7sgg+WgbAM+HnmD1rTzgHBNF24eJTsL?=
 =?us-ascii?Q?TPklT5UyHxUMWYiXW64qTyC52WKgUEkfr0oXCGyEFj+a+LtJtwpC+Q60OYUJ?=
 =?us-ascii?Q?MVGw4Al/v4HvD+ZMq0bQ94JjpOC7FsSsZCEl9nRF7riW7iefw2InhWiSnldA?=
 =?us-ascii?Q?8PpduRdT565jJ5GLYkhJevDrGSaMF+d9iVJTfFJubhMPnkwCJ/ZM2sVWcFXl?=
 =?us-ascii?Q?WOmrxJfgWMEQK9VjTsDgSqrVRX2BB6+Zr6OXeUVVSO/L8zDurSP8SJhVSoxd?=
 =?us-ascii?Q?4GQUlXTiOsduOb4zakJkiLCxLsR1YnsocxWDvT+Ezhgy/gUqTWxIu8zNBeHV?=
 =?us-ascii?Q?T+3/4i2llYnUzLL39AyRe/KM8keTtPi2CfQToxbYV8iOjRH5cmJL7MWnSqi9?=
 =?us-ascii?Q?FiBZPKfmwos+zHtw5YimW4rIfWSdnO/FItVNpc9/IFE47b8cofdywwTykKaU?=
 =?us-ascii?Q?Jeg9u4qx+m2/YXa8/5OiEpBHHNkA4IDikg+UV3+L45+3oo1ykZxofaPCkC+l?=
 =?us-ascii?Q?gj/HmH9GZi3+nHOK0yDnnUHm0VqVYZtWl+BZVjNt1c21aPndC0UbAUMnxG6w?=
 =?us-ascii?Q?H9QS1aA66/qKPWSYJLQlfMtKzKPmdy39I0DcsCFqaW/Qov4EbFl5m35fKpUY?=
 =?us-ascii?Q?hYfP+Z6Vlo0NkCIsWUz49/JIBxqK4qurteDBFEHRpOFx0wxl5wXwz3NtC7T7?=
 =?us-ascii?Q?FTWdWthwCrvAI8XU+9GlzafdJgao1tHXI9ZdMAOMZ0osGSjDxTbP5bqHvlMJ?=
 =?us-ascii?Q?ISXHxauCP5DB1GcOX/Y75RgL3C55TUy5NQd42+v7s8u36CveHTURmhj12f5r?=
 =?us-ascii?Q?EtM8zgR8/CCDLleQ0STv7SZsj/X3tT545mTUIYDfoSj6whpnBWGtzFLmK9ed?=
 =?us-ascii?Q?pnbb/6FQ8Xdpv1qE5pNKPIJ9nO3jVRWqhncFJZFootvzxxr9I2Nk3lGd7k80?=
 =?us-ascii?Q?w6mUpKH2QS++hsXSB3/Z+/WSAkw9uDnETSrEmHyWdOt2K7Ud8y/A+yiCXCcw?=
 =?us-ascii?Q?NMUbt6qV4kAnvBqmGl2dEivA8ePGRiMfSFR3hght7391wEnOuiekBrZfdOJ8?=
 =?us-ascii?Q?aX+EbdD5dQpQUXcZEqPMJw8frpVgNHn/TyysGRONLWIIRiniRseusFmDjXob?=
 =?us-ascii?Q?iqY2I9yTdsWvgU4jpgW0kKACipODx5MgvQnEWhFUiEsRrjHwS2+sYW9pkae4?=
 =?us-ascii?Q?fOMWeeT73oefVU8HBQcn0fWwKREmZdlpRMUuT4PrCkIAjnKYwrv1bBTbJbtT?=
 =?us-ascii?Q?c28jwT2AvZrVZP9TfSGqgvR7x9azZrTOdoW/u4Kdf//TrkZP2jbyblPPRQZX?=
 =?us-ascii?Q?WRZXG67sG4doL9hea386eyIOaSg6VfxSFkHIAI3ln6PhY4cGmb6+zgX4tujI?=
 =?us-ascii?Q?0RXX4XucDWxGjDoK7mhrhVQGLZ8QrvPTSVVBjipPOJpB0dF3WY50g/jOZf8z?=
 =?us-ascii?Q?FznLz4WufVu9qCCtpd+skxzcsIeGBziUZandODKMbObtfSIJsFFOvX/mNSil?=
 =?us-ascii?Q?VQx3TUoTJqjDHL3Gq0piynGz8gpf/0/X1Z04vNq1bYDB5Ua3O3OGnVCelIUy?=
 =?us-ascii?Q?h+fxX78V23dZO8T0zqHqDotVGABk5Hel0PlJSY0qElg5eUBHSz7OZklEv6ky?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4d66c5-871a-4092-76f9-08daa1ef9b6b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:50.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEYs+q+lLOoX1CdfRm8744J01R5jNgLdjN55LqLsMQZlOT9VCvltXyvqIecAA2Uyjj3GnkpFrfJTjDCYI2/SxqbJnQAywSHbBQ7n8ZrCJvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
Received-SPF: pass client-ip=40.107.5.137;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace a dumb function in commands-bsd.c by the code of HW address
getting.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ca81114171..f9997ee1ec 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -20,6 +20,8 @@
 #include <sys/param.h>
 #include <sys/ucred.h>
 #include <sys/mount.h>
+#include <net/if_dl.h>
+#include <net/ethernet.h>
 #include <paths.h>
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
@@ -178,10 +180,15 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
  */
 int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **errp)
 {
-    /*
-     * We can't get the hw addr of this interface,
-     * but that's not a fatal error.
-     */
-    return 0;
+    struct sockaddr_dl *sdp;
+
+    if (ifa->ifa_addr->sa_family != AF_LINK) {
+        /* We can get HW address only for AF_LINK family */
+        g_debug("failed to get MAC address of %s", ifa->ifa_name);
+        return 0;
+    }
+    sdp = (struct sockaddr_dl *)ifa->ifa_addr;
+    memcpy(buf, sdp->sdl_data + sdp->sdl_nlen, ETHER_ADDR_LEN);
+    return 1;
 }
 #endif /* HAVE_GETIFADDRS */
-- 
2.34.1


