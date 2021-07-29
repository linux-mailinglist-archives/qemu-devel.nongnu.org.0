Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637633D9E09
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:07:05 +0200 (CEST)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m908G-0000Bt-4D
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903E-00044z-US; Thu, 29 Jul 2021 03:01:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45091 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m9038-0002iK-1h; Thu, 29 Jul 2021 03:01:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gb1fX3njMz9sCD; Thu, 29 Jul 2021 17:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627542100;
 bh=lyh3nioXBhrxJDri2BQ3Iv5w1IUycxnRQbZnG8OYWzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=adZEDQDZRSg4Y/QXGhgHcLZ3WmsUz1EO+kRWpsCE6oCT+SeoxKADJQUG4Hf76+g0S
 gtv1DT/bEqpZ+mpaA+MAufhIP9UDhdJ62RrEFmnlw3jeJZclZQgNofI5LW+Cyne4Lm
 eRUlB72+dN89j9ZV8bDNUXDyi30DbQ8AlHZiiQOo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 1/5] ppc/pegasos2: Fix spurious warning with -bios
Date: Thu, 29 Jul 2021 17:01:31 +1000
Message-Id: <20210729070135.422262-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729070135.422262-1-david@gibson.dropbear.id.au>
References: <20210729070135.422262-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The -append option is currently not compatible with -bios (as we don't
yet emulate nvram so we can only put it in the environment with VOF).
Therefore a warning is printed if -append is used with -bios but
because the default value of kernel_cmdline seems to be an empty
string instead of NULL this warning was printed even without -append
when -bios is used. Only print warning if -append is given.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <483ac599a1407b766179aaea2794aed60cc09f53.1626367844.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pegasos2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 9fad1854b1..b8ce859f1a 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -191,7 +191,7 @@ static void pegasos2_init(MachineState *machine)
             warn_report("Option -kernel may be ineffective with -bios.");
         }
     }
-    if (machine->kernel_cmdline && !pm->vof) {
+    if (!pm->vof && machine->kernel_cmdline && machine->kernel_cmdline[0]) {
         warn_report("Option -append may be ineffective with -bios.");
     }
 }
-- 
2.31.1


