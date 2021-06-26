Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D092F3B4D45
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:55:47 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx2EE-00032t-S9
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vu-0002PP-Hs
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:50 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vr-0000R1-NV
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:50 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t19-20020a17090ae513b029016f66a73701so9274481pjy.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziCUNw7iMfXxhXUy1AbaM+Ca/hJ3SGJZ/ldvQFuxiE8=;
 b=iT/rfKxEWy20qwBWIruZIHWnqbywN46mDcWVm2g3VgGNrDNSkUen/jpbVdRVa9qnpj
 kYXsdHXn9k8NaHG01sZibxXWHbT6sws7rFnXim8L4cw6Nq/kfb0bbzm9WBzt58BMEw5/
 D4plVp+lhsMc6//+Y4DmMLrLGYGA+OkZ6XEnrob1KvQWgojPDkf+juVPYlFXha8xg/xQ
 vteZfVRFiz7kk5ZonYXLIxkBfLV3BFCrcz34yTHD3moGwbmynndnIt9ijI8bn4xbydiY
 tovtKpvY0R1O5RcL4e2aGH3Mg93dP7BDjnRYkOWuO1JJTIagLJriXqt0Qgn7N7Wn0QZZ
 Da+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziCUNw7iMfXxhXUy1AbaM+Ca/hJ3SGJZ/ldvQFuxiE8=;
 b=tWWSyLH8VGVZ14mFXhAxu3aRgmpnW7X9liFWM5tDUUqK+28ldtRkLgCwc3JxgLwfb2
 fcdLYCQgztr1FytMNwduPmpJKcVG/1qy5gddeaJxLX21cjeUyRbI3fLtKaXJ6lA+EBvH
 PacNvRfVjiTU76NE9z8a7zWurOCCMec+NhRfGLLmxvSebyVFfXRELSmilEKELZGNWeIB
 /siRr95lTImBP5NU5hB5RaGCsbiiCCOAHg5LURc1B/sXJ9M5i89NuhVLxjqCUwS1k2SO
 Q3EE4kJfB03Gfmg6rymc0qLN6AJ2lgemrjN85bRyIechflHbseilfJQDcq9Dco2SvAmK
 l3UQ==
X-Gm-Message-State: AOAM531K1z8+qxb1uy/JqE0pjY7ewXR/Y6WO2q+9Fs83ygSP6dVnmSZE
 D6pWmi/Kha9iIPs+9hwDeYRMJvLBAdCy7A==
X-Google-Smtp-Source: ABdhPJxoivzzPqmeGA1u1eObLf2hELVJV6YXCdKJ32vfix1a/vwj7Nxi8GFjFCTT+t4ah84o4SvUIA==
X-Received: by 2002:a17:90a:c8b:: with SMTP id
 v11mr24609762pja.114.1624689406426; 
 Fri, 25 Jun 2021 23:36:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/29] target/arm: Improve REVSH
Date: Fri, 25 Jun 2021 23:36:25 -0700
Message-Id: <20210626063631.2411938-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new bswap flags can implement the semantics exactly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 669b0be578..a0c6cfa902 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -354,9 +354,7 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 /* Byteswap low halfword and sign extend.  */
 static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
 {
-    tcg_gen_ext16u_i32(var, var);
-    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-    tcg_gen_ext16s_i32(dest, var);
+    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_OS);
 }
 
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
-- 
2.25.1


