Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B5380CF8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:29:13 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZkW-0003LM-L5
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVz-0005xi-J5
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:13 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVt-00073Y-Fx
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:11 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id w9so15570099qvi.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v08dNCUR+fN7w5GyhkzzKQU94qjvyNBgVPpCT3wlKEE=;
 b=kTaysS57N7ob9A/85uu/8STXBNdF2YAjQ3N1VmTo84pYn2c0D6+TuoTcrwWMsxdkuJ
 VQdZr0WvPiy5/5c7+eMSjYww/YNnN4l03yr1LcwEeZDond3iC2XbrOuTa+Eq+avFesTe
 BB8AIOVUnrEdOGpq5qvDNE7WGY6JsAj8923Cu/2/DDF6rpLbeq+eR0KpxyW1lx80RpUO
 if3ajxmBogV82U06jXtMFX5yNGQR71tW+C6FGD1zZLLpoRgV61JjgPqhcZZQ4i5JspXj
 F/CvydzUc4+J25kUJtRTNCzXDOgoiX8tD/cFYtiX/nf3nuy7tQP2NFPbuUgN+xfjhqyN
 h3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v08dNCUR+fN7w5GyhkzzKQU94qjvyNBgVPpCT3wlKEE=;
 b=XSWpVVESGkJZXu314Z3aBH/Pzj6KzXlyohljRJuMTPVAquHwTST7muoLETHYmGCNaq
 ZiifEHV2NCdHSujJyUj2gh2MCEvizcTNi0EF/iIlzLg0WrqBkRmMleLt7hj8xiiltrfZ
 fW7wnRsfdjBlc9vDTP69xD/aJc8l981lNcWF5/gBQY5d7ESBlG3ZiBJrlIGFIYmvsKzC
 arDVHG9bi1TqIjgTEMccYGmk4RgKCXTCiHKnSDfMv0xn6oVuF4LEFSpRmNTSFBGNkwRo
 vJ/wUrG2fk/wvUTgNuReqZAhFqEwU62X5VO5wbbj/sv688ocdXBxdD316JKrzhuU8Eq2
 sEjQ==
X-Gm-Message-State: AOAM531SR2WTgxlFbx/g2ewG5GysvT7hRr30AXZ7kZIYcEep2qee7jIO
 AwQrncRlQiROAtZn+azVnT8dIoM6ahcotwqE2oQ=
X-Google-Smtp-Source: ABdhPJxvY7Me+znB6ir/8zjgii5pxUg9+Nr6uBDxVhb16ehu2isETfOe0KPz4QagW5rAco8V3HykYQ==
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr46904630qvs.55.1621005244549; 
 Fri, 14 May 2021 08:14:04 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/50] target/i386: Reduce DisasContext.prefix to uint8_t
Date: Fri, 14 May 2021 10:13:14 -0500
Message-Id: <20210514151342.384376-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The highest bit in this set is 0x40 (PREFIX_REX).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 44a28858aa..61c0573c2f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -78,7 +78,7 @@ typedef struct DisasContext {
 
     /* current insn context */
     int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
-    int prefix;
+    uint8_t prefix;
     MemOp aflag;
     MemOp dflag;
     target_ulong pc_start;
-- 
2.25.1


