Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317046F838A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvBi-0001UW-WD; Fri, 05 May 2023 09:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dwagner@suse.de>)
 id 1puuIW-0006kN-Kp; Fri, 05 May 2023 08:12:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dwagner@suse.de>)
 id 1puuIV-0006cl-7b; Fri, 05 May 2023 08:12:28 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0EFB228F8;
 Fri,  5 May 2023 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683288743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDGBrYFJssc/Q1KX1ZzMsDCwxUBeHBBjo+AO5XR+/mk=;
 b=m19jnCoAMBLL0TKcBwMVdVlqV+eb8zuZbarBsY2kJmhbitAG85JYpC2Nm+Qf/Ru3oyL53x
 EBmLqpPie98sLlhyL8joh8Woj5AICQZ9fF8rtKrp8o28M5+DWFS+3jJ9flSwiIc1FbYGsb
 7ZEDvCLVnd521N2IgS2KIAwDkDtHoPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683288743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDGBrYFJssc/Q1KX1ZzMsDCwxUBeHBBjo+AO5XR+/mk=;
 b=mawZYYC7vA1ujQ5CK4xjvYp/XoZGLCCvDMSMiFVRLVkjJ6ICy26D5d2zMWBqpbZWw6LZOf
 Zbd1E+G+8iEvLcBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E362F13513;
 Fri,  5 May 2023 12:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RmF8N6fyVGRJLwAAMHmgww
 (envelope-from <dwagner@suse.de>); Fri, 05 May 2023 12:12:23 +0000
From: Daniel Wagner <dwagner@suse.de>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, Daniel Wagner <dwagner@suse.de>
Subject: [PATCH v1 1/1] hw/nvme: Add hotplug handler to nvme bus
Date: Fri,  5 May 2023 14:12:16 +0200
Message-Id: <20230505121216.30740-2-dwagner@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505121216.30740-1-dwagner@suse.de>
References: <20230505121216.30740-1-dwagner@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=dwagner@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 May 2023 09:09:27 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Support attaching/detaching namespaces during runtime.

Signed-off-by: Daniel Wagner <dwagner@suse.de>
---
 hw/nvme/ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac24eeb5ed5a..7bddbc644cae 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -8314,6 +8314,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev, dev->id);
+    qbus_set_bus_hotplug_handler(BUS(&n->bus));
 
     if (nvme_init_subsys(n, errp)) {
         return;
@@ -8540,10 +8541,22 @@ static const TypeInfo nvme_info = {
     },
 };
 
+static void nvme_bus_class_init(ObjectClass *oc, void *data)
+{
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+}
+
 static const TypeInfo nvme_bus_info = {
     .name = TYPE_NVME_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(NvmeBus),
+    .class_init = nvme_bus_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void nvme_register_types(void)
-- 
2.40.0


