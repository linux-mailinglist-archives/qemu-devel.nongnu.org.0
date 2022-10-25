Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D060D830
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:53:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTgZ-0005aA-0k; Tue, 25 Oct 2022 19:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgW-0005U5-H7
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:16 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgV-0002z8-1P
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso316167wma.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83SXE8AE3IXPEXq0sb4zKw6WXURfWcnz2Ug5j96SE0k=;
 b=yXaYxH8FwywYwB75qCnMBhfGCd5FILaWtTqb117ghpk+Df6r+3ZORvJSKLBePcClFh
 uZmYRwDcdqVq6rtnsDuQwQsE73wLVaHKKXiKjp3UCRHWHD6Cfh0fm6BWpqqh1kuAdsZn
 m/lFMPlOHMIg9ip6sFEVlJISmEHPNgsyHlk+5Nz8XR/4k1y4uRFPjgYPyAmULAWkfpxf
 uDcGhG3QLlvU9U3BLdLn0QpO9k6COGCprNaSUQTECm77PtsbsuZ82GtfbedHylheSX/f
 YOIjNvslgdSPMNYSkolKWCJ1qzHp4HETAeAiaEqV/nJPPJl6dNtO9VB3c3zz9wRkZ9pZ
 OJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83SXE8AE3IXPEXq0sb4zKw6WXURfWcnz2Ug5j96SE0k=;
 b=u3v9khi/qIvrfvTTQgdBOyLOF7XDRSN+z5rNshMP4JUhnI6YSyv7q3a9ATby9U1Ky2
 zUVou9UgND5/2dRM8eqomrpNYfkzzyCz9Hz1+MfZmMNhx6YWPf4JfzW+VniDKPasKeoS
 /9pgJbbpOeua+0WYz+vhabZVmWDUQ0fOeHTlMoRFJjproxrjdU9N20eCUoHqBLzYhUXY
 i10N34JBNWjJiuzz/QyuklcCnFdxlxuZU8rCARMzvf2K5s+OO6iDQAGVhx+dQ7hyr5Kt
 vcyaCIHKwEQcW3VO5j2Zt9+cAsiqqOXOgTZCHiy5SsM50uhI6yV+FuFfN5/XX3ivzLVj
 PTQg==
X-Gm-Message-State: ACrzQf2NfXBHsfbkkj0YXeahS+8rsfgr1RHFBQ1SUE/PCj12mPnEdIPj
 fnaAN8gDgF2BDmQfnSXE6B1U9KBMa2WuK152
X-Google-Smtp-Source: AMsMyM55/nSwiHjEHNbkvqWITV1++7a2MRGEL63QQt612HugqiyEzh7TsTeEvp4rcx5iWN7va3wFbA==
X-Received: by 2002:a05:600c:42c6:b0:3c6:f27e:cac8 with SMTP id
 j6-20020a05600c42c600b003c6f27ecac8mr410140wme.175.1666741813559; 
 Tue, 25 Oct 2022 16:50:13 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r29-20020adfa15d000000b002365f326037sm4649107wrr.63.2022.10.25.16.50.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Oct 2022 16:50:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] target/m68k: Rename qregs.def -> qregs.h.inc
Date: Wed, 26 Oct 2022 01:50:04 +0200
Message-Id: <20221025235006.7215-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025235006.7215-1-philmd@linaro.org>
References: <20221025235006.7215-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/{qregs.def => qregs.h.inc} | 0
 target/m68k/translate.c                | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/m68k/{qregs.def => qregs.h.inc} (100%)

diff --git a/target/m68k/qregs.def b/target/m68k/qregs.h.inc
similarity index 100%
rename from target/m68k/qregs.def
rename to target/m68k/qregs.h.inc
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 9df17aa4b2..f018fa9eb0 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -39,7 +39,7 @@
 
 #define DEFO32(name, offset) static TCGv QREG_##name;
 #define DEFO64(name, offset) static TCGv_i64 QREG_##name;
-#include "qregs.def"
+#include "qregs.h.inc"
 #undef DEFO32
 #undef DEFO64
 
@@ -75,7 +75,7 @@ void m68k_tcg_init(void)
 #define DEFO64(name, offset) \
     QREG_##name = tcg_global_mem_new_i64(cpu_env, \
         offsetof(CPUM68KState, offset), #name);
-#include "qregs.def"
+#include "qregs.h.inc"
 #undef DEFO32
 #undef DEFO64
 
-- 
2.37.3


