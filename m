Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7398258FF9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD72Q-0002z3-Tb
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kD6zF-0005C1-Cs
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:10:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kD6zC-0003kK-7q
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598969408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cNgVF9HWZy4RUr6DCucDvzASAeqTHl0TqesZxD7F8xs=;
 b=CgCKSGELaQASl2+mkUN3aHNiCDCq8j7bBiCEZibykwbNS8WEWnLP3nl+WJWU1ZoHtTcCTs
 6nVrz1vUxs0Ms4oblHVKgo97LPjlwpOIy90hFxeJjbTOyCLhlKn+HB4L2Psw0vBYg8Hpe8
 sxPKqbpf4+g3k0DtAGgAab8ACai9SGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-7XrF3pF1M8K0diA-ZOYiuA-1; Tue, 01 Sep 2020 10:09:53 -0400
X-MC-Unique: 7XrF3pF1M8K0diA-ZOYiuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3201818CBC41;
 Tue,  1 Sep 2020 14:09:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E2A7C584;
 Tue,  1 Sep 2020 14:09:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0D7D17447; Tue,  1 Sep 2020 16:09:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] cirrus: handle wraparound in cirrus_invalidate_region
Date: Tue,  1 Sep 2020 16:09:44 +0200
Message-Id: <20200901140944.24101-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:11:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code simply asserts that there is no wraparound instead of handling
it properly.  The assert() can be triggered by the guest (must be
privilidged inside the guest though).  Fix it.

Buglink: https://bugs.launchpad.net/qemu/+bug/1880189
Cc: Li Qiang <liq3ea@163.com>
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/cirrus_vga.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 212d6f5e6145..5d1f62e50e67 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -640,10 +640,16 @@ static void cirrus_invalidate_region(CirrusVGAState * s, int off_begin,
     }
 
     for (y = 0; y < lines; y++) {
-        off_cur = off_begin;
+        off_cur = off_begin & s->cirrus_addr_mask;
         off_cur_end = ((off_cur + bytesperline - 1) & s->cirrus_addr_mask) + 1;
-        assert(off_cur_end >= off_cur);
-        memory_region_set_dirty(&s->vga.vram, off_cur, off_cur_end - off_cur);
+        if (off_cur_end >= off_cur) {
+            memory_region_set_dirty(&s->vga.vram, off_cur, off_cur_end - off_cur);
+        } else {
+            /* wraparound */
+            memory_region_set_dirty(&s->vga.vram, off_cur,
+                                    s->cirrus_addr_mask + 1 - off_cur);
+            memory_region_set_dirty(&s->vga.vram, 0, off_cur_end);
+        }
         off_begin += off_pitch;
     }
 }
-- 
2.27.0


