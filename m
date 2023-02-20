Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680069CBE7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:20:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU64S-0002FI-Gk; Mon, 20 Feb 2023 08:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64Q-0002EY-Fq
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:19:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64P-000760-31
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:19:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id p8so1314992wrt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9XssOvydBlHwVUUwEi4liJFlLTsO0m5yxHdZTbs0B0=;
 b=jFx7aHokSKT+vYwg5OCzw1ID6zR/OxDluPjO5Lx/SRqIWuKxybgKEcEOdFLR430np6
 fTNq7hwm5jR5fO2a/iEzs6jb5JQfgG0lQ5Qe/qbvjaVZUU3gPCJ8fnHG6vGcE68efdav
 ibUxhWE4n1eleijXaB7Mei3vBS6+UCx5wJqdRglLNF8oGxKy7eH9DJqFOkNFyk6nZLqr
 xnFFKkgMIRbrokRsLmn9ebKB8pkV9Yuh99aPsYhsDXPQvRgxumeWnYexRFEl1spMGm3B
 T7ZjeV1kZG2bRFLS/7QV6vbrhN1mOgE1Oz7J3tkDbANlwW5iq05bxLsKOhVtnAXdMow6
 zdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9XssOvydBlHwVUUwEi4liJFlLTsO0m5yxHdZTbs0B0=;
 b=RtGHetbGLzBInyzSKpXLTnRVLEbvVlDBSt50BTnXyKGgUU7YyiSEBDRsE7cAbY3+Nh
 qbo/o400Rgr62zmvgf0oejjWTg9WfFMZcoP79+D1cqgXjCdJqBNVmaCi03PQhF/lZfJf
 HDI5HAC6k3xPI6SWacAU2hTw54zm1EbbPfqZVIMm269JDVtRiPAvrAGHmEyt51kVd+hr
 S2tWyE/Go5lF/jNnfXfeN/8kSzTnzRWUE5qMaMzDxmnq4j7IFDK1p1pDZDKg7NrpeEm9
 3DOV/Cl0/z+M+nH+bSL7E7/JjgLvTw51p6tApE4PR8j4ldDqZcNAzWTd1yzJeMbPo/QQ
 GP7A==
X-Gm-Message-State: AO0yUKUoDDXJZI69p6PX1nPZwewKqv9KGSZmoMNoaouueeE25eIXDyT3
 ZwWNCZ2Ja9nM1R95zEuTG5wjndrhRl54c/Qu
X-Google-Smtp-Source: AK7set9QFhyP6DYHPe1g5BZ9zhUGKz/IG+QO+y/5g0M0zJoodvgKKlSLwUGxtg7UeSXGGOgOkEdaJA==
X-Received: by 2002:a5d:5046:0:b0:2c5:594b:10d6 with SMTP id
 h6-20020a5d5046000000b002c5594b10d6mr2320706wrt.29.1676899143372; 
 Mon, 20 Feb 2023 05:19:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b002c553509db7sm5846815wrq.52.2023.02.20.05.19.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 05:19:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] hw/audio/ac97: Replace container_of() by AC97() QOM cast
 macro
Date: Mon, 20 Feb 2023 14:18:36 +0100
Message-Id: <20230220131837.26292-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220131837.26292-1-philmd@linaro.org>
References: <20230220131837.26292-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 364cdfa733..b3a45bb49f 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1295,7 +1295,7 @@ static const MemoryRegionOps ac97_io_nabm_ops = {
 
 static void ac97_on_reset(DeviceState *dev)
 {
-    AC97LinkState *s = container_of(dev, AC97LinkState, dev.qdev);
+    AC97LinkState *s = AC97(dev);
 
     reset_bm_regs(s, &s->bm_regs[0]);
     reset_bm_regs(s, &s->bm_regs[1]);
-- 
2.38.1


