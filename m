Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0973A5EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:09:44 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsibH-0000Mp-K4
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi70-0002er-Ox
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6q-0003d3-Bm
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ei4so9287141pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pPwNgd+FhwESG7b/TarUMGEShi9vbglIUO+o/J97nY=;
 b=RYWZ6pptEGzMOaI53mfq7NTrcI2qI7z98tlgRCTqsZj6IWA49N+OLKfPoIiwTGHV8E
 GZMor8a5jP83+2oS9hDlFN/uc/MrsBFjOOLxhFiEaCxohNMpVi/hsW6c3v9yw1dOohbo
 CIo2sYSBqb6EvF94qck+5VLX/nyiZSlxNM+XqqoMqkISeh5hPfAeYveZHSX1cEd5Saof
 gf0FCA4JHk4IHC1lhjucFDTfjjI5G7sj5vbc6iYRpyDwVdbDRy+oifZnVaWDlz4wdaK2
 /kOiDcHQ4FsrVNV4g5hJr6iyamOrHLeK0IiVKhmUqjicqHHib0YFyteilLsTjgGS+6ql
 Wqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pPwNgd+FhwESG7b/TarUMGEShi9vbglIUO+o/J97nY=;
 b=ZYoRrg3lRpIBoCxCwxYKrq+UwZM013c4/M48sh7RSOfU0euFKxiv8LKLfUgF+nXpEk
 vbDW8bl8XGYtwGHdASVDxhL4kKPxhrYbVUyia/P1FXV18htaw6QIZz/IjQKTrSlqqzYr
 G3DETUYaRfwLWVe3ukzYRvpX5Pu42lqaK3Yzohx4xDOiEgTB/RHSQSNx2rzglhdMH0r4
 DwJjA6KVa11ERM5akQRiGCZb8kgihLdoJSQKfp6KUoIm3+b2JZIe+ffTUydSq+0zmfkF
 a/7U59MPMcOpkVwEuUNxAh/A7GAE+zAppFLqBhhcb0GmYAank35k3TAQLaRlTJLUsgF+
 4XZg==
X-Gm-Message-State: AOAM530AsUw1DmlNEB+DESWsFXv/8LzfZldhZjv6TuBBTKTGM+a4GpJU
 /4gV7nAlDzBc1ynxVO6z1H3U71hGDHtZIg==
X-Google-Smtp-Source: ABdhPJxnFx8xmkv3rSLFHPuEXsWG/TfG+IeaUyCWFtAegoIUj0ToEYKzANR2dLdTbvRmz/t5NWR+jQ==
X-Received: by 2002:a17:902:ceca:b029:112:b67b:fe4f with SMTP id
 d10-20020a170902cecab0290112b67bfe4fmr15773235plg.32.1623659894674; 
 Mon, 14 Jun 2021 01:38:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/28] target/arm: Improve REVSH
Date: Mon, 14 Jun 2021 01:37:54 -0700
Message-Id: <20210614083800.1166166-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new bswap flags can implement the semantics exactly.

Cc: Peter Maydell <peter.maydell@linaro.org> 
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6b88163e3a..46d95d75ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -341,9 +341,7 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
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


