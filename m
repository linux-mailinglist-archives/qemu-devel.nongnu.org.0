Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CAD33E88B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 05:47:06 +0100 (CET)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMO5J-0000GI-6O
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 00:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMO4P-0008Fc-NT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 00:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMO4L-0003x3-Oo
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 00:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615956364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vcyrGEK3wQ9liRA2vtdVMIVInNJMXL7nw/rK+TiPnaE=;
 b=OHd967NjOWwS/cBdAcwCIoGIAAcMeRliOFzqPS4yv/AvJNvboW2fHf390Wx6fO33fcMnq6
 M9cZOg6IREho9IR3ACyq6Ok52dvtceehQkMHkFHO87IcG1GQEVgoqb7HflHAb8tCkuz3La
 NJBWaGZJptSyd6g9Fg4ZkXQK9fKBGVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-WFpAOcPGNLmGQwVlzX8g-A-1; Wed, 17 Mar 2021 00:44:52 -0400
X-MC-Unique: WFpAOcPGNLmGQwVlzX8g-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E5B681746E;
 Wed, 17 Mar 2021 04:44:51 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-175.bne.redhat.com [10.64.54.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6775660875;
 Wed, 17 Mar 2021 04:44:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/char/pl011: Fix clock migration failure
Date: Wed, 17 Mar 2021 12:44:41 +0800
Message-Id: <20210317044441.112313-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, luc@lmichel.fr, qemu-devel@nongnu.org,
 f4bug@amsat.org, shan.gavin@gmail.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a added clock to trace buad rate change since v5.2.0 by
commit aac63e0e6ea3 ("hw/char/pl011: add a clock input"). The added
clock causes migration failure. For example, migration from v5.2.0
to v5.1.0 can fail with the following error messages:

   qemu-system-aarch64: error while loading state for instance 0x0 \
                        of device 'pl011'
   qemu-system-aarch64: load of migration failed: No such file or \
                        directory

This fixes the issue by reporting the baud rate change at post load
time so that the clock won't be migrated by sub-section to avoid the
migration failure.

Cc: qemu-stable@nongnu.org
Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/char/pl011.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c5621a195f..401bd28536 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -322,20 +322,20 @@ static const MemoryRegionOps pl011_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static const VMStateDescription vmstate_pl011_clock = {
-    .name = "pl011/clock",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_CLOCK(clk, PL011State),
-        VMSTATE_END_OF_LIST()
-    }
-};
+static int pl011_post_load(void *opaque, int version_id)
+{
+    PL011State *s = PL011(opaque);
+
+    pl011_trace_baudrate_change(s);
+
+    return 0;
+}
 
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
     .version_id = 2,
     .minimum_version_id = 2,
+    .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(readbuff, PL011State),
         VMSTATE_UINT32(flags, PL011State),
@@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_INT32(read_trigger, PL011State),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription * []) {
-        &vmstate_pl011_clock,
-        NULL
-    }
 };
 
 static Property pl011_properties[] = {
-- 
2.23.0


