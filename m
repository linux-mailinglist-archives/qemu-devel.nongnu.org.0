Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5E2886DB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:25:46 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpar-000240-Ug
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVU-0005FI-I9
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48777 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVQ-0001mc-HT
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wX034Wz9sVM; Fri,  9 Oct 2020 21:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238796;
 bh=tQlKX5/6ah1tqzgovx914AmLnL9Dm4wGAwv93zwiCG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jco1EC4Jf9H51ruhYC8tnDnPSinPQEEOaVf3zfUURmzNIm3FO83w+x8g+h2j4jRLo
 P4xHpHcJu3ZFhjsRYcJDaz1OmIqluJ+IU+uPFmUFSJRBE4wpeIhlExFIioeY73uZ5j
 qZKPv0eJvOjFeIHdFtzFluFI7tbibNRy5o7DxReE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/20] spapr: Simplify error handling in callers of
 ppc_set_compat()
Date: Fri,  9 Oct 2020 21:19:36 +1100
Message-Id: <20201009101951.1569252-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 06:19:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

Now that ppc_set_compat() indicates success/failure with a return
value, use it and reduce error propagation overhead.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-5-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 544a1947d9..0f82e657e3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3817,10 +3817,9 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      */
     if (hotplugged) {
         for (i = 0; i < cc->nr_threads; i++) {
-            ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->compat_pvr,
-                           &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            if (ppc_set_compat(core->threads[i],
+                               POWERPC_CPU(first_cpu)->compat_pvr,
+                               errp) < 0) {
                 return;
             }
         }
-- 
2.26.2


