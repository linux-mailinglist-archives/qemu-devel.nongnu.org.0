Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95C52994D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:08:44 +0200 (CEST)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqNv-0007eH-2H
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4o-0000Tl-P2
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4l-0007ni-N9
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:48:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so1419833pjp.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=Ig4e2ZOlV6l6B/eekA8p2Y3WC7jOcp2Oi7+b0x8DuFvXpkFdWnbyciWeXw9ciEuL6W
 /XRl5XYEEaf36eqOY4Esw8pYTXuPcwzmi/wcv061oLLZhbHwFR+YCHA8JUJV/8koZdqv
 G0hqF4bKmEoGUC6hxGFiZOd3qJMxv8yXDDQTw2YWipv0Sw//+EwBoabhQm5R6QjPrLQL
 Yy+LLZGugDk+vDyCu0dCTSdeYLRJP0s9CwI4oL77bbp+uHhgkvrg/JW0zq9xnUFz19Tn
 l6lK+qwS/E3WXFWqBTtc22J1Z/0i8BWXVywCFSrdQtog3dpsFeERw0mN6j8F2Ox60wRF
 rT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=ruUI+I3/M4ckRyLf2f765KQfm2sCM5IE6sJM4s77hKD2AHUPXmR/DDmUJW3MmzB/WW
 GBctxYwvg/4guOuaKxyb8ek43RODxgoFctbUlwIBh6+Jlzo0Z8ScW4+zs3iU6EOFVT9t
 R9gJjfKoc/wVHcl8cLveGVrH4i4yo2vxEGrumkZtI+Z6mY9qmcQfwGtUb1BU1VeywKVB
 ahYFnOl9pT+S+O5i2t4Qm9R8M7KE22qEvVb3tBgici1icuzIMPnnbDeeSP8/2sqfWXnY
 pu3mB3J5GCrT41SdwNV5GvQB1lHM/RuXlbVlr3QxzAA13AcVAIHQdmDs7wsI0uA7h0Ut
 yBZA==
X-Gm-Message-State: AOAM532hFBGNf/wiujBBry0KLdpaMMdM6UaQpB6Wq4n57lUD7TsCt7+F
 AJOFoBx0eMpamwX0ch29JyLYP+IV+rHSUA==
X-Google-Smtp-Source: ABdhPJwkYRZgXpazCoH5TpezoEz662E1jUw8EI8D5xNsV9+/EAlGtt9eA0rR1mYwOoCAdRvTXr4bpA==
X-Received: by 2002:a17:902:700b:b0:15f:a51a:cdeb with SMTP id
 y11-20020a170902700b00b0015fa51acdebmr20570976plk.137.1652766534418; 
 Mon, 16 May 2022 22:48:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 3/7] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
Date: Mon, 16 May 2022 22:48:46 -0700
Message-Id: <20220517054850.177016-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1


