Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9905A64BE7B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:34:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmn-0000ey-VR; Tue, 13 Dec 2022 16:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmj-0000d8-S2
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:57 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmh-0003Dd-93
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:57 -0500
Received: by mail-oi1-x235.google.com with SMTP id r130so1053666oih.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=u2VYPKwTiOzufQhtwVhv/H7VrnIXSasov7WRww9TT82jmeEwxD6cOYxrV0yfGRZYps
 z+Q4DNUERk8wBghRze+IwTI1sIKqgqn+di7ypjF8pkclsLgbcUlgen4O+WXrdmvzEeRc
 kiHVLlHOnr+Vc87qJUD65OcAaLGmZh/nMqsmgO7W7iIW40G1XkMvxTPNFND5KxE8zN1n
 J290vYJbhiqor6dyRGqTFWHDAv7GlBiqOFtShCN0jAMij14VtK2kDz2tSyNm2ut2pkNa
 8aGMHvW0c/RMvVLT9bThekneGuvbYr3oQ+CNGXbKF7GBgCLrX0cit3lGga5jV0jZtTVh
 fgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=1I40lw40mdvyLvl3n/eN5q0SByeGGndYWE60XjY9Ig3mbaZEQZbZCctMA5CkXjU1FW
 bA2NbvU21kR167uooyZk9i5jnX4ifmL9QxG/xKgAxGn6Yj37WOFKYxQ8QpOSu/mIKQPn
 pE83jxacfAP91LpaYSRpQjJz8akh9Yb4XJ1kHVio/oNeOyxLAMUHS9ZYTGkkU522E+yI
 Smp85Fy1NAEfruItw7LWGXOBcooL9O7Z4Pu3/05OmlQQ2REHNHDj4nQdiN6Yyb6PKrpG
 H6u2FkQgsrYRKswkcw3JDVVt47I/bgeO8iEPZYYPYnvbIURtdrJ7REfwf6jkPTR3H556
 /izw==
X-Gm-Message-State: ANoB5pkON4x5i91vy61MdQUvfuoaQqxdoWfaJSOVWcInwsDN+f+8X0EM
 2++GWG943HtWfE1scU8XkYVHwtl94TdRtceeKxA=
X-Google-Smtp-Source: AA0mqf4PNhkyZa4gInsybScGOCVYXezR9zB7gpMro//5bhTQeE0NTOMD0fy/W0AcvU4vGemoIQcddg==
X-Received: by 2002:a05:6808:491:b0:35e:8855:1f2f with SMTP id
 z17-20020a056808049100b0035e88551f2fmr5502380oid.31.1670966754631; 
 Tue, 13 Dec 2022 13:25:54 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 11/27] tcg: Move TCG_TYPE_COUNT outside enum
Date: Tue, 13 Dec 2022 15:25:25 -0600
Message-Id: <20221213212541.1820840-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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


