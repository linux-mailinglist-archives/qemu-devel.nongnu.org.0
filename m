Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E566D0664
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:20:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBd-0007sj-Gb; Thu, 30 Mar 2023 09:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBM-0007hC-0V
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBK-00020w-Cj
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso13429430wms.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayn4boipfKt66I0EYH92uExFZX9rPHRcwf3MoBEl5oE=;
 b=WsXDiTktmk/x41KB1TLDuc2UN+WEKkNuKpNzpyrcegs/PMRqhEnQwR6bvKtZQTFZ6L
 3ayKX0iuzhaH6wN9ODzjx4RfhZO1rX0BUI55mZatdlJUVjqfTYBqZ5KcQ/LXoiTjJBlP
 Kra1a8Ummq46NMQw20llMMBonr5WNlxulMxY36nio/Q/WI0Cnw21FX0k/1ZEYpHDl4QS
 Bp7M9G236Zbu68G1OWtA3Rlg2AFqfflt+KSM/vZDkGs0Z+dJou0Y25aBy6iPsdouy4u7
 VdlmabvjMR9iW0GgHngeRoN1VKWkadiWr4kaT5/vqQe5RbKqflaovkIpBeyIqbfrBAzh
 jK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayn4boipfKt66I0EYH92uExFZX9rPHRcwf3MoBEl5oE=;
 b=Zn3V7DboXHRTH32hJ+Gl3FyOSAkoZZMck7kfyHZqRHmLIDjjO1KtHm7gdWqvKMlHKr
 XXvHbryQxAuq8ceH66XmyC1viFeEhU+sMJjJ7bAFuf7BS1X+JYfaI3Y534t6ldisLeeP
 2NogwW20xLn9y8f/m+mc0d/NnUhHVqrTgY3zQYW325lMrHn770bWAgGWBnDgph0kJkAZ
 Zw0f6IJdIVmeFr/PZY9wiLU0ObRNkDmDO0tCNz4hFOv+cn1ztMugcEAe8aevH7ujuQgp
 DP83eY4CdshYe/45aE8I1bclsRl4SNh+kjoKt5xgkqek6N2XQXA2C0o/h/uJL3ad3T6R
 /AeQ==
X-Gm-Message-State: AO0yUKU1itWZrFD4eCyHxwOjwQ6Rg8drbNtqtRabCvXwLZCUWOflo9mJ
 3MAtxZpwYbGn5v1E+cTB8ZqglQ563xYTafzdT64=
X-Google-Smtp-Source: AK7set+YZ9wYf0Xqxu1W/jM4l89IyEGO4t+X0JRzqsnY8JeeUUr9rwm+N6Om6k0kO99BSFzvXJH2/A==
X-Received: by 2002:a05:600c:22cd:b0:3eb:29fe:7343 with SMTP id
 13-20020a05600c22cd00b003eb29fe7343mr17152558wmg.33.1680182348879; 
 Thu, 30 Mar 2023 06:19:08 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a1c4b1a000000b003ef62deb830sm5816581wma.25.2023.03.30.06.19.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:19:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/6] linux-user/mips: Use P5600 as default CPU to run NaN2008
 ELF binaries
Date: Thu, 30 Mar 2023 15:18:52 +0200
Message-Id: <20230330131856.94210-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Per the release 6.06 revision history:

 5.03 August 21, 2013

 • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
   Descriptions” were optional in release 3 and could be R/W,
   but as of release 5 are required, read-only, and preset by
   hardware.

The P5600 core implements the release 5, and has the ABS2008
and NAN2008 bits set in CP1_fcr31. Therefore it is able to run
ELF binaries compiled with EF_MIPS_NAN2008, such the CIP United
Debian NaN2008 distribution:
http://repo.oss.cipunited.com/mipsel-nan2008/README.txt

In order to run such compiled binaries, select by default the
P5600 core when the ELF 'MIPS_NAN2008' flag is set.

Reported-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230327162444.388-1-philmd@linaro.org>
---
 linux-user/mips/target_elf.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/mips/target_elf.h b/linux-user/mips/target_elf.h
index a98c9bd6ad..b965e86b2b 100644
--- a/linux-user/mips/target_elf.h
+++ b/linux-user/mips/target_elf.h
@@ -15,6 +15,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
     if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
         return "R5900";
     }
+    if (eflags & EF_MIPS_NAN2008) {
+        return "P5600";
+    }
     return "24Kf";
 }
 #endif
-- 
2.38.1


