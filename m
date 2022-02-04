Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79B4AA1A8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:14:55 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5ux-0001LZ-1v
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:14:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WX-0008Vp-VW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:42 -0500
Received: from [2a00:1450:4864:20::430] (port=46781
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WH-00089i-9B
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id q19so1033654wrc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DJc74+RWn+7GCLpeFVdjhEK4yszN3h2ZPbtHnLLnDyQ=;
 b=nNQO+N1mmT879NpVswxfwQqVop5KiZOwVemk9eov7KsWoXZMefYFGa4LhKPqvPaGMN
 KwlyIfShqA8T4fikCJzt0ikAkvMR+VT+cLlVq2oQqelXYw0icc0ypR29chI8OdhjKf0v
 TUFoE/wHfcGxbKpQfNmcrCEzjdcw7o7cnI2Ot7fXk+9O28PMsuL8HNNQAIggHYZSa2pa
 +Rp4f/CgQyaPCKD4RF4i0ZmWGk5nqvNLLfVmdjpE89hO3pFsIKFMGc37SEzrYmlF5qKZ
 KFUVk4fUjMtlagJDWJnWD9DadeodB/rSfdqRewa0Ri2YD8NhFl2arQRBwsagqMJ2AXbg
 EyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJc74+RWn+7GCLpeFVdjhEK4yszN3h2ZPbtHnLLnDyQ=;
 b=mNOmT+1ZuTo2DB9dZUUwxuXY3KIR9XhtG2tZDPgMLeSKg3cx8FRDDex43ZJ5eqnt9p
 /cvy5VSdo8xlTgeMHh3ElGQ4vz9h4VzQ8861txTNulBx2UiFUcp7lGUcBc+1GHMlKJKi
 OqFXZR9DuYWMxruzCPFquIIIwgPDBO+Jgy+Sp2kJk5twdO8+u23C9iyClAcpTn0+rdmN
 plN4FLFC+5xFhq+KtA4MfLFZ0iX9IyhnJjzQRPKskKXbcSB1HOkCQrLAskGEo+h/QYco
 njuHmhwTJkbyYaBx6yzUfctGQdnFbDwuzz/sqUeOWaeaxDKCrU8QrrmCQoOz61DNhIQ7
 Rn2A==
X-Gm-Message-State: AOAM532v5spRQRqBpda0X633EioIxkE+juhUSu4B1rd0+JF3UlSN9lSO
 oBqW4p7hIpCtSlEyIlZVPVIwNA==
X-Google-Smtp-Source: ABdhPJy3BQdYZaQX9qf2UX9qT3M0qEH3bjje6GpRM+UN04vVqf5ezZ3lOtnT5eJdnMd5pAMK2s6w+Q==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr587693wrr.42.1644007758720;
 Fri, 04 Feb 2022 12:49:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t3sm858463wrv.103.2022.02.04.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05CC31FFCA;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 19/26] tracing: remove the trace-tcg includes from the build
Date: Fri,  4 Feb 2022 20:43:28 +0000
Message-Id: <20220204204335.1689602-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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


