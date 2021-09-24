Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9D41700B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:09:40 +0200 (CEST)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi9D-0008Jo-MM
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThi7-00073X-Tf
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThi5-0008B8-EO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so25641081wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjvVczq8n5tzr9drSBRznUr4y3SH1knsfynMe8Ogfbw=;
 b=gqbZD1QYHG/V+4FRZ+RsPkcPC6mtNJKoVwY8DNaJAY1Oo3Gmwh3hN0swaNYldC6mtE
 2I2dcbFS35V7W3vN+iBxxuIxo75qc/jEn5dvYkRMsGj3hNBcKtR3OgBmv5jgu4pRSBjf
 pk+OClhKQq7bdH68FYVQXgygBIURTlnfitexMnylKUfu74Hvx0QEbhf7jbLEO2Sea0DN
 FNfro3QQnMLosH4I/97qVvLkTiCmOaXW6r/QhojFwEf9jutZ8brRKv9tchkp9CO0rTSH
 0ooy8q1R5sn6Xc7JF5AyBmdxH7UkCSUKGDUCtzXeAFJUze/N3J+LkDUQC7UvhKG83eEL
 wDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LjvVczq8n5tzr9drSBRznUr4y3SH1knsfynMe8Ogfbw=;
 b=k/2ZN4S+8tDxDb2gGqIQjtGyv7/TVEOvz3L6r5ri9UtkCQ1Umf1YySHOTUCZA6NIm4
 ShuvU0yw3f0B4FW1pBXxznS0vy+wZsQ4OJftJ00RIjZ9OZsfviAZZPVks9k+xCVevhxS
 Ct9TIwQhUWE263COOtrkieeddo2A5Cst5lvT+D4p5C0n4llwUL2rMQyagFrDUlbuGAXE
 CIthnGZfOsCYfcin/3XENsYFBWr1omV1oRyQuF7aiGXrl2s+LU7cuhFpuAgmKKR8HoWC
 V1Z7V9wq3EnN7GwmDGt6EjgI5C8491YKUOB30XPM3WIRd2Rcs+i2uTcvgAW2cUp60ApZ
 xf0w==
X-Gm-Message-State: AOAM532lIJa+3s60S72omk0+ucswRk11WEYLDx7R4IxKMfBqlnaA7xXp
 BMfZIQFwHfL33KbGCh+R5Vj4p5H5G9A=
X-Google-Smtp-Source: ABdhPJxTSOKRlGhxmppefEI6DDkH8tPZRl4LsiMD887WvwAqOCLsCo9OR2eguLu9mFjC0C/DOHXQ/Q==
X-Received: by 2002:adf:f890:: with SMTP id u16mr10175704wrp.388.1632476495755; 
 Fri, 24 Sep 2021 02:41:35 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k26sm1170670wms.39.2021.09.24.02.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 35/40] target/sparc: Remove pointless use of CONFIG_TCG
 definition
Date: Fri, 24 Sep 2021 11:38:42 +0200
Message-Id: <20210924093847.1014331-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SPARC target only support TCG acceleration. Remove the CONFIG_TCG
definition introduced by mistake in commit 78271684719 ("cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 21dd27796d0..0d252cb5bdc 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -859,7 +859,6 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 };
 #endif
 
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps sparc_tcg_ops = {
@@ -874,7 +873,6 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 {
-- 
2.31.1


