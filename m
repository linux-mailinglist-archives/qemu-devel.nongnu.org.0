Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640E6A28A4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrBN-0008Sk-Fh; Sat, 25 Feb 2023 04:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBK-0008MO-8P
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBI-0000Pf-JM
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so983770wmi.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hUi5JZWgtGe/HPtd1a91JzPK7NOPEzO7wKibYvhikkw=;
 b=FBuJLECQflDxkDWSI7MQjY/AkSukimuaLC4B+b4opw6gTkCHqcSOUOvAALKqfU0G2B
 OJ/WkrUfYNFFeg+/pZl79M7KxhtapXH9ynLjh3z+FiH/xQTj22KBxYmgBCLFMwfo6OTo
 57ewjg2vAUry5gjzQPCJuvz3hRnf0uhU3GruD/OGhlTB76CR5EVcZTgySeRaVVGEmbwE
 LuUbrNB+2+jcqCbCkx45YbuVowUyiumRhEiEAjq/30qxhuVNTmrWj4ThNxEb6fuGTG3k
 giil+7gi6DizPdMOtzyN6FK0ETvvzY0I4vt89vc36H7KPefU8CbGSIy1L/kl3wyLevOS
 IK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUi5JZWgtGe/HPtd1a91JzPK7NOPEzO7wKibYvhikkw=;
 b=luHMIm7ED9CiYSQb787aBwhFD9ir/qlfg+I2OAPxi9VLPFWzrdhTCiyJhCjccqqwrR
 7+dYdfJg53oJuOpGVVBsnDySxtm9c8pgjX7GIIyxnUJIolkiIO0XeO5gIQEJU6/HHsGo
 54MTDRoCYy0z8YV/eVBrINx6mdK3tolN9HS6icRavnVm3YVZQvy9NBpH7hsf1QyOmtun
 +RMTNdZ2MhMFVokMTBsED3OyD3c8DVYtUswznzA9fwzZ/Pfg6NSRqe1EfVKn2vNz9J9G
 ittX6kXIrqbvtr9cS/U1V7ASI8L2mn0MfQnhvSHXlg8lfcoS1x1uLXvL1+QUTwDjQ487
 Cldw==
X-Gm-Message-State: AO0yUKV/SPb4ZmMvHnyQxZnCSpS6WepJYdJDBmv9AI3yh+2mWps/SEOo
 CfjozzQPL7F3sX1wHYvABy7L0DDPbQ8is4Mlnl8=
X-Google-Smtp-Source: AK7set+5Az+ziufYzlmX/dcvWatUvqnyLhKVR0Z9DQG7UaGW83kqZXkq6AHZYyBaxvndlXeozNmNcg==
X-Received: by 2002:a05:600c:1898:b0:3e2:20c7:6553 with SMTP id
 x24-20020a05600c189800b003e220c76553mr14829622wmp.13.1677318567000; 
 Sat, 25 Feb 2023 01:49:27 -0800 (PST)
Received: from localhost.localdomain (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 s17-20020adff811000000b002c758fe9689sm1288801wrp.52.2023.02.25.01.49.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Feb 2023 01:49:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 3/5] dump: Clean included headers
Date: Sat, 25 Feb 2023 10:49:01 +0100
Message-Id: <20230225094903.53167-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230225094903.53167-1-philmd@linaro.org>
References: <20230225094903.53167-1-philmd@linaro.org>
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

"qemu/win_dump_defs.h" is only required by win_dump.c,
but win_dump.h requires "sysemu/dump.h" which declares
the DumpState type. Remove various unused headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump-hmp-cmds.c |  2 +-
 dump/dump.c          |  6 ++----
 dump/win_dump.c      | 15 +++++----------
 dump/win_dump.h      |  2 +-
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
index e5053b04cd..b038785fee 100644
--- a/dump/dump-hmp-cmds.c
+++ b/dump/dump-hmp-cmds.c
@@ -1,5 +1,5 @@
 /*
- * Human Monitor Interface commands
+ * Windows crashdump (Human Monitor Interface commands)
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/dump/dump.c b/dump/dump.c
index 4d68a74ffa..da63129825 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -14,22 +14,20 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "elf.h"
-#include "exec/hwaddr.h"
+#include "qemu/bswap.h"
 #include "exec/target_page.h"
 #include "monitor/monitor.h"
-#include "sysemu/kvm.h"
 #include "sysemu/dump.h"
-#include "sysemu/memory_mapping.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-dump.h"
 #include "qapi/qapi-events-dump.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
+#include "hw/core/cpu.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
diff --git a/dump/win_dump.c b/dump/win_dump.c
index f20b6051b6..ba7fa404fe 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -1,5 +1,5 @@
 /*
- * Windows crashdump
+ * Windows crashdump (target specific implementations)
  *
  * Copyright (c) 2018 Virtuozzo International GmbH
  *
@@ -9,19 +9,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/cutils.h"
-#include "elf.h"
-#include "exec/hwaddr.h"
-#include "monitor/monitor.h"
-#include "sysemu/kvm.h"
 #include "sysemu/dump.h"
-#include "sysemu/memory_mapping.h"
-#include "sysemu/cpus.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/error-report.h"
-#include "hw/misc/vmcoreinfo.h"
+#include "exec/cpu-defs.h"
+#include "hw/core/cpu.h"
+#include "qemu/win_dump_defs.h"
 #include "win_dump.h"
+#include "cpu.h"
 
 static size_t win_dump_ptr_size(bool x64)
 {
diff --git a/dump/win_dump.h b/dump/win_dump.h
index b8c25348f4..56f63683c3 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -11,7 +11,7 @@
 #ifndef WIN_DUMP_H
 #define WIN_DUMP_H
 
-#include "qemu/win_dump_defs.h"
+#include "sysemu/dump.h"
 
 void create_win_dump(DumpState *s, Error **errp);
 
-- 
2.38.1


