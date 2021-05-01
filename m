Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F23708A3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:03:27 +0200 (CEST)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuti-0000fl-6V
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui2-0006Ti-HB
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuhz-0003lB-Pb
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so3444760pjn.5
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSp5lRgjBRrXqczyQWvsoXEiHZoFgBy6aeylHhLetBE=;
 b=B+44fskOVmU0wMMz5PCemfAGi0+oR2wue0LcxEHZ4Hs/ax9Tl8UqMU4uTgDwJPkWfZ
 9nnYBihzTs6U9kmxYgXAJfxO7gRt0zTcoPI4pjsuU3vEScScd5ulovKKt3Tw6CKdsi7s
 ckrRrvXYGbvT90yh9a+9yohXcM3wYStSaAhSd9c/ofk3XWfn16Usl6SmHBONVxll1MTz
 +gtwwEeal+ptRE+pFHdlKIgB6WZBAn0BIKUxW0hz7eyhSwnzKzpmvSsMyHldXF5vOSIy
 8q/tWpjV6FpAeh6DTa7TtCFmEXHW2kkm2u1HjnJqVsfCR67nLUoBKBd3SFfoZyoeY2Uh
 Wj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSp5lRgjBRrXqczyQWvsoXEiHZoFgBy6aeylHhLetBE=;
 b=dx0JDiTNJ8i4hkAjt4eAffuOYJWTCTvWcnuaGdtOe97CsK5bMSJlMaXOE/otxMGl9i
 OsOWllXnqED/xQLHB+uCdvPUSnO9adYFQop2m/rF42oHEbIrIVkiP6mOkxtQRPaSex5m
 ZDViuT8vFuG2lha2sreJDHGkwvqc1rHx7/gGf++wGPvnbaGdidsk0ZZk802/J9v6Lf1U
 ggtB6KLGEt9NsycRRKASQXlkzV1QdFej9X/cizopJ2D0cKlhib8cdxRCzTMLFdD1RHwU
 K6dURS52Oa6u8AtUuUgGTnGE0sSdUjHT94YpcRoA+Oza87ww+YIbmNJ/oitVARfRfjYZ
 wS4Q==
X-Gm-Message-State: AOAM532L7cMH5m1C7Rvwktqp80FUbT4MR1+sXOnibhneX71JyS9kjcgJ
 xD9bPEqMNBQ+nL/+tDGniAFym6TENDK8qg==
X-Google-Smtp-Source: ABdhPJxF1IuJtbgcCUrTr8uom8KACQHQmADyWaiOuWuu14LtWmLGTfXX3bwOcbIld5v/6I0Uq+6scw==
X-Received: by 2002:a17:902:b494:b029:e7:36be:9ce7 with SMTP id
 y20-20020a170902b494b02900e736be9ce7mr11537495plr.43.1619895078228; 
 Sat, 01 May 2021 11:51:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm4971360pfa.68.2021.05.01.11.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:51:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] exec: Remove accel/tcg/ from include paths
Date: Sat,  1 May 2021 11:51:12 -0700
Message-Id: <20210501185116.1338875-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501185116.1338875-1-richard.henderson@linaro.org>
References: <20210501185116.1338875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When TCG is enabled, the accel/tcg/ include path is added to the
project global include search list. This accel/tcg/ directory
contains a header named "internal.h" which, while intented to
be internal to accel/tcg/, is accessible by all files compiled
when TCG is enabled. This might lead to problem with other
directories using the same "internal.h" header name:

  $ git ls-files | fgrep /internal.h
  accel/tcg/internal.h
  include/hw/ide/internal.h
  target/hexagon/internal.h
  target/mips/internal.h
  target/ppc/internal.h
  target/s390x/internal.h

As we don't need to expose accel/tcg/ internals to the rest of
the code base, simplify by removing it from the include search
list, and include the accel/tcg/ public headers relative to the
project root search path (which is already in the generic include
search path).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210413081008.3409459-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                 | 1 -
 include/exec/helper-gen.h   | 4 ++--
 include/exec/helper-proto.h | 4 ++--
 include/exec/helper-tcg.h   | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e..d8bb1ec5aa 100644
--- a/meson.build
+++ b/meson.build
@@ -258,7 +258,6 @@ if not get_option('tcg').disabled()
     tcg_arch = 'riscv'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
-                        '-iquote', meson.current_source_dir() / 'accel/tcg',
                         language: ['c', 'cpp', 'objc'])
 
   accelerators += 'CONFIG_TCG'
diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index 29c02f85dc..1c2e7a8ed3 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -81,8 +81,8 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
 #include "helper.h"
 #include "trace/generated-helpers.h"
 #include "trace/generated-helpers-wrappers.h"
-#include "tcg-runtime.h"
-#include "plugin-helpers.h"
+#include "accel/tcg/tcg-runtime.h"
+#include "accel/tcg/plugin-helpers.h"
 
 #undef DEF_HELPER_FLAGS_0
 #undef DEF_HELPER_FLAGS_1
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 659f9298e8..ba100793a7 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -39,8 +39,8 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
-#include "tcg-runtime.h"
-#include "plugin-helpers.h"
+#include "accel/tcg/tcg-runtime.h"
+#include "accel/tcg/plugin-helpers.h"
 
 #undef IN_HELPER_PROTO
 
diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
index 27870509a2..6888514635 100644
--- a/include/exec/helper-tcg.h
+++ b/include/exec/helper-tcg.h
@@ -60,8 +60,8 @@
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
-#include "tcg-runtime.h"
-#include "plugin-helpers.h"
+#include "accel/tcg/tcg-runtime.h"
+#include "accel/tcg/plugin-helpers.h"
 
 #undef str
 #undef DEF_HELPER_FLAGS_0
-- 
2.25.1


