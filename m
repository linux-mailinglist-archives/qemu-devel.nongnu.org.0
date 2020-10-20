Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0242886C8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:22:36 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpXm-0006xH-V7
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVO-0005AC-QO
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59105 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVM-0001m3-OE
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wW6Nssz9sTt; Fri,  9 Oct 2020 21:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238795;
 bh=UQeKnEyyTSxmoEIdYY5GOyxn0b+kvE8aWWOtHzoSncU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUY5yc2yUaJ/a3HijM9d3INIj9id93WV3cknUnXyBPE0/eJN8zPpoKBRqDriY27f7
 0ZXkT8+SHVFaSkS3MHVHBa14kyhyzeg7PO81jsadjW1Wwwp9oYcRtgaTSb7somirTl
 xvP+IOspI2YVC8aq8nPd5gCJZdbB316bbHJoE3g0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 04/20] ppc: Fix return value in cpu_post_load() error path
Date: Fri,  9 Oct 2020 21:19:35 +1100
Message-Id: <20201009101951.1569252-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 dbarboza@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nonngu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

VMState handlers are supposed to return negative errno values on failure.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-4-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/machine.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 109d071162..5e58377376 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -347,18 +347,19 @@ static int cpu_post_load(void *opaque, int version_id)
     if (cpu->compat_pvr) {
         uint32_t compat_pvr = cpu->compat_pvr;
         Error *local_err = NULL;
+        int ret;
 
         cpu->compat_pvr = 0;
-        ppc_set_compat(cpu, compat_pvr, &local_err);
-        if (local_err) {
+        ret = ppc_set_compat(cpu, compat_pvr, &local_err);
+        if (ret < 0) {
             error_report_err(local_err);
-            return -1;
+            return ret;
         }
     } else
 #endif
     {
         if (!pvr_match(cpu, env->spr[SPR_PVR])) {
-            return -1;
+            return -EINVAL;
         }
     }
 
-- 
2.26.2


