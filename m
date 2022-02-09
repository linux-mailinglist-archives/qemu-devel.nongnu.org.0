Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA334AF4C7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:07:47 +0100 (CET)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoZO-0007Mi-VG
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZP-0001Np-Aa; Wed, 09 Feb 2022 09:03:44 -0500
Received: from [2a01:111:f400:7d00::715] (port=53856
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZI-0000MG-Bg; Wed, 09 Feb 2022 09:03:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kldd8Mt9lVjN8047ZbQl0MF8NIju0tjSNdnBG9zg3IU5m6nQJKX3HzGtCBT6/Fvl7pCULC1gZI+05ETyJ9qVpZHmLg1tbVxxLOzJM+7LgRIj8H9PWOnBWbmLiBdVeAaw2o1ktTKjM+3DuC5/Xjm3I5DVlxldwVt2ODVwcXu50XUOjXaOGDFc7Ld0l/oo6V/xeZ3VjBaciN/FrU4ZPvxt8F9Ff6i5VOjuBe5VJyZi40Vp/8LYPOI5WNe7KJviI4UtCpfEz73eDhkPTgdWhvwMcecTiIr3/T6v+7PD1i50/Q4LDsOQvDTjZJcbR1O+6Lov5j0Tpzs3fQoZ7LiVX0gaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKnnQ521wHQXoS171jQSVPN5nLAsdXbzPJyY12zHwxY=;
 b=hSY5YR8X3Uo+CchNxLnewxk1oT8rolMr6B8v7hD6iHpolkrh7hxArm9gSeU5Kb8TccCWNVrbJCt+Hy79i/t6A5DTUh2XoTM2wegwS3vPiZceJunxxzX7wNxR0jErJ3bTd5EcCXortaS0hxjG9uj7q4g3+nwQgFoMqUaTXKsHrg6DOKEn45yOVv/phDKsU6IRVXcaKWfXMUzYzmOmx582KryT7cgOB8dN+8Wmq5n94FGEkwMZC3FkHW99fVZaw3zPonBcYy2JjOGn2Ye+Zryymvhbjvr2iokixP4IKeriFGJ2jz38mMuHOmmy8UW7T3HUDhavcRzeRqsZG4FXR50cFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKnnQ521wHQXoS171jQSVPN5nLAsdXbzPJyY12zHwxY=;
 b=fS9/O5UL7bjDtkimY+MfyLGyUEvR+p+k/ZaY5t9oufzuzu6FfS/Tpsb3LJCBVmB/xJNsliriHq0jOMyPALYztHcUEuHLftbguTEKlm4t9MWXpaEeFmuqcwIs76p7QGbooCP2nLef9EbbQsK1gdCXtyB8ZcOFWATEX49XwPi3FmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:03:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 3/7] block/nbd: Assert there are no timers when closed
