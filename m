Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5831EACD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:13:44 +0100 (CET)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCk3r-0002xP-OC
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lCjz7-0007Te-1r
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:08:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lCjz3-00053R-P0
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613657323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OxTwvwc4crIZ7nLlR0ttqEdt3XNAPWwjYlmpX9pW+uY=;
 b=Nbt8GviQ5nFpBsiWtgF2noHZY5UhtK7l+H5p8LqW/wFp/dLTGKWFM+zFyDCCljZUUu+H5o
 3D5f3oIiLC4xzJJxWFWWa14PU40fMGOYYh6bQ033EVXQEJYvUkvL6lN9CFapYh2Ze8i2/Y
 NZPP/atRlkyZCCf2y0uTpKUfTb/ZMk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-IzZE8n3POQeNQnvRHq4DbQ-1; Thu, 18 Feb 2021 09:08:39 -0500
X-MC-Unique: IzZE8n3POQeNQnvRHq4DbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05281107ACC7;
 Thu, 18 Feb 2021 14:08:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A18706F963;
 Thu, 18 Feb 2021 14:08:35 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] net: eepro100: validate various address values
Date: Thu, 18 Feb 2021 19:36:29 +0530
Message-Id: <20210218140629.373646-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While processing controller commands, eepro100 emulator gets
command unit(CU) base address OR receive unit (RU) base address
OR command block (CB) address from guest. If these values are not
checked, it may lead to an infinite loop kind of issues. Add checks
to avoid it.

Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/eepro100.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc..afa1c9b2aa 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
         bool bit_i;
         bool bit_nc;
         uint16_t ok_status = STATUS_OK;
-        s->cb_address = s->cu_base + s->cu_offset;
+        s->cb_address = s->cu_base + s->cu_offset;  /* uint32_t overflow */
+        assert (s->cb_address >= s->cu_base);
         read_cb(s);
         bit_el = ((s->tx.command & COMMAND_EL) != 0);
         bit_s = ((s->tx.command & COMMAND_S) != 0);
@@ -860,6 +861,7 @@ static void action_command(EEPRO100State *s)
         }
 
         s->cu_offset = s->tx.link;
+        assert(s->cu_offset > 0);
         TRACE(OTHER,
               logout("val=(cu start), status=0x%04x, command=0x%04x, link=0x%08x\n",
                      s->tx.status, s->tx.command, s->tx.link));
@@ -990,8 +992,10 @@ static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
         break;
     case CU_CMD_BASE:
         /* Load CU base. */
+        assert(get_cu_state(s) == cu_idle);
         TRACE(OTHER, logout("val=0x%02x (CU base address)\n", val));
         s->cu_base = e100_read_reg4(s, SCBPointer);
+        assert(!s->cu_base);
         break;
     case CU_DUMPSTATS:
         /* Dump and reset statistical counters. */
@@ -1048,8 +1052,10 @@ static void eepro100_ru_command(EEPRO100State * s, uint8_t val)
         break;
     case RX_ADDR_LOAD:
         /* Load RU base. */
+        assert(get_ru_state(s) == ru_idle);
         TRACE(OTHER, logout("val=0x%02x (RU base address)\n", val));
         s->ru_base = e100_read_reg4(s, SCBPointer);
+        assert(!s->ru_base);
         break;
     default:
         logout("val=0x%02x (undefined RU command)\n", val);
-- 
2.29.2


