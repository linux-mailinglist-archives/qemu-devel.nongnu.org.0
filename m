Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6F29ACE9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:13:57 +0100 (CET)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXOnU-00056C-8V
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNQ0-000243-SI
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPx-0004nX-2w
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id k21so903408wmi.1
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JPmCRadlcjLOXi8wXt27gGH7nkOGqransKBP2rvN/wQ=;
 b=yWsN4iQTqKy372jlLnmU5oo12lbfl2gBE2UJitOEypBU3Oy/4E42WxtKzZD7Tn08uu
 +1D/MP185QtC7TVRyiC9u8kEh+EAmbY/TKWJt9uRZvSUD+T6ANzMPuTrKeuQJ7vJL11X
 hZ0pC/ezW2K/f4/VnT3G1xFG/18BEJK1WWUZx5f2JaDMwclBxkDRdJlO0YpVofFXi+tD
 dGP5YbPSmsRamzRAq9FcDPtxXWiKJB37yd5XJUGbd5CzYBc+PSvmE2SDR1Oprcev5v9S
 7YjFuMzdnC94TYJkL48ytTs2b9QaWkH+CeocARcJaW5O/Lz2ilW0HX2sYetDOa0Zb8pa
 vkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPmCRadlcjLOXi8wXt27gGH7nkOGqransKBP2rvN/wQ=;
 b=hUO2m72GC5rhrb8yRl+0ymH+p6bmMj5R9nigmYy1LqEAKXJpayYvfDMGdxjVliBuhX
 GcBa1FTtLVY5Dy5RDGLIQVkkB+byv5Xqn0CubGAti0PboYV3TUubSsZcnkQC+P/tZGsf
 XsOWrVJtVCBc3lG39b/fsiGe8sECymhPaFt6ldywsvraWmkNLVv5cYxiBHsUsstF+of7
 1jhH1l9qWHgvemWg2nRX5jnPi9TeMabvsfzhjyShO+HQ1pnArVf8gerwiDeA1o28yiym
 8i6YnvK91UWS0npBbBn933B4z3ioC4kfGUhQ9oMLIiTCXhjeIqKWJ7i7cEr221EkZQmX
 GZmA==
X-Gm-Message-State: AOAM53303LA7RAY0RTdjlEEt5T75PBLSsDVKE/wAl4GK7rTeUOPS2SIs
 t7sKqfCZSa5z55exAd3jQZTKbxBMELa2UQ==
X-Google-Smtp-Source: ABdhPJyzkeFAi4nvcU86T6TjTeti/qXtZ1zpZd+uy316j99OiHti/WHwD6prNQ17BXT0/fgUhH2UMw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr974573wmj.49.1603799131272;
 Tue, 27 Oct 2020 04:45:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 32sm1712203wro.31.2020.10.27.04.45.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:45:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/48] hw/misc/bcm2835_cprman: implement clock mux behaviour
Date: Tue, 27 Oct 2020 11:44:30 +0000
Message-Id: <20201027114438.17662-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027114438.17662-1-peter.maydell@linaro.org>
References: <20201027114438.17662-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Luc Michel <luc@lmichel.fr>

A clock mux can be configured to select one of its 10 sources through
the CM_CTL register. It also embeds yet another clock divider, composed
of an integer part and a fractional part. The number of bits of each
part is mux dependent.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/bcm2835_cprman.c | 53 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index b22170f3bc2..919a55aa23f 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -231,15 +231,66 @@ static const TypeInfo cprman_pll_channel_info = {
 
 /* clock mux */
 
+static bool clock_mux_is_enabled(CprmanClockMuxState *mux)
+{
+    return FIELD_EX32(*mux->reg_ctl, CM_CLOCKx_CTL, ENABLE);
+}
+
 static void clock_mux_update(CprmanClockMuxState *mux)
 {
-    clock_update(mux->out, 0);
+    uint64_t freq;
+    uint32_t div, src = FIELD_EX32(*mux->reg_ctl, CM_CLOCKx_CTL, SRC);
+    bool enabled = clock_mux_is_enabled(mux);
+
+    *mux->reg_ctl = FIELD_DP32(*mux->reg_ctl, CM_CLOCKx_CTL, BUSY, enabled);
+
+    if (!enabled) {
+        clock_update(mux->out, 0);
+        return;
+    }
+
+    freq = clock_get_hz(mux->srcs[src]);
+
+    if (mux->int_bits == 0 && mux->frac_bits == 0) {
+        clock_update_hz(mux->out, freq);
+        return;
+    }
+
+    /*
+     * The divider has an integer and a fractional part. The size of each part
+     * varies with the muxes (int_bits and frac_bits). Both parts are
+     * concatenated, with the integer part always starting at bit 12.
+     *
+     *         31          12 11          0
+     *        ------------------------------
+     * CM_DIV |      |  int  |  frac  |    |
+     *        ------------------------------
+     *                <-----> <------>
+     *                int_bits frac_bits
+     */
+    div = extract32(*mux->reg_div,
+                    R_CM_CLOCKx_DIV_FRAC_LENGTH - mux->frac_bits,
+                    mux->int_bits + mux->frac_bits);
+
+    if (!div) {
+        clock_update(mux->out, 0);
+        return;
+    }
+
+    freq = muldiv64(freq, 1 << mux->frac_bits, div);
+
+    clock_update_hz(mux->out, freq);
 }
 
 static void clock_mux_src_update(void *opaque)
 {
     CprmanClockMuxState **backref = opaque;
     CprmanClockMuxState *s = *backref;
+    CprmanClockMuxSource src = backref - s->backref;
+
+    if (FIELD_EX32(*s->reg_ctl, CM_CLOCKx_CTL, SRC) != src) {
+        return;
+    }
 
     clock_mux_update(s);
 }
-- 
2.20.1


