Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5C3895D7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:52:55 +0200 (CEST)
Received: from localhost ([::1]:41150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRJJ-0005JM-Oe
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyl-0004IG-PX
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:36 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyX-0005kw-DD
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:35 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so12616539otg.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7/mZ3OBU1PFkFN8QyiVnXNGXP8bHJzSnl+yFiRCNuE=;
 b=W7E1tQl9SvFS2Z15xTvE9J39X05VP9JvRK1ocA+XC74w49GaJPoNviOidNrzeazb9j
 ehylXHm3Y45+nqhE66Dg74jeB4o9sCsYKWSAwPBSk6RvteIKTY0Lzj5Qqr61D+Hm7MgV
 bWQUdHFNMJDeSjVJvY1bdvakLjCcDEXNaHkcXpG7DjJCYzWcReL1PBpYujrzv8c3BX9E
 LNT4vCAl2snApEjsiIsG4AZ6DLKbLzpKtU15aqSKzM25RxhhSpEGHYUD11ol8y++ObcB
 gQvqK1eSJuPMg4aFXz3b9LsnbLzKXpyWDKBIB091Wo5w25O9fJDGTsafx+fQjXzuUwB8
 LLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7/mZ3OBU1PFkFN8QyiVnXNGXP8bHJzSnl+yFiRCNuE=;
 b=ssas2LTISw1S77bl7Klbb4HUNK2NhlUO8L3TQ1pFiRYee+autPv7gKfsssJyXpwgCg
 IWk62SucE0kJt4achvrYnO8A5SpMtAWOueODPBVU7UJyiTgtDR54TQUFvCwQZEHYJEJC
 wc3veCXhfAG+bYlh8PiECJ2r7vJulWdK/UxZPaQCIZa/dtvkjCBN43J+LZ2zwRLOdrGK
 cjqhwXxVxuY0cei74JI44b3Vl4Wir/27XP8KWbu/Q0i0ZqriGN3ujVJ3N2FO+b6tNgQQ
 AvVGK6ziHKQO4Y+nGFtiehW2suke6ui69ZkFXJUy10xOMVzH24IIDkNfgWCDZF/h+M9J
 JO7A==
X-Gm-Message-State: AOAM533zoeaNCZm8ecRC7lgot0Saq36f3H4tflgwonVbQfEmQlRtXIYp
 HlgNCGpR3FuBETXrmS1yNVayYYRFjoMZvVDw
X-Google-Smtp-Source: ABdhPJxkPA7hN9PsRYTQNNgnqh9o0XmScLpOG9E603rxq1kLFIaJmcqAzwI6a7vtYpjsQW1ML8+xqQ==
X-Received: by 2002:a05:6830:1510:: with SMTP id
 k16mr652122otp.290.1621449078228; 
 Wed, 19 May 2021 11:31:18 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/50] target/i386: Reduce DisasContext jmp_opt,
 repz_opt to bool
Date: Wed, 19 May 2021 13:30:26 -0500
Message-Id: <20210519183050.875453-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-27-richard.henderson@linaro.org>
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


