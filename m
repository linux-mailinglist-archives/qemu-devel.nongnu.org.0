Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097E32FD8E
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:39:54 +0100 (CET)
Received: from localhost ([::1]:59328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeeP-0003bo-Fv
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb1-0006vk-TR
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:25 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeaz-0002wq-UD
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:23 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 18so4646694pfo.6
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myPurBGQOJ9HRp/gWQglk2sYpbZ88UPxyO7dwBmpmMU=;
 b=m1Ai1dw9Za2kqbDvuaKHBLrY1mMGZR+HzdzI5hAX+4V0K0PRn1V3NrF1bEPOZqodSM
 UWiZ/7MEFLXbu8wjKqbJSw0W3NN/X7H7qFWnqzVuX1ElhFIRGOKNXxVhkwgGTx3JrKf+
 N4ZCq+P9b8tvYoPzB1B1MeYiNkpp2e6kJgwW3/AfTJBRU3TpZDlqxWvokHAqDTVp7NY7
 h6XdbTPf0LZxSrLiosV+DiukBsdvBdbQm1MqeAfco+A0Jbz/7okO74zqYtq4ueA/Dm9S
 9dV4g9DNauy+FGsTWIDyWkoStzDdP6VLngPuRqKT+3o/jhn/2J0QeeFXPl42BMpOwutb
 oLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myPurBGQOJ9HRp/gWQglk2sYpbZ88UPxyO7dwBmpmMU=;
 b=qdK9zZ4j4kTUxOPkratyn2mDNurdSJAkE4ZFe1juAQmSLGEfzyWe/1Be9Q/yMhUO2R
 5GnME5VtonwsAAx6Y7NXoUgeIvWlrSRq9Czno9F8l2pwHpkbaHoOpNEwNTgxNCw///DR
 V54AlQcy9aTh2AHggHswoG7Iv6nYKxYKTmNZoOF5IGOR2SccHUIrvTFMLEz/DL+Qr/Ve
 xtjzkXHze1+rMFhwW8rih3VDksh+DI06A7KswQo1kAIpcrpZsbFXWhJKrH56evnWcLbl
 /90fRo9tWNHUZ9iAHq5RBID4L8Smv0aqlVz9lchvURnjyw02S0aSgmECSKIFxprd7UBg
 iIFQ==
X-Gm-Message-State: AOAM532pghlo4i/q1H3DRqR0HCaR02bE7IArXYyp1QD9A8/l9Tc7rZaj
 u7dRXhnwEM6vCtUowokzSPZOc45g9MH1kg==
X-Google-Smtp-Source: ABdhPJwsrEYsqRyvTUwVNoHg83HASGiG3enqQojp08gp57WBmsyIQ41bQRB3dAFV613tQTPvOq18rw==
X-Received: by 2002:a63:1958:: with SMTP id 24mr14477563pgz.320.1615066580592; 
 Sat, 06 Mar 2021 13:36:20 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/27] tcg: Split out tcg_raise_tb_overflow
Date: Sat,  6 Mar 2021 13:35:51 -0800
Message-Id: <20210306213613.85168-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow other places in tcg to restart with a smaller tb.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197b..bbe3dcee03 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -346,6 +346,12 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
+/* Signal overflow, starting over with fewer guest insns. */
+static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)
+{
+    siglongjmp(s->jmp_trans, -2);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -1310,8 +1316,7 @@ static TCGTemp *tcg_temp_alloc(TCGContext *s)
     int n = s->nb_temps++;
 
     if (n >= TCG_MAX_TEMPS) {
-        /* Signal overflow, starting over with fewer guest insns. */
-        siglongjmp(s->jmp_trans, -2);
+        tcg_raise_tb_overflow(s);
     }
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
-- 
2.25.1


