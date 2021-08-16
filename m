Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63653ED40C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 14:38:14 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbsb-0005fN-MF
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 08:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mFbqq-0004o6-KF
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:36:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mFbqo-0000Zw-Kq
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:36:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60ACF21E57;
 Mon, 16 Aug 2021 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629117381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=w/gx9zC9nDJQjik8EhLrSBUMd173CrJPNYl562xWUpQ=;
 b=uccuvijV2gdwrjx0z8XM73xKleplCEOTSvDQO/FGGd9+aMTEyo/YokMAdMTYen5gpSW9VC
 sNRoJtHT4QvwiNPQiqDIZxx1MsENXQgbzLv3AxaHtPM/hxepeXl4149i3myUQNXarVWjPf
 cYeYuzr2t+h4nmCT6P7xDZCS4z4KiCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629117381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=w/gx9zC9nDJQjik8EhLrSBUMd173CrJPNYl562xWUpQ=;
 b=W3aPib71bpxTIlMtjfrUBh1tF+SbGm4yfOJ04gsHA8/samlSvsAJW5t/akCmN8GFCIBc4D
 AONKA9pqs2VRhSAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8E1613B0A;
 Mon, 16 Aug 2021 12:36:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dqTIJMNbGmEJewAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 16 Aug 2021 12:36:19 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] vga: don't abort when adding a duplicate isa-vga device
Date: Mon, 16 Aug 2021 09:36:11 -0300
Message-Id: <20210816123611.28183-1-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, kraxel@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If users try to add an isa-vga device that was already registered,
still in command line, qemu will crash:

$ qemu-system-mips64el -M pica61 -device isa-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)

That particular board registers the device automaticaly, so it's
not obvious that a VGA device already exists. This patch changes
this behavior by displaying a message and exiting without crashing.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 hw/display/vga-isa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 90851e730b..1fba33b22b 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -33,6 +33,7 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 #define TYPE_ISA_VGA "isa-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
@@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
+    /*
+     * make sure this device is not being added twice, if so
+     * exit without crashing qemu
+     */
+    if (qemu_ram_block_by_name("vga.vram")) {
+        error_setg(errp, "vga.vram is already registered");
+        return;
+    }
+
     s->global_vmstate = true;
     vga_common_init(s, OBJECT(dev));
     s->legacy_address_space = isa_address_space(isadev);
-- 
2.32.0


