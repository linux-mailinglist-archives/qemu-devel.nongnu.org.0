Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464B6A4409
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7A-0002E0-La; Mon, 27 Feb 2023 09:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe77-00024A-F3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:25 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe75-0007zH-PV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:25 -0500
Received: by mail-wr1-x436.google.com with SMTP id v16so3542510wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aN47Fsd6Vw3ECvj3+90qDL+aYtdX8f7tcZ4eVa1EoMQ=;
 b=p/Tde3Hu8yniS6549l1aYU6/xHK0lSw1eRySnJRsntXDQgpTj1txhl873rr6p5fk8g
 XpHy90nEtu3kKcHBiozEkvCQOtk6l1zC8gc8PnGl0Xib2nZZI0tX3n8WXtRsUAyewiQ9
 7wHjdTFKlbicFJBjNU9jdWfSBDQwBYMUMUnPIWdzFUic+fpbSJ6wATb3lbtT5AXxiGAT
 dv8AswEmqIMNAJK7Eahh/4fqklrNUrBeKtin4DIS75iuco2WRuF8xaxJ60b+TcdHpefj
 QCSwQ0NmYkDOwUHmsi4QOz3Df1e22G5hq7h0oLYUybWVKeDt+pzqEJWoYMGmsaaDHQAU
 HxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aN47Fsd6Vw3ECvj3+90qDL+aYtdX8f7tcZ4eVa1EoMQ=;
 b=h8U0zUXq/DmtohyzyKunSz8yu0EunsFpJVrp12qC9R0/uskOGCTpDTkd73gHi1Smr1
 i1uqh/35wSRwEaaefx/IC0Y2urnhYC/7KvH4Q6dGop7jy3zd79PHQLDHRDZdhM64njHt
 0hJOJjCFQ7F/L7j+FrulRpq0Zb/GbjcEiUJa2w0tyHTdrISW0AKsrSqavA82J/i68xii
 NwyZjZt91Hme2/cCKDC8khICZP78ah6pSw49X3MsUTzHVnD/3WHFAnwkj6o0xl9OQnpC
 rlltQcJHTk3zjbtjyorxqEDUUpOztRwE3x3DZ1RrVqORvU8w+SfK5TGzGTMK527ULTLD
 6IVg==
X-Gm-Message-State: AO0yUKUt7VOD1+tHxbimYABFsZDzkFAxfTtuZ2awXJeYzkbjECUwIVhv
 ZajPp1eV/XIghmrx7w5+3CMxeWFMA6pYIPot
X-Google-Smtp-Source: AK7set8fU8p7qEp/UuGDwETA9ZQ/QOekrjxNGDpnrc+ozsK4bTduOA+owoO2geKo0UxBaN8GsiwSBA==
X-Received: by 2002:a5d:6147:0:b0:2c9:ed98:c3bd with SMTP id
 y7-20020a5d6147000000b002c9ed98c3bdmr5039607wrt.60.1677506662045; 
 Mon, 27 Feb 2023 06:04:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfedce000000b002c7b229b1basm7232685wro.15.2023.02.27.06.04.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 033/126] softmmu: Silent -Wmissing-field-initializers warning
Date: Mon, 27 Feb 2023 15:00:40 +0100
Message-Id: <20230227140213.35084-24-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Silent when compiling with -Wextra:

  ../softmmu/vl.c:886:12: warning: missing field 'flags' initializer [-Wmissing-field-initializers]
    { NULL },
           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221220143532.24958-4-philmd@linaro.org>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6e526d95bb..f5b9912c57 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -883,7 +883,7 @@ static const QEMUOption qemu_options[] = {
 #define ARCHHEADING(text, arch_mask)
 
 #include "qemu-options.def"
-    { NULL },
+    { /* end of list */ }
 };
 
 typedef struct VGAInterfaceInfo {
-- 
2.38.1


