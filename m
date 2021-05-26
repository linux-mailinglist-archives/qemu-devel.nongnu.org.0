Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622D3919C2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:16:16 +0200 (CEST)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluKV-0005Hj-5q
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBu-00047B-5t
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBs-0004HX-GR
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQ0/lgssc1eafWvuKxJ1n/R+E4upeZXznjWu7OYJQHQ=;
 b=DfdInjdBFCdmUMBiIqQqmxIe66Z9NIhbMXFyIeAdyH5Ua6Aaumb+0/YQup1HjID3+aRIDV
 uTqZ4E/NKES54iVVrjBDs6rgB8Hk8OBi6ctyKVfBkpeuyArcUa61Mu/Qd5bdslcmYqSqvK
 jq99W5Vj9Wjd6PztY+f8odv/CqOybDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-emGLDmxeMm-r1Zqbpb4zcw-1; Wed, 26 May 2021 10:07:17 -0400
X-MC-Unique: emGLDmxeMm-r1Zqbpb4zcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A6E2107ACCD;
 Wed, 26 May 2021 14:07:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 313DA60875;
 Wed, 26 May 2021 14:07:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0BB5B1800939; Wed, 26 May 2021 16:06:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] pckbd: clear outport_present in outer pre_load()
Date: Wed, 26 May 2021 16:06:26 +0200
Message-Id: <20210526140627.381857-14-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

The variable outport_present is a flag to show if the outport
subsection was loaded. Clear the outport_present flag in the
outer pre_load() function. This method is recommended in the QEMU
manual for developers in the chapter "Migration, Subsections".

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210525181441.27768-12-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index de867abc06b7..baba62f357a2 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -457,7 +457,6 @@ static void kbd_reset(void *opaque)
     s->mode = KBD_MODE_KBD_INT | KBD_MODE_MOUSE_INT;
     s->status = KBD_STAT_CMD | KBD_STAT_UNLOCKED;
     s->outport = KBD_OUT_RESET | KBD_OUT_A20 | KBD_OUT_ONES;
-    s->outport_present = false;
     s->pending = 0;
     kbd_deassert_irq(s);
     if (s->throttle_timer) {
@@ -564,6 +563,7 @@ static int kbd_pre_load(void *opaque)
 {
     KBDState *s = opaque;
 
+    s->outport_present = false;
     s->extended_state_loaded = false;
     return 0;
 }
@@ -574,7 +574,6 @@ static int kbd_post_load(void *opaque, int version_id)
     if (!s->outport_present) {
         s->outport = kbd_outport_default(s);
     }
-    s->outport_present = false;
     s->pending = s->pending_tmp;
     if (!s->extended_state_loaded) {
         s->obsrc = s->status & KBD_STAT_OBF ?
-- 
2.31.1


