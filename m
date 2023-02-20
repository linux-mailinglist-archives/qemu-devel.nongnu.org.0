Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C569C7A5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:28:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2G0-0005y0-Rt; Mon, 20 Feb 2023 04:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fw-0005qh-Tg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:44 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fu-0003kM-Ab
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:44 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g7so1925643wrd.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4A4SsLrMuIwbak6pyt/+cbMSuHTNMfA64YSLVmLb5ZM=;
 b=e6MUYLMqWdLWeqQZMf2Hw3csPi3Px7nSr8ih0whFq60tzAMtGHRUyodHL8wHXicFOV
 bKYGQRAAGCNMxPxIjBhVSPDrfQ/M1FA8qpG/ntTPviYpvZTk79xzeCgSfWBywi8ygDNu
 AUMvrirJJ3ZtmOZXW4EvGXG1DV9zz113BIL7Wb0NE8CGT1QIPlx98MlV9X/P2Gs/wHjo
 1LQcULiZ12JQSkKT3bSwAMkVEimTyo1qQu5AVBoUaFZUgnvFq+7JpVcibM64+XshDO/H
 VXQ/ckZZbzlmd4YQK/im3Q+pwlXKGImTlQRgKUTWNZrIwb4ar0+Ymm56CSJWTRxUqUaI
 8/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4A4SsLrMuIwbak6pyt/+cbMSuHTNMfA64YSLVmLb5ZM=;
 b=d5KoV7wnCKuG4VZOjo5lJOH0XnGXBZAkGo78O8wFFdICYya7Pl7Gr9ApkSR+64fDov
 fnHc59J6RI7fvli0iTA8W218P6lMw1Mq6CSlnQjtlAjl5lG2wZ6hRI3fCAyvWNM6wBfv
 48C2Cku7CQ2kjXQneUelCTy8d4s+5uyrmEsH1kpNbi489zF9awuJ5udSFakAufuKJyEB
 HlzS+uu4facH5vHVz/rYI6tG/AI6+cHLWJL4G0iiij4+1vIQfmfjAO8nszkYpac+QDpY
 QwdXuJD3EHA7MmcbuIucstJAKq5rvztBR8Mfr13A6jbv6JAKO0bl3Ch+xAgEN9EXynfF
 Kqtg==
X-Gm-Message-State: AO0yUKXbdlip1nkNVe4QpAfW7zITwC2fpA/yJLAfd+EkVXerHoj7otds
 1MYFDw0xpQL7Pc0BIKi4RgCvPwZ2pOKttE5z
X-Google-Smtp-Source: AK7set+F0wK3a0aycMvtdXQ+Qqus7J4+1YeJAddQmyouY+cX0bfUyQryF9/VbSl8CNNRuCLM12snxA==
X-Received: by 2002:a5d:6548:0:b0:2c5:54fd:265e with SMTP id
 z8-20020a5d6548000000b002c554fd265emr974190wrv.70.1676884481451; 
 Mon, 20 Feb 2023 01:14:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c410100b003dec22de1b1sm13328503wmi.10.2023.02.20.01.14.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/24] hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
Date: Mon, 20 Feb 2023 10:13:42 +0100
Message-Id: <20230220091358.17038-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Missed in commit d7458e7754 ("hw/ide/internal: Remove unused
DMARestartFunc typedef") which removed the single use of RunState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-8-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/ide/internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 29a8e79817..e6deb1c5dc 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -7,7 +7,6 @@
  * non-internal declarations are in hw/ide.h
  */
 
-#include "qapi/qapi-types-run-state.h"
 #include "hw/ide.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
-- 
2.38.1


