Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E366475D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:25:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHjo-0003uU-Vg; Tue, 10 Jan 2023 11:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjj-0003sg-M8
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjg-00069A-I2
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so12391589wms.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mv6b5BVX+E5dEjhJ+rRg+doFrBJfje2G5RxYlkiYMSQ=;
 b=EGwEFMa5ohJrcCLO3bm4qK8JpoFkCAfd7aeQrdHSR7jEMKA0GhQWFpV7m9oded5D8v
 iSQOUOsKG2aE9Zu4cJWon2NmJoi4w+Cy/CWeTqAGQ3rC/tzcMms0e0yVRtQHXlHdreEo
 2hhGYpFtA5Ts4i4hBH7dEdXFipfbDDlM93SJNU5IVcvXZIvW39TgA8BFfqXboS/Ogu9I
 vjNQ1SiwD/lyek7RT1sQH0Ev13fPrDVFZVc+nc4znQsHd9N2nWuhSSvdXihDbxZnUxcn
 E0+Swo0iH1YjXRTLziHWQhPVSMetOfDX1lULv6mopRgd7Yg2GRAWv0qq0ggk6j153c9q
 8bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mv6b5BVX+E5dEjhJ+rRg+doFrBJfje2G5RxYlkiYMSQ=;
 b=KUkxA/QkVw+JZc4MylNcIoNXl6GIhOYz3gCOiSA5IoGaPXLN7ToRcObQPHDHiOPV1H
 eswcWmV5QULXOcR4mKzcvTrDBRcNcQO0VJzzm+rn/pdbRolBXoYetG3QsedLW/Y3fSj8
 ez9EcxKT9/bWDG5F79NKQrNoc2wKxq3ED74JlsGMTPacf549pqVolXzDJCD7wQtL2QR4
 Q5HWrCcrCFlvb7CjRvOvEx/cW9s+uNswXpgfU/tw2JkNOXHxr/kBTDH1n0Uq7w+Og5WJ
 q3Xkz+1Nm7eAbFSm5Jqkdb3+CrYU7DZO/PMqKt1Zz/WjpXJsf7h5EaCtSmLku36cU0n/
 zIbw==
X-Gm-Message-State: AFqh2kqLlvLb2KIv7yBEC9arWMcLY+r8LuuLlPJrHMHlMB5lIA9roAsO
 indP5ZBTBRmyWws407sKJBLIUTO243/V1V+/
X-Google-Smtp-Source: AMrXdXvoNff2pdMsQLp8LwxhYT0eToJUKvKyvOP7gjM0ylrtULNkfWY2aeJe2dLduSKZt24Z3pw+Kg==
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id
 fm7-20020a05600c0c0700b003d973fe96f8mr43396466wmb.32.1673369066705; 
 Tue, 10 Jan 2023 08:44:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm23390981wms.43.2023.01.10.08.44.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 03/18] target/arm/cpregs: Include missing 'target/arm/cpu.h'
 header
Date: Tue, 10 Jan 2023 17:43:51 +0100
Message-Id: <20230110164406.94366-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

CPReadFn type definitions use the CPUARMState type, itself
declared in "target/arm/cpu.h". Include this file in order
to avoid when refactoring headers:

  ../target/arm/cpregs.h:241:27: error: unknown type name 'CPUARMState'
  typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
                            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c..63b645907e 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -21,6 +21,8 @@
 #ifndef TARGET_ARM_CPREGS_H
 #define TARGET_ARM_CPREGS_H
 
+#include "target/arm/cpu.h"
+
 /*
  * ARMCPRegInfo type field bits:
  */
-- 
2.38.1


