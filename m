Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F145DE57
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 08:58:00 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiZDM-0005Jn-4u
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 02:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54989)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hiZBo-0003vB-D8
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 02:56:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hiZBn-0007Lr-DK
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 02:56:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52658)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hiZBn-0007LH-85
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 02:56:23 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7022D58E42;
 Wed,  3 Jul 2019 06:56:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EBF1473DB;
 Wed,  3 Jul 2019 06:56:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3017F17444; Wed,  3 Jul 2019 08:56:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 08:56:00 +0200
Message-Id: <20190703065600.13535-2-kraxel@redhat.com>
In-Reply-To: <20190703065600.13535-1-kraxel@redhat.com>
References: <20190703065600.13535-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 03 Jul 2019 06:56:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/1] fix microphone lag with PA
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
Cc: Martin Schrodt <martin@schrodt.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Martin Schrodt <martin@schrodt.org>

Several people have reported to have bag microphone lag with the PA
backend. While I cannot reproduce the problem here, it seems that their
PA somehow decides to buffer the microphone input for way too long,
causing this delay. This patch sets an upper limit to the amount of
data PA should hold. This fixes the problem reliably on their side,
while having no adverse effects on mine.

Signed-off-by: Martin Schrodt <martin@schrodt.org>
Message-id: 20190615153852.99040-1-martin@schrodt.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index fa9dd9efd4cc..5fc886bb33cd 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -618,7 +618,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     ss.rate = as->freq;
 
     ba.fragsize = pa_usec_to_bytes(ppdo->latency, &ss);
-    ba.maxlength = -1;
+    ba.maxlength = pa_usec_to_bytes(ppdo->latency * 2, &ss);
     ba.minreq = -1;
     ba.prebuf = -1;
 
-- 
2.18.1


