Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15534440BE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 12:46:08 +0100 (CET)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miEiV-0005qQ-62
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 07:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1miEc6-0003xz-HK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 07:39:30 -0400
Received: from apollo.dupie.be ([2001:bc8:3f2a:101::1]:54758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1miEc3-0003Mz-DL
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 07:39:29 -0400
Received: from localhost.localdomain (unknown
 [IPv6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8])
 by apollo.dupie.be (Postfix) with ESMTPSA id 09F43152106D;
 Wed,  3 Nov 2021 12:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1635939563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lk8dVN5476VW8lCnEQBxcK403o6VQUdHc0vDrXYBJck=;
 b=JPKqxfAI0772SlDac9rOejQNvrsZn3mC1YxGT1099+lLtbzOMYYKl3vawHGSY7uYZZI+Bx
 qH99HFcJVTHL9JmE0jm236A8CfuXh6iTcRIumKDI+giTQj1xESXo3wQmPvJHerut5Wv8Wm
 x9UsnP7Ei9DQVdOt0jAOyfYDX9pTmikjB131e+ALxUond5Mgu8buOiBbnApA+u9jxG7DH3
 R/653d0XN4CNJ/HOc/tDO9880dNVSP0pxbUAlJ4owQ7nc1nE+RfOz6cXp5wz+aS1a/scOT
 Qr2E5+JKqCQXQsJnGNI/0nD86xGF6TqnPwQulo4W6vjhjxt+moM41/Ds6d7FUw==
From: Jean-Louis Dupond <jean-louis@dupond.be>
To: qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, mst@redhat.com,
 Jean-Louis Dupond <jean-louis@dupond.be>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2] Fix virtio-net-pci* "vectors" compat
Date: Wed,  3 Nov 2021 12:38:31 +0100
Message-Id: <20211103113830.22283-1-jean-louis@dupond.be>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:bc8:3f2a:101::1;
 envelope-from=jean-louis@dupond.be; helo=apollo.dupie.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

hw_compat_5_2 has an issue: it affects only "virtio-net-pci"
but not "virtio-net-pci-transitional" and
"virtio-net-pci-non-transitional".  The solution is to use the
"virtio-net-pci-base" type in compat_props.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1999141

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Jean-Louis Dupond <jean-louis@dupond.be>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e24e3e27db..b17a15508c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
-    { "virtio-net-pci", "vectors", "3"},
+    { "virtio-net-pci-base", "vectors", "3"},
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
-- 
2.33.1


