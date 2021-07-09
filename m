Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBF3C2769
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:18:50 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tDF-0007iE-Ts
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t55-0001WR-47
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4u-0000ub-IO
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id p8so12880443wrr.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rfdm8hMp1rU2ugPXFVshopocV670fyDA7HBkl2H1lks=;
 b=NEx859oQbJPSqQpMMe44kUEz3saIt1n03EWV+Jvd8HDv6HFGDI9nCpx8XzEbHrIgO9
 1ZkVRTPvhskMV8IzOZFifcQWQXutRjtowyi40D5rlp+6ZWPqzem3csUJM7KemMZDMqnO
 I28AG0jgAXa3rFDfi4ceOwcRnxRttx3ie7A92Sf5iAF4G17yZubSG5UX6NQGnWP52uLg
 Hn4c9GBfSH9fyu0XRVJ00+8LSS2WvR/hfGatYPOLJLrrFeVkTSBGAMZmq8KSV8qXQ03s
 e7Wd3wxMkSH0VBw6ouEajqRz/JYGOKJwJ+iS/Eem66h+FLHiCgUXLqGbuo5gTBLdkOJ5
 5tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfdm8hMp1rU2ugPXFVshopocV670fyDA7HBkl2H1lks=;
 b=apS5zfmN6L1QwdIpp9cjkIWOUhsk0DqQZWXTJhlI+35FNh6ohPnCdI+fGAPryBYnKG
 +pAFdQsAzSCgvMC035faD6NYR9Hz6KaCBsPQajIXaJaSjW42Mj7RLGnw1Tp7a1vb50lg
 Jv9fbvVB5xMt6L82Ys9SmbbSbDtT9jcPvejdlCmHSy8/E3QPlt7rm19o5uHgXB/8uhCJ
 ufVbaPX2tsUgYME5RnlY4Oi7mbVR8vjcTo3/aRs/M5NBPz8KhmwIAqtp7tvJUojaEHV7
 EYIq6VG0NcB1t2AKhsAdsfDr3HalPdmbT+B3a6z7Lbn9KX21swE/WBMP1zsWcW5DrxBG
 4p9g==
X-Gm-Message-State: AOAM53000mpK6a+yGlM6Wo1tnSfJbNsMMbGCmV/NtTRcmWtwI+51M4je
 D18qT8odm3mBViQmLVphM+xOF6SWEEoNwAoW
X-Google-Smtp-Source: ABdhPJxARkezFxP+o/HVFL6UEJCrpfa9vxHhCZlDgF4jRP+qQvGRhyr4L2SniWKElagcA7Kt3HJ4Ew==
X-Received: by 2002:adf:f04a:: with SMTP id t10mr41848297wro.318.1625847011233; 
 Fri, 09 Jul 2021 09:10:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] hw/gpio/pl061: Add tracepoints for register read and
 write
Date: Fri,  9 Jul 2021 17:09:54 +0100
Message-Id: <20210709161003.25874-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add tracepoints for reads and writes to the PL061 registers. This requires
restructuring pl061_read() to only return after the tracepoint, rather
than having lots of early-returns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/gpio/pl061.c      | 70 ++++++++++++++++++++++++++++++--------------
 hw/gpio/trace-events |  2 ++
 2 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index b21b230402f..42f6e6c4891 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -149,90 +149,114 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL061State *s = (PL061State *)opaque;
+    uint64_t r = 0;
 
     switch (offset) {
     case 0x0 ... 0x3ff: /* Data */
-        return s->data & (offset >> 2);
+        r = s->data & (offset >> 2);
+        break;
     case 0x400: /* Direction */
-        return s->dir;
+        r = s->dir;
+        break;
     case 0x404: /* Interrupt sense */
-        return s->isense;
+        r = s->isense;
+        break;
     case 0x408: /* Interrupt both edges */
-        return s->ibe;
+        r = s->ibe;
+        break;
     case 0x40c: /* Interrupt event */
-        return s->iev;
+        r = s->iev;
+        break;
     case 0x410: /* Interrupt mask */
-        return s->im;
+        r = s->im;
+        break;
     case 0x414: /* Raw interrupt status */
-        return s->istate;
+        r = s->istate;
+        break;
     case 0x418: /* Masked interrupt status */
-        return s->istate & s->im;
+        r = s->istate & s->im;
+        break;
     case 0x420: /* Alternate function select */
-        return s->afsel;
+        r = s->afsel;
+        break;
     case 0x500: /* 2mA drive */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->dr2r;
+        r = s->dr2r;
+        break;
     case 0x504: /* 4mA drive */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->dr4r;
+        r = s->dr4r;
+        break;
     case 0x508: /* 8mA drive */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->dr8r;
+        r = s->dr8r;
+        break;
     case 0x50c: /* Open drain */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->odr;
+        r = s->odr;
+        break;
     case 0x510: /* Pull-up */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->pur;
+        r = s->pur;
+        break;
     case 0x514: /* Pull-down */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->pdr;
+        r = s->pdr;
+        break;
     case 0x518: /* Slew rate control */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->slr;
+        r = s->slr;
+        break;
     case 0x51c: /* Digital enable */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->den;
+        r = s->den;
+        break;
     case 0x520: /* Lock */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->locked;
+        r = s->locked;
+        break;
     case 0x524: /* Commit */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->cr;
+        r = s->cr;
+        break;
     case 0x528: /* Analog mode select */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->amsel;
+        r = s->amsel;
+        break;
     case 0xfd0 ... 0xfff: /* ID registers */
-        return s->id[(offset - 0xfd0) >> 2];
+        r = s->id[(offset - 0xfd0) >> 2];
+        break;
     default:
     bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pl061_read: Bad offset %x\n", (int)offset);
         break;
     }
-    return 0;
+
+    trace_pl061_read(DEVICE(s)->canonical_path, offset, r);
+    return r;
 }
 
 static void pl061_write(void *opaque, hwaddr offset,
@@ -241,6 +265,8 @@ static void pl061_write(void *opaque, hwaddr offset,
     PL061State *s = (PL061State *)opaque;
     uint8_t mask;
 
+    trace_pl061_write(DEVICE(s)->canonical_path, offset, value);
+
     switch (offset) {
     case 0 ... 0x3ff:
         mask = (offset >> 2) & s->dir;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 48ccbb183cc..442be9406f5 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -18,6 +18,8 @@ pl061_update(const char *id, uint32_t dir, uint32_t data) "%s GPIODIR 0x%x GPIOD
 pl061_set_output(const char *id, int gpio, int level) "%s setting output %d to %d"
 pl061_input_change(const char *id, int gpio, int level) "%s input %d changed to %d"
 pl061_update_istate(const char *id, uint32_t istate, uint32_t im, int level) "%s GPIORIS 0x%x GPIOIE 0x%x interrupt level %d"
+pl061_read(const char *id, uint64_t offset, uint64_t r) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
+pl061_write(const char *id, uint64_t offset, uint64_t value) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
 
 # sifive_gpio.c
 sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.20.1


