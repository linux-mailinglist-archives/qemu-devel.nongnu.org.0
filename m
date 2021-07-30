Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC7A3DBA13
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:08:24 +0200 (CEST)
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TBX-0004kd-BF
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2h-0004ky-4L
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2f-0006gF-F0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id z4so11455725wrv.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6s/hh8/s2nyZqNr3a/RAcx7sX2YweNlw0nNeN1vHD9w=;
 b=S38cMTnegYn3V5li9CvxXHaS/UxMtYCyIp0LJIDQ4tMrADgVsigKbtISkxA3tI6W8A
 UgDo6TCIwEHgRwxycwPRFhHZ1pDhgXA18iSFCqCNB44bNXLuLzzi3mt0bG+WIDzbZYHg
 K3cMCCGNtW2288SFLLS2wLDJrKF5QTzR3BpI0yv6YLW1486OQZg7LJMWw4qCr/77c/eA
 +4pp4DNnLYZ0WNM7YXM0IE+7/C1D7KvN2jHzFNXEn2u3lt1fNc+Tpn6ctmGGIcPEyyos
 KQOs1ENeXbHsuE3IBfpsPMF4qMnAjl5Y7/2sq1XJ0+nkZ9hzeoWoBYkvt4l1GUTyNpTz
 pJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6s/hh8/s2nyZqNr3a/RAcx7sX2YweNlw0nNeN1vHD9w=;
 b=MLLumLov+/XWCntb352riQXnWM9VYFJ+S6D0fmDy2fGzPXQ+Dsi35f0SREim6QUHBa
 gTzWxg/uyldC8JFiJw6b4dvvJL0g88VFpAJloa/zwmVtwepaiGnd39cYnVnFFvk79pWq
 U/lG/2whO8cbnI8Th0b61OKzbkdYNleS14IwNtn2eTviG090EA394eWj7SZX411jA1m7
 X1qyegdrCg5MIsG2ORXQiQXz7dVx4kFUrUnculddTJhkyjIMP3MfK/ny4q/3fvyk9awW
 ADFwlBfxkSTyjZ7PTsCsptTnDufU5dlQWk1FhkzZ+FPjbQrBA6HIenyPJBj2/f+rciQ2
 7l4w==
X-Gm-Message-State: AOAM532iBKhO/m5NVcIT60l6HpRGbhQqBzIR6V7TVCfUueLWWXUHw5K8
 EfUYT8oQVdm39TPhiTKkXM7Y/n9Savo=
X-Google-Smtp-Source: ABdhPJw2ofriIIqGHWntTSSBT6GpzpkLWGFzGL4ZFHB2AviRGsUVzYnBqfZdo42iZtKu4SjwTVaViQ==
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr3211191wrx.137.1627653551892; 
 Fri, 30 Jul 2021 06:59:11 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:11 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/13] tests/plugins/bb: adapt to the new arg passing scheme
Date: Fri, 30 Jul 2021 15:58:13 +0200
Message-Id: <20210730135817.17816-10-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/bb.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index de09bdde4e..7d470a1011 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -104,10 +104,17 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "inline") == 0) {
-            do_inline = true;
-        } else if (g_strcmp0(opt, "idle") == 0) {
-            idle_report = true;
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "idle") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &idle_report)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.25.1


