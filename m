Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440D5EF13C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:04:58 +0200 (CEST)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpTV-0001SI-AD
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMT-0005NB-JY
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:46 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:26178 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMR-0000p0-Kb
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2+Uh9un4F2FOylNqB19TtCgv0S9SiWl8j8pOnqgw+gAjd82bWoc4YVbRBCrLugIxH/XNaRb2pTFmjgZEs+lMUXh5smq1XFh5zNdl+cej4zw6/QlQxY6oS8A8xFsoTANY4F9hN2vXRpg7K7MR4LjQPzC8gkveSLDTX38ymNHZ3tLaalUry4d0MgTGwygbj6jf48O/twhjbylqmOFH6Bsxa6L1XW8sIivIrQmlOaWUSP7dzHg3lOaT0QCr2sSgg4rdnMlbqMlhy3ZRlQvLnLKGtmvI0jbSR67uqgmdWrkCTSTajPQG8zMzwNCVh6mdoQxXQmY44FVCGh6593Ya9s6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DZSm4z5DofDfGSRj6kGXnR9CPkDe8yQ8zWjJ8ehoeI=;
 b=bUaQW6obF2VtVuFQLAuOGBoBUa3G2Ufmwn04pJTh1GlAW3dYegPTgpJzHtA0uhGD910JRSzfOggbxA+1IDJPvqgMf0wFttzR2kiMzAo7LFgO9gEVx9g0qjntm8TNyq+0kBWzlb9N941/uERYj1jrBNvLJt+i1SFH4ID/y33KItNdMOhqd+fV34JGNKERWJJDkzYwEXz5/UlaSObvQWSewjirQbS3v7kij6NMFYvi6HWGh/Y3IthXp94tdcwej1Jyz1AbUHSnZcXPAeXCnS0/j4Dcj4eiG9pVNbsTMLhTbCPNOMbx/FGcqsZ1msCjlSUT57d4Fx6t5aup4vezB6wA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DZSm4z5DofDfGSRj6kGXnR9CPkDe8yQ8zWjJ8ehoeI=;
 b=Fvg6ef3iK2r/w1dGpvtvlmGhjKd7fgX/dKYohgxXDv3QQi75RnO2cHslRRNxV1eIThTS5SEmcCnDMcNFFgBbEOl5VVxmjnf5bFsd+HJnTISY8lj3MMEYGwaJVEB2WgIM81im6aA+rSQXYsu+km7WdgR1QPKTI74iIOoBsX7NgvmeQgfPEbPkPtxQLrFh2WR31zYi2AFCy/RurgyTRoFJcNIqqwyy2GDYuCRgLXVZh8NfgfLYvcjB9tlyILQS3K+QMjvhKQPe07hTzDjpvdODSREr0A3jKx/AWAuNQsRT+NK5eC0capwnlr5AltFVBm5mq0SkyeNIaEir7+Oebl265A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:52:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 4/7] qga: Add shutdown/halt/reboot support for FreeBSD
