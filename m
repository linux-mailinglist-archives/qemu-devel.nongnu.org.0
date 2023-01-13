Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E23669A21
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:30:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnS-0001lj-P0; Fri, 13 Jan 2023 09:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmp-00015S-QA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003oi-8b
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17449822wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c7XGJQLnyfKX1vBajpS8zvsUCj272U0606U4cygYrzo=;
 b=zGVO1oweDDPiYavOyAa3kTQxvI6grJoMoFKhSuJulY8nj7WvZp3asYPlb+p/HTCDwX
 QLJ6rTaeawd2fHaiScoIuQY3LFUXAqyqkcmknugC82jtRYjc8TRvkS+kZM4vbA1+Tvqz
 QC5zAzI5x/4mIP24ljbiyTTA5F7Gy61iAaO83/b1tIyB56BOJ5RHEd9jewidYHidm82j
 ZsZj8xe5aEFiyIydtDXUPQDm7OqR6cHQpFxN2+bA09cuuu+okLgl4BLUzjdVdR6efn6R
 vwkZrK7/pACKT4Zp93iDMXa5obEyPdL/emNKzlhB34+DIGwqRZLuxTt8H6cNPIBQmyPS
 bO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7XGJQLnyfKX1vBajpS8zvsUCj272U0606U4cygYrzo=;
 b=plPb+1Tmbj+lebYBBK8yno2QaH6bfIBZPN75d8a4veU5bRs9BKlmJybhryoYVAURWR
 hiGsBhunwlyFsxMkEFt+EY/07La8Tk6t+29sirDRHhPyjr5j9AoAjXnLINLynsDzfOyR
 khEQxg4O2UNsIzfxKgImq+0irbGXXXv+6FoOv3aDOseusw7vLkz65MjsU9JKAkdXKkZE
 B8gb38d95WCWW+1WFTor6lgyuSm19dq2VRwx0A8xvZlotfpit/9m1NtG4r1+MqmqlLes
 s0KRkrzvHVXk+soTatcF9VqQFKWOACN3fbg3MyieaATSjPimgD7SLdT1/IfsDMU7nOj1
 KOrw==
X-Gm-Message-State: AFqh2krQQ2m1LkIxVPJHAHm/HhYwB9l+EX819yZ6RMwW+2894x+5bs3x
 BTxtr0RDbz2ndXhPB8DumWrmPj+wc5XtB6Ni
X-Google-Smtp-Source: AMrXdXtmbqSb9Ga5+cwEuYOBdVDydwyEIeLjHIBbLDCiOn5fJMlcd79vN1T1klfr4sB1bZaL5A3/1g==
X-Received: by 2002:a05:600c:8505:b0:3da:f89:bc46 with SMTP id
 gw5-20020a05600c850500b003da0f89bc46mr6598738wmb.17.1673619110337; 
 Fri, 13 Jan 2023 06:11:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/38] hw/arm/omap: Drop useless casts from void * to pointer
