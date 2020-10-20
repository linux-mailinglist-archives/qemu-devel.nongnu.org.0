Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B35E290B56
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 20:34:36 +0200 (CEST)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTUYl-00029a-Kg
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 14:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSN-0007pq-AX; Fri, 16 Oct 2020 14:27:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57606
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSL-0000FL-RI; Fri, 16 Oct 2020 14:27:59 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSI-0003wP-Ec; Fri, 16 Oct 2020 19:27:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, f4bug@amsat.org,
 hpoussin@reactos.org, qemu-ppc@nongnu.org, atar4qemu@gmail.com,
 david@gibson.dropbear.id.au
Date: Fri, 16 Oct 2020 19:27:35 +0100
Message-Id: <20201016182739.22875-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
References: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/5] m48t59-isa: remove legacy m48t59_init_isa() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is no longer used within the codebase.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/rtc/m48t59-isa.c     | 25 -------------------------
 include/hw/rtc/m48t59.h |  2 --
 2 files changed, 27 deletions(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index cae315e488..dc21fb10a5 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -58,31 +58,6 @@ static M48txxInfo m48txx_isa_info[] = {
     }
 };
 
-Nvram *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
-                       int base_year, int model)
-{
-    ISADevice *isa_dev;
-    DeviceState *dev;
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(m48txx_isa_info); i++) {
-        if (m48txx_isa_info[i].size != size ||
-            m48txx_isa_info[i].model != model) {
-            continue;
-        }
-
-        isa_dev = isa_new(m48txx_isa_info[i].bus_name);
-        dev = DEVICE(isa_dev);
-        qdev_prop_set_uint32(dev, "iobase", io_base);
-        qdev_prop_set_int32(dev, "base-year", base_year);
-        isa_realize_and_unref(isa_dev, bus, &error_fatal);
-        return NVRAM(dev);
-    }
-
-    assert(false);
-    return NULL;
-}
-
 static uint32_t m48txx_isa_read(Nvram *obj, uint32_t addr)
 {
     M48txxISAState *d = M48TXX_ISA(obj);
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index 04abedf3b2..9defe578d1 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -47,8 +47,6 @@ struct NvramClass {
     void (*toggle_lock)(Nvram *obj, int lock);
 };
 
-Nvram *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
-                       int base_year, int type);
 Nvram *m48t59_init(qemu_irq IRQ, hwaddr mem_base,
                    uint32_t io_base, uint16_t size, int base_year,
                    int type);
-- 
2.20.1


