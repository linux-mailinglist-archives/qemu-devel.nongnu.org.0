Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71333919B9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:16:01 +0200 (CEST)
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluKG-0004qO-Rq
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluC8-0004RT-0g
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluC3-0004MQ-KE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PECO0g06hLDjOu3d7I9Nb0+6uo2MxEBlaUky8/Wav6k=;
 b=EcRilCN5VHREqjmEzPHcPfBOTxbdu1wPOV+ghFhREyx0qMlUNd4fVD4SwVSiuPrnqwBFup
 ZayaHEByPfpSHS+bs/3OwA4cn4rUytecmRIutGfiX2N1GVsRzny7PnLQGOiBW4fJ5BcecZ
 sf692DIhjjc3YXhL5gl+2YEB22IHzwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-b75u_6B1PFG9_p7n2DO0yw-1; Wed, 26 May 2021 10:07:26 -0400
X-MC-Unique: b75u_6B1PFG9_p7n2DO0yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3082D90E647;
 Wed, 26 May 2021 14:07:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAAFD61094;
 Wed, 26 May 2021 14:07:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 161E6180093A; Wed, 26 May 2021 16:06:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] hw/input/ps2: Use ps2_raise_irq() instead of open coding
 it
Date: Wed, 26 May 2021 16:06:27 +0200
Message-Id: <20210526140627.381857-15-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Inspired-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210513171244.3940519-1-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/ps2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 5cf95b4dd3eb..8dd482c1f65b 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -217,7 +217,7 @@ void ps2_queue(PS2State *s, int b)
     }
 
     ps2_queue_noirq(s, b);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_2(PS2State *s, int b1, int b2)
@@ -228,7 +228,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)
 
     ps2_queue_noirq(s, b1);
     ps2_queue_noirq(s, b2);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
@@ -240,7 +240,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
     ps2_queue_noirq(s, b1);
     ps2_queue_noirq(s, b2);
     ps2_queue_noirq(s, b3);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
@@ -253,7 +253,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
     ps2_queue_noirq(s, b2);
     ps2_queue_noirq(s, b3);
     ps2_queue_noirq(s, b4);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 /* keycode is the untranslated scancode in the current scancode set. */
-- 
2.31.1


