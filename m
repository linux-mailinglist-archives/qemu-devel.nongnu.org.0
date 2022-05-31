Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF5538DDD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:38:54 +0200 (CEST)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvyKz-0007YK-Fg
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvy8h-0008Ix-W3
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:26:12 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvy8X-0008AD-MO
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:26:11 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D4241F97B;
 Tue, 31 May 2022 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653989158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BMyW7YvYfdXoUUQ6CLwB02Lx4UJvEtP1magnfsvicy0=;
 b=S4X4Sp86n4Rf+1C0G1UB0pVtVXjdJzy4HIK6rQ7K6HYIm/g7dEL7Oy3g5/XahfgnwRyI8/
 ymru9s2CTZ/yUDQVeDav5lM294q9SqrCmufKPI32NbUVLc5TNjQA1GjqXUJi28tgLVwjnn
 i/YzBpToA+c7e45+EEdT1sZuY12KopQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653989158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BMyW7YvYfdXoUUQ6CLwB02Lx4UJvEtP1magnfsvicy0=;
 b=0Nbyj5bIxkZV8zmwh4WYZ+/FLzBP10GC3LvqAmDQ7BA2vWGW0E2Rtuyz97sQ0EiFkSvAPp
 AyfXuoBocLdKqzDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCA3A132F9;
 Tue, 31 May 2022 09:25:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nNtaMCXflWIBEQAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 31 May 2022 09:25:57 +0000
From: Claudio Fontana <cfontana@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>, Claudio Fontana <cfontana@suse.de>
Subject: [PATCH] pci: fix overflow in printf string formatting
Date: Tue, 31 May 2022 11:25:39 +0200
Message-Id: <20220531092540.10151-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 hw/pci/pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9b37f8000..6e7015329c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
 static char *pcibus_get_fw_dev_path(DeviceState *dev)
 {
     PCIDevice *d = (PCIDevice *)dev;
-    char path[50], name[33];
-    int off;
-
-    off = snprintf(path, sizeof(path), "%s@%x",
-                   pci_dev_fw_name(dev, name, sizeof name),
-                   PCI_SLOT(d->devfn));
-    if (PCI_FUNC(d->devfn))
-        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
-    return g_strdup(path);
+    char name[33];
+    int has_func = !!PCI_FUNC(d->devfn);
+
+    return g_strdup_printf("%s@%x%s%.*x",
+                           pci_dev_fw_name(dev, name, sizeof(name)),
+                           PCI_SLOT(d->devfn),
+                           has_func ? "," : "",
+                           has_func,
+                           PCI_FUNC(d->devfn));
 }
 
 static char *pcibus_get_dev_path(DeviceState *dev)
-- 
2.26.2


