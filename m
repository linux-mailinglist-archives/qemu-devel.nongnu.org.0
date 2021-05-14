Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B301D380D48
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:35:37 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZqi-0003Pg-Pk
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW2-0005z6-Av
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:14 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVx-00075C-9C
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:13 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 1so22444851qtb.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJoH36NcaZSZ2yzHruKlic3w1esXmUvOLvdzF5tdSBo=;
 b=Wuoog4OY96XpITteXLqLnVwrvqR1vejX7ni9yJjpwrwcc09zEag86nz4GyP/21iGng
 vL0x0WXyJWvLu+agYpOuenI3NcFALPGidzGUQH98esUJ04DZDxTg9QovYKNbRXxrMkIX
 +kNd8BwMLiYSiL358WheH/jckTz119OEKbTI44mhb0xJoB/ioMWvTinDAa7QryqiF/CD
 BzPc8x3Fjlbg2KR+utC206KYSvv51WY/4FgBSdmaUqrYmxWdT+CuyXZIVgTTOtpHej7x
 Lq0veaOCtdo/+28a/8wN0FF7jljJW1xuekSVr/r0GYLt6/bFt3c/DSlyG4ii9gzdA4RA
 IfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJoH36NcaZSZ2yzHruKlic3w1esXmUvOLvdzF5tdSBo=;
 b=MFP8bE5F+nhLQIY6kCBnyCmZO+KcYy0mGE4hJ4cKE2aHa4poDDETELfje7VqHbtK9y
 Y5eklr8UQoXCVAKbwR26VtQrr+D1ZM2nDrAGmx9oBdvxrLqPB5epa2tdr5vEJgl8pTVx
 /zXl4KVyQ95vDB4xcj5yMYezw6RAK2Oix+mLXeyQhs1GpmFkA0yEyX8UiSUvqm2iVEID
 bDlly0TcJXFlUXMpK/LCduIJ5cyvq3TQ9dnvup9Pbsl1AwqqyApqfg+HYM6/NZU2adeT
 4jdz7bf27iz8k1RKgVwqDllsYby39qL/xOcJPW7Ny30qJ6wCZh4gTrqDh1b45cjz1ydG
 sWmA==
X-Gm-Message-State: AOAM532WDiotI4e3NbcZaD4c2n8CuCWavPc0fVtMoS4xx1IkCnUALFD8
 5OY60Ntss4grk4ay5Rs3pB9yFlfRe17a/o0hEMY=
X-Google-Smtp-Source: ABdhPJyAFe78aVv0xE+hI9W2lbkZS71kt7YLemYyoOiHwlb628PHgJqOd2V+sMB6R3XTvrgPwIzXSA==
X-Received: by 2002:a05:622a:40b:: with SMTP id
 n11mr43153449qtx.167.1621005248162; 
 Fri, 14 May 2021 08:14:08 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/50] target/i386: Reduce DisasContext jmp_opt,
 repz_opt to bool
Date: Fri, 14 May 2021 10:13:18 -0500
Message-Id: <20210514151342.384376-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3f6214c624..b9b94f0625 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -101,8 +101,8 @@ typedef struct DisasContext {
     uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-    int jmp_opt; /* use direct block chaining for direct jumps */
-    int repz_opt; /* optimize jumps within repz instructions */
+    bool jmp_opt; /* use direct block chaining for direct jumps */
+    bool repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
     uint32_t flags; /* all execution flags */
     uint8_t popl_esp_hack; /* for correct popl with esp base handling */
-- 
2.25.1


