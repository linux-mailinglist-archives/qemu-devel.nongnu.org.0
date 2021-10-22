Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A8437299
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:19:44 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdoq8-0003cC-0f
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdoni-0000xJ-MH
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003Id-4g
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M27Bp-1mgIhw0Oi1-002a87; Fri, 22
 Oct 2021 09:17:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] mac_via: add GPIO for A/UX mode
Date: Fri, 22 Oct 2021 09:17:00 +0200
Message-Id: <20211022071705.471954-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D1XaLNO/CCfD++noskQfzQUeB6ICQrIsbrSxSvKvvd1dsRQFW6O
 99e2J74PeiN1Z1EHfVhN22jtQrSDLMCNFfVys8uZ/DYz36VKxusxZ4fEi7Otbp43dCcnjUE
 bQC4ZXSmDi/Pizs12gFGuudvZXzfpktSJqB3O3fQSbUBPMlNGOlgx9bVX6c8LmTPd/Xoret
 2882xeyeFJwptiOBDDCag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ADBCcVZ20sU=:0GEQwtuvfVHynDAyfmp+hM
 0mK3pyf3GTEslaCukAfuO4J6WNaxFwpJgfnm32dob1WRrvuAkDsd6yH1KAgUwivszLuaj1q1V
 f2XGR9XzxtEEuRftz8kw+EpTDvZjVZkjgtg8DwJ1xzLYxzGYKiB72nwToMzaw0WqmiD+0Q6tY
 UtqvpcYa4sWnylEGB8O6IIw8ShLpIHdsAJKKe0W0bnisyFq4iHXvlK9weGtrtgG6RRZ3sVQI6
 xD21qKA1s0r2MQC9uidJtjq/D36lkoMgm1jhDQcrymFw/7yVF+wzLMaRqmC8z9szfep2rWTm+
 pSZW0xcjR2ILUG30NB0ymHL8gVLrd8iWlMuUDEH5OSP3hNYJUKPUz8z4KXqhQhIH/Gpm4tro+
 JfYQfnkOIjiTHLp2YlIcEUwk5zzZbAsXwU9TxyD8tuU20EvykRlcHBpOs+qM1Tday4XXuLI6S
 EbB7616BVQnIvhFhroMM2tHxOMjhstbiP2GHYDm+FmurfYUZyFwKRjk1Rvj2r4+sTzJgnmeXr
 aoSrg2ygUt+C+pMuP+ud15XVH6s1ja6P0thukMDYJGipSzdlSBksgrjOSZ0OTI8ZG/bYiVy/E
 vL84NZOVexfGdUiJdGhl2YO0heoNPNpiSpfZPtnbzMOwDWIBKoB2q92j+3HP1mWLpVaQeQmi0
 GJ/2D33KdhmMZ9YalB/E0xc3wg1efBz29RLe/0RxEG0iVGnyuO4L91ot7gKzAiqz6zoE=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Add a new auxmode GPIO that is updated when port B bit 6 is changed indicating
whether the hardware is configured for A/UX mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/mac_via.h |  1 +
 hw/misc/mac_via.c         | 19 +++++++++++++++++++
 hw/misc/trace-events      |  1 +
 3 files changed, 21 insertions(+)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 4506abe5d0e3..b44556586601 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -43,6 +43,7 @@ struct MOS6522Q800VIA1State {
     MemoryRegion via_mem;
 
     qemu_irq irqs[VIA1_IRQ_NB];
+    qemu_irq auxmode_irq;
     uint8_t last_b;
 
     /* RTC */
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 7a53a8b4c04d..b378e6b30554 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -880,6 +880,21 @@ static void via1_adb_update(MOS6522Q800VIA1State *v1s)
     }
 }
 
+static void via1_auxmode_update(MOS6522Q800VIA1State *v1s)
+{
+    MOS6522State *s = MOS6522(v1s);
+    int oldirq, irq;
+
+    oldirq = (v1s->last_b & VIA1B_vMystery) ? 1 : 0;
+    irq = (s->b & VIA1B_vMystery) ? 1 : 0;
+
+    /* Check to see if the A/UX mode bit has changed */
+    if (irq != oldirq) {
+        trace_via1_auxmode(irq);
+        qemu_set_irq(v1s->auxmode_irq, irq);
+    }
+}
+
 static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
@@ -902,6 +917,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
     case VIA_REG_B:
         via1_rtc_update(v1s);
         via1_adb_update(v1s);
+        via1_auxmode_update(v1s);
 
         v1s->last_b = ms->b;
         break;
@@ -1046,6 +1062,9 @@ static void mos6522_q800_via1_init(Object *obj)
               TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
 
     qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
+
+    /* A/UX mode */
+    qdev_init_gpio_out(DEVICE(obj), &v1s->auxmode_irq, 1);
 }
 
 static const VMStateDescription vmstate_q800_via1 = {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index ede413965b6c..2da96d167a7b 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -228,6 +228,7 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
 via1_adb_send(const char *state, uint8_t data, const char *vadbint) "state %s data=0x%02x vADBInt=%s"
 via1_adb_receive(const char *state, uint8_t data, const char *vadbint, int status, int index, int size) "state %s data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
 via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size) "data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
+via1_auxmode(int mode) "setting auxmode to %d"
 
 # grlib_ahb_apb_pnp.c
 grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
-- 
2.31.1


