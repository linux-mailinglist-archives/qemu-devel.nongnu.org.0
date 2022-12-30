Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14C6593BD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:16:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sK-0003LV-Sh; Thu, 29 Dec 2022 19:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039N-2y
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rR-0002fG-UG
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:00 -0500
Received: by mail-pl1-x629.google.com with SMTP id g16so10694960plq.12
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=WOoRfVyQTjqZkMg1T8esrWnGgkOt0/+1E+Xu0U1kHFE9wHeg3BdOX1wTPbIhIJsFGh
 dcdPGjuWso3NfICWkuHxcKooRcdmDGIk+30SrKLpdxW4bpN1OVeHzwSVJ2Lj3ZOBmfOD
 pfqzKXdMVpyB9GCMMAyebYaFK0bihjOxjdKIa0OoB7EtsWx969K9/STFQAu5CUx8wgzP
 jZ689PuMj2DyWh6JSsaWgi9ZzX51AHq/bLXwGek1w2R39YUSie516/W3C2FR9Z1rLCeA
 B4wVDGQZN/dJTB3nZpclgLCYUSN1yDyXtJlngM0W4XxOfUbgRSLbTaGExQs9KSiKRzLh
 6rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=4i2NE4dxgZhz6IA+lx/MveiMdNkxE5aKRg/SoBxEY5wfBhBPBF5JGRzQK2s9aVpQMp
 z0OKx2fsWefmcqERfEzw+Aeq1eQwEwZ2Z+T+3jZgKueMiWs0l0LIfON6aOJVPoR92EXw
 CI/TVVe30QpZF48pq4zAwtyYA3q+duFCyvSmS3gLfHOzNOhSbJml4VU2+lPd/r2hYe7C
 pB7VXKz35ymNgjk6imXQBCmNvMMqUPnRM1HsMVHkulSffpzE9zAeIvuSxtU+reaplSaI
 +/cg9R93v4Yf7F3/jSWhUXFXQplXc0elxDxPswqE5fbzOO7rqckuVMh65Tx+KE3dMW+x
 pOTA==
X-Gm-Message-State: AFqh2kr52FGjJLzR6nYUggoUeIWPM9JtIvGG9J36zyikPJtZDzkf434f
 4lWnWdvTbSvF3D/dLapyC5BefzwhfFZG1Tcd
X-Google-Smtp-Source: AMrXdXsuZTAHKLxoS73NTYDi/rZLbTm3da7w/DDEOLCUliltizAqqTiZG6RVPA/2dwqVR4cs1ojpTw==
X-Received: by 2002:a17:902:f786:b0:192:9d79:d3d6 with SMTP id
 q6-20020a170902f78600b001929d79d3d6mr6293450pln.69.1672358566868; 
 Thu, 29 Dec 2022 16:02:46 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/47] tcg: Move TCG_TYPE_COUNT outside enum
Date: Thu, 29 Dec 2022 16:02:00 -0800
Message-Id: <20221230000221.2764875-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The count is not itself an enumerator.  Move it outside to
prevent the compiler from considering it with -Wswitch-enum.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index afa18986b1..f2da340bb9 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -294,7 +294,8 @@ typedef enum TCGType {
     TCG_TYPE_V128,
     TCG_TYPE_V256,
 
-    TCG_TYPE_COUNT, /* number of different types */
+    /* Number of different types (integer not enum) */
+#define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)
 
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
-- 
2.34.1


