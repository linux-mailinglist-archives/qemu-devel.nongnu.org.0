Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93242414A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:26:23 +0200 (CEST)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8oI-0002lY-Qr
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iU-0002FO-3c
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iQ-0007cL-Kh
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so2579965pji.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D7BNR4EL/CqUl1Os5ldvpAplvvCc0TsItdHnp4wjtoY=;
 b=yt4wC6gL1By7b/TMrYEXIW+1tSy/RVTcpjH409n/DMdD4aa8CaRFe7z63QovXstVOA
 OgQBbfjQmIcvao4sgBQox2iTwtMYniQbn4ml8funXnkj/bM3PBObvuzzhXMBc8RSndos
 U52skVggpB4aYUvPGiXI3msDYICRcJOeqZUkXhHgSoKjNzWrEgjbwZrWF/1cihVjm98Q
 Wwsw1YM3bFAMcWTH2AJ9jfAYkHLOrhWewb6CMLSJJtAu0H4SqzaeFWb/plLPpYzyzHGx
 MkRTGGG5duYG/EM3nnc36Bc8vYJgQpcdn2QEgK6788jApLJDkrKbc/eWaA8R2YpHmsHh
 39Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7BNR4EL/CqUl1Os5ldvpAplvvCc0TsItdHnp4wjtoY=;
 b=f8gkcdJV9xIhTkLLyUBVRf8vYJYEMmy6G25VvPdw3Zvg/t87koGOWJYLsyTUUHbYBD
 9bCGlvp3qWXDp/NFFKEER7MkMVBjbXsX+iRbltJaz5dbHS+HkzO4BrGoKYzvKl8q6hp1
 QaV8Jn4rW1udAMvGuRJTSahw4+jDcDt5oHXtBKDs7m/b777RgZpzcka+1uTlEJP8bSCF
 kKAPI5Te/oWdI8b7noYXHUGogtXECuaAokvAN92xL1s253svxG7PTVYrW+aCliPJeTq5
 bvG41RGdlVDUaPVUSlP756yAZFKx3dgu/gwVRR0rhQ3tcoFEDIFEbvow4AVulNVb3sqx
 kjdg==
X-Gm-Message-State: AOAM533yX3UPw8vryjd5sG0cE/ZlmruX/7Rx/qKCrQQclEkg+fkaoS/3
 Di7Ejf55kvjvDtli+79YS3WBpa1tgL/LHw==
X-Google-Smtp-Source: ABdhPJyXtOhCI5FBKH0YTA1fLgJXINm2duYKiDEohm73dT5G+ydZE7LbYuTLthJWz45fNaSTfJqh4w==
X-Received: by 2002:a17:90a:8b8d:: with SMTP id
 z13mr11700666pjn.214.1633533617291; 
 Wed, 06 Oct 2021 08:20:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] tcg: add dup_const_tl wrapper
Date: Wed,  6 Oct 2021 08:19:49 -0700
Message-Id: <20211006152014.741026-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

dup_const always generates a uint64_t, which may exceed the size of a
target_long (generating warnings with recent-enough compilers).

To ensure that we can use dup_const both for 64bit and 32bit targets,
this adds dup_const_tl, which either maps back to dup_const (for 64bit
targets) or provides a similar implementation using 32bit constants.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Message-Id: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..1bb6c0ce3e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1272,6 +1272,18 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
+#if TARGET_LONG_BITS == 64
+# define dup_const_tl  dup_const
+#else
+# define dup_const_tl(VECE, C)                                     \
+    (__builtin_constant_p(VECE)                                    \
+     ? (  (VECE) == MO_8  ? 0x01010101ul * (uint8_t)(C)            \
+        : (VECE) == MO_16 ? 0x00010001ul * (uint16_t)(C)           \
+        : (VECE) == MO_32 ? 0x00000001ul * (uint32_t)(C)           \
+        : (qemu_build_not_reached_always(), 0))                    \
+     :  (target_long)dup_const(VECE, C))
+#endif
+
 /*
  * Memory helpers that will be used by TCG generated code.
  */
-- 
2.25.1


