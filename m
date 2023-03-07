Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7156AF7A6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesA-0004hT-T5; Tue, 07 Mar 2023 16:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes8-0004fg-9B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:24 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes6-0000v5-Iq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:23 -0500
Received: by mail-wr1-x435.google.com with SMTP id r18so13539869wrx.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zl004Ztdx+ncMhjo78lnbFMoRF4r79GXD1PmC56py4I=;
 b=cdg7macd9u+5luzgJQ2QFOtqP6xusVqOyiA9NdbwXgCcTeeV9O7XGN1zs9/VmP7/uV
 qKabDY0fEmP2JN3CX+4QyFqkT3RVLuC4Ei8bzqVV7Fu22kVu/sIu1qnhHYNM6sAG6Red
 DSNMgOEnuAdnnCE6oKtm1zbuE8BOHJoXiiPZn+3KDupNlExFlhaUGGUXMy933F9g9S0k
 s0QbYI0oAsWwgtx3O3cGPhtG0pMxMawux2thXxz6wXsZCyeJsPQ5Z5QZxQJ+JkjEK/kZ
 LFKv3Ozmd/qljpjdcHy0cUpW5bSbTMVEEg+ElysJfO4e5GYA2tcee0BodM93cy7qzpGR
 Nv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zl004Ztdx+ncMhjo78lnbFMoRF4r79GXD1PmC56py4I=;
 b=PpV07+MOcnvekujYDSdNXU5iW28YCR4Fb2HTP8WwK8NWFpDZ8I/xhMDo3JecZBLLLj
 rOCp1KSETyYOlJvy4Ofa4K6OfIqPVJ9jcSHBrTtPhiHBLhSsns8DelRi3M22xOvCRkXM
 M4e4JFd21r3lRd4Cy48w4G6nwK99tuHRUd9nFpVjxdDz+orv9ROMQPsiub9XvyPqnWNU
 UPCaPX6FeOcXLegY22ANk5KXqzRxdUNk9ZeKIupP8eBROzNi1PyBQqW/xFKihF3YCPy0
 +mQ3ZQ+K+tfpul8B/dL4qxBiFPpFH+NmbJvpXhMEm0LMb7frGAD0MBhv0bm90aNYXYVH
 5+wQ==
X-Gm-Message-State: AO0yUKU9AwkiDzgszruNpY7HJU6nOfeuhdMoEgc48ddzK/30Yq0/Q+uw
 VdlgYrxYH/C+F9VmIKgsz9pRcw==
X-Google-Smtp-Source: AK7set8QzQAX2Q3tkWOyZA3bC605wlCnothUQ/JTp1uAJsalvow55diwK705ezyKM40A1TAPLswuRw==
X-Received: by 2002:adf:fe90:0:b0:2bf:b199:c7eb with SMTP id
 l16-20020adffe90000000b002bfb199c7ebmr9348108wrr.54.1678224560549; 
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfea91000000b002c6e8cb612fsm13267973wrm.92.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A05C1FFD8;
 Tue,  7 Mar 2023 21:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 29/30] gdbstub: Build syscall.c once
Date: Tue,  7 Mar 2023 21:21:38 +0000
Message-Id: <20230307212139.883112-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

There is no longer anything target specific.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-29-richard.henderson@linaro.org>

diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index 9f479010b1..02e3a8f74c 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -2,9 +2,7 @@
  * GDB Syscall Handling
  *
  * GDB can execute syscalls on the guests behalf, currently used by
- * the various semihosting extensions. As this interfaces with a guest
- * ABI we need to build it per-guest (although in reality its a 32 or
- * 64 bit target_ulong that is the only difference).
+ * the various semihosting extensions.
  *
  * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2023 Linaro Ltd
@@ -14,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
-#include "cpu.h"
 #include "semihosting/semihost.h"
 #include "sysemu/runstate.h"
 #include "gdbstub/user.h"
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index d679c7ab86..bd5c5cd67d 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -31,8 +31,7 @@ user_ss.add(gdb_user)
 gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
 softmmu_ss.add(gdb_softmmu)
 
-# These have to built to the target ABI
-specific_ss.add(files('syscalls.c'))
+common_ss.add(files('syscalls.c'))
 
 # The user-target is specialised by the guest
 specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
-- 
2.39.2


