Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80CC362880
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:19:18 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTzp-0003c0-QT
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTiD-00046c-Ec
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:05 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThf-0004W5-Mc
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:04 -0400
Received: by mail-pl1-x629.google.com with SMTP id t22so14153224ply.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
 b=on1k2vf5G4Nx0xIg2DtfIG3D/oabpkqS+D0rI2KXDgx4ppDZNlgW8cDBjiQfP0InmB
 Th4tPlGBmBPZ/5Q/9P8Zv146QycNLlmlFzPGbK3tJ9Y/dUW6VVMTLHLbEyxVpwQbZLkP
 YwbCBTX1OcvVUhIjqdNjn0C1xXKVnWQ3rlYQkDhGm3WCELDVnBh3KrL+KxejzuyLV0go
 Fo2vf/8oTbWDWZA2a9jtGS0As9IVtn8HcdI9PRJ3QoIAeTr8vKQrbvY6P1efdVA+3tKQ
 OQAXiJWqIFt7G7xq/5clfJ2ocZ+3OwBK1EdFijfe6YSbEJIs+siwoiuiZr+WiXmEb/4F
 rEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
 b=RwnChH5NTA6REt3D0lLwdaO36v07DC6PtGKhDgE5RsTh9FywgqGp2lc8EOT6V+Fd2U
 HXcdR7cSZ6DtouySr7sS7Yr59WbZLcvLnbpqUvLfEWKk1JOFQxgT3ErWGhRDxGR5KWYi
 mHBaVsWMdcdI5OxOwA/Zhw2W4HzXMhZJULZiDUZOq0w7vx/wbz7AQqhPqkkT92Yzl1a3
 V6hT3GHs75Ccw0Of6o+NfFW3NH0RZ2jbEX4qnBuEpgtJV/O1ddBjm4FsKA0f9twbFF/3
 cR5a9eWw0RSB4Z4Dsp3joTNgLuXX4pIHcCU4FUxo8pD99hyPWdI9gvwsDJa1vpgj/NOQ
 UagQ==
X-Gm-Message-State: AOAM532gvSWqbLgsb3lWEIUV/OEA44K8GLm9cu2s0YFIelxHQqllcExt
 1D5tpw5fbMoE61aSU+ff/6ABun4FayrWiA==
X-Google-Smtp-Source: ABdhPJyMVx4P1oPQsXsvftA5bvIHsjIicFpSnk0yS65UdYuHU7t2/VWpCLOaIbw409D51hRQ8LGMkQ==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr10964450pjp.232.1618599630294; 
 Fri, 16 Apr 2021 12:00:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/30] target/arm: Enforce alignment for sve LD1R
Date: Fri, 16 Apr 2021 11:59:59 -0700
Message-Id: <20210416185959.1520974-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 584c4d047c..864ed669c4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5001,7 +5001,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.25.1


