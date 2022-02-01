Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08114A684F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:00:59 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF28w-0000Rl-LX
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:00:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtz-0002jn-HD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:15 -0500
Received: from [2a00:1450:4864:20::42f] (port=36459
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtx-0001gr-1s
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:14 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u15so33746429wrt.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DJc74+RWn+7GCLpeFVdjhEK4yszN3h2ZPbtHnLLnDyQ=;
 b=rw/dCwDgUrA4CtxM0tDz1aWUGbDY5zTeZL/9B+5mdpYI/+O0chbL+jpMLdFIp7FVEO
 vwiXq1pmizMXBmdtj9xdT/0SyQGWwl/+vEZnA037/UmKCI9hmzaQ/f6BLnZKs7Kx+f4c
 2d3AhoVCfE9DTREW+sfVr4KoXyGI+1HVbeYDyDkhBRgDSCmoCA960nM4MBlHRST/u3X4
 1YM+XkSyhqCj6DPnERgXIEAatLu6OkwSXldG84wGT3lcZkyYJAlpA4CRH9WdldvdiwYa
 6IkreutwwBmSixfn8l6er2lntdNRANxHnIHQBvPbqXfRdUqsr1NuUHMlZr3MdouJrRa2
 LjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJc74+RWn+7GCLpeFVdjhEK4yszN3h2ZPbtHnLLnDyQ=;
 b=nGIqMtxXu71DYpbnnBGqcWNs3p/pgsRCO9ngO+w/U5gHd2ViLNmCt/2ybAjg2Q+qSW
 YihRy9kVPnoHwrZvwQrUhR4Xih8MrwYlrXEhsL/OiUK7oRwlI5ozBgBrM20WV6Ev39V9
 Js6r9xiqRZ2dtdZcj7z4oY8RwRRSD6/fZJ6Ov+cPhLhk6a8dFF7N7R0/cNhR0KYgr1mV
 HBkFs+j//3oz98qcaUWQv6HssX3Q14GfvevfTBNA5B+LqTKvS9Lhrjk7409qxsM4y7h5
 XIK6HQEKBRQLT36x1m+E9oFTTVWuYxllm8EBtQdcce/eYqlfTkfXhpHY6q4itJIffkCS
 pwXA==
X-Gm-Message-State: AOAM533h5gF8H+VSQNfjoAOXLh1P5fNPh/NhpkZfQXyCVxd3za4anGoj
 OMQERx2z7Yn5AEvbe/AWBdqLtA==
X-Google-Smtp-Source: ABdhPJwxTeDsIDGN9llEK63Q5XOp03wNHRNIoYOYu15sVwUynQ6dZPkFDtb8Tnf5AJxNuB3XG8EYpg==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr21656699wrn.691.1643740150389; 
 Tue, 01 Feb 2022 10:29:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm2628556wma.22.2022.02.01.10.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:29:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7523F1FFCA;
 Tue,  1 Feb 2022 18:20:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/25] tracing: remove the trace-tcg includes from the build
Date: Tue,  1 Feb 2022 18:20:43 +0000
Message-Id: <20220201182050.15087-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220124201608.604599-16-alex.bennee@linaro.org>
---
 include/exec/helper-proto.h | 1 -
 include/exec/helper-tcg.h   | 1 -
 include/trace-tcg.h         | 6 ------
 trace/meson.build           | 1 -
 4 files changed, 9 deletions(-)
 delete mode 100644 include/trace-tcg.h

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index ba100793a7..c4b1bda632 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -38,7 +38,6 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 #define IN_HELPER_PROTO
 
 #include "helper.h"
-#include "trace/generated-helpers.h"
 #include "accel/tcg/tcg-runtime.h"
 #include "accel/tcg/plugin-helpers.h"
 
diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
index 16cd318b83..3933258f1a 100644
--- a/include/exec/helper-tcg.h
+++ b/include/exec/helper-tcg.h
@@ -59,7 +59,6 @@
     | dh_typemask(t5, 5) | dh_typemask(t6, 6) | dh_typemask(t7, 7) },
 
 #include "helper.h"
-#include "trace/generated-helpers.h"
 #include "accel/tcg/tcg-runtime.h"
 #include "accel/tcg/plugin-helpers.h"
 
diff --git a/include/trace-tcg.h b/include/trace-tcg.h
deleted file mode 100644
index da68608c85..0000000000
--- a/include/trace-tcg.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef TRACE_TCG_H
-#define TRACE_TCG_H
-
-#include "trace/generated-tcg-tracers.h"
-
-#endif /* TRACE_TCG_H */
diff --git a/trace/meson.build b/trace/meson.build
index c4794a1f2a..29f3bffd5a 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -67,7 +67,6 @@ trace_events_all = custom_target('trace-events-all',
                                  install_dir: qemu_datadir)
 
 foreach d : [
-  ['generated-tcg-tracers.h', 'tcg-h'],
   ['generated-helpers.c', 'tcg-helper-c'],
   ['generated-helpers.h', 'tcg-helper-h'],
   ['generated-helpers-wrappers.h', 'tcg-helper-wrapper-h'],
-- 
2.30.2


