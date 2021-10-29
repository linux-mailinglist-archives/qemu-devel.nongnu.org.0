Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9224405BE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:23:17 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbDQ-0000EC-8Q
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9A-0001TM-Ci; Fri, 29 Oct 2021 19:18:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb98-0006hV-Ih; Fri, 29 Oct 2021 19:18:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id d5so3860593wrc.1;
 Fri, 29 Oct 2021 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IMxeujrA9pkHzGmlQQ3ZftEGFPf6+T20rNX3ir1Ss0=;
 b=n5bGVif8D3yLen/dDyF0GTte3SsTHLjO/RYMesICC77h7js6EO8LEuedJ4dN5ufOLa
 XzJoWryiZ77TmEbbH2eM/S+tDsBJ2LHj6Takv6D9oasyzki5uGc1VSb1l+acrtFh01L+
 jSK5yEHMrjBuiWfxsLTOI0muJQOdQmpsFYVkv0HIU5qXDh3wLMgTFUTAt9NrLGi+AqRD
 5wZaIl4ak/A+lHmkG9NWglqrJiffy19vZ2gYFbmpPzxzM8ArPZrdqs3XJjNXIBZHXXCN
 0lv7dKcMOKZYM026zZeLUHmuoTglPMLeIFwSV3k67Lt0EICcUbQ/3f8GoPONPh/9Grg9
 X0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3IMxeujrA9pkHzGmlQQ3ZftEGFPf6+T20rNX3ir1Ss0=;
 b=G1ho52l+saz+o+leznp+nO4HOF1/JLnGY+QSaY8RxU3J24LcBE48osjsr3A0fRUh3m
 585CbxQXFKkZeO2x7S5uG8V6RoRl8pIRkJsVXvv1OqRfkeXO5B9SvtYBf8eMmIkk0ndl
 BtOxzICZYYIVthO59PnWXKoPcDoj+Lb2JgBS5uQh9VF8XtOpRB6JrB6HUlu2z0ULFeHq
 PFQ49GRiKNguji2aaniRXY0zkJbj/FDu43ZSEmPVuSLaS4ONjtlthK86ywodNt6kscsE
 78GdAM6XDKjuztjUgu+ZMv0Oleuefa9fZAqseTfpRk5JZHXTkV28ZVjB538JHZ1QpRqF
 d0iQ==
X-Gm-Message-State: AOAM5304fQrR8I75JlgtPCfdorR0khFdZbAWh4wnrppbgpayKNUk/leu
 d9kMlo+pJksP7tdvesBYHb0THlY8Gj8=
X-Google-Smtp-Source: ABdhPJyP2Dnck145zvnW0eMTZy1ceYVCl2Mdd2RyPC6uRZ//52TA1tmnAjfnhU99jsDmRsOwtJydkQ==
X-Received: by 2002:a05:600c:2505:: with SMTP id
 d5mr14526418wma.194.1635549526879; 
 Fri, 29 Oct 2021 16:18:46 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i7sm2023213wmb.20.2021.10.29.16.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:18:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] target/arm: Introduce store_cpu_field_constant() helper
Date: Sat, 30 Oct 2021 01:18:31 +0200
Message-Id: <20211029231834.2476117-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
References: <20211029231834.2476117-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the store_cpu_field() helper which takes a TCG
temporary, store its value to the CPUState, introduce the
store_cpu_field_constant() helper which store a constant to
CPUState (without using any TCG temporary).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a32.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e8..17af8dc95a8 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -70,6 +70,9 @@ static inline void store_cpu_offset(TCGv_i32 var, int offset)
 #define store_cpu_field(var, name) \
     store_cpu_offset(var, offsetof(CPUARMState, name))
 
+#define store_cpu_field_constant(val, name) \
+    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env, offsetof(CPUARMState, name))
+
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
 {
-- 
2.31.1


