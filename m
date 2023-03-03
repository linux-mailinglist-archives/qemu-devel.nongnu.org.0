Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4E6A92D1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z6-0007pp-Mq; Fri, 03 Mar 2023 03:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z2-0007h7-3U
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:44 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z0-0007t6-Dw
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:43 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y2so1790594pjg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832901;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lW3Uf0KlHT8vG+lzu2lShmAurqfdQqKUZLaTQ/2d9nc=;
 b=tKFzg2u9hnOFYeRVb5TEFWMcTV13Tzvhf5Q7SFQWrx/temYulKmUp2v1Cmy7UPCPyI
 uboCi/yGe0o9BAR531AiIy++IsVWCX2E6PRH01M6MDX4hm3/mrKqFuj2OjWrHpB9AyyS
 lRlbRax6nkPMHr4bjjoIVE43Gb0X4Htk3YCiHLSRTLxDbWhe/ZmokYy8jzFELkPsE5Wi
 2+fl1rP0OJGR0NAWyqygp5h1/YMNUjDNgPNyF/M3IoDxUaAgSNhWpnN9T0PDRXnu/Hk2
 NErpoyA/zS0sj2es0NTeMnG5rvOWF63U2gGqnPBf04pJtJoBESrUbVJxs0p+Ly6uaMtB
 ZaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832901;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lW3Uf0KlHT8vG+lzu2lShmAurqfdQqKUZLaTQ/2d9nc=;
 b=G14Yaxwpj9svfklf23sxBg72p9vVlbxUhfjm1BomevSCFr02Vx2tT0nUPWJwyyrpDd
 TId+JFZoyHRJmpPzJFy+Pd9yyXa5Ng/FSkFZC2REV3KhjfUjoH8GxsbmYf9csKgNOfvA
 /jNBu20zglX3VCl104q/c2zaX+T7l3wEN6duydEWkooiOON4GxhA97RHF5m8lZMWzthN
 9GqKJsFqr+ZzEDZhdTs+7i89xNyYHd6GdH9SC2rR8U2TZG5IwQES4ifLlMvxTi6H0aEU
 sPFOZ+m0g1S+ANFtPzBneuoGl6aiwtq3QpqJ6dNzaZ+83HE++phVycyg8/fPmDMADxiR
 k/iA==
X-Gm-Message-State: AO0yUKXzBKdnTL5OMlReqfh0eSEuEe4+sUJ4P7AvnJXUqW9kORapED3n
 pCOmG6nXeeOvgI5VXZMzDmlP1Q==
X-Google-Smtp-Source: AK7set+a3CrsgLLcn7wJGxEvJcTB0nN+aUK9fz+myqVSMo5x5yTrkmr+ez0jcx7d8A7ia++Fm3pHdw==
X-Received: by 2002:a17:90b:4c43:b0:233:c40d:9a37 with SMTP id
 np3-20020a17090b4c4300b00233c40d9a37mr934004pjb.10.1677832900844; 
 Fri, 03 Mar 2023 00:41:40 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 lx3-20020a17090b4b0300b00233bc4edb77sm2900050pjb.25.2023.03.03.00.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:40 -0800 (PST)
Subject: [PULL 16/59] target/riscv: Add property check for Zvfh{min} extensions
Date: Fri,  3 Mar 2023 00:36:57 -0800
Message-Id: <20230303083740.12817-17-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1033.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add check for Zvfh and Zvfhmin.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-7-liweiwei@iscas.ac.cn>
[Palmer: commit text]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49912c9174..49ac368662 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -768,6 +768,20 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfh) {
+        cpu->cfg.ext_zvfhmin = true;
+    }
+
+    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfh/Zvfhmin extensions require Zve32f extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfh && !cpu->cfg.ext_zfhmin) {
+        error_setg(errp, "Zvfh extensions requires Zfhmin extension");
+        return;
+    }
+
     /* Set the ISA extensions, checks should have happened above */
     if (cpu->cfg.ext_zhinx) {
         cpu->cfg.ext_zhinxmin = true;
-- 
2.39.2


