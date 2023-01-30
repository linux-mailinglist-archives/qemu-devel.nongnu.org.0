Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52126681C4F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGI-00006j-54; Mon, 30 Jan 2023 16:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFw-0008EJ-3x
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:00 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFu-0005GP-BR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:59 -0500
Received: by mail-pg1-x530.google.com with SMTP id 7so3671489pgh.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgVGCieNlPxoyEgaWXSxq/bB4MIJjGptm+RNX2KPXVY=;
 b=y4qb5gQz1a9K5hNGoGTKmnvScFYL73Vp2HPHu16JeoW+psppiGg0IR53sYnZX8rZZG
 2CBB8mXzt48ezKdDGfqNdONpA8TiKNKuawPJEUPrkhzufgF7jRb/kUEB8ivqi/JBRK2v
 rCg47k2lRex7s4SY6Cyp3dj03POAab9cZhxA0NcMbkqYqa9IGc9c4o2ZKtqKqtVD0Vfu
 wX4rcZesRkeVfpFZALRVxAaOaijIaP/vSsqhKsn7/QT9YHNS4zMoGgQESQxwhrWUfWcK
 GsG7RfFEeb2mPYrscmaQXqMvr5XMf6F5Pi/4jGIQCf8UHr0JfrKgXjbRF8eHOsVFA1lO
 T17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgVGCieNlPxoyEgaWXSxq/bB4MIJjGptm+RNX2KPXVY=;
 b=Lm059egxpFZeOzoX6Prt/o3uzsObFVbenF3JGC95rc0PEIeJOslb/qdHz9/RL6A2sJ
 ddnHV7tCHTkJoyL2L1AUTynAHJiZFPIzc5yhIPisPeXXtGhTsS+3ODHWq6mI5boXKzQf
 /vcdSIiS/2Ut2N1CSRhblu9p0iokwlX119kIpU54Oe/RHoYihiq8wh7Rcw0tH4RnjYhr
 4Nz8CrfYoR1WBJMldZq03etjdyM/ih99N5eIPK1EX+kw4cmbzQx+RTlZ4n+5Anj2QLaE
 yMCVIM2Y3igtg/5Pn4q+94Fp1mr/kkwx7xizfUMh4wIkHCM2z1sg7iBKa0fHZfjt+OgE
 tQ5A==
X-Gm-Message-State: AFqh2koKbzqHXuHPGkESvCkfUxTBC1KPGkiaqTl4nyX2pg+B2xcfb69b
 XtzH971xHeXve49LuKDvjlkQbdoFeC52mCSx
X-Google-Smtp-Source: AMrXdXvySXxzcSrw41TeSeV3/DmfO95/1hPowPFFAKJKmYysEtQo+aImMod2g/EZoHw9ZDlW2FaUNg==
X-Received: by 2002:a62:1488:0:b0:586:b33c:be2 with SMTP id
 130-20020a621488000000b00586b33c0be2mr48636969pfu.26.1675112397048; 
 Mon, 30 Jan 2023 12:59:57 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 10/27] tcg: Add tcg_gen_movi_ptr
Date: Mon, 30 Jan 2023 10:59:18 -1000
Message-Id: <20230130205935.1157347-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 839d91c0c7..66b1461caa 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1285,6 +1285,11 @@ static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
     glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
 }
 
+static inline void tcg_gen_movi_ptr(TCGv_ptr d, intptr_t s)
+{
+    glue(tcg_gen_movi_,PTR)((NAT)d, s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


