Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20F355CE5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:30:19 +0200 (CEST)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsL4-0003xJ-8y
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lTsJs-000359-Um
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:29:04 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lTsJp-0001xS-DY
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:29:02 -0400
Received: by mail-ej1-x631.google.com with SMTP id mh7so14012901ejb.12
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgiTpDshRiw4d+T/hmNL3qR3zOiy26fGm78fm/Tov2o=;
 b=FIMENiMg1JX24cEEva4a/lT27uFLU1N9qJLCse48wwqi/jspJu+NunfXMjKnLW4bwc
 I8JKPGx25MggIbFvWAlSZLDjEuY0+F/bJ6EXUi6GQRtUFQ35zo7hF53kdFJLNNC7e1W8
 FagAk8M85yCc+1PqSj8ksB3vPyVrjJFbkeKEv1PihIEBD8yRE2I+W+gNoVLTAWgqurRd
 TmTpD8WXBZ3FEBs4i1gFNG1ATV21d9grvbfzPuwfLmb6WEHtF1TGF69l037CD32iYhMa
 1uSZdYToZAaxmB6g3kMcIsajO4Ye+BQ1yS5QXXHbYQLZsUuV71o97ikY1tC5kbgJFqYq
 zLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zgiTpDshRiw4d+T/hmNL3qR3zOiy26fGm78fm/Tov2o=;
 b=exUBOw3ecb9mGfQeCSqjvmH63ZLbPzsNWlZyx2fU/ZX06AI0eROw5z3UewSvI2Y+nE
 4iW8nLL6GR+OwX0Yt2KgWXA6AVUpc2+a/7oENir3VxiDR+BirWdZ+ZVg4hkviBOtHbU1
 xX4C5D1cgC0MKMBOEUMxKxrN7fwe3UvCXlMOIFn33JDuQ0WbnaR9GxDiAv3pr+3wEep8
 1lGSEzYchsoCLf+/8Av2KSRuvGZgNXnERPm1FsBcrELM7xGwI8FZ9KambsOpmKpaJQa9
 QQV45/z0f/UXZ113ZLOqoXAF2L7ZjqF+YmOhsaGWHtINdHsAG/l2oV2fc6M+KPfS0C7K
 Z7Dw==
X-Gm-Message-State: AOAM530FzZj8yMuRY/mzW5xuMHXYA1x4efeWCmeStH6SM5pIX4MkfO3m
 btSWNzL16q0tTLBqE0ZfDoR6AGi2XETIiQ==
X-Google-Smtp-Source: ABdhPJy3W9VNfWzp5Xnctto4o2rZ+LiUcHArSlnIeBqH2O64Pa2VI/Efco68RJJIA0fka+TX8i0zow==
X-Received: by 2002:a17:906:32cb:: with SMTP id
 k11mr7615828ejk.158.1617740939421; 
 Tue, 06 Apr 2021 13:28:59 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id bo19sm7703479edb.17.2021.04.06.13.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 13:28:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0?] target/mips: Fix TCG temporary leak in
 gen_cache_operation()
Date: Tue,  6 Apr 2021 22:28:57 +0200
Message-Id: <20210406202857.1440744-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a TCG temporary leak when translating CACHE opcode.

Fixes: 0d74a222c27 ("make ITC Configuration Tags accessible to the CPU")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c518bf3963b..71fa5ec1973 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -12804,6 +12804,8 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     TCGv t1 = tcg_temp_new();
     gen_base_offset_addr(ctx, t1, base, offset);
     gen_helper_cache(cpu_env, t1, t0);
+    tcg_temp_free(t1);
+    tcg_temp_free_i32(t0);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.26.3


