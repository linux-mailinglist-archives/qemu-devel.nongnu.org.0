Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E717F6AF7CA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf1p-0003uE-JH; Tue, 07 Mar 2023 16:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZf1o-0003u6-Gz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:39:24 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZf1m-0002wy-LQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:39:24 -0500
Received: by mail-wr1-x434.google.com with SMTP id j2so13529188wrh.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678225160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDCwQpt2b+FEq/4plC2udpKZMAb+w8VXBXnKnibWH1w=;
 b=oC9hyFMti+/cFFo18kX/JQN341QcvtHuCnUlCk7ZSXzpfrrzzptbPZ/5vroLSGhT30
 WN7XRue+X79PRFTbZPISMR50bdygAs4swYwkmm4d3vqIAlB3l8q41GSJDy5ySjBu9Wvl
 tJVoBhf8BOaUQgMFdJI2ecc6N7KL8ELbG1vdIBscuNzKA+1KpdyCfs72yR1Ptah+qMg4
 9xl/RzGn5nAMXmGmRCprXqVkbZrLAYsCzDChMxoznme9U7SRCF+k8IoQzvWQvIhk7j9f
 0hg1CSm8Qzo2yO7GbQxh9qtov+13TCrv+OiwiHxDRJTJTlUg5lDj2BvgCK3+ihGO47Kf
 yn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDCwQpt2b+FEq/4plC2udpKZMAb+w8VXBXnKnibWH1w=;
 b=UI31I0FDBgpF7Bdwy7RAyvsuquXPCInOVaGp2eqoLTr1OkH8sa9nFCHYpvL++qnA+m
 uEgNuDtk+1VEe0bdr4yagkE2f4qdrTg0RTaip3bumPW0+Z1qppmSOhq/zLDOJeOMs1jk
 zgdRufHnO2zfA2p+nqkprcOqfRplHzLLMFvqwISzlbGGZ91rRG4ASuc01FmvdZyfaqmA
 pazDm1IYUiJcH0sAvLPfin8bBpac9fnyek9pYf8gPAMIlFIrgy4BEUtqbtut3Y1h/u6c
 xNF8psUk7s7Vi8Ei0ly6bcJsXDo2p0iTuG6yfhOC4ZwwQqCx3kzeYOr6ArsXmGYbk/2y
 nBUg==
X-Gm-Message-State: AO0yUKWT/P+IE4+oQWU2sOeEDTUQ4v42SBS5zwMsizaZ8UatqkLhYKoQ
 coxS6sP4IGgvpw+d8XnkfdVNug==
X-Google-Smtp-Source: AK7set8mNn0YZ9vOq4wc2BE8OiwXWihnEv33Y2vcoOXD3mdmK1Aj8vhrGU/HZpFXuULhJEvifDxQbw==
X-Received: by 2002:a5d:5489:0:b0:2c5:6182:5f6b with SMTP id
 h9-20020a5d5489000000b002c561825f6bmr11433308wrv.18.1678225160523; 
 Tue, 07 Mar 2023 13:39:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4688000000b002c5544b3a69sm13685745wrq.89.2023.03.07.13.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:39:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88FB91FFB7;
 Tue,  7 Mar 2023 21:21:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 22/30] gdbstub: only compile gdbstub twice for whole build
Date: Tue,  7 Mar 2023 21:21:31 +0000
Message-Id: <20230307212139.883112-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Now we have removed any target specific bits from the core gdbstub
code we only need to build it twice. We have to jump a few meson hoops
to manually define the CONFIG_USER_ONLY symbol but it seems to work.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-23-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-23-richard.henderson@linaro.org>

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
2.39.2


