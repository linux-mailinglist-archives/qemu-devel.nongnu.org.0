Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B68242EDAB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:29:59 +0200 (CEST)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJXK-0000uj-Kc
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbJPh-0005NA-GC
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:22:05 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbJPe-0006Gv-OR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:22:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5A2EA748F58;
 Fri, 15 Oct 2021 11:21:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3E863748F57; Fri, 15 Oct 2021 11:21:59 +0200 (CEST)
In-Reply-To: <cover.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] via-ide: Set user_creatable to false
Date: Fri, 15 Oct 2021 11:16:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Message-Id: <20211015092159.3E863748F57@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This model only works as a function of the via superio chip not as a
standalone PCI device.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
This should be before the last patch changing via-ide or squshed into
it. And similar to usb part but there I need to add it to the info
struct. I can resend with these if you think this series worth the
hassle. The previous one fixing the usb irq works without this clean up.

 hw/ide/via.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 252d18f4ac..82def819c4 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -217,6 +217,9 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
 
     dc->reset = via_ide_reset;
     dc->vmsd = &vmstate_ide_pci;
+    /* Reason: only works as function of VIA southbridge */
+    dc->user_creatable = false;
+
     k->realize = via_ide_realize;
     k->exit = via_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_VIA;
-- 
2.21.4


