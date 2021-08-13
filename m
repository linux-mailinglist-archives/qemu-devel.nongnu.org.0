Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06353EBED8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:44:39 +0200 (CEST)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgqs-0002Iv-ML
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mEgjU-000147-AO
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:37:00 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mEgjS-0007Tb-In
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:36:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BD49223A3;
 Fri, 13 Aug 2021 23:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628897815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X/UKWplQSLmkRHtR3f8GCDp8miuTm7kUrc8RF1r2uTc=;
 b=dRlH+XctiKq1HwZHNC0aIv5uFsG4gB9tlc4luPK6NyIbaSpAGv52aS3risMETztHC5HU8v
 Q3mLNqs/dMAmQATr410Tp1a/6QPPzEwZK1xCNsGrl0Z9VNouxhbkQVPhENSd8ERtQR1x2Z
 HY28tCDHKzDXAUCCWOqZZFmO/ndg5Uo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628897815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X/UKWplQSLmkRHtR3f8GCDp8miuTm7kUrc8RF1r2uTc=;
 b=mzx7iruyEO30RitZesGHeDep2qWf2iXI0x7n4Zj9x7KSiQdRCeZFAuDELNcWaIw9pF5NHz
 1QR14IPaGDJ206Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1897013B06;
 Fri, 13 Aug 2021 23:36:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E+U4MxUCF2FuXwAAMHmgww
 (envelope-from <jziviani@suse.de>); Fri, 13 Aug 2021 23:36:53 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] vga: don't abort when adding a duplicate isa-vga device
Date: Fri, 13 Aug 2021 20:36:19 -0300
Message-Id: <20210813233619.32178-1-jziviani@suse.de>
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

That particular board registers such device automaticaly, so it's
not obvious that a VGA device already exists. This patch changes
this behavior by displaying a message and ignoring that device,
starting qemu normally.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 hw/display/vga-isa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 90851e730b..69db502dde 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -61,6 +61,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
+    /*
+     * some machines register VGA by default, so instead of aborting
+     * it, show a message and ignore this device.
+     */
+    if (qemu_ram_block_by_name("vga.vram")) {
+        error_report("vga.vram is already registered, ignoring this device");
+        return;
+    }
+
     s->global_vmstate = true;
     vga_common_init(s, OBJECT(dev));
     s->legacy_address_space = isa_address_space(isadev);
-- 
2.32.0


