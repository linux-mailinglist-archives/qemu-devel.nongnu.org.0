Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B652D44D59A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:12:07 +0100 (CET)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7zy-0004gp-Sv
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v4-0004wx-W2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:03 -0500
Received: from [2a00:1450:4864:20::432] (port=36485
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v3-0001j6-G3
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:02 -0500
Received: by mail-wr1-x432.google.com with SMTP id s13so9160673wrb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nPNWSGH2oqme4L/mgDeHjYH64JjrZN0FOeCC5e7HFA=;
 b=do1ddRpkX0XK/VOEX1YBEKqcqbV0HY4uh+BTQOpOftkmNe7oUAOHCKErBH0RlR4XRX
 OYumYosDubqx1jOwTOc0Ucw6cZoepqVHphEYSNhi9PeS9R016Kb728lPsTnJjq+4zewH
 Z1RnnO9ZuuvFN0MyGxBru8QMU7S4W9VNqlljEBRHHYS0jTPH/p3dUxq0Fwgfd+oDR8pU
 +UHJH+2kLyohbACHJA1TeKPRPK152HxqRzGTAozi8XRRRLY6Cpy4Vaw8vm/rOLxkv3zq
 MzMFT5sMnz4LAPVhB63tf2A7O9JnaBtOTsKCKv8avJPHQhbwxHeg8EPCNJjwJiPDON15
 8FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nPNWSGH2oqme4L/mgDeHjYH64JjrZN0FOeCC5e7HFA=;
 b=6zvSYernAWA98NhQHWr7CDRMs4Rw9jyZ2P9HqQ4uKNAHcUIIoxR3kyTHRGVroGS5zy
 Nsf6t2Zx21vJJYcO/PpyXhTqtyA7xumDcAMh6zlZVQDwubaOdGupW8FyVadWTzaTRaIk
 JSU1pCWikDG+hAONhGrMQ5nnIZF7YYBalmjnHyQd3cwjdbv9tSDJeGYlBW/Siwl3nBE8
 FxoJkNN1mYm2SnQmgrP98Iwn73Wxc11Bc4h757csannEq018Uf1qFwRfq4FE6zHiQjJC
 eKtNq0kWj+MZ4F3djToH/mNjKlT/y272MoFO12gUJkV9xLHKAKcwfyCr3VJF0mzmmxR/
 JLoQ==
X-Gm-Message-State: AOAM531CRoyxuRqZBlWUelcHZjPaSgvadyFSsTvW+KHb0TMaGNwOiOaO
 fiWH5UKe+uSWaOPgFlASw4HqniNMz64wvkVrz0c=
X-Google-Smtp-Source: ABdhPJyywwco1XPHV5I1mWOcJEw/fiJZ9WYAkoPORV3ZACKwviQLlU85OC8ZvkG4jb0ONY/Xxj1Klw==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr7969627wri.6.1636628820110;
 Thu, 11 Nov 2021 03:07:00 -0800 (PST)
Received: from localhost.localdomain
 (10.red-95-125-227.dynamicip.rima-tde.net. [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id j8sm2536684wrh.16.2021.11.11.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:06:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] tcg/optimize: Add an extra cast to fold_extract2
Date: Thu, 11 Nov 2021 12:06:53 +0100
Message-Id: <20211111110656.237727-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111110656.237727-1-richard.henderson@linaro.org>
References: <20211111110656.237727-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no bug, but silence a warning about computation
in int32_t being assigned to a uint64_t.

Reported-by: Coverity CID 1465220
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index dbb2d46e88..2397f2cf93 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1365,7 +1365,7 @@ static bool fold_extract2(OptContext *ctx, TCGOp *op)
             v2 <<= 64 - shr;
         } else {
             v1 = (uint32_t)v1 >> shr;
-            v2 = (int32_t)v2 << (32 - shr);
+            v2 = (uint64_t)((int32_t)v2 << (32 - shr));
         }
         return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
     }
-- 
2.25.1


