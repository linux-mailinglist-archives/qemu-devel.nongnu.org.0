Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01B69B211
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:54:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4vb-0005Ea-Sb; Fri, 17 Feb 2023 12:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vZ-0005D0-8A
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:45 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vX-0000wJ-HP
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:44 -0500
Received: by mail-pj1-x1034.google.com with SMTP id y2so1948106pjd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNYI9dmX50T6dGo7VdQuyO6akiZafXJYK1pmz8lKKOc=;
 b=LZkODX28HuTrsCQ/i241FbzbJoMXs7xZ7PhankcvYCodN5KoGnzEeQtkOafy7u6aWB
 IMJ19q1rLlbwdIwJ2KBwNYlWc/C3R50V/I9y7a6mv9SjHWHU+eGBHvT9xmviagjmco+I
 CrIJ8uTzawrBbVRMHT1ussNrBzcUm7OweDYqEColbepyEkFBsLQ3BpXZm5CtCsqmyjeI
 2MBllWS5xVQ3y1IBSZLj4yilcRacJUGyoxX+dGjPlIxbXgvezN81JrxAREi7YE1ct2VE
 zZmrRvkxDo+4CE0xhTe2XffAtm5cgVASn83W9OJk5/sKv07KX9bw90c9H/Nid3MVUzC/
 8RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNYI9dmX50T6dGo7VdQuyO6akiZafXJYK1pmz8lKKOc=;
 b=JfeKPTzCdaW7zJjzrH974TL5X26eyBjO9voz7dkHVsya3BdsU8bbD0IVM9hJrauzJw
 eHuhlt37WuIH/5tXefuIdCieBXLIQObO7N8UD8WvSTpJhu1VDnCEEfi+M/mR/04HqLnE
 eeW56rIUpppAPv/E60ZaXAboSNquaBEJKvbDumo3qAoBQIWQSnbPgnfB/f1zAaPJpwON
 TYPx0KciTR/CMlQu2g8U4AclOvQpOMVgKQhBc2FHYuOWv2L+evXDpFfwrBxbSssstrts
 CHBw7RMwpLGWCCkdzJ4DExeA4H/W31DB3m/8h2N3ZPs2p6LF1a4kNyBLc3OmOzIqHAdi
 bv7A==
X-Gm-Message-State: AO0yUKWOb/hK6Usq3lonY0fAw/t6qiC5FshFPEiE1KHju1mljrcBc+LV
 dT4uQKXmSeEiIABonzx7QloIWg==
X-Google-Smtp-Source: AK7set9WrULX4Ak0RER7PdY1Gf8r+4U7zvhUxrfLbbtGe9bIZowFstAhfPgHdk2+fUsLcxJOe4isFg==
X-Received: by 2002:a17:902:da8d:b0:19b:c37:25e7 with SMTP id
 j13-20020a170902da8d00b0019b0c3725e7mr5975009plx.66.1676656422172; 
 Fri, 17 Feb 2023 09:53:42 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b0019607547f29sm3392267plb.304.2023.02.17.09.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:41 -0800 (PST)
Subject: [PULL 8/9] target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()
Date: Fri, 17 Feb 2023 09:52:02 -0800
Message-Id: <20230217175203.19510-9-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

We have a RISCVCPU *cpu pointer available at the start of the function.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230210123836.506286-1-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ad8d82662c..3a9472a2ff 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -60,7 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
          * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
          * only when maxsz >= 8 bytes.
          */
-        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
+        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
         uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
-- 
2.39.0


