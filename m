Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FD2F0374
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 21:33:10 +0100 (CET)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyKv7-0001sT-Hz
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 15:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsL-0008Rb-Cy
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsD-0007CO-22
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:15 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1577B747638;
 Sat,  9 Jan 2021 21:29:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6634F7475FD; Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Message-Id: <d0a806fed5e8055aee4fcf5b2f4790e6dd0f9dc6.1610223397.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1610223396.git.balaton@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 05/13] vt82c686: Set user_creatable=false for VT82C686B_PM
Date: Sat, 09 Jan 2021 21:16:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device is part of the multifunction VIA superio/south bridge chip
so not useful in itself.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index fc2a1f4430..9b16660e9d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -200,8 +200,9 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
     k->revision = 0x40;
     dc->reset = vt82c686b_pm_reset;
     dc->desc = "PM";
+    /* Reason: part of VIA south bridge, does not exist stand alone */
+    dc->user_creatable = false;
     dc->vmsd = &vmstate_acpi;
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo via_pm_info = {
-- 
2.21.3


