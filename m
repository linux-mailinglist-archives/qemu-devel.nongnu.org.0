Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D06508F41
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:16:46 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEsf-0007sD-RV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEil-0005M9-N2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:31 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEij-0001Bm-VC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:31 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bg24so2681555pjb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7lsVTmyGDucjIzypVl9G9xgzg0WOWvjikiRtOmHVOc=;
 b=ySJ+ZUilQ47RcPjl8V2CyNsUKb9kZZaJXdkWEjy+aYGBBQ6OvWSHWBjm4Z4JDHQ0Rs
 deb/KDcNbfOr7UPrOsota38sByvRIlJTKiIYr5J+XTZzBXxYyNgGqM9Wsk2qHi+21DuH
 19vUBkEBikELxwSZLYkmAwzpyitPAdcI9p2jI02UQ3ds2j2XKF98uSgRuT0fXzPxvUWe
 Lz0QiGNxFdqXA4DDaQNaEdH2ypXDZLpPeTTrVbcbLGQyXw/+iXy1a6Nk9IXEJouFejLW
 ftOdX+DmQ0DrA8YA52Fa0xf+4PqJCIKI+cHkIs1Euhp1XN0OPWyohqE1SMXbNiA6OmOW
 P9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7lsVTmyGDucjIzypVl9G9xgzg0WOWvjikiRtOmHVOc=;
 b=vMU+7uFfhFL1c6GWIxoPFKBs8wBq4FVNFeQ8NjFjLGkKLU/ilI7GmsXrBJlsoL4clS
 ata/4gp+SiRsCCmp9bNhTGopWWtjxw5/O2VUA341b4Kz5zeJOykR3HpEgwxjPpKn0fR9
 gATLpRmKdcTRyXfkvNobwgu5St6yPvWjl7fLhS7ibJo7sUX0zhvv7rhmKf7HRGkkwqNJ
 50rlfSAd0ATmejFmUmraESYOfBmKsfZcZ5cAJ+2vHCzk+Q4LUp/OMXi4G7WNSN+mbewf
 8G+BbJEfUv2AE2O4S2Va/Ms4ofdQ2n2ABySz1TyfQbjdPzAw+qZeXpSxP2q/8XXWm4MZ
 3enQ==
X-Gm-Message-State: AOAM533CWKUBEWQkygXk6OBbUVujDGJG2xacXnIoW7VAoAen12k5mFlb
 32hoKwK27uMmevA+nW354WlnKz3xEt1Grw==
X-Google-Smtp-Source: ABdhPJxN6V9KxQEy6YkjYkIlq+y9KNQC4sG0us5Z6ckPrUoKIssAU5FjdnguVTC3LB0m0I4R+3JrMQ==
X-Received: by 2002:a17:902:7298:b0:158:3a08:3163 with SMTP id
 d24-20020a170902729800b001583a083163mr21475596pll.133.1650477987924; 
 Wed, 20 Apr 2022 11:06:27 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/39] hw/xen: Split out xen_pv_output_msg
Date: Wed, 20 Apr 2022 11:05:47 -0700
Message-Id: <20220420180618.1183855-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not replicate the individual logging statements.
Use qemu_log_trylock/unlock instead of qemu_log directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-9-richard.henderson@linaro.org>
---
 hw/xen/xen_pvdev.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 8ab458922a..0423c61158 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -196,34 +196,38 @@ const char *xenbus_strstate(enum xenbus_state state)
  *  2 == noisy debug messages (logfile only).
  *  3 == will flood your log (logfile only).
  */
+static void xen_pv_output_msg(struct XenLegacyDevice *xendev,
+                              FILE *f, const char *fmt, va_list args)
+{
+    if (xendev) {
+        fprintf(f, "xen be: %s: ", xendev->name);
+    } else {
+        fprintf(f, "xen be core: ");
+    }
+    vfprintf(f, fmt, args);
+}
+
 void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
                    const char *fmt, ...)
 {
+    FILE *logfile;
     va_list args;
 
-    if (xendev) {
-        if (msg_level > xendev->debug) {
-            return;
-        }
-        qemu_log("xen be: %s: ", xendev->name);
-        if (msg_level == 0) {
-            fprintf(stderr, "xen be: %s: ", xendev->name);
-        }
-    } else {
-        if (msg_level > debug) {
-            return;
-        }
-        qemu_log("xen be core: ");
-        if (msg_level == 0) {
-            fprintf(stderr, "xen be core: ");
-        }
+    if (msg_level > (xendev ? xendev->debug : debug)) {
+        return;
     }
-    va_start(args, fmt);
-    qemu_log_vprintf(fmt, args);
-    va_end(args);
+
+    logfile = qemu_log_trylock();
+    if (logfile) {
+        va_start(args, fmt);
+        xen_pv_output_msg(xendev, logfile, fmt, args);
+        va_end(args);
+        qemu_log_unlock(logfile);
+    }
+
     if (msg_level == 0) {
         va_start(args, fmt);
-        vfprintf(stderr, fmt, args);
+        xen_pv_output_msg(xendev, stderr, fmt, args);
         va_end(args);
     }
     qemu_log_flush();
-- 
2.34.1


