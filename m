Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8322CB7ED
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:00:58 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO0P-0006Mo-Jt
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCl-0003Ok-QK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCN-0003jq-4S
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ty3iAIwSeDAfny4IAymcTJQMuo7vVeAhfYZHYYjvnRI=;
 b=UvQdNtxMWGq5IYOQ45LXn0NlLDqeJMKsctV5LN6nLGtfeDsxjL12EL49X2jYwoYKpOMn3c
 5GSz2VlQ+vmTwAJUc8NBJr4GDjJDHqgtP+9x39sEPlZbQ3mRPwD/jrSsxS7RAmX9xSdxNz
 Omfr8TbxqGaUOdGLNimIDYmdpd0mbLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-rW2fRqOvMiWGTFFGsAMOsA-1; Wed, 02 Dec 2020 03:09:09 -0500
X-MC-Unique: rW2fRqOvMiWGTFFGsAMOsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A19F75708B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BADC5D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 050/113] hw/char/serial: Clean up unnecessary code
Date: Wed,  2 Dec 2020 03:07:46 -0500
Message-Id: <20201202080849.4125477-51-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since commit 5ec3a23e6c8 ("serial: convert PIO to new memory
api read/write") we don't need to worry about accesses bigger
than 8-bit. Use the extract()/deposit() functions to access
the correct part of the 16-bit 'divider' register.

Reported-by: Jonathan D. Belanger <jbelanger1@rochester.rr.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1904331
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201120161933.2514089-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/serial.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 97f71879ff..62c627f486 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "hw/char/serial.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
@@ -338,11 +339,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     default:
     case 0:
         if (s->lcr & UART_LCR_DLAB) {
-            if (size == 1) {
-                s->divider = (s->divider & 0xff00) | val;
-            } else {
-                s->divider = val;
-            }
+            s->divider = deposit32(s->divider, 8 * addr, 8, val);
             serial_update_parameters(s);
         } else {
             s->thr = (uint8_t) val;
@@ -364,7 +361,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
         break;
     case 1:
         if (s->lcr & UART_LCR_DLAB) {
-            s->divider = (s->divider & 0x00ff) | (val << 8);
+            s->divider = deposit32(s->divider, 8 * addr, 8, val);
             serial_update_parameters(s);
         } else {
             uint8_t changed = (s->ier ^ val) & 0x0f;
@@ -478,7 +475,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
     default:
     case 0:
         if (s->lcr & UART_LCR_DLAB) {
-            ret = s->divider & 0xff;
+            ret = extract16(s->divider, 8 * addr, 8);
         } else {
             if(s->fcr & UART_FCR_FE) {
                 ret = fifo8_is_empty(&s->recv_fifo) ?
@@ -502,7 +499,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case 1:
         if (s->lcr & UART_LCR_DLAB) {
-            ret = (s->divider >> 8) & 0xff;
+            ret = extract16(s->divider, 8 * addr, 8);
         } else {
             ret = s->ier;
         }
-- 
2.26.2



