Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A744336ECF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:27:10 +0100 (CET)
Received: from localhost ([::1]:33092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHb2-00082p-RT
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnm-0001JL-9d
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnk-0000fF-28
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o26so406930wmc.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fE2XhPMXxb9owm5fUQuZRfsQOnkzPKyhol7+md8V6X0=;
 b=MQiIZOaVfWuBI/mFzZROYYpRI9/RbGT/0+KgoP6dCB6v5njjPzcnlxN/tHR6bVq3s4
 5UzPINKapp5KSNYPM2Yz5ElFpnBA4YHKDGjCGffuvfcCjFm4kFP7ZQ+mL/frdcwv1wTI
 ktrcJhPVitoZsKhyxuq4InSg05c8ZnLUFLJbCjGRttIM5ucCi0SOfsw+RjYvSV4o9SBX
 iAk8B4m9Hi+jceStvrBNGSLkq/3txiwsHgagC+J/CaPIfj49SZBPfhXU5x7T/vsCYndn
 r3WqirnfdsSDhO3DFxC9l/xVOWAU2Yrx/m+BhpHVRuV9PN7OxDXwT1oPKGPReQXGPnbN
 nXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fE2XhPMXxb9owm5fUQuZRfsQOnkzPKyhol7+md8V6X0=;
 b=jXjR5QNH4igwmaCsy+g1OciQw4ngdPCy78Sk2Q2MyiL48PnNV7HHe0r+iHZVgAS/6C
 sYUAtUg+htgJa8E/x3bXufBV0xQfJArnUnnmHZgAyNZn5ap0+6wPWlSNO/0XWvEOhlG8
 nLkqvkHNO+1f0AWiCXaVlWMf80dzzt4YScWgPNu5kfVCUyek7nbYdh+jmsd43QdbP6Za
 IcerHTcue5EZZwbMpDYl73OlDFeLxAr1rKimXmFNqlq7rC5oxKEi5dmNb0hsbdLKCqYO
 KmCs0I6pj5ZnUXwaWGa2VEsHdCyRtIqEdilVQ/29lUMV1+r4wwWEbCT5l4Vkj7z730Ks
 S+QA==
X-Gm-Message-State: AOAM530qU9NbvctG2U75JNfXm6/8xWZ6oTDrUOAB13Jna72ILjHNptTb
 7wqyCmrKQ3mWxPVcSyISAIdBpLrXkQ0=
X-Google-Smtp-Source: ABdhPJw5xDgfOVoLwDM2kOJYLeMh4PIbjbtO712t4gM/QfZCFRbxBh4nEesuepBG4bwtN3tluDNq4Q==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr6170017wmq.73.1615432550530; 
 Wed, 10 Mar 2021 19:15:50 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:50 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] tpm: Changed a qemu_mutex_lock to QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:30 +0200
Message-Id: <20210311031538.5325-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:43 -0500
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removed a qemu_mutex_lock() and its respective qemu_mutex_unlock()
and used QEMU_LOCK_GUARD instead. This simplifies the code by
eliminiating gotos and removing the qemu_mutex_unlock() calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 backends/tpm/tpm_emulator.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc193..a3c041e402 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -126,7 +126,7 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint8_t *buf = NULL;
     int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    QEMU_LOCK_GUARD(&tpm->mutex);
 
     buf = g_alloca(n);
     memcpy(buf, &cmd_no, sizeof(cmd_no));
@@ -134,20 +134,18 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
 
     n = qemu_chr_fe_write_all(dev, buf, n);
     if (n <= 0) {
-        goto end;
+        return ret;
     }
 
     if (msg_len_out != 0) {
         n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
         if (n <= 0) {
-            goto end;
+            return ret;
         }
     }
 
     ret = 0;
 
-end:
-    qemu_mutex_unlock(&tpm->mutex);
     return ret;
 }
 
-- 
2.25.1


