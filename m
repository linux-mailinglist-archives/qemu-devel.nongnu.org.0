Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA933A83C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:33:15 +0100 (CET)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYMM-0002oa-Jh
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGw-000606-A5
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:38 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGu-0008BW-Rx
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:38 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id t16so6881805qvr.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yjdtKlRm3WuNdcNC9EUZQ7YJqY8dzEyQHbjSnP7J42Q=;
 b=FnH7s/f17efMqPJ9qLstuHjwS5rRDyjEDSMMLbZdAB0t9XllQLAf6lw1eThds0ZpIC
 KYnbt2B25RT/NM+Zdgst+0ulgVqhi8dIvWTg47eyKRyMeeZ1PpcDK0VOAyI4ttBZf29m
 DhGt+JUdFpesssIM2Rggp//3a1TlshpfqfxLOv0GATsi1co77fTayVxjY2wa/ZWcIEX6
 ngsa8PwNBlKX7lhQQ2cs2aSyNLBgql/8ZzWSZvJYbzZbRN3cqqIcsL4FwZHLehWIwfpI
 MIdlVlKO7G8pURPWVXsaWESbsaLwcXdZk/1C8QCz55SOFDKE6krjeEhqVRIDXLAsE8JZ
 wTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjdtKlRm3WuNdcNC9EUZQ7YJqY8dzEyQHbjSnP7J42Q=;
 b=HYgXvzq7O9vq/4zL6Oo8zrFfRzJxyjfFnzTI+VRNv5HmlngF6Fifk3rTVsB8nc3gz2
 N6csesut2V2qV4G51bMDImQ0AVKeNMHpUngPundKT59L3FDgwEcvE+yNBppzjFzTPJ8o
 Yu4EywfUbWeBZ+mB/VjAZjB4qpxZy5rOd7jWR0N7Ig0ahq2rMrgKQ8NpLZyL3ThocXd3
 xTjcnBwr61EmCv0HBc/EW1GvzxZRrOURVe5yti/6rzDEuUnfzW11FgytNRYFFngPbYz5
 d8pxtFZqR9BJ1DdAQCjTSL2xdZguVuArcl+7TBceN3F72exu3CGxppV7JHiHb5Xo/h6G
 KJyw==
X-Gm-Message-State: AOAM533kjGQklGHhgLOB7mTth7y0EwayTdYcmrigHy6uPGbgoUEQR7rd
 BHBC7dET//WSRkrkr9rKd/aKkUexBt9OVz4o
X-Google-Smtp-Source: ABdhPJyGZuxWKrxE4/gxMY8JnOC9Uab3azSs7IecQiDfBzll72wW8pH0F5bq7/GHmsUPvo5lv0gPsg==
X-Received: by 2002:a05:6214:268c:: with SMTP id
 gm12mr7883189qvb.36.1615757255954; 
 Sun, 14 Mar 2021 14:27:35 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/29] accel/tcg: Inline cpu_gen_init
Date: Sun, 14 Mar 2021 15:27:03 -0600
Message-Id: <20210314212724.1917075-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It consists of one function call and has only one caller.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b9057567f4..6d3184e7da 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -245,11 +245,6 @@ static void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-static void cpu_gen_init(void)
-{
-    tcg_context_init(&tcg_init_ctx);
-}
-
 /* Encode VAL as a signed leb128 sequence at P.
    Return P incremented past the encoded value.  */
 static uint8_t *encode_sleb128(uint8_t *p, target_long val)
@@ -1331,7 +1326,7 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
     bool ok;
 
     tcg_allowed = true;
-    cpu_gen_init();
+    tcg_context_init(&tcg_init_ctx);
     page_init();
     tb_htable_init();
 
-- 
2.25.1


