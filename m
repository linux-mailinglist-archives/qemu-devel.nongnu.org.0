Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B426A44B7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeEI-0000PQ-FU; Mon, 27 Feb 2023 09:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDH-0007Kk-SL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:47 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDF-00011p-UD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:47 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so6350683wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HqwZ52hr6zNLG2cBZSpTKqrDS8szOBhqgsEVua8GwmQ=;
 b=K6KBh4lsyNmiJU94VCSXIvfEobVCBGUhSCKD1zPL56uiCZDkspXZfFVFyC8ODYjj4m
 Fs63H4iepJltytQB9C6+080FlinLj1q9bWGIdB435vyl25RldEdv5n1OzIgOEUSYUSu9
 zQAU++l5HcKDpbnFawYB16uzT2jZGnbjh/+xZfPT79RHGb/WosXtZ8oEgwIpHv1Y4Fw8
 JreslamcVNJSfh/FhCGm+zKm5Bzyq/OHUvl0Ykay45vkM705AkIhzSyu7A90KLTKJQ6R
 nDkC9lx6AULcTmrcsFzcyznRSVZ/Z078k8oRqQqT9EmZ8sUKMyZ39MsFXV0H2emtfb9z
 oZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqwZ52hr6zNLG2cBZSpTKqrDS8szOBhqgsEVua8GwmQ=;
 b=Mqf4E3lGcInOf7+rdmcVLHOhpxPgbZuvLOIECsC//nZ1o7OFUZD4hE6IIBcd1OjEgF
 fVfQwTVwmNAjJRW/wkrOwt551I9abV7anstu7MlWYAZS4hp5Xt+ZKuHfsrvD/oQTJvQG
 TqfR6xlTry4RthGPj7kddqEyWhMUg90XbEJWNhn96HhKAs3sA7yBqEr2HzOGWkTFn4nK
 CLU8UG0Ner7z2F1tIExcPVWU4gZwvEwnHAWeW4R/VrmhXrfcPINWZzclrtNsx7QKLGCA
 zw/KGH7iQc7C17xNraUczjdsm4ZuZf1fEIZWBS9IbZSJkNHABRzMjWGFGxJ5qR75MsnG
 +0Gg==
X-Gm-Message-State: AO0yUKUlF5IS4OCE/dk0EtK8LC6sVn8B6cKwVTg15wJVt66Srd+s9ZP/
 C0RyufTlpWa8pn4yGGxg0ITYdeuvurKqVes7
X-Google-Smtp-Source: AK7set9PeKObIpyqq6kwRcSbu6WsmJAp0KjW9ItyjR17uFY9qKd7vvZ+VMmrleQShXp7LdIzGvoKhw==
X-Received: by 2002:a5d:4e08:0:b0:2cb:76d4:42ea with SMTP id
 p8-20020a5d4e08000000b002cb76d442eamr3658271wrt.36.1677507044482; 
 Mon, 27 Feb 2023 06:10:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b002c5694aef92sm7166141wrx.21.2023.02.27.06.10.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 103/126] hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
Date: Mon, 27 Feb 2023 15:01:50 +0100
Message-Id: <20230227140213.35084-94-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Only atapi.c requires the SCSI constants. No need to include
it in all files including "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-7-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/ide/atapi.c            | 1 +
 include/hw/ide/internal.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 0a9aa6f009..0c36bd0afd 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -27,6 +27,7 @@
 #include "hw/ide/internal.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
+#include "scsi/constants.h"
 #include "trace.h"
 
 #define ATAPI_SECTOR_BITS (2 + BDRV_SECTOR_BITS)
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..29a8e79817 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -13,7 +13,6 @@
 #include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
-#include "scsi/constants.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1


