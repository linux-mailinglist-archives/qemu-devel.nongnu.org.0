Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569014CD36B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:29:37 +0100 (CET)
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ67s-0003jB-BV
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:29:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ60B-0002jq-HM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:39 -0500
Received: from [2a00:1450:4864:20::32e] (port=40662
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ60A-0004gV-0F
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:39 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so1249366wmb.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4AbYvV6pM/kHUjvkC09aZIGxcMx4nP3w1jg109SqVs=;
 b=P+/pcj2oHiPJDuXoicx3lK81eT2PqAkzr6VG2BQZOb3ZVzj1DxDhTsHlArijviaU8B
 6pKfqsNYp+yZYKKn7fgQIDIlTmRv1k9yY1ySbcFJFoEg1Ogif3z2FkCBC2dJqfXSusq3
 urxo+lVfkw26yyb7LjinazNALrB8/N3+e+q2OixCFuNrW1LHV16335wltPxtJqLyZiCw
 nuFNhnMeEhIEHmr/MOAyhGePyvofFBLMo2Hk5obcZoDXsUMJNqsfTAXs7G5bpaRMS14O
 EeTTrXOkpAQ4Xtv8SHTtXi8U0HZJamB5Krjj//G5NELbt5+iTA73n6XT+y/lvJjEgc6x
 a9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4AbYvV6pM/kHUjvkC09aZIGxcMx4nP3w1jg109SqVs=;
 b=gw4Ox8V4gkOx8b1mVw3KhhZKyonI8jCC3ge/zPRPjxTwYek1eLtnx/voBreIV1Q04d
 r1k/z30amXMV36g5kWEcR4IHzw7idLh2XJ6Gyalhel/7lYYnh9KRqk/ixSjBWVbTKKfi
 aGw7NobFJkuDQgQRmt0AgUNutqCrtnAGqfxufR8mqjqoc9SE59ZVtuUXutis2XcO3jDR
 WDHDicXWFg3uKZpuzi6AYL/mXKCi0pY7DR6oKxWnADBA3O6lt0VLU1VSde3tHUXjDN/+
 M5VqKYOq0y1/Jt+GcS2mecNYKBdT3MxqLlAalW0bWnfRdqQHiGVgFy/zgseRU1o8qXl/
 FU7Q==
X-Gm-Message-State: AOAM533liE2bhrRBJ+LZrwFqYWJy4xr1BLpYYIRIRH6iT2SNp3Csei8M
 Okpdvq1DjjODDGA3ZtN2QGketNjyviY9Ow==
X-Google-Smtp-Source: ABdhPJyDb3OsVe9T9P4gezXNDS39n8ZQqUkQdAStt+wwJefoK+UXyQtnbkrHvQtvvvmJ8MQvmqxRiw==
X-Received: by 2002:a05:600c:3596:b0:381:751a:f0a6 with SMTP id
 p22-20020a05600c359600b00381751af0a6mr7344601wmq.168.1646392896779; 
 Fri, 04 Mar 2022 03:21:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] util: Use meson checks for valloc() and memalign()
 presence
Date: Fri,  4 Mar 2022 11:21:24 +0000
Message-Id: <20220304112126.2261039-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of assuming that all CONFIG_BSD have valloc() and anything
else is memalign(), explicitly check for those functions in
meson.build and use the "is the function present" define.  Tests for
specific functionality are better than which-OS checks; this also
lets us give a helpful error message if somehow there's no usable
function present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220226180723.1706285-8-peter.maydell@linaro.org
---
 meson.build     | 2 ++
 util/memalign.c | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index eae0e4febb3..74f4e05c82b 100644
--- a/meson.build
+++ b/meson.build
@@ -1623,6 +1623,8 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 # thinking that Windows has posix_memalign()
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
 config_host_data.set('CONFIG_ALIGNED_MALLOC', cc.has_function('_aligned_malloc'))
+config_host_data.set('CONFIG_VALLOC', cc.has_function('valloc'))
+config_host_data.set('CONFIG_MEMALIGN', cc.has_function('memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
diff --git a/util/memalign.c b/util/memalign.c
index c3280528d24..2a139a5695d 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -56,10 +56,12 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     }
 #elif defined(CONFIG_ALIGNED_MALLOC)
     ptr = _aligned_malloc(size, alignment);
-#elif defined(CONFIG_BSD)
+#elif defined(CONFIG_VALLOC)
     ptr = valloc(size);
-#else
+#elif defined(CONFIG_MEMALIGN)
     ptr = memalign(alignment, size);
+#else
+    #error No function to allocate aligned memory available
 #endif
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


