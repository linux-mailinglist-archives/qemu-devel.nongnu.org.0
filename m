Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A513B6ADB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:12:21 +0200 (CEST)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzUK-0000WH-AL
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQW-00011N-Ou
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQQ-0006I7-U6
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id m17so9746762plx.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6g32w52G2pzRv3LnQoNyzNgEZsD49+r9MgWNfn6Rxk=;
 b=QvKtXlnZbHcQY4OMIAeclzjAkPZV5JhwDnKEzNE8uqmfZkbjH9mq+kUvs5iIB2wKZe
 +p6DoliIy3qbRxd2DlJy6drAI5qHWYjKizqCqt2yvdVQDcfmkuCcIOP30jhX9kQoBgVZ
 2W4bkJhyn2Qs3raF8YQqo7WTCeLY+hPE+4jea+UqMirTriso+jebOqJd43IE5mSIt2Nz
 Zm8QWVWp3nt2SskiU2WRSb2qvaNbFKMxs3zDrlmobgIHKuUgnI3exlsReHPsYnBoGjC8
 TJpbeYnV6a+CMDOhQDfuhBjFirqGKqyelHeKolZAEFJPPyMefhJ1PbvjK3Xx4siCysk3
 Glaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6g32w52G2pzRv3LnQoNyzNgEZsD49+r9MgWNfn6Rxk=;
 b=OECAwMK3/J6bLKSlw+IQ1G87ZRFUbZUoBy/npSzkmrRrtgYvYa+PuUl4sv0/EQWWHn
 v421PZCtRCU2+Fjf3tqEWbLq2uUkW/ZWBRw8SDEf+Qcwgrm4ZtYQxMynGWOqzm6vSN8d
 gMKptKy7cFLKLCppEiBjFsJNC0V7z3SY/q0iFX9SnrJ5gjlFo9wW/i+cT1epM0vp8HUe
 8zyFMA58VQzQWV/73sNaVtslr6BfV5OcwMTMfAAOxK93VxMVjW1vyZrteyFSD9iS/4Lm
 /GwtBG3NqTBS8gwuaHk0qoUhQVsJNqFs7raxGn18yxdSaZ/YGA/6GA2sVwyM5ZyOcj3W
 DJyQ==
X-Gm-Message-State: AOAM531F58oCFQDqMIVTq1hO+dyANda6F4TGvSJlIawkuCkf7zLNoLWI
 SRGlWQ+Its1g7+WrLV5AgPJtrTi9UythTA==
X-Google-Smtp-Source: ABdhPJyC+UrXmL1OIWNTPCrin94+fZ8/EAEEaun2m7KuEzfqASCMuuLXw1xwEiCARgQx24ppLhKY1g==
X-Received: by 2002:a17:90a:cb0c:: with SMTP id
 z12mr24904103pjt.195.1624918095842; 
 Mon, 28 Jun 2021 15:08:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/9] target/nios2: Remove assignment to env in
 handle_instruction
Date: Mon, 28 Jun 2021 15:08:07 -0700
Message-Id: <20210628220810.2919600-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Direct assignments to env during translation do not work.

As it happens, the only way we can get here is if env->pc
is already set to dc->pc.  We will trap on the first insn
we execute anywhere on the page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 66f4c25b06..6fd4330b31 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -740,14 +740,15 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     uint32_t code;
     uint8_t op;
     const Nios2Instruction *instr;
+
 #if defined(CONFIG_USER_ONLY)
     /* FIXME: Is this needed ? */
     if (dc->pc >= 0x1000 && dc->pc < 0x2000) {
-        env->regs[R_PC] = dc->pc;
         t_gen_helper_raise_exception(dc, 0xaa);
         return;
     }
 #endif
+
     code = cpu_ldl_code(env, dc->pc);
     op = get_opcode(code);
 
-- 
2.25.1


