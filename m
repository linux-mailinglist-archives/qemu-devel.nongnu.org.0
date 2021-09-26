Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DD418CFB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:07:51 +0200 (CEST)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdFO-0005lk-Pu
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcf0-0006Qq-M8
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcez-0007Lb-8n
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d21so46379130wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gsdxrxIkLL008ui7WH6lPMx1hd/4ygkSIHUg3uTtLo=;
 b=PpjUmsuZA+KYcyopDCxf73aGZ1pXnkPG7BtLPRmyG7WNbe5M9hIDP6d2qoECu8wrQo
 D5LBKtDl0euZIeCBi9f3G7UeyhIzbUUS0QJU33xmpnr+EaI3noqRwJ9WS4otst5/R9h+
 GKQ99dZJWhzq+XZfn3l/sNA1M82/Qs6kMq710sJVLEWPP4c6TqapJYHUMaODaHnxWkIE
 JMeMh5Jg4hCbW+sLx7i1++DiknYuLKGRp1SlF94nrrAfodNg6d3svw3w7SxdFTJffaLh
 xq3FFhgbDVKyYnT5lZg1HVL8f9BTNowE8l1uvhlxh224SWwLl9tfIhu/PC0XgqtlrCmS
 bgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1gsdxrxIkLL008ui7WH6lPMx1hd/4ygkSIHUg3uTtLo=;
 b=FVoZRaOFLESplaWvdjDBq+iz9Ar5JGcsKH2FjYW5DtZ/U4Sw6r9HOKQkMwUJ+DSBLx
 PrFiONgYMjMnLV7trb85HIeCcuAA/5d+FhygVitQWlw6XJntuJzZ+LcW3za00VWAT1jv
 qG4shVvhyfefAu8eznixk1yZVr8+qcHsd5HH6sGcjSxC3bFuV6ck7O0oKr351O7g9JjQ
 uMMoV76/H2AUHXkiNxdrFJhLkmFha5EBtoatOGCLAc5cevgTIXzrZEqM0ll2EU5YSdeq
 1GN17C73b0ebPAA7nOmpjBCBYbasJERe/KJG8fkcAmd7UIgLH/2dAGQWcvsUTe4C/M6m
 3afg==
X-Gm-Message-State: AOAM533fl4vuqyFM5PrzUP+1qO6CWjVIXDoS+MTLEqrel1Y+zb5tuKvE
 WXYXog7nxYJJ1DYRNh4+Msy26D1om60=
X-Google-Smtp-Source: ABdhPJzSoiVhoETIUZjTn+HRPlmlsO5sQXjJhJz0SSvcLI654NXR9Jt6xwjYKO/r9o9vIU17JZmx6w==
X-Received: by 2002:a05:600c:40c4:: with SMTP id
 m4mr12658825wmh.100.1632695411857; 
 Sun, 26 Sep 2021 15:30:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 b11sm8345335wmb.27.2021.09.26.15.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:30:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 37/40] target/tricore: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:13 +0200
Message-Id: <20210926222716.1732932-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/tricore/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f04..419fa624bd5 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -62,10 +62,12 @@ static void tricore_cpu_reset(DeviceState *dev)
     cpu_state_reset(env);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool tricore_cpu_has_work(CPUState *cs)
 {
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -154,6 +156,9 @@ static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .tlb_fill = tricore_cpu_tlb_fill,
+#if !defined(CONFIG_USER_ONLY)
+    .has_work = tricore_cpu_has_work,
+#endif
 };
 
 static void tricore_cpu_class_init(ObjectClass *c, void *data)
@@ -167,7 +172,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
     cc->class_by_name = tricore_cpu_class_by_name;
-    cc->has_work = tricore_cpu_has_work;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
     cc->gdb_write_register = tricore_cpu_gdb_write_register;
-- 
2.31.1


