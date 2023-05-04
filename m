Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1154F6F7164
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:45:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoq-0007dy-OB; Thu, 04 May 2023 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZH1-0004DE-Vy
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:45:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZH0-0003Qn-CP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:45:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30639daee76so359328f8f.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683207928; x=1685799928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dIQm8PC6pkLkq9gZOWLt5qqSZpzfAqbVrZM4/KuGLvo=;
 b=Asyve2gzY6sB+7Go3Mx5Ys868oywbZ9HjnkgBQkf5VHDl5ftWX0NDKrJx9ZluPB6d5
 mIAnJkHEGR99xZaJvwKb1lMyOthk/iVgHNo6D8zuP9t0mrd1nvAYgk6tYeaid+MD3K5B
 AIYhme2jAt6WaFnf8OS9SReKXe0nUab9GLBO99jXzuzfpg0bCL9iY/AAmWjdXhfQq/zN
 qBXTS+NGT84Ez8QyapLMKkVIdtR9obbM1OxlB/vVMgi4XIjYiGEzR5uLayFNO0hBETpz
 StSV3uHDZv6QQXA52dba3mUVV4/Af8lpOmvqhqRoCUncTnhGesna3JlZYaexqC939Xok
 6X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683207928; x=1685799928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIQm8PC6pkLkq9gZOWLt5qqSZpzfAqbVrZM4/KuGLvo=;
 b=NvSyqDaL86rgbCaIK5c7CelQBNCcu7i8zVG52fdD4PIsuI37WtF89TPfZdIxW/5dzr
 uhYr+7MQxbgkDl6amgHn6grQS49lmwOR4YTz93/tUihcdGJu6AgWBa3ZoesaEccXs2KK
 lvzrfgFXYiV9utIUbWWCdW4qMD99itY99jQ3TdvPwIxFlAUh1XZQORDZ4rCqDLhFngzv
 3Ry4yl5YaNps/4D0+koNYPRSw1QREIiGs48k+x9qh2TWlA/0UhbbCfOF26useQEzVJPs
 bzgsBMaNwW2rrH/hBPjbJC84hqr3Dn6NkAUCZfuoJE7+Ywgh5ACNJIWl8ea9Onpnd/ll
 6zXg==
X-Gm-Message-State: AC+VfDwVcQ1aRyB4Ill3ssneSLBlMeHmfyU3hLztUcOvvgicZFwc5pry
 s1uO+Mkm2gHQCIy6LFeWMixoOzt5SQ7ZfHLnGvo=
X-Google-Smtp-Source: ACHHUZ4W1NlP+8wHMhCuWn74sNkWpIRnzq8lNmnPZwsZ0GlIKm+gektw5ydYrLcY42f38W0Cv88y4w==
X-Received: by 2002:adf:eeca:0:b0:2ef:baa1:f3fc with SMTP id
 a10-20020adfeeca000000b002efbaa1f3fcmr2425472wrp.19.1683207928051; 
 Thu, 04 May 2023 06:45:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe350000000b002c71b4d476asm37001908wrj.106.2023.05.04.06.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 06:45:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] scripts/coverity-scan: Add xtensa and openrisc components
Date: Thu,  4 May 2023 14:45:26 +0100
Message-Id: <20230504134526.2748157-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We have two target architectures which don't have Coverity components
defined for them: xtensa and openrisc. Add them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
As usual with coverity components, these will need to be added
manually via the scanner UI, since it has no import-from-file...

 scripts/coverity-scan/COMPONENTS.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 7c48e0f1d21..add7c5a279c 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -143,3 +143,9 @@ loongarch
 
 riscv
   ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*|/hw/.*/(riscv_|ibex_|sifive_).*)
+
+openrisc
+  ~ (/qemu)?((/include)?/hw/openrisc/.*|/target/openrisc/.*)
+
+xtensa
+  ~ (/qemu)?((/include)?/hw/xtensa/.*|/target/xtensa/.*)
-- 
2.34.1


