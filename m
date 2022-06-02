Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234353BB7A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:18:21 +0200 (CEST)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmaa-0006ai-0b
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVl-0008WT-3H
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVj-0006By-EI
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:20 -0400
Received: by mail-pf1-x433.google.com with SMTP id e11so4998006pfj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TlQd9U4tjMzAzpm7T3B0kc5/gc9CrLmX8sJ+ar9r7o=;
 b=A2goC8g599B6WZFE/VJKcwMd2TeNeLXTiPL1TLzgqeul+GdlB/5na1onyq8WVrpKt8
 S8rdeWrCESjDI4fp4VkLsAEjYGh33eiXhhETIUKuuPsmcWYX+2wVxgdJiGoIn1UR8T3z
 HqLhPhVq2CCy+F3/0CjQj9mO6pxjGuT5+1l2Ks9DTIqqplgWC3gGpEUaFzthF1rS/gM5
 yhprK3V74C9pwY0NLWuk3F4fQygNZZWzhVYprRHRLE14sB4kqQKqjiDbU/MMaD/bXlJq
 SaGMb8+yJBT1XnofFLf42sf0CeKjIw+D6cHrW6WlACnru3h9uyUGrGtJ1YMas8cCVLoW
 XeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TlQd9U4tjMzAzpm7T3B0kc5/gc9CrLmX8sJ+ar9r7o=;
 b=qBqC0S53vcVFUVkAf7qv3J68bNCim2Xg1MfJU99/LYLfvFZYohR73R6np3dT7B+T6k
 b84Zu1VjQ+rKtTiGp4k3/YjL1E3L2/X26GpSiNvQvnPmQjz9uChLRcHayo3/J7fuehNo
 wrj3WBvz1avj73ixPSzw02S8LUYoOsTSK5sdKG2eWuqh2qvg26CFaPVraPA7EgJ2UIST
 dtlNwFWH2rjAQol/6ftEOHQtUOQCRd05JdGKLP0SbFVRIHMmomAiYCXIQHtxivwMy4oJ
 PN9N9wZAqrclc7hvoLJYV5vnGFyl7w8plZoe5p8RD4uGyRCAjMVfaG2tPT+h8hV/In94
 a8Sg==
X-Gm-Message-State: AOAM5311JnLZPl9GJJo7FV6TkaebD3heaFNcx1jjFCMAo6mCofpita1e
 URqMt9KHOTmUI+sN7B17Wq7VG0J2w6T59A==
X-Google-Smtp-Source: ABdhPJwmddSbuJoCyWLzqB0pEBdFkXlc3/wTmuquPoglzWJBRZ+EPrEdumfK7c0uygrA6egP3VW4Bg==
X-Received: by 2002:a62:6411:0:b0:50a:81df:bfa6 with SMTP id
 y17-20020a626411000000b0050a81dfbfa6mr5742280pfb.26.1654182797984; 
 Thu, 02 Jun 2022 08:13:17 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a170902820100b001618383483fsm3625159pln.224.2022.06.02.08.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 08:13:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 1/3] tcg: Add tcg_gen_mov_ptr
Date: Thu,  2 Jun 2022 08:13:10 -0700
Message-Id: <20220602151312.477967-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602151312.477967-1-richard.henderson@linaro.org>
References: <20220602151312.477967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an interface to perform moves between TCGv_ptr.

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index b09b8b4a05..209e168305 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1288,6 +1288,11 @@ static inline void tcg_gen_addi_ptr(TCGv_ptr r, TCGv_ptr a, intptr_t b)
     glue(tcg_gen_addi_,PTR)((NAT)r, (NAT)a, b);
 }
 
+static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
+{
+    glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


