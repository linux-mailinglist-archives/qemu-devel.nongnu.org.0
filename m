Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FF28A105
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 19:33:03 +0200 (CEST)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRIju-0005SL-EO
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 13:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdZ-0000Qs-Ga
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:29 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdX-0003qj-WD
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:29 -0400
Received: by mail-wr1-x444.google.com with SMTP id e18so13666902wrw.9
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCMj0TR+Fl9dY8Kl27uG0iFSZwgVew5RPBCHaa3rL38=;
 b=VNZIODbJL37JdFqCpr8kQ4CBc8EulYHr0VJqZx/+Orbb5nKbOzCXCSSo5SB0+FF8kZ
 DnMXv1pEC1DNxu3foBY+noVBDKvyYSdJUOLYqddyKwRkeU/NDFF3nCdbh8uuJY6lK/6J
 dJx6VTVZ/N7qtjHogWgQ6psBGWpq81OHQ67UVR3iHo0BzhsNqzezDmqFm/7V/HtYmrsq
 SLmtS/nTXTbWl9jdXDeB3hLY+gKiUHKf2DpZfj1jPMSh5sH9IpIklriETN0+Q9a//ubL
 viJpNFEgJDbo7sWmjTafCQssG3sIGs5npE3smZJRztLKTv3qS8ZYEC7TAtgD/3ItfCh/
 oigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MCMj0TR+Fl9dY8Kl27uG0iFSZwgVew5RPBCHaa3rL38=;
 b=BpAmybVLDcqfwZkzdviBhda+2ZnzNrTqLn0TInZe//j18XXgROeXnm6WM/aFnLeS6y
 8rxKZETYV45HNkeZ2+3YLQDZpPtnuDd5IS60xVAbjzxt4JRCBooT2RE63pPuILUJT0ZD
 HpJVcmNVXHwDmY0SVmvDhv/ybN3hwU68muhFkEdY/2F7XPbtwzBWAjWSnJYnUby7E7cQ
 NWWk1E1vldBRUMnKMPM7m5miNgf6CK7LZQujbBj8G/LAzzhD8ptiEunGnhnIJJik+F4k
 /AYc7yKxMxr/ewN03gmq+jNpltmhuIqlhuyiX3W7H/052EEoiGElhooFXf4vp1KY0O4B
 81Ow==
X-Gm-Message-State: AOAM532bXnlR5i/VVHpSBVaUIT6/YwOSpSwKUvNJ9o2bzsILXMCPI8M1
 WUr8WEcouwv6beH9C4Gu/FE2aPH6W0s=
X-Google-Smtp-Source: ABdhPJz4lAvTPNnGvkCrGFLKN7Vg2JsNstR2Yc01E+EHwOft1i1t+TkkN39/E911C82DJ7yNtbgn8w==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr1004043wrt.360.1602350786429; 
 Sat, 10 Oct 2020 10:26:26 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i11sm16786068wre.32.2020.10.10.10.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 10:26:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/20] hw/core/clock: add the clock_new helper function
Date: Sat, 10 Oct 2020 19:26:01 +0200
Message-Id: <20201010172617.3079633-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010172617.3079633-1-f4bug@amsat.org>
References: <20201010172617.3079633-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <luc@lmichel.fr>

This function creates a clock and parents it to another object with a given
name. It calls clock_setup_canonical_path before returning the new
clock.

This function is useful to create clocks in devices when one doesn't
want to expose it at the qdev level (as an input or an output).

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luc Michel <luc@lmichel.fr>
Message-Id: <20201010135759.437903-4-luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/clock.h | 13 +++++++++++++
 hw/core/clock.c    | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index d357594df99..cbc5e6ced1e 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -90,6 +90,19 @@ extern const VMStateDescription vmstate_clock;
  */
 void clock_setup_canonical_path(Clock *clk);
 
+/**
+ * clock_new:
+ * @parent: the clock parent
+ * @name: the clock object name
+ *
+ * Helper function to create a new clock and parent it to @parent. There is no
+ * need to call clock_setup_canonical_path on the returned clock as it is done
+ * by this function.
+ *
+ * @return the newly created clock
+ */
+Clock *clock_new(Object *parent, const char *name);
+
 /**
  * clock_set_callback:
  * @clk: the clock to register the callback into
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 7066282f7b9..f866717a835 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -23,6 +23,21 @@ void clock_setup_canonical_path(Clock *clk)
     clk->canonical_path = object_get_canonical_path(OBJECT(clk));
 }
 
+Clock *clock_new(Object *parent, const char *name)
+{
+    Object *obj;
+    Clock *clk;
+
+    obj = object_new(TYPE_CLOCK);
+    object_property_add_child(parent, name, obj);
+    object_unref(obj);
+
+    clk = CLOCK(obj);
+    clock_setup_canonical_path(clk);
+
+    return clk;
+}
+
 void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque)
 {
     clk->callback = cb;
-- 
2.26.2