Date: Thu, 29 Sep 2022 09:52:36 +0200
Message-Id: <20220929075239.1675374-5-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 12823860-0752-44a8-aca1-08daa1ef9a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CpMKMGPErpPLrCojf8gtpwoL7b6JvmRxL+Nlf1xqXWkBXC0WJmwZgaTyNZHnJ6NYPSEHpKxfCAOPlKYrN1b7ndhSofuuz/KMwM7SG3C7oGKtrCxzdtk/PVXfKdBV/rGKdYqKHJg00CyIG6Mur/VdFzxlpogc6egAxTnBkaYpLXpnh00qAlszBc/T0wCXl7aEcgQI8CsD/aWAGOGw1lBlFB6fjWniIh8sKBcf+DALgz6P3/J4p8/KBKm+dLC0DghnhLyooLSVY/qw+uF+nFXKlH2VZ2HODVpqPsX5mkSYRzRwsx93Jd9qx5aUMejNiwiOwjLFwjisMpIp5rJUgrDpRirSXFfZZ+S7rdSCXAF+CI2VCTLmYGWgA/PuI7sGOcJHgzlb7fLVl5iMk825xrd0pedIgOQFX1V+OrjMpFYom0o03wyLiLuYm6cuHVtgqKPpI6XkVnKKIvmZom5S0FzzfouO7aXh9qULRW0HjDgqwLb2FN0ySWPlQAZ0Igne5xer48r3TLzJEpi60gb4heqlUNlSzkDJm3TAH8ikNeghWEVEAld2yTxkfnXApRe7ARo/Q2JJDv8h0gRs6LMTtWoMRK+3vUWAv9+cleMBvqv3SUWno9s5FFKNQC1ObLFgnTWIfirfp028owDj8Ldg7bbMCThxcEpy4bAIyUTePM8hF1sZxZKnKd9hh0oGsYGVUfp/Rgc2VrdZYDzVIogxkBB9ElvwFcnsaakwuTjjIPukpWU62Ym0cJbkzehdFVeW+1z4U4bLM41Pe5HS7h2cDHqnOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(451199015)(2616005)(38100700002)(38350700002)(86362001)(6486002)(478600001)(8936002)(5660300002)(6506007)(26005)(6512007)(316002)(6666004)(2906002)(6916009)(41300700001)(8676002)(36756003)(52116002)(44832011)(186003)(66476007)(66556008)(66946007)(4326008)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxylNh8jBxuD8bgZdCNQVR5S3qKKVMy4OSU0ZbnnA3rowPV1wGkWJW6k2Cug?=
 =?us-ascii?Q?r4LJRLFGi1srcwZcwrxT2pGq4vtTuShU5AF7sPwerbi+2VZb9U56mhUcREFY?=
 =?us-ascii?Q?FVxBU9IyRMoQWEu9ROthhsoyjJBUACrFazTm4xgZnKPP+zABjm10evafQGGn?=
 =?us-ascii?Q?UaNYSDwMxk+8W74MMT/vbqUM+pYhIM0L6Sby6+QwZXXkkdx7+PUHgTZeP6sP?=
 =?us-ascii?Q?KHqTw85Sm4kSlV1MkYA4Ywq5KHwSzhB/Rvth6I59c0BbgEb1GXTQH/DTvVSO?=
 =?us-ascii?Q?NE/djQWSWbj3uj9bE65Xm28dhaIcb58Wac5QSBNa+3AoteIrIOldg4Hpe1Q6?=
 =?us-ascii?Q?MXc54K0SpwBMRuyh2pA9+q7kSZwlnPzk4aScp0RbZ5f32EGiZruztkF200IW?=
 =?us-ascii?Q?F2geOpLUTYqj+PP2z7q5NGS3KdVd9xmfZ4NlFetrfDKXSvNNtColY+g5Oq6L?=
 =?us-ascii?Q?qX9eWu/B3bPGqy1zqUw+56UE/Izq4C3aFkfmC6K9HtxK3gi0YZZBsVQhN4he?=
 =?us-ascii?Q?5KbyPXTDZHPV8MHdfWOPA5YCNaV89Ll2/M+lOb6JYdTegck/eDm4hBOknU64?=
 =?us-ascii?Q?kh8uMsa2r+rY71N7LYPOtVhK47Snd9FBVtcIuygbMkiLXVZ3xqhy5kdfu/wZ?=
 =?us-ascii?Q?Rh7jMzCY1h31vY+VYFknTjUcuoDXXVL3lzTjEidLU0Th4U8VOFK7yuh6LJNa?=
 =?us-ascii?Q?d+Xo+2Fc63km+vDG3a/PKsr/9Lr9GZbw2EN6noPkbV0uw2t3bOc1pf/QnNGW?=
 =?us-ascii?Q?SCbxljyi3yuRIZ77Q/YMJWRc3Wyc5uGfRKUNO4hE6l1guXVHJH4DCpOmyW71?=
 =?us-ascii?Q?FEjGz0gYwJDl0zGDWznljcePNU6k4PNAnV3YDefXTlaFCacrEnQ+62rWP5Sp?=
 =?us-ascii?Q?Bz9WR6SDaNU5UnPpzGS7ugs2BVuWJ/VkaBQ5wyvEqJ1sBwT/KdrJI2vpult4?=
 =?us-ascii?Q?/s2wYZVOBi/P1Aq+yftZcjqxWEf9W78FmziBS9b9EAg1dizsp/prfV1OQPeW?=
 =?us-ascii?Q?eJrBduMdHHKleY5X19ESGk+v7bIvQXwyP7BF34e/bXKav09/IPBFWDGtL8E6?=
 =?us-ascii?Q?vR9b9SH7hDYViAtaVywH/laNjQLyxrVzUFGCmlY7OVxsbWCwB8Sr8PHK1yRL?=
 =?us-ascii?Q?DzBSUwyqUfYCgJcrzjgxEHhqewPSUFsmba4R368nyt5mPjnOIrJwXqjcctDw?=
 =?us-ascii?Q?C2xOQxdjPSMtlnK/8HSp03ths3+uJmuHHL01D+FfbrQHFN//vPXqi9WC7txg?=
 =?us-ascii?Q?lODlLuJJYe94jm+EC1CRe4RnXZNmUfe+49NnqbCef00+ieN+LKelWgcUOdfC?=
 =?us-ascii?Q?MPKGs5pgTJApvTr8BIzNICS9dADnTVpzqKAH8fBaK+bLLgC2OoqXE/PpP20C?=
 =?us-ascii?Q?sRe5eP2udgVhisJIzjjzQiYCo+bBZ5i6T3R/X10xVoNA9K/1j918c6SJ8ri8?=
 =?us-ascii?Q?T5Zczv9PsA72LcFfLfMnwcCyHr2/kqZLvm7elZktTRhUBk2QuZsYXEoY8Dox?=
 =?us-ascii?Q?MaCeQ2Wq6HiOnOK/meviaR42yiID0m0g74UgCbRTfXaZhHsAN7Q8OkcKJV/p?=
 =?us-ascii?Q?vlAAkf9wLYiMiNcJzi8GGa2vU073e+UPz+eXOwh6wAVkRBq/Oss9qP3GySc7?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12823860-0752-44a8-aca1-08daa1ef9a37
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:48.4514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9M6vmwjdkLU8EJVd5Efn8sLfID17aBnBM8brFkkOoqzZjshdfQqeVpc+GqUCL6MLd+YpGsjFGYaIudt+FY2nhtGwkqn8V+xOxozue6gPqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509
Received-SPF: pass client-ip=40.107.6.106;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add appropriate shutdown command arguments to qmp_guest_shutdown()
for FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 49f9996a9c..88e0d0fe24 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     const char *powerdown_flag = "-i5";
     const char *halt_flag = "-i0";
     const char *reboot_flag = "-i6";
+#elif defined(CONFIG_BSD)
+    const char *powerdown_flag = "-p";
+    const char *halt_flag = "-h";
+    const char *reboot_flag = "-r";
 #else
     const char *powerdown_flag = "-P";
     const char *halt_flag = "-H";
@@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 #ifdef CONFIG_SOLARIS
         execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
               "hypervisor initiated shutdown", (char *)NULL);
+#elif defined(CONFIG_BSD)
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
 #else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
-- 
2.34.1


