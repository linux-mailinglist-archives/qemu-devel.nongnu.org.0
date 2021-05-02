Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD6370FD6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:30:53 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLY4-0006tN-Le
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMV-0008EZ-56
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:55 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMT-0002tC-Gx
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:54 -0400
Received: by mail-pl1-x630.google.com with SMTP id a11so1869772plh.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d8CBczrHncTC7jkXzgGz+cyQf3ESCXlA91ntw2lzZG8=;
 b=E+rva+qJrH5ryjX/w0DsX04yeyndYJamgacOvmFmRACHYpAs0grm6ePy18ilacQAsA
 xr4WDjYfbs+tphG5T/95j8JjFoIZWoqnlIBy7bM4zmHOqh5lxHMQLWdPeIPmPLXgcy7E
 Rfc28rHjHfuhdvSDpBDoKqfRQnI365+Fz1t8qM7vQRzXDbotddOL7cIhuDHk+p0aXw4x
 OpXQVYLXxGki1aAaJhF+AElbz5ZX14NAYnYwFV4iWLfGWvNdy2xq/5HfG0udX395MwNm
 /CD18DqC+6/+tbH57860V7mhuwzVI+abWLIHx7L4zS5LZ9B93TJS/06d9hmSS1tZZb5v
 qV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d8CBczrHncTC7jkXzgGz+cyQf3ESCXlA91ntw2lzZG8=;
 b=hrx+tox4vmEuide3fV88h/PC+5S7ovCJF0fpTVWDwNLa0OJZMaZwFRmEgWLGOEOmuA
 qU6kzH/qLervf5EFp5MGybOJYKdeyFSTMV3uNVg2mJ+pAAlFDbEchInuzCpUIdquQgyP
 zPrDZJFjukrOsLJDJ1Jj/X8FPXZ/0ZF/fU/WmfId1EcU7pztdnNouK3Z+oOCJua0aHG0
 wHaxsJWcIpW0gjSIv7un1+9445vVu/F3j6VHhQmzBAiMxKEaJfCIzsZ77D0xZ38Q/CLD
 MGyuwpNf/tfMTU3Ms3nOAEtqqp62mihqkslxs+ZwfLFop5OPS0xrWASp014YDrbOPm3F
 5+cg==
X-Gm-Message-State: AOAM5334R2EIlxJN05BJ2VvPdAa2CBKfnK11ZbiO3C7JEtbuXKJJolMv
 Z9a1u6Fu1Uw8SHFHSx5dkhe1IPF7Ycmo3w==
X-Google-Smtp-Source: ABdhPJxIkpVscWH+M2KVghjjC/eW6sKgaMGpz5KucvyHG0dUzPpCjfLO3/YNSuTroBV+U9k5bYnGnw==
X-Received: by 2002:a17:90a:d17:: with SMTP id
 t23mr5025999pja.163.1619997532215; 
 Sun, 02 May 2021 16:18:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/28] accel/tcg: Inline cpu_gen_init
Date: Sun,  2 May 2021 16:18:24 -0700
Message-Id: <20210502231844.1977630-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It consists of one function call and has only one caller.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9841eb3fb6..d55ecbe195 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -245,11 +245,6 @@ static void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-static void cpu_gen_init(void)
-{
-    tcg_context_init(&tcg_init_ctx);
-}
-
 /* Encode VAL as a signed leb128 sequence at P.
    Return P incremented past the encoded value.  */
 static uint8_t *encode_sleb128(uint8_t *p, target_long val)
@@ -1331,7 +1326,7 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
     bool ok;
 
     tcg_allowed = true;
-    cpu_gen_init();
+    tcg_context_init(&tcg_init_ctx);
     page_init();
     tb_htable_init();
 
-- 
2.25.1


