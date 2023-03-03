Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671446A8F93
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvct-0007bN-Pd; Thu, 02 Mar 2023 21:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcr-0007a7-3B
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:29 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcp-0001tO-A1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:28 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso947939pjs.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pf0gnzU22Lq1Q1Kv39Okh1QPjAe7PNl3a36TYlU7/jI=;
 b=VF7U7mEJYwo4wJH8QP5k/Lpj5n48C59nIe3K1GWafjnexVPbchkUezF9lbR1RBhODF
 gXsWtCoFvnpo5H/e28jBCiSX+pG6UT7cMRa6Pxlt6+OvWfVVapKxLob60NiD1GK3PlIV
 nVt2ewVwq6Wj0Hv9DffOab0tHHvxnFYnPwJ4Bvj429A8G3oZweIsZTVMM0WTrdQYs8b5
 2F2x35daleTzlrRwKkAcizkoVyTQKscOHTmR++Dw+RdWyYQtcV+8xhpJKoS1Jka5w5ef
 jFCnUt3zlXhjSDp5Tehc6cRHxa1gGCtvgiaEphrjKLx55YD8wyc+OsOXMgzWMerrFn1B
 5GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pf0gnzU22Lq1Q1Kv39Okh1QPjAe7PNl3a36TYlU7/jI=;
 b=dU+9r1QKL8vMFS8I833CIqVi2sjoykFHaxa4BqdjjQH4yRbAKQAhU65PwgzRTEBtsT
 5Dw+XfFhPnluPHpbsRitXWxxjrzDOTWLjWZ2kXb59wOSKVfosMA33JTwIKEi4Y1cXcTI
 gxFpADONdlkSs+W31VyeNnNIgaNSnXafb4nmyRUCZuvr/45UolulPXANwTdGuoUPLHFj
 cVt3R4rOI9Xh7z8g70s2WU7W9uAbEEY8XCMo8+8fz/pm/U4TSr/fiV+LVJxArQ+Xe04I
 Voe8LoyrBPburdMJ5xXbLLu8sJInCUjMERRa4CFlPsOUrCTTOkp+5HklChE4oJGcdEm3
 R52A==
X-Gm-Message-State: AO0yUKXNt7NpmlxrfmFSJtmAi0f+PUSUI+0HFpaNIHYrJdhXRximFbMq
 5xlAYmCQi4VmplsN7F4A5MjSM/jSc/uJwR0P4hg=
X-Google-Smtp-Source: AK7set9JD4FPlRqTLoZGX/aAidM8OqSBV2YX4Mi5k7GX1QIJ36+ymxpE9iqHJyDwjIlGEcmVMApkXA==
X-Received: by 2002:a17:902:d4cc:b0:19b:dbf7:f9ca with SMTP id
 o12-20020a170902d4cc00b0019bdbf7f9camr805339plg.0.1677812305829; 
 Thu, 02 Mar 2023 18:58:25 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 22/29] gdbstub: only compile gdbstub twice for whole build
Date: Thu,  2 Mar 2023 18:57:58 -0800
Message-Id: <20230303025805.625589-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
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

From: Alex Bennée <alex.bennee@linaro.org>

Now we have removed any target specific bits from the core gdbstub
code we only need to build it twice. We have to jump a few meson hoops
to manually define the CONFIG_USER_ONLY symbol but it seems to work.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-23-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c   |  4 +---
 gdbstub/meson.build | 30 ++++++++++++++++++++++++++----
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e264ed04e7..d9e9bf9294 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -39,9 +39,7 @@
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "exec/exec-all.h"
 #include "exec/replay-core.h"
-#include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
 
 #include "internals.h"
@@ -1612,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     {
         .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index c876222b9c..d679c7ab86 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -4,13 +4,35 @@
 # types such as hwaddr.
 #
 
-specific_ss.add(files('gdbstub.c'))
+# We need to build the core gdb code via a library to be able to tweak
+# cflags so:
+
+gdb_user_ss = ss.source_set()
+gdb_softmmu_ss = ss.source_set()
+
+# We build two versions of gdbstub, one for each mode
+gdb_user_ss.add(files('gdbstub.c', 'user.c'))
+gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))
+
+gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
+gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
+
+libgdb_user = static_library('gdb_user',
+                             gdb_user_ss.sources() + genh,
+                             name_suffix: 'fa',
+                             c_args: '-DCONFIG_USER_ONLY')
+
+libgdb_softmmu = static_library('gdb_softmmu',
+                                gdb_softmmu_ss.sources() + genh,
+                                name_suffix: 'fa')
+
+gdb_user = declare_dependency(link_whole: libgdb_user)
+user_ss.add(gdb_user)
+gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
+softmmu_ss.add(gdb_softmmu)
 
 # These have to built to the target ABI
 specific_ss.add(files('syscalls.c'))
 
-softmmu_ss.add(files('softmmu.c'))
-user_ss.add(files('user.c'))
-
 # The user-target is specialised by the guest
 specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
-- 
2.34.1


