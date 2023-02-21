Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB369EAF5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:04:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbea-0006nc-9f; Tue, 21 Feb 2023 18:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbeI-0006Tb-Gs
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:02:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe7-0006HN-3G
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:02:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so75736wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVHpGqkcdr2gO4uob9X2D+X5gkMbOtaQKWo3v4EPeXY=;
 b=iGquWRm6hguyiLKLVJTz6HRy0PovTLPeMQ4ZFPxtt1CCrP9lujTRvaAj3umXypY+De
 oMMu3gRC09AnqP3uKvlCSV/9KLYN1F25xsn1yF+tWmcsNCdr3jUl+Bq/vgrXDq+ON1hg
 jz0IycpKzHGokCz4G/EaiKAwOmarp0nFhO652ta5yMj0g/9fP3c/dlcNI/8qWHxHPbQf
 dYKVS4met2t6cluob25JG4YhzkP6cRTg1ftSbJSfpG+p6cQCMrltHryrTFx6QF0eVQDB
 OtMn+6WWR1e2nUBbsHyLdhBs/RZeZ1qJoo0DbCsSoV1LFVmh2mgrY/Wsfzv3QfG7CVq6
 q1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TVHpGqkcdr2gO4uob9X2D+X5gkMbOtaQKWo3v4EPeXY=;
 b=T7VkeCOy0zJ0OIOW0qu7Ygq729ytiiFF2cORpAxV5ROOpLvyJryA+gawPDTIMA0ZBw
 EzuuiRj6knBhIJC/axr3wqD8x9o8mCIzRaXJqL7coT+PfTxXPV3u3CfcSDo4zqicZh/q
 +PHgz5a9EhdqYaPvmyzncjlrtn06IyJJ4DQUFuA2+dilQ0CITnHD4cWRyxi2A22cCs2q
 HPLS7PM8r+3jcQihmnR/lYePZ4m59Wd4UJ50uTzQ5yS9oyG33E3p5SJqUgn0bBEGyyFQ
 /bOWKmdG6PiO/hebLnF+dtU1Bw0PvWCxZOcQjUtdJ4Num+8HmSRiGrC5/tofvP8XQxqJ
 XMfg==
X-Gm-Message-State: AO0yUKW05oTp2IJLDGa/Es6iyyoEZGODHuXvuUNijnPAPMjiIhsLyIys
 Y8f6HqW+XLmwFLy4eZj7wLov6g==
X-Google-Smtp-Source: AK7set8S+FZTxNAK5rZh2HHkQd/hnzrrhL2WwPDiw8cG6ld8jNrsdaTQg9S2QcTmWQRJwiW1Octe2g==
X-Received: by 2002:a05:600c:2ad6:b0:3df:f7f3:d007 with SMTP id
 t22-20020a05600c2ad600b003dff7f3d007mr4302001wme.17.1677020520311; 
 Tue, 21 Feb 2023 15:02:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm5381055wmn.14.2023.02.21.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:01:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2FFE1FFCC;
 Tue, 21 Feb 2023 22:52:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 21/24] gdbstub: only compile gdbstub twice for whole build
Date: Tue, 21 Feb 2023 22:52:24 +0000
Message-Id: <20230221225227.3735319-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now we have removed any target specific bits from the core gdbstub
code we only need to build it twice. We have to jump a few meson hoops
to manually define the CONFIG_USER_ONLY symbol but it seems to work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - also include user and softmmu bits in the library
---
 gdbstub/gdbstub.c     |  3 +--
 gdbstub/user-target.c |  2 +-
 gdbstub/meson.build   | 32 ++++++++++++++++++++++++++------
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index a8b321710c..791cb79bf6 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -39,7 +39,6 @@
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
 #include "sysemu/replay.h"
@@ -1611,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     {
         .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
index e1d9650c1e..a0c10d6e12 100644
--- a/gdbstub/user-target.c
+++ b/gdbstub/user-target.c
@@ -233,7 +233,7 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
 }
 
 
-#if defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_LINUX)
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx)
 {
     TaskState *ts;
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index 56c40c25ef..6abf067afc 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -4,13 +4,33 @@
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
+libgdb_user = static_library('gdb_user', gdb_user_ss.sources(),
+                             name_suffix: 'fa',
+                             c_args: '-DCONFIG_USER_ONLY')
+
+libgdb_softmmu = static_library('gdb_softmmu', gdb_softmmu_ss.sources(),
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
-# and BSD?
-specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))
+# The user-target is specialised by the guest
+specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
-- 
2.39.1


