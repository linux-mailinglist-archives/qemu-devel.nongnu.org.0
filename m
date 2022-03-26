Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F74E8121
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:38:54 +0100 (CET)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6d3-0001nz-MP
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:38:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qb-0007Hf-5N
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:01 -0400
Received: from [2607:f8b0:4864:20::232] (port=43754
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QY-0005N3-L8
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:00 -0400
Received: by mail-oi1-x232.google.com with SMTP id w127so11074273oig.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPR3QL2zkjcobuOtk7sTr4ObN7Yl/0yBneTbMcqTLmw=;
 b=CF0vW+cXHZI6FalbhwNhBqD4kjpPCJZAOLBgfnf6nrJQAfMe/jIkmdhVYY+fC09v8m
 uTom8A99Bl6sHEfI/R3AjNaqqFTkacyHKFiqRaEd5vKQcCiPM54fRPHDLy92zldkwSnJ
 9KRwuZpbGBXIuM1xr/T94YWr/VD3PbW2IdJNTvCFSLA4NBd14oGi0vxwzY22p8OATBIx
 IsSkgeVdbP+XRpPP0tXijDiGCxqrvQ+gAhHhk/B2qpg0Wl5OgblMOVZbUCmKB4YA0wkn
 AtWtd8bWaI7I2xBtKJh7ooXbCl+QImxM3SZFLxrP+9Jc2Y6mOSIbT3CecPPCDM8VqAmA
 I79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPR3QL2zkjcobuOtk7sTr4ObN7Yl/0yBneTbMcqTLmw=;
 b=ZVzc92uTGbB6tGfjR57MiqAWZDjh+VXp+a75LXiFUr3iteeAx0nNFJKcZES7DZ4VED
 fFFGbklgkIWTBjYpo1kgKOOrMllNPoTyEGGiqZa73fZ5JsaNqeaGjgPwoHBTOympyO2S
 cB7i9SAnDBo0hwtbLV0NmzTyy7an09evwoOuTai0+YebFxgtna46+4nJc2f2aXoKS+6M
 5P6H8IwEZBt42Go3X9uP4XfgkXHr/5+pyk9+RL5puxpVoLdBjs3zu75OQJAcl+eKyqsp
 l5MkN9YbAiHehssxHVSJxqnNhVliZNNEmlwlGqsG6twdJP6ohjBYLyqHPH475zG6kxEf
 xa3w==
X-Gm-Message-State: AOAM532RccPNjKw/IV7OTtcXDlG+dpoygc2bj2vjrXlUYic9xybPYNAF
 27sKWQ2y5LExWeWofrSyBBoKGYVy8Jd/mtJj
X-Google-Smtp-Source: ABdhPJzDxGO028uc59qBJsWz0YBWHwIpr0nz3YWxpiy4+vPiHCcusjuhmqQDbz9xIipL0U6PoxuUCg==
X-Received: by 2002:a05:6808:3021:b0:2d4:40f3:6b30 with SMTP id
 ay33-20020a056808302100b002d440f36b30mr12720638oib.31.1648301157550; 
 Sat, 26 Mar 2022 06:25:57 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/39] hw/xen: Split out xen_pv_output_msg
Date: Sat, 26 Mar 2022 07:25:02 -0600
Message-Id: <20220326132534.543738-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not replicate the individual logging statements.
Use qemu_log_trylock/unlock instead of qemu_log directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