Date: Wed,  9 Feb 2022 15:02:54 +0100
Message-Id: <20220209140258.364649-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5329fd48-75fd-4adf-4ef7-08d9ebd4e8ba
X-MS-TrafficTypeDiagnostic: AM8PR08MB5698:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5698EC6EAF3FC7DA74E315B8C12E9@AM8PR08MB5698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OfKD+EVguit1+ozCYgAE0Z4QX8i8oV8myuZ9veuKbeVm4vcUnUMuO7/B2LpfrRuJW7LrlWqrRbHUsCbU2YPNybCBQIFXqKDTWT6354T78Ct2wXHjDFg48yqvC+B2Caf9n7DDgykmOkJIjsrMiIE0/fGMy8zf0yyyrGS4z3BTxv0lfFkR1bYBK1SQTJpQF8bkg44IIiQa6UuKeaj7ZxDT2x6h1U1bV+X+9VPUNDhjpJFXnBnB2pxS1wooAq88SbgTRqVou8wJ/7aZlGtFJAmrmFO0KAk6Wv2bc57k1IP16Ocap0h7NNMdQeanDIYmi90Iv+yNDgFtqzGe6+dvBq/Ll5FaXpfZM5NK6XUYZRb4NZRw6QYTnxM63P85Tg86bEXa4+lQ0cIfTJCNuJ+vaYsrlPy6bLwPnQUafkuy3FFD2rf8hUAjJ1lPyJwtWc19+J4EAyoC8ivCn7R8FmrGl/JdbKl8az8m/6KGpdPGUrBcrdhqdHCZgV151/vX40oWyryv/8OPTew3YgR0tfje86yv9PdpMmMgyPOKA4rTB8njDpxbRocbevLXka5UJoa9qCHFF6xLt4dywWw9RzLD15cQnb/8nD6dHc9HpEGJccQE8OyuHaXhVqAoqccT/jOXEJ4v0ictMN62iAqqBcYfESuWsN8GYXnQr4HGdQZxFcPe2jursn7rCu1rmgt8yHMUpsgSLJtjAQvNOkbPbZ297W1yKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(316002)(6512007)(83380400001)(2906002)(5660300002)(6666004)(8936002)(1076003)(38350700002)(66476007)(66556008)(6506007)(8676002)(86362001)(66946007)(38100700002)(4326008)(508600001)(6486002)(26005)(186003)(6916009)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ul3Q3oFgJhIjxsa0krLDsIgHL8ivoIxKTOkvKfMtReIqKZj62YkY2Mbi5Rzq?=
 =?us-ascii?Q?8YTU7Jxq2+sMXt6UYbBfApfhxG8tHaeKCoJLxi+59HidC2/yvIpuvFr9N+Iu?=
 =?us-ascii?Q?lMiOko1g0kzJgj8gnSW+tOaDWY512YlXQYRDP6Tc0CToeBbUWS75YQ4KV0x+?=
 =?us-ascii?Q?hGohcKzUqIpZzL4Puo32vTPP0qStyJmls/wkJcMjkH5OWu61yaDOvP9ORUgi?=
 =?us-ascii?Q?u+cR3JVKD/UJEGHfKa+3IuS2Qqp2w7gG2Onx1irulRlp4ahQIovmanKrYbW2?=
 =?us-ascii?Q?fvZF20Pnsr6q3X5mUsbXEom7/RO0TqgXOU9wIQHxCt9cRmdLef7K8e27GfI9?=
 =?us-ascii?Q?wdhL22MjjqtlcgiLtS3mTlK1M0PkO9ucOZHbsw0GNdMY6rGS6c1HJD3Hz5ep?=
 =?us-ascii?Q?o8jKYuUuxBu48dLqX86C89QeY1w7gAdVQed+0NNN8AkgFTVcKO9N53BqBErb?=
 =?us-ascii?Q?x53MxIEmfifLVTRq7L/Mov1wZfY2YOseLIkDGY/a3fgjkR3FclXiLlOwHwj4?=
 =?us-ascii?Q?JY/vHHI81AbyfUIUaRMwf4DKUfRMT4xohnN9a4tmKWBtoLGccM+Vd3MngFM5?=
 =?us-ascii?Q?ejVhQYltXVGg0HX10HFiA3a3/VCI9YfUEZA7Ak/eKY0ZOwcw0HC0EZN4ZaYv?=
 =?us-ascii?Q?pPv3Aj27BQuAKhLNfkkZ6QXMOvowGYV6+08UnD9Z5ufLC7ZVvkrFf2XNr3YJ?=
 =?us-ascii?Q?wIT8n1pN3WEjPSNcFtSNLGVe+zfR5zl+bRB46MjgT3Rmw7PbwmMvQZjBXjui?=
 =?us-ascii?Q?KyCVoPdIt65ZLYJPAD0VuvdiJpSkmws1AetGgAgK9G0n63QO/QPyRUXB5V2Q?=
 =?us-ascii?Q?Ln6BTxnayIxOiy081+PEkw+p1y5KYu1xDIEAORfFStxCRu4NmUyd2Y4R3rR6?=
 =?us-ascii?Q?ZN0N5n48R7z5mAnTxsMqVgcCp0nkG0aIx1GN6UzAOFJnlpl2/G8S+NQEQQWU?=
 =?us-ascii?Q?ueAVGwVQbOiYB8UVM5+zsutw5FehxFaY5Iv8nNZGPINGifleL+JNwi7tvcJT?=
 =?us-ascii?Q?zgSzp0v2zJiV7OUYEoHV3cjo4NTQw/kfJSBos0OeMWf7+LcD5zbwS6SzlKjg?=
 =?us-ascii?Q?uVkBtczZLiUT9KzvbdjImxEO4I3OeFNfAGLaW8egTcze5Q4CG44XY/z5FeQ7?=
 =?us-ascii?Q?hCCI/XFSruLkYu/hkfnEFso+Q5/qnknR78mH6PVvLou2/mM0lW5ogoxzzeaO?=
 =?us-ascii?Q?td/WjQmt6JJ96rYZp3S3IKHWTDKqfAb4CjOwmo3WiOOO0kJFggRgkTzKBdRT?=
 =?us-ascii?Q?qknDM5e7Qbe8dytpUV2zNl/e+zAlT/WGvD1XsDxk1M5tFvdjGrJd0w6ib1JC?=
 =?us-ascii?Q?ky2RCVrUs9t2vGkKKuUkXEGkGPqA1621J4KalYAzxM1KckyXk+J7oGxwloxi?=
 =?us-ascii?Q?ZDOpNBqVGDOzmA3qc/QunMGVKhwfaZNQeUcaK1lbLNyeg4cLIg/DGEAHd+hC?=
 =?us-ascii?Q?Er0Kmt1wuZqcEAMKmZHvD3uOf6FZoGGNBGkMkB42ApBTcxAovc6mCZ0Pr6R0?=
 =?us-ascii?Q?m4SiqAH0UBm3d6Nq4Xztbyr8n2y1TPWSlzGIMBMoIikwJo/KN7bkZ0C52zQN?=
 =?us-ascii?Q?M+oRcmJxE+kpW5r6OrivzZcT0sEQy9ETA3wPrxguXkQep74/lFRdLTU31MpZ?=
 =?us-ascii?Q?gdAz4R59fG9c2e1LKiqiF2uneK3U1WVlP+CCWNd8+J7YBqrY8tVbH1EjazoO?=
 =?us-ascii?Q?7YYB7Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5329fd48-75fd-4adf-4ef7-08d9ebd4e8ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:12.0535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VltLQwpp0el0m33SUgQ2PvokHlQpWkDXvn3v4qL/ggOuX/ZGL3/Ox+ANrrl70esNI77rbtmiKVsosVnxFI03x+8AJmLPPx+/X1ryBlwSe+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::715
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Hanna Reitz <hreitz@redhat.com>

Our two timers must not remain armed beyond nbd_clear_bdrvstate(), or
they will access freed data when they fire.

This patch is separate from the patches that actually fix the issue
(HEAD^^ and HEAD^) so that you can run the associated regression iotest
(281) on a configuration that reproducibly exposes the bug.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5ff8a57314..dc6c3f3bbc 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -110,6 +110,10 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
+    /* Must not leave timers behind that would access freed data */
+    assert(!s->reconnect_delay_timer);
+    assert(!s->open_timer);
+
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
-- 
2.31.1