Date: Fri, 13 Jan 2023 14:11:14 +0000
Message-Id: <20230113141126.535646-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c            | 115 ++++++++++++++++++--------------------
 hw/arm/omap2.c            |  40 ++++++-------
 hw/arm/omap_sx1.c         |   2 +-
 hw/arm/palm.c             |   2 +-
 hw/char/omap_uart.c       |   7 +--
 hw/display/omap_dss.c     |  15 +++--
 hw/display/omap_lcdc.c    |   9 ++-
 hw/dma/omap_dma.c         |  15 +++--
 hw/gpio/omap_gpio.c       |  15 +++--
 hw/intc/omap_intc.c       |  12 ++--
 hw/misc/omap_gpmc.c       |  12 ++--
 hw/misc/omap_l4.c         |   7 +--
 hw/misc/omap_sdrc.c       |   7 +--
 hw/misc/omap_tap.c        |   5 +-
 hw/sd/omap_mmc.c          |   9 ++-
 hw/ssi/omap_spi.c         |   7 +--
 hw/timer/omap_gptimer.c   |  22 ++++----
 hw/timer/omap_synctimer.c |   4 +-
 18 files changed, 142 insertions(+), 163 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index f693faa43e0..559c066ce90 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -176,7 +176,7 @@ static void omap_timer_fire(void *opaque)
 
 static void omap_timer_tick(void *opaque)
 {
-    struct omap_mpu_timer_s *timer = (struct omap_mpu_timer_s *) opaque;
+    struct omap_mpu_timer_s *timer = opaque;
 
     omap_timer_sync(timer);
     omap_timer_fire(timer);
@@ -185,7 +185,7 @@ static void omap_timer_tick(void *opaque)
 
 static void omap_timer_clk_update(void *opaque, int line, int on)
 {
-    struct omap_mpu_timer_s *timer = (struct omap_mpu_timer_s *) opaque;
+    struct omap_mpu_timer_s *timer = opaque;
 
     omap_timer_sync(timer);
     timer->rate = on ? omap_clk_getrate(timer->clk) : 0;
@@ -202,7 +202,7 @@ static void omap_timer_clk_setup(struct omap_mpu_timer_s *timer)
 static uint64_t omap_mpu_timer_read(void *opaque, hwaddr addr,
                                     unsigned size)
 {
-    struct omap_mpu_timer_s *s = (struct omap_mpu_timer_s *) opaque;
+    struct omap_mpu_timer_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -226,7 +226,7 @@ static uint64_t omap_mpu_timer_read(void *opaque, hwaddr addr,
 static void omap_mpu_timer_write(void *opaque, hwaddr addr,
                                  uint64_t value, unsigned size)
 {
-    struct omap_mpu_timer_s *s = (struct omap_mpu_timer_s *) opaque;
+    struct omap_mpu_timer_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -308,7 +308,7 @@ struct omap_watchdog_timer_s {
 static uint64_t omap_wd_timer_read(void *opaque, hwaddr addr,
                                    unsigned size)
 {
-    struct omap_watchdog_timer_s *s = (struct omap_watchdog_timer_s *) opaque;
+    struct omap_watchdog_timer_s *s = opaque;
 
     if (size != 2) {
         return omap_badwidth_read16(opaque, addr);
@@ -333,7 +333,7 @@ static uint64_t omap_wd_timer_read(void *opaque, hwaddr addr,
 static void omap_wd_timer_write(void *opaque, hwaddr addr,
                                 uint64_t value, unsigned size)
 {
-    struct omap_watchdog_timer_s *s = (struct omap_watchdog_timer_s *) opaque;
+    struct omap_watchdog_timer_s *s = opaque;
 
     if (size != 2) {
         omap_badwidth_write16(opaque, addr, value);
@@ -431,7 +431,7 @@ struct omap_32khz_timer_s {
 static uint64_t omap_os_timer_read(void *opaque, hwaddr addr,
                                    unsigned size)
 {
-    struct omap_32khz_timer_s *s = (struct omap_32khz_timer_s *) opaque;
+    struct omap_32khz_timer_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 4) {
@@ -458,7 +458,7 @@ static uint64_t omap_os_timer_read(void *opaque, hwaddr addr,
 static void omap_os_timer_write(void *opaque, hwaddr addr,
                                 uint64_t value, unsigned size)
 {
-    struct omap_32khz_timer_s *s = (struct omap_32khz_timer_s *) opaque;
+    struct omap_32khz_timer_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 4) {
@@ -532,7 +532,7 @@ static struct omap_32khz_timer_s *omap_os_timer_init(MemoryRegion *memory,
 static uint64_t omap_ulpd_pm_read(void *opaque, hwaddr addr,
                                   unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     uint16_t ret;
 
     if (size != 2) {
@@ -600,7 +600,7 @@ static inline void omap_ulpd_req_update(struct omap_mpu_state_s *s,
 static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
                                uint64_t value, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     int64_t now, ticks;
     int div, mult;
     static const int bypass_div[4] = { 1, 2, 4, 4 };
@@ -765,7 +765,7 @@ static void omap_ulpd_pm_init(MemoryRegion *system_memory,
 static uint64_t omap_pin_cfg_read(void *opaque, hwaddr addr,
                                   unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -876,7 +876,7 @@ static inline void omap_pin_modconf1_update(struct omap_mpu_state_s *s,
 static void omap_pin_cfg_write(void *opaque, hwaddr addr,
                                uint64_t value, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     uint32_t diff;
 
     if (size != 4) {
@@ -988,7 +988,7 @@ static void omap_pin_cfg_init(MemoryRegion *system_memory,
 static uint64_t omap_id_read(void *opaque, hwaddr addr,
                              unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -1070,7 +1070,7 @@ static void omap_id_init(MemoryRegion *memory, struct omap_mpu_state_s *mpu)
 static uint64_t omap_mpui_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -1103,7 +1103,7 @@ static uint64_t omap_mpui_read(void *opaque, hwaddr addr,
 static void omap_mpui_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -1168,7 +1168,7 @@ struct omap_tipb_bridge_s {
 static uint64_t omap_tipb_bridge_read(void *opaque, hwaddr addr,
                                       unsigned size)
 {
-    struct omap_tipb_bridge_s *s = (struct omap_tipb_bridge_s *) opaque;
+    struct omap_tipb_bridge_s *s = opaque;
 
     if (size < 2) {
         return omap_badwidth_read16(opaque, addr);
@@ -1198,7 +1198,7 @@ static uint64_t omap_tipb_bridge_read(void *opaque, hwaddr addr,
 static void omap_tipb_bridge_write(void *opaque, hwaddr addr,
                                    uint64_t value, unsigned size)
 {
-    struct omap_tipb_bridge_s *s = (struct omap_tipb_bridge_s *) opaque;
+    struct omap_tipb_bridge_s *s = opaque;
 
     if (size < 2) {
         omap_badwidth_write16(opaque, addr, value);
@@ -1269,7 +1269,7 @@ static struct omap_tipb_bridge_s *omap_tipb_bridge_init(
 static uint64_t omap_tcmi_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     uint32_t ret;
 
     if (size != 4) {
@@ -1307,7 +1307,7 @@ static uint64_t omap_tcmi_read(void *opaque, hwaddr addr,
 static void omap_tcmi_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -1384,7 +1384,7 @@ struct dpll_ctl_s {
 static uint64_t omap_dpll_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct dpll_ctl_s *s = (struct dpll_ctl_s *) opaque;
+    struct dpll_ctl_s *s = opaque;
 
     if (size != 2) {
         return omap_badwidth_read16(opaque, addr);
@@ -1400,7 +1400,7 @@ static uint64_t omap_dpll_read(void *opaque, hwaddr addr,
 static void omap_dpll_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct dpll_ctl_s *s = (struct dpll_ctl_s *) opaque;
+    struct dpll_ctl_s *s = opaque;
     uint16_t diff;
     static const int bypass_div[4] = { 1, 2, 4, 4 };
     int div, mult;
@@ -1464,7 +1464,7 @@ static struct dpll_ctl_s  *omap_dpll_init(MemoryRegion *memory,
 static uint64_t omap_clkm_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 2) {
         return omap_badwidth_read16(opaque, addr);
@@ -1668,7 +1668,7 @@ static inline void omap_clkm_ckout1_update(struct omap_mpu_state_s *s,
 static void omap_clkm_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     uint16_t diff;
     omap_clk clk;
     static const char *clkschemename[8] = {
@@ -1756,7 +1756,7 @@ static const MemoryRegionOps omap_clkm_ops = {
 static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
                                  unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     CPUState *cpu = CPU(s->cpu);
 
     if (size != 2) {
@@ -1801,7 +1801,7 @@ static inline void omap_clkdsp_idlect2_update(struct omap_mpu_state_s *s,
 static void omap_clkdsp_write(void *opaque, hwaddr addr,
                               uint64_t value, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
     uint16_t diff;
 
     if (size != 2) {
@@ -1911,7 +1911,7 @@ struct omap_mpuio_s {
 
 static void omap_mpuio_set(void *opaque, int line, int level)
 {
-    struct omap_mpuio_s *s = (struct omap_mpuio_s *) opaque;
+    struct omap_mpuio_s *s = opaque;
     uint16_t prev = s->inputs;
 
     if (level)
@@ -1947,7 +1947,7 @@ static void omap_mpuio_kbd_update(struct omap_mpuio_s *s)
 static uint64_t omap_mpuio_read(void *opaque, hwaddr addr,
                                 unsigned size)
 {
-    struct omap_mpuio_s *s = (struct omap_mpuio_s *) opaque;
+    struct omap_mpuio_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
     uint16_t ret;
 
@@ -2007,7 +2007,7 @@ static uint64_t omap_mpuio_read(void *opaque, hwaddr addr,
 static void omap_mpuio_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
-    struct omap_mpuio_s *s = (struct omap_mpuio_s *) opaque;
+    struct omap_mpuio_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
     uint16_t diff;
     int ln;
@@ -2104,7 +2104,7 @@ static void omap_mpuio_reset(struct omap_mpuio_s *s)
 
 static void omap_mpuio_onoff(void *opaque, int line, int on)
 {
-    struct omap_mpuio_s *s = (struct omap_mpuio_s *) opaque;
+    struct omap_mpuio_s *s = opaque;
 
     s->clk = on;
     if (on)
@@ -2198,10 +2198,9 @@ static void omap_uwire_transfer_start(struct omap_uwire_s *s)
     }
 }
 
-static uint64_t omap_uwire_read(void *opaque, hwaddr addr,
-                                unsigned size)
+static uint64_t omap_uwire_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_uwire_s *s = (struct omap_uwire_s *) opaque;
+    struct omap_uwire_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 2) {
@@ -2235,7 +2234,7 @@ static uint64_t omap_uwire_read(void *opaque, hwaddr addr,
 static void omap_uwire_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
-    struct omap_uwire_s *s = (struct omap_uwire_s *) opaque;
+    struct omap_uwire_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 2) {
@@ -2351,10 +2350,9 @@ static void omap_pwl_update(struct omap_pwl_s *s)
     }
 }
 
-static uint64_t omap_pwl_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_pwl_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_pwl_s *s = (struct omap_pwl_s *) opaque;
+    struct omap_pwl_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
@@ -2374,7 +2372,7 @@ static uint64_t omap_pwl_read(void *opaque, hwaddr addr,
 static void omap_pwl_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_pwl_s *s = (struct omap_pwl_s *) opaque;
+    struct omap_pwl_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
@@ -2414,7 +2412,7 @@ static void omap_pwl_reset(struct omap_pwl_s *s)
 
 static void omap_pwl_clk_update(void *opaque, int line, int on)
 {
-    struct omap_pwl_s *s = (struct omap_pwl_s *) opaque;
+    struct omap_pwl_s *s = opaque;
 
     s->clk = on;
     omap_pwl_update(s);
@@ -2445,10 +2443,9 @@ struct omap_pwt_s {
     omap_clk clk;
 };
 
-static uint64_t omap_pwt_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_pwt_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_pwt_s *s = (struct omap_pwt_s *) opaque;
+    struct omap_pwt_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
@@ -2470,7 +2467,7 @@ static uint64_t omap_pwt_read(void *opaque, hwaddr addr,
 static void omap_pwt_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_pwt_s *s = (struct omap_pwt_s *) opaque;
+    struct omap_pwt_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
@@ -2577,10 +2574,9 @@ static void omap_rtc_alarm_update(struct omap_rtc_s *s)
         printf("%s: conversion failed\n", __func__);
 }
 
-static uint64_t omap_rtc_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_rtc_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_rtc_s *s = (struct omap_rtc_s *) opaque;
+    struct omap_rtc_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
     uint8_t i;
 
@@ -2662,7 +2658,7 @@ static uint64_t omap_rtc_read(void *opaque, hwaddr addr,
 static void omap_rtc_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_rtc_s *s = (struct omap_rtc_s *) opaque;
+    struct omap_rtc_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
     struct tm new_tm;
     time_t ti[2];
@@ -3034,7 +3030,7 @@ static void omap_mcbsp_rx_newdata(struct omap_mcbsp_s *s)
 
 static void omap_mcbsp_source_tick(void *opaque)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
     static const int bps[8] = { 0, 1, 1, 2, 2, 2, -255, -255 };
 
     if (!s->rx_rate)
@@ -3080,7 +3076,7 @@ static void omap_mcbsp_tx_newdata(struct omap_mcbsp_s *s)
 
 static void omap_mcbsp_sink_tick(void *opaque)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
     static const int bps[8] = { 0, 1, 1, 2, 2, 2, -255, -255 };
 
     if (!s->tx_rate)
@@ -3173,7 +3169,7 @@ static void omap_mcbsp_req_update(struct omap_mcbsp_s *s)
 static uint64_t omap_mcbsp_read(void *opaque, hwaddr addr,
                                 unsigned size)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
     uint16_t ret;
 
@@ -3271,7 +3267,7 @@ static uint64_t omap_mcbsp_read(void *opaque, hwaddr addr,
 static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
                 uint32_t value)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     switch (offset) {
@@ -3407,7 +3403,7 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
 static void omap_mcbsp_writew(void *opaque, hwaddr addr,
                 uint32_t value)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (offset == 0x04) {				/* DXR */
@@ -3498,7 +3494,7 @@ static struct omap_mcbsp_s *omap_mcbsp_init(MemoryRegion *system_memory,
 
 static void omap_mcbsp_i2s_swallow(void *opaque, int line, int level)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
 
     if (s->rx_rate) {
         s->rx_req = s->codec->in.len;
@@ -3508,7 +3504,7 @@ static void omap_mcbsp_i2s_swallow(void *opaque, int line, int level)
 
 static void omap_mcbsp_i2s_start(void *opaque, int line, int level)
 {
-    struct omap_mcbsp_s *s = (struct omap_mcbsp_s *) opaque;
+    struct omap_mcbsp_s *s = opaque;
 
     if (s->tx_rate) {
         s->tx_req = s->codec->out.size;
@@ -3590,10 +3586,9 @@ static void omap_lpg_reset(struct omap_lpg_s *s)
     omap_lpg_update(s);
 }
 
-static uint64_t omap_lpg_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_lpg_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_lpg_s *s = (struct omap_lpg_s *) opaque;
+    struct omap_lpg_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
@@ -3615,7 +3610,7 @@ static uint64_t omap_lpg_read(void *opaque, hwaddr addr,
 static void omap_lpg_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_lpg_s *s = (struct omap_lpg_s *) opaque;
+    struct omap_lpg_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
@@ -3650,7 +3645,7 @@ static const MemoryRegionOps omap_lpg_ops = {
 
 static void omap_lpg_clk_update(void *opaque, int line, int on)
 {
-    struct omap_lpg_s *s = (struct omap_lpg_s *) opaque;
+    struct omap_lpg_s *s = opaque;
 
     s->clk = on;
     omap_lpg_update(s);
@@ -3713,7 +3708,7 @@ static void omap_setup_mpui_io(MemoryRegion *system_memory,
 /* General chip reset */
 static void omap1_mpu_reset(void *opaque)
 {
-    struct omap_mpu_state_s *mpu = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *mpu = opaque;
 
     omap_dma_reset(mpu->dma);
     omap_mpu_timer_reset(mpu->timer[0]);
@@ -3793,7 +3788,7 @@ static void omap_setup_dsp_mapping(MemoryRegion *system_memory,
 
 void omap_mpu_wakeup(void *opaque, int irq, int req)
 {
-    struct omap_mpu_state_s *mpu = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *mpu = opaque;
     CPUState *cpu = CPU(mpu->cpu);
 
     if (cpu->halted) {
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 8571eedd736..366d6af1b66 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -167,7 +167,7 @@ static inline void omap_eac_out_empty(struct omap_eac_s *s)
 
 static void omap_eac_in_cb(void *opaque, int avail_b)
 {
-    struct omap_eac_s *s = (struct omap_eac_s *) opaque;
+    struct omap_eac_s *s = opaque;
 
     s->codec.rxavail = avail_b >> 2;
     omap_eac_in_refill(s);
@@ -177,7 +177,7 @@ static void omap_eac_in_cb(void *opaque, int avail_b)
 
 static void omap_eac_out_cb(void *opaque, int free_b)
 {
-    struct omap_eac_s *s = (struct omap_eac_s *) opaque;
+    struct omap_eac_s *s = opaque;
 
     s->codec.txavail = free_b >> 2;
     if (s->codec.txlen)
@@ -333,10 +333,9 @@ static void omap_eac_reset(struct omap_eac_s *s)
     omap_eac_interrupt_update(s);
 }
 
-static uint64_t omap_eac_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_eac_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_eac_s *s = (struct omap_eac_s *) opaque;
+    struct omap_eac_s *s = opaque;
     uint32_t ret;
 
     if (size != 2) {
@@ -452,7 +451,7 @@ static uint64_t omap_eac_read(void *opaque, hwaddr addr,
 static void omap_eac_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_eac_s *s = (struct omap_eac_s *) opaque;
+    struct omap_eac_s *s = opaque;
 
     if (size != 2) {
         omap_badwidth_write16(opaque, addr, value);
@@ -656,7 +655,7 @@ static void omap_sti_reset(struct omap_sti_s *s)
 static uint64_t omap_sti_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
-    struct omap_sti_s *s = (struct omap_sti_s *) opaque;
+    struct omap_sti_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -697,7 +696,7 @@ static uint64_t omap_sti_read(void *opaque, hwaddr addr,
 static void omap_sti_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_sti_s *s = (struct omap_sti_s *) opaque;
+    struct omap_sti_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -751,8 +750,7 @@ static const MemoryRegionOps omap_sti_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static uint64_t omap_sti_fifo_read(void *opaque, hwaddr addr,
-                                   unsigned size)
+static uint64_t omap_sti_fifo_read(void *opaque, hwaddr addr, unsigned size)
 {
     OMAP_BAD_REG(addr);
     return 0;
@@ -761,7 +759,7 @@ static uint64_t omap_sti_fifo_read(void *opaque, hwaddr addr,
 static void omap_sti_fifo_write(void *opaque, hwaddr addr,
                                 uint64_t value, unsigned size)
 {
-    struct omap_sti_s *s = (struct omap_sti_s *) opaque;
+    struct omap_sti_s *s = opaque;
     int ch = addr >> 6;
     uint8_t byte = value;
 
@@ -1057,7 +1055,7 @@ static void omap_prcm_int_update(struct omap_prcm_s *s, int dom)
 static uint64_t omap_prcm_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_prcm_s *s = (struct omap_prcm_s *) opaque;
+    struct omap_prcm_s *s = opaque;
     uint32_t ret;
 
     if (size != 4) {
@@ -1369,7 +1367,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s *s)
 static void omap_prcm_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_prcm_s *s = (struct omap_prcm_s *) opaque;
+    struct omap_prcm_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -1849,7 +1847,7 @@ struct omap_sysctl_s {
 static uint32_t omap_sysctl_read8(void *opaque, hwaddr addr)
 {
 
-    struct omap_sysctl_s *s = (struct omap_sysctl_s *) opaque;
+    struct omap_sysctl_s *s = opaque;
     int pad_offset, byte_offset;
     int value;
 
@@ -1873,7 +1871,7 @@ static uint32_t omap_sysctl_read8(void *opaque, hwaddr addr)
 
 static uint32_t omap_sysctl_read(void *opaque, hwaddr addr)
 {
-    struct omap_sysctl_s *s = (struct omap_sysctl_s *) opaque;
+    struct omap_sysctl_s *s = opaque;
 
     switch (addr) {
     case 0x000:	/* CONTROL_REVISION */
@@ -1971,10 +1969,9 @@ static uint32_t omap_sysctl_read(void *opaque, hwaddr addr)
     return 0;
 }
 
-static void omap_sysctl_write8(void *opaque, hwaddr addr,
-                uint32_t value)
+static void omap_sysctl_write8(void *opaque, hwaddr addr, uint32_t value)
 {
-    struct omap_sysctl_s *s = (struct omap_sysctl_s *) opaque;
+    struct omap_sysctl_s *s = opaque;
     int pad_offset, byte_offset;
     int prev_value;
 
@@ -1995,10 +1992,9 @@ static void omap_sysctl_write8(void *opaque, hwaddr addr,
     }
 }
 
-static void omap_sysctl_write(void *opaque, hwaddr addr,
-                uint32_t value)
+static void omap_sysctl_write(void *opaque, hwaddr addr, uint32_t value)
 {
-    struct omap_sysctl_s *s = (struct omap_sysctl_s *) opaque;
+    struct omap_sysctl_s *s = opaque;
 
     switch (addr) {
     case 0x000:	/* CONTROL_REVISION */
@@ -2233,7 +2229,7 @@ static struct omap_sysctl_s *omap_sysctl_init(struct omap_target_agent_s *ta,
 /* General chip reset */
 static void omap2_mpu_reset(void *opaque)
 {
-    struct omap_mpu_state_s *mpu = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *mpu = opaque;
 
     omap_dma_reset(mpu->dma);
     omap_prcm_reset(mpu->prcm);
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 1d156bc3441..e7212920797 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -66,7 +66,7 @@
 static uint64_t static_read(void *opaque, hwaddr offset,
                             unsigned size)
 {
-    uint32_t *val = (uint32_t *) opaque;
+    uint32_t *val = opaque;
     uint32_t mask = (4 / size) - 1;
 
     return *val >> ((offset & mask) << 3);
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 68e11dd1ecc..1457f10c83a 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -115,7 +115,7 @@ static struct {
 
 static void palmte_button_event(void *opaque, int keycode)
 {
-    struct omap_mpu_state_s *cpu = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *cpu = opaque;
 
     if (palmte_keymap[keycode & 0x7f].row != -1)
         omap_mpuio_key(cpu->mpuio,
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index e8da9333782..1c890b92018 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -67,10 +67,9 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
     return s;
 }
 
-static uint64_t omap_uart_read(void *opaque, hwaddr addr,
-                               unsigned size)
+static uint64_t omap_uart_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_uart_s *s = (struct omap_uart_s *) opaque;
+    struct omap_uart_s *s = opaque;
 
     if (size == 4) {
         return omap_badwidth_read8(opaque, addr);
@@ -108,7 +107,7 @@ static uint64_t omap_uart_read(void *opaque, hwaddr addr,
 static void omap_uart_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_uart_s *s = (struct omap_uart_s *) opaque;
+    struct omap_uart_s *s = opaque;
 
     if (size == 4) {
         omap_badwidth_write8(opaque, addr, value);
diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 09e18407b46..f33fc7606d3 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -175,7 +175,7 @@ void omap_dss_reset(struct omap_dss_s *s)
 static uint64_t omap_diss_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_dss_s *s = (struct omap_dss_s *) opaque;
+    struct omap_dss_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -213,7 +213,7 @@ static uint64_t omap_diss_read(void *opaque, hwaddr addr,
 static void omap_diss_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_dss_s *s = (struct omap_dss_s *) opaque;
+    struct omap_dss_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -254,7 +254,7 @@ static const MemoryRegionOps omap_diss_ops = {
 static uint64_t omap_disc_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_dss_s *s = (struct omap_dss_s *) opaque;
+    struct omap_dss_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -379,7 +379,7 @@ static uint64_t omap_disc_read(void *opaque, hwaddr addr,
 static void omap_disc_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_dss_s *s = (struct omap_dss_s *) opaque;
+    struct omap_dss_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
@@ -669,10 +669,9 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
     omap_dispc_interrupt_update(s);
 }
 
-static uint64_t omap_rfbi_read(void *opaque, hwaddr addr,
-                               unsigned size)
+static uint64_t omap_rfbi_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_dss_s *s = (struct omap_dss_s *) opaque;
+    struct omap_dss_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -739,7 +738,7 @@ static uint64_t omap_rfbi_read(void *opaque, hwaddr addr,
 static void omap_rfbi_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_dss_s *s = (struct omap_dss_s *) opaque;
+    struct omap_dss_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 0ba42ef637c..3532a801be2 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -198,7 +198,7 @@ static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
 
 static void omap_update_display(void *opaque)
 {
-    struct omap_lcd_panel_s *omap_lcd = (struct omap_lcd_panel_s *) opaque;
+    struct omap_lcd_panel_s *omap_lcd = opaque;
     DisplaySurface *surface;
     drawfn draw_line;
     int size, height, first, last;
@@ -376,10 +376,9 @@ static void omap_lcd_update(struct omap_lcd_panel_s *s) {
     }
 }
 
-static uint64_t omap_lcdc_read(void *opaque, hwaddr addr,
-                               unsigned size)
+static uint64_t omap_lcdc_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_lcd_panel_s *s = (struct omap_lcd_panel_s *) opaque;
+    struct omap_lcd_panel_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* LCD_CONTROL */
@@ -412,7 +411,7 @@ static uint64_t omap_lcdc_read(void *opaque, hwaddr addr,
 static void omap_lcdc_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_lcd_panel_s *s = (struct omap_lcd_panel_s *) opaque;
+    struct omap_lcd_panel_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* LCD_CONTROL */
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 6677237d42a..c6e35ba4b80 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -1454,10 +1454,9 @@ static int omap_dma_sys_read(struct omap_dma_s *s, int offset,
     return 0;
 }
 
-static uint64_t omap_dma_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_dma_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_dma_s *s = (struct omap_dma_s *) opaque;
+    struct omap_dma_s *s = opaque;
     int reg, ch;
     uint16_t ret;
 
@@ -1505,7 +1504,7 @@ static uint64_t omap_dma_read(void *opaque, hwaddr addr,
 static void omap_dma_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
-    struct omap_dma_s *s = (struct omap_dma_s *) opaque;
+    struct omap_dma_s *s = opaque;
     int reg, ch;
 
     if (size != 2) {
@@ -1557,7 +1556,7 @@ static const MemoryRegionOps omap_dma_ops = {
 
 static void omap_dma_request(void *opaque, int drq, int req)
 {
-    struct omap_dma_s *s = (struct omap_dma_s *) opaque;
+    struct omap_dma_s *s = opaque;
     /* The request pins are level triggered in QEMU.  */
     if (req) {
         if (~s->dma->drqbmp & (1ULL << drq)) {
@@ -1571,7 +1570,7 @@ static void omap_dma_request(void *opaque, int drq, int req)
 /* XXX: this won't be needed once soc_dma knows about clocks.  */
 static void omap_dma_clk_update(void *opaque, int line, int on)
 {
-    struct omap_dma_s *s = (struct omap_dma_s *) opaque;
+    struct omap_dma_s *s = opaque;
     int i;
 
     s->dma->freq = omap_clk_getrate(s->clk);
@@ -1703,7 +1702,7 @@ static void omap_dma_interrupts_4_update(struct omap_dma_s *s)
 static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_dma_s *s = (struct omap_dma_s *) opaque;
+    struct omap_dma_s *s = opaque;
     int irqn = 0, chnum;
     struct omap_dma_channel_s *ch;
 
@@ -1859,7 +1858,7 @@ static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
 static void omap_dma4_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_dma_s *s = (struct omap_dma_s *) opaque;
+    struct omap_dma_s *s = opaque;
     int chnum, irqn = 0;
     struct omap_dma_channel_s *ch;
 
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 12ec16d1b03..b3cb3499bd1 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -72,7 +72,7 @@ static void omap_gpio_set(void *opaque, int line, int level)
 static uint64_t omap_gpio_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_gpio_s *s = (struct omap_gpio_s *) opaque;
+    struct omap_gpio_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 2) {
@@ -110,7 +110,7 @@ static uint64_t omap_gpio_read(void *opaque, hwaddr addr,
 static void omap_gpio_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_gpio_s *s = (struct omap_gpio_s *) opaque;
+    struct omap_gpio_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
     uint16_t diff;
     int ln;
@@ -309,7 +309,7 @@ static void omap2_gpio_module_reset(struct omap2_gpio_s *s)
 
 static uint32_t omap2_gpio_module_read(void *opaque, hwaddr addr)
 {
-    struct omap2_gpio_s *s = (struct omap2_gpio_s *) opaque;
+    struct omap2_gpio_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* GPIO_REVISION */
@@ -382,7 +382,7 @@ static uint32_t omap2_gpio_module_read(void *opaque, hwaddr addr)
 static void omap2_gpio_module_write(void *opaque, hwaddr addr,
                 uint32_t value)
 {
-    struct omap2_gpio_s *s = (struct omap2_gpio_s *) opaque;
+    struct omap2_gpio_s *s = opaque;
     uint32_t diff;
     int ln;
 
@@ -611,10 +611,9 @@ static void omap2_gpif_reset(DeviceState *dev)
     s->gpo = 0;
 }
 
-static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr,
-                                    unsigned size)
+static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap2_gpif_s *s = (struct omap2_gpif_s *) opaque;
+    struct omap2_gpif_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* IPGENERICOCPSPL_REVISION */
@@ -643,7 +642,7 @@ static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr,
 static void omap2_gpif_top_write(void *opaque, hwaddr addr,
                                  uint64_t value, unsigned size)
 {
-    struct omap2_gpif_s *s = (struct omap2_gpif_s *) opaque;
+    struct omap2_gpif_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* IPGENERICOCPSPL_REVISION */
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index d7183d035e9..9f6a71ce305 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -109,7 +109,7 @@ static inline void omap_inth_update(struct omap_intr_handler_s *s, int is_fiq)
 
 static void omap_set_intr(void *opaque, int irq, int req)
 {
-    struct omap_intr_handler_s *ih = (struct omap_intr_handler_s *) opaque;
+    struct omap_intr_handler_s *ih = opaque;
     uint32_t rise;
 
     struct omap_intr_handler_bank_s *bank = &ih->bank[irq >> 5];
@@ -136,7 +136,7 @@ static void omap_set_intr(void *opaque, int irq, int req)
 /* Simplified version with no edge detection */
 static void omap_set_intr_noedge(void *opaque, int irq, int req)
 {
-    struct omap_intr_handler_s *ih = (struct omap_intr_handler_s *) opaque;
+    struct omap_intr_handler_s *ih = opaque;
     uint32_t rise;
 
     struct omap_intr_handler_bank_s *bank = &ih->bank[irq >> 5];
@@ -156,7 +156,7 @@ static void omap_set_intr_noedge(void *opaque, int irq, int req)
 static uint64_t omap_inth_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_intr_handler_s *s = (struct omap_intr_handler_s *) opaque;
+    struct omap_intr_handler_s *s = opaque;
     int i, offset = addr;
     int bank_no = offset >> 8;
     int line_no;
@@ -234,7 +234,7 @@ static uint64_t omap_inth_read(void *opaque, hwaddr addr,
 static void omap_inth_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_intr_handler_s *s = (struct omap_intr_handler_s *) opaque;
+    struct omap_intr_handler_s *s = opaque;
     int i, offset = addr;
     int bank_no = offset >> 8;
     struct omap_intr_handler_bank_s *bank = &s->bank[bank_no];
@@ -423,7 +423,7 @@ static const TypeInfo omap_intc_info = {
 static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
                                 unsigned size)
 {
-    struct omap_intr_handler_s *s = (struct omap_intr_handler_s *) opaque;
+    struct omap_intr_handler_s *s = opaque;
     int offset = addr;
     int bank_no, line_no;
     struct omap_intr_handler_bank_s *bank = NULL;
@@ -504,7 +504,7 @@ static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
 static void omap2_inth_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
-    struct omap_intr_handler_s *s = (struct omap_intr_handler_s *) opaque;
+    struct omap_intr_handler_s *s = opaque;
     int offset = addr;
     int bank_no, line_no;
     struct omap_intr_handler_bank_s *bank = NULL;
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 10de7a55236..67158eb1649 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -126,7 +126,7 @@ static void omap_gpmc_dma_update(struct omap_gpmc_s *s, int value)
 static uint64_t omap_nand_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_gpmc_cs_file_s *f = (struct omap_gpmc_cs_file_s *)opaque;
+    struct omap_gpmc_cs_file_s *f = opaque;
     uint64_t v;
     nand_setpins(f->dev, 0, 0, 0, 1, 0);
     switch (omap_gpmc_devsize(f)) {
@@ -205,7 +205,7 @@ static void omap_nand_setio(DeviceState *dev, uint64_t value,
 static void omap_nand_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_gpmc_cs_file_s *f = (struct omap_gpmc_cs_file_s *)opaque;
+    struct omap_gpmc_cs_file_s *f = opaque;
     nand_setpins(f->dev, 0, 0, 0, 1, 0);
     omap_nand_setio(f->dev, value, omap_gpmc_devsize(f), size);
 }
@@ -290,7 +290,7 @@ static void fill_prefetch_fifo(struct omap_gpmc_s *s)
 static uint64_t omap_gpmc_prefetch_read(void *opaque, hwaddr addr,
                                         unsigned size)
 {
-    struct omap_gpmc_s *s = (struct omap_gpmc_s *) opaque;
+    struct omap_gpmc_s *s = opaque;
     uint32_t data;
     if (s->prefetch.config1 & 1) {
         /* The TRM doesn't define the behaviour if you read from the
@@ -320,7 +320,7 @@ static uint64_t omap_gpmc_prefetch_read(void *opaque, hwaddr addr,
 static void omap_gpmc_prefetch_write(void *opaque, hwaddr addr,
                                      uint64_t value, unsigned size)
 {
-    struct omap_gpmc_s *s = (struct omap_gpmc_s *) opaque;
+    struct omap_gpmc_s *s = opaque;
     int cs = prefetch_cs(s->prefetch.config1);
     if ((s->prefetch.config1 & 1) == 0) {
         /* The TRM doesn't define the behaviour of writing to the
@@ -509,7 +509,7 @@ static int gpmc_wordaccess_only(hwaddr addr)
 static uint64_t omap_gpmc_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_gpmc_s *s = (struct omap_gpmc_s *) opaque;
+    struct omap_gpmc_s *s = opaque;
     int cs;
     struct omap_gpmc_cs_file_s *f;
 
@@ -621,7 +621,7 @@ static uint64_t omap_gpmc_read(void *opaque, hwaddr addr,
 static void omap_gpmc_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_gpmc_s *s = (struct omap_gpmc_s *) opaque;
+    struct omap_gpmc_s *s = opaque;
     int cs;
     struct omap_gpmc_cs_file_s *f;
 
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
index 54aeaecd696..b7875489da3 100644
--- a/hw/misc/omap_l4.c
+++ b/hw/misc/omap_l4.c
@@ -52,10 +52,9 @@ hwaddr omap_l4_region_size(struct omap_target_agent_s *ta,
     return ta->start[region].size;
 }
 
-static uint64_t omap_l4ta_read(void *opaque, hwaddr addr,
-                               unsigned size)
+static uint64_t omap_l4ta_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_target_agent_s *s = (struct omap_target_agent_s *) opaque;
+    struct omap_target_agent_s *s = opaque;
 
     if (size != 2) {
         return omap_badwidth_read16(opaque, addr);
@@ -79,7 +78,7 @@ static uint64_t omap_l4ta_read(void *opaque, hwaddr addr,
 static void omap_l4ta_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_target_agent_s *s = (struct omap_target_agent_s *) opaque;
+    struct omap_target_agent_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index f2f72f6810b..6aa1b3ef7fb 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -31,10 +31,9 @@ void omap_sdrc_reset(struct omap_sdrc_s *s)
     s->config = 0x10;
 }
 
-static uint64_t omap_sdrc_read(void *opaque, hwaddr addr,
-                               unsigned size)
+static uint64_t omap_sdrc_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_sdrc_s *s = (struct omap_sdrc_s *) opaque;
+    struct omap_sdrc_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
@@ -89,7 +88,7 @@ static uint64_t omap_sdrc_read(void *opaque, hwaddr addr,
 static void omap_sdrc_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_sdrc_s *s = (struct omap_sdrc_s *) opaque;
+    struct omap_sdrc_s *s = opaque;
 
     if (size != 4) {
         omap_badwidth_write32(opaque, addr, value);
diff --git a/hw/misc/omap_tap.c b/hw/misc/omap_tap.c
index 3f595e8df7e..4d7fb7d85f1 100644
--- a/hw/misc/omap_tap.c
+++ b/hw/misc/omap_tap.c
@@ -23,10 +23,9 @@
 #include "hw/arm/omap.h"
 
 /* TEST-Chip-level TAP */
-static uint64_t omap_tap_read(void *opaque, hwaddr addr,
-                              unsigned size)
+static uint64_t omap_tap_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
+    struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
         return omap_badwidth_read32(opaque, addr);
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index b67def63813..edd3cf2a1eb 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -321,11 +321,10 @@ void omap_mmc_reset(struct omap_mmc_s *host)
     device_cold_reset(DEVICE(host->card));
 }
 
-static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
-                              unsigned size)
+static uint64_t omap_mmc_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint16_t i;
-    struct omap_mmc_s *s = (struct omap_mmc_s *) opaque;
+    struct omap_mmc_s *s = opaque;
 
     if (size != 2) {
         return omap_badwidth_read16(opaque, offset);
@@ -418,7 +417,7 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
                            uint64_t value, unsigned size)
 {
     int i;
-    struct omap_mmc_s *s = (struct omap_mmc_s *) opaque;
+    struct omap_mmc_s *s = opaque;
 
     if (size != 2) {
         omap_badwidth_write16(opaque, offset, value);
@@ -576,7 +575,7 @@ static const MemoryRegionOps omap_mmc_ops = {
 
 static void omap_mmc_cover_cb(void *opaque, int line, int level)
 {
-    struct omap_mmc_s *host = (struct omap_mmc_s *) opaque;
+    struct omap_mmc_s *host = opaque;
 
     if (!host->cdet_state && level) {
         host->status |= 0x0002;
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 7c7e689707a..8f85c3e3918 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -134,10 +134,9 @@ void omap_mcspi_reset(struct omap_mcspi_s *s)
     omap_mcspi_interrupt_update(s);
 }
 
-static uint64_t omap_mcspi_read(void *opaque, hwaddr addr,
-                                unsigned size)
+static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap_mcspi_s *s = (struct omap_mcspi_s *) opaque;
+    struct omap_mcspi_s *s = opaque;
     int ch = 0;
     uint32_t ret;
 
@@ -226,7 +225,7 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr,
 static void omap_mcspi_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
-    struct omap_mcspi_s *s = (struct omap_mcspi_s *) opaque;
+    struct omap_mcspi_s *s = opaque;
     int ch = 0;
 
     if (size != 4) {
diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index c407190138c..34e6af7aff5 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -159,7 +159,7 @@ static inline void omap_gp_timer_trigger(struct omap_gp_timer_s *timer)
 
 static void omap_gp_timer_tick(void *opaque)
 {
-    struct omap_gp_timer_s *timer = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *timer = opaque;
 
     if (!timer->ar) {
         timer->st = 0;
@@ -179,7 +179,7 @@ static void omap_gp_timer_tick(void *opaque)
 
 static void omap_gp_timer_match(void *opaque)
 {
-    struct omap_gp_timer_s *timer = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *timer = opaque;
 
     if (timer->trigger == gpt_trigger_both)
         omap_gp_timer_trigger(timer);
@@ -189,7 +189,7 @@ static void omap_gp_timer_match(void *opaque)
 
 static void omap_gp_timer_input(void *opaque, int line, int on)
 {
-    struct omap_gp_timer_s *s = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *s = opaque;
     int trigger;
 
     switch (s->capture) {
@@ -219,7 +219,7 @@ static void omap_gp_timer_input(void *opaque, int line, int on)
 
 static void omap_gp_timer_clk_update(void *opaque, int line, int on)
 {
-    struct omap_gp_timer_s *timer = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *timer = opaque;
 
     omap_gp_timer_sync(timer);
     timer->rate = on ? omap_clk_getrate(timer->clk) : 0;
@@ -262,7 +262,7 @@ void omap_gp_timer_reset(struct omap_gp_timer_s *s)
 
 static uint32_t omap_gp_timer_readw(void *opaque, hwaddr addr)
 {
-    struct omap_gp_timer_s *s = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* TIDR */
@@ -328,7 +328,7 @@ static uint32_t omap_gp_timer_readw(void *opaque, hwaddr addr)
 
 static uint32_t omap_gp_timer_readh(void *opaque, hwaddr addr)
 {
-    struct omap_gp_timer_s *s = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *s = opaque;
     uint32_t ret;
 
     if (addr & 2)
@@ -340,10 +340,9 @@ static uint32_t omap_gp_timer_readh(void *opaque, hwaddr addr)
     }
 }
 
-static void omap_gp_timer_write(void *opaque, hwaddr addr,
-                uint32_t value)
+static void omap_gp_timer_write(void *opaque, hwaddr addr, uint32_t value)
 {
-    struct omap_gp_timer_s *s = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* TIDR */
@@ -440,10 +439,9 @@ static void omap_gp_timer_write(void *opaque, hwaddr addr,
     }
 }
 
-static void omap_gp_timer_writeh(void *opaque, hwaddr addr,
-                uint32_t value)
+static void omap_gp_timer_writeh(void *opaque, hwaddr addr, uint32_t value)
 {
-    struct omap_gp_timer_s *s = (struct omap_gp_timer_s *) opaque;
+    struct omap_gp_timer_s *s = opaque;
 
     if (addr & 2)
         omap_gp_timer_write(opaque, addr, (value << 16) | s->writeh);
diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index 72b997939bd..d93a9344ede 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -39,7 +39,7 @@ void omap_synctimer_reset(struct omap_synctimer_s *s)
 
 static uint32_t omap_synctimer_readw(void *opaque, hwaddr addr)
 {
-    struct omap_synctimer_s *s = (struct omap_synctimer_s *) opaque;
+    struct omap_synctimer_s *s = opaque;
 
     switch (addr) {
     case 0x00:	/* 32KSYNCNT_REV */
@@ -55,7 +55,7 @@ static uint32_t omap_synctimer_readw(void *opaque, hwaddr addr)
 
 static uint32_t omap_synctimer_readh(void *opaque, hwaddr addr)
 {
-    struct omap_synctimer_s *s = (struct omap_synctimer_s *) opaque;
+    struct omap_synctimer_s *s = opaque;
     uint32_t ret;
 
     if (addr & 2)
-- 
2.34.1


