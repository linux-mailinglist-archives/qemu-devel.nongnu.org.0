Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CF3895C3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:48:47 +0200 (CEST)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRFO-0003dU-0I
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQye-00043P-9c
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:28 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyV-0005kB-AR
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:27 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso12656592ote.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MmALl6+SrAgZGE+y4AHRDA6ukcJz+jYrukcq8t6BAbA=;
 b=E7Qi3grS40snfcUegvCNE9Ukgir8DUOneR0HOdM/5u5omYiQUBx7LZcCSxX/vR/4f4
 oMoBuCl1B0xNEqfsHb49O7mtmUgrm7jZTvwODPlXZxbS48NvuWWhqtiS7tbs6VlQWX70
 Z66N5Lo0CjCSAkVeP0dauTMydVlZlUBL1nK8jNvpP6UJpa+nTfhjA/BN/ATlcwyxMcSz
 CRWh5lR7j3wlE7EvMkGn8oqO1kzDzcX3K3WRC2/0ulZdDdvVDvAmsQeqrBZU4QHG5TUn
 3M11lFfdWqzYKD/JFNIaF0VGX/xFsj54nluKLp4kLsxMhmuoYo+nCqZ3jkcu7RPZLxlx
 YoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MmALl6+SrAgZGE+y4AHRDA6ukcJz+jYrukcq8t6BAbA=;
 b=P8o9EnfsQyGzVWliOgg0BnBBQKvApROq/FQj7+IiEN4ly/2LZ+h80vyZzCfcZBUQ9F
 iSRRJx1kRhdcoI2FCNptSzijBnqZE/J2HD8bh0X7V12/vi1ZQtTfXyncGODPIVfV4wSk
 oinp4P3kaUd75I2UHZt/Zg5s6R2WG6Re1up6TpqQ1kh27mCcQOzoEAPo8/JQNYCoeo5V
 AvWK8Ig27dekXms98lb784HQcoYtFfDPnk9wM/3me1FFSG0xNAAXQa4BA0NTh/OSXaTi
 w8dTFAGURwvAKxiWaBh0E231V1W8N1vJSCZNkxF8yds9401NVbp/Ar2L0EMdqdHOUQTv
 UDyA==
X-Gm-Message-State: AOAM530xERdEGhx/juKhURmnGv5La5SfvrQ97/kaxVz7njx0DY2xPtqv
 AhJO2Q4e3OXJXn+I5Mn8C6/FkOzC4gJZ2sXA
X-Google-Smtp-Source: ABdhPJw9feZSzAdfxpfZaVAs+i4pVfna9mhjfiAYpQ2h98QwalOfXvdv9qZSsPQ3BENI25ipXco4CA==
X-Received: by 2002:a05:6830:1e6e:: with SMTP id
 m14mr626268otr.215.1621449075289; 
 Wed, 19 May 2021 11:31:15 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/50] target/i386: Reduce DisasContext.vex_[lv] to uint8_t
Date: Wed, 19 May 2021 13:30:23 -0500
Message-Id: <20210519183050.875453-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, vex_l is either {0,1}; if in the future we implement
AVX-512, the max value will be 2.  In vex_v we store a register
number.  This is 0-15 for SSE, and 0-31 for AVX-512.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-24-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 61c0573c2f..1367e53e4e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -97,8 +97,8 @@ typedef struct DisasContext {
     uint8_t rex_b;
     bool rex_w;
 #endif
-    int vex_l;  /* vex vector length */
-    int vex_v;  /* vex vvvv register, without 1's complement.  */
+    uint8_t vex_l;  /* vex vector length */
+    uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
     int tf;     /* TF cpu flag */
-- 
2.25.1


