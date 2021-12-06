Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B354469506
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:29:24 +0100 (CET)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muCBP-0007q1-Ar
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muCA1-00072i-9P
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:27:58 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:47802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muC9y-0000Te-Me
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:27:57 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A923F1FD2F;
 Mon,  6 Dec 2021 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638790068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B9mYm5Y6hadN/QQvHLGl2Wc1tOzHva0Vu/vH9VI5W3E=;
 b=MVd811S+1SqAXCHLQg+Ja14c6AvfEhQKctcddFD+ibpzB1LibRZDNkePhWmWsGBcSSM0ld
 eEWt7iX8muJZMQ4NS6ufYEy9d3gGzJTB5MWKNzWwU5xQ/SfXNakSa0wYWPoZq4+dX/XuTC
 i46PvbpEth480omlT27DVw4MCYkonHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638790068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B9mYm5Y6hadN/QQvHLGl2Wc1tOzHva0Vu/vH9VI5W3E=;
 b=eFPWTdzj+GHuGvtbcJeREJKSWJ7XmAcG71AemqXnVaa7YLYuUcbLv1hHlOlaqrSGS8lZZP
 2YkGfgxPoc746GDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FDA313BD9;
 Mon,  6 Dec 2021 11:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YoCoHbTzrWHEYwAAMHmgww
 (envelope-from <lizhang@suse.de>); Mon, 06 Dec 2021 11:27:48 +0000
From: Li Zhang <lizhang@suse.de>
To: pbonzini@redhat.com,
	cfontana@suse.de,
	qemu-devel@nongnu.org
Subject: [PATCH 1/1] kvm: Clear variables which may not be used
Date: Mon,  6 Dec 2021 12:27:38 +0100
Message-Id: <20211206112738.14893-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The variables msi, route in kvm_irqchip_send_msi may be uninitialised
values in some cases. It's necessary to clear them.

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 accel/kvm/kvm-all.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eecd8031cf..bd50dc6b80 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1913,10 +1913,8 @@ static KVMMSIRoute *kvm_lookup_msi_route(KVMState *s, MSIMessage msg)
 
 int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
 {
-    struct kvm_msi msi;
-    KVMMSIRoute *route;
-
     if (kvm_direct_msi_allowed) {
+        struct kvm_msi msi;
         msi.address_lo = (uint32_t)msg.address;
         msi.address_hi = msg.address >> 32;
         msi.data = le32_to_cpu(msg.data);
@@ -1926,6 +1924,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
         return kvm_vm_ioctl(s, KVM_SIGNAL_MSI, &msi);
     }
 
+    KVMMSIRoute *route;
     route = kvm_lookup_msi_route(s, msg);
     if (!route) {
         int virq;
-- 
2.31.1


