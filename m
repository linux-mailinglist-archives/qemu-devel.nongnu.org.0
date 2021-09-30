Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F541D2FF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:03:20 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpA7-0003jO-Qi
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosB-00014z-HS; Thu, 30 Sep 2021 01:44:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos9-0003WY-W4; Thu, 30 Sep 2021 01:44:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR1bghz4xbk; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=7kD4/B2z3ZCtTngwym1zN2iFaIcm+D0e4YZfhkNCxPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F5CQNJfNwG1B5ArvcjaRQpZmS0rjwdIyLTmiQHHmC6TXOBL2EA9m4QSb9FiTRflmq
 N2g37UpY7m5+s1MTwi5OiDNFg2gl5ScBwsIX9nwzx5t2FKPkCKmdKlAVIHEyVNf1Fo
 yFX2qR/JIctFK/tu5jTOh/hU7S/kd0r+C1xPtkT8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 16/44] spapr_drc.c: do not error_report() when drc->dev->id ==
 NULL
Date: Thu, 30 Sep 2021 15:43:58 +1000
Message-Id: <20210930054426.357344-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The error_report() call in drc_unisolate_logical() is not considering
that drc->dev->id can be NULL, and the underlying functions error_report()
calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
behavior when trying to handle "%s" with NULL arguments.

Besides, there is no utility into reporting that an unknown device was
rejected by the guest.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210907004755.424931-4-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a2f2634601..a4d9496f76 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
             }
 
             drc->unplug_requested = false;
-            error_report("Device hotunplug rejected by the guest "
-                         "for device %s", drc->dev->id);
+
+            if (drc->dev->id) {
+                error_report("Device hotunplug rejected by the guest "
+                             "for device %s", drc->dev->id);
+            }
 
             /*
              * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
-- 
2.31.1


