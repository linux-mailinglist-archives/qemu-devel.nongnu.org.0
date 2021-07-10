Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E713A3C3558
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:51:57 +0200 (CEST)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FGn-0005mG-03
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exi-0006IF-0E
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:14 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exg-0002Uv-1B
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:13 -0400
Received: by mail-pl1-x636.google.com with SMTP id u3so1516029plf.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UL9lKIoQlLvt7I/sySzh/3RjeNWeRLX3v5RFNYO4U8s=;
 b=fkm12orOgtnCIcCvbwfe3RBI3AOfFHzqmJ9C8Pc3tQf/z5Jp59EnxRiFFtwQgoyOFe
 +SxWfujgMW4KXRTX1h/y57sk6M/XpybCTZGl5sLIe+VrkZOITR3NZWY0VV5622EVwlP2
 /uBULXrd5ONjCPieN5yNdK9bjAc1k2KGxVmsDnt5eVOxFBhrHJ8AS7NkSG4hNlZeVJDw
 bvbHv6/DKJnHN/fN4g7CyDXHNEJkKWH1iJJ8AeusUjIZTKgNm+oBDmkVsIf91sIrs7BJ
 69T26IATvjEIahL2NO1Wvl7RgVZMvE+R8k9sitcsUX2YDc3jiOL0s2Jj09Cr5rFOp/Ve
 9+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UL9lKIoQlLvt7I/sySzh/3RjeNWeRLX3v5RFNYO4U8s=;
 b=tilAxQ/pufQh8IYiWWRH/xPxnQtW4nIysQrUjWXBGLn/fLIfo0yoZtqxqBbsDbNgmE
 47OSnUw950houTilo3RLfJ3q8/rwhu27Jtk8xUtari+l4eJvgplM3cxmVJQclTEX9zKW
 6QrC76gTGwVriz9LZwOZHeuk9zweMjrFaS08NaGHkUyVFJLmKpxnD27CBw57i7YSL+lS
 5VBoUZUHl+2YyOxl70SBlG53LrQzrW/ZVmh0LUpMr28gzNlXQvYj1KHMbZWERCQ+pNYT
 AAfF8drweAnaqaSsqq/6jxGtUSz+mDcYqE2+NElxcl9OPtXAEm+Y+WJMuqn1A7HgmlcZ
 maBQ==
X-Gm-Message-State: AOAM530zOR/POhWxOSu/W6/BljDDPqvJVmMg0AUmlyd8+xI9F4zfuZO/
 IWDusoBRfY5yIVh+YJBsfHod0kDWH8fsxw==
X-Google-Smtp-Source: ABdhPJw5LdPL6PltHOLLdg1Cz2sOWWmTtqf0c2ODLnlCDumKCpaLYXsggnnc5CKEvcYRX4hvIO1Z9g==
X-Received: by 2002:a17:902:9006:b029:107:394a:387 with SMTP id
 a6-20020a1709029006b0290107394a0387mr35855632plp.35.1625931130708; 
 Sat, 10 Jul 2021 08:32:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/41] accel/tcg: Log tb->cflags with -d exec
Date: Sat, 10 Jul 2021 08:31:41 -0700
Message-Id: <20210710153143.1320521-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 67ed25beb9..e22bcb99f7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -183,9 +183,9 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
-                      "/" TARGET_FMT_lx "/%#x] %s\n",
-                      cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc, tb->flags,
-                      lookup_symbol(pc));
+                      "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
+                      cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc,
+                      tb->flags, tb->cflags, lookup_symbol(pc));
 
 #if defined(DEBUG_DISAS)
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
-- 
2.25.1


