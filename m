Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9A452FED
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:09:28 +0100 (CET)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwL9-0006Ih-Kp
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF9-0001xF-4W
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:15 -0500
Received: from [2a00:1450:4864:20::336] (port=41843
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF7-0004vl-Je
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:14 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso2088100wmf.0
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ersVyP4dai2FHOQSCztPDbnZ5yJisq87sPVkJZJ0M0=;
 b=J1vR8Eb6AjJQj1Z3potXlFnMnTGQQI9Eogdymx8WjOKL9SEs3qV2Gx2TJuMuFADdoU
 IdN0en/wjSle+U5BTvUO8wooIuNevPVjzwDHwFYmBp88lHb8LGIiWlJp1K1etQHcXVui
 jBRpRZTpXa4B9y9guQqm2U1VGR5ARJTHYhStpxLKTl86eGJadSy6KQeWzJcK/U9p18dk
 skoH9OFha1Sh5zmPiwvusLhWVqdhqcgbUZrfiT1kLvtHh1vxog7NMQz5fe6SWB2l+eHg
 7jngmIB0w/2mKFKXcGwdu/PBX5suBtLXar9jjmEl8baGIjKkAQYBoqpoxj+cp09kTp6w
 nNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ersVyP4dai2FHOQSCztPDbnZ5yJisq87sPVkJZJ0M0=;
 b=QfKZ/lUAVupQOQ6j/H5yDq9GvWvL1mBywOZCpfA5W3k1fkmXghzxt+UJKV/RSuXWd6
 W7UB8f4axY2Ref+YxxnQi5w5kb6KaHz+p2FgDBtvsDRN86WMe0+Txg+gBOAI/mrquBqP
 YDB/laYcW4RpP+YHtGa56+7nT5RvnO3J1mxs+pADk2MGL0QYURJR0D0Dm4DJjJhkLOQ6
 n2byVcjJsuyzRCFcaALGMPXVB7l7Mz4wRRrgivGptneFszJKOwoHaoMlAhUI8FL6ZTyL
 ntuaZvLuNcGDTpTdoam4639yiBvPuNe6Xnn32Z1qMAGftBPN6XhEKajxnooxOkaCM05O
 Q7TA==
X-Gm-Message-State: AOAM533zGdtVBX43zImORX3gROZuYTshJxCGGaoUeWBbcQA1EUUNZ3ow
 IdTD7+oOcKNeSxW/CZ82J+YyVHcIFpKoh63dv3A=
X-Google-Smtp-Source: ABdhPJzYMWXmmgo02JgX3K8vOseSO25h3u4dwcvTD115WZdbpk8DYQc/F5z4J8IdkYUCwr2YvQcQWw==
X-Received: by 2002:a1c:f319:: with SMTP id q25mr6602325wmq.33.1637060592322; 
 Tue, 16 Nov 2021 03:03:12 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 9/9] common-user: Move safe-syscall.* from *-user
Date: Tue, 16 Nov 2021 12:02:56 +0100
Message-Id: <20211116110256.365484-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Move linux-user/safe-syscall.S to common-user so that bsd-user
can also use it.  Also move safe-syscall.h to include/user/.

Signed-off-by: Warner Losh <imp@bsdimp.com>
[rth: Adjust build rules to eliminate common-save-syscall.S.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                 | 8 ++++++--
 {linux-user => include/user}/safe-syscall.h | 0
 linux-user/signal.c                         | 2 +-
 linux-user/syscall.c                        | 2 +-
 common-user/meson.build                     | 2 ++
 {linux-user => common-user}/safe-syscall.S  | 0
 linux-user/meson.build                      | 1 -
 7 files changed, 10 insertions(+), 5 deletions(-)
 rename {linux-user => include/user}/safe-syscall.h (100%)
 create mode 100644 common-user/meson.build
 rename {linux-user => common-user}/safe-syscall.S (100%)

diff --git a/meson.build b/meson.build
index ec22cf05c1..c5b0b2b247 100644
--- a/meson.build
+++ b/meson.build
@@ -2359,6 +2359,7 @@ block_ss = ss.source_set()
 bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
+common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
@@ -2605,12 +2606,15 @@ subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
 subdir('linux-user')
+subdir('common-user')
 subdir('ebpf')
 
-specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
+specific_ss.add_all(when: 'CONFIG_BSD_USER',
+                    if_true: [bsd_user_ss, common_user_ss])
 
 linux_user_ss.add(files('thunk.c'))
-specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
+specific_ss.add_all(when: 'CONFIG_LINUX_USER',
+                    if_true: [linux_user_ss, common_user_ss])
 
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
diff --git a/linux-user/safe-syscall.h b/include/user/safe-syscall.h
similarity index 100%
rename from linux-user/safe-syscall.h
rename to include/user/safe-syscall.h
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ca8f24b9ec..0744c6bf20 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -31,7 +31,7 @@
 #include "trace.h"
 #include "signal-common.h"
 #include "host-signal.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 544f5b662f..0c5f63d08c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -132,7 +132,7 @@
 #include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/common-user/meson.build b/common-user/meson.build
new file mode 100644
index 0000000000..233b69199c
--- /dev/null
+++ b/common-user/meson.build
@@ -0,0 +1,2 @@
+# TODO: reorg the *-user headers so that this can be built once.
+common_user_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('safe-syscall.S'))
diff --git a/linux-user/safe-syscall.S b/common-user/safe-syscall.S
similarity index 100%
rename from linux-user/safe-syscall.S
rename to common-user/safe-syscall.S
diff --git a/linux-user/meson.build b/linux-user/meson.build
index bf62c13e37..af8d39aecc 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -9,7 +9,6 @@ linux_user_ss.add(files(
   'linuxload.c',
   'main.c',
   'mmap.c',
-  'safe-syscall.S',
   'signal.c',
   'strace.c',
   'syscall.c',
-- 
2.25.1


