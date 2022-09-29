Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688D5EF87D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:18:01 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvIV-0001TY-RB
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD1-0007Uq-H7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCv-0004PK-2I
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h7so1798671wru.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NkejQo14YoKW4YZpsBZJ/pz1ZNt0+OQHO1iaD1STJCE=;
 b=gNsukcQZMgmQY0jP1nvYUYcGc5XSXQ6KQFeabr3+4PRVphyerKXGpKtxtMKqOP8LjT
 uYtTKKNJgpFAByw8cO61saFNI70hDSqi1BPEU9BkykPJ8a/Ly9UUlF32WtlgEaEWxCdA
 xpeximmhwFaw2Ngs0SW0og3zEAQ/Jb/GEdYipUhMKoPUERKpstu+7VJU0bn+w51buNxU
 4+SAA7yrK+JJaDckLVSNp3NlwPO8nYNcj+zhcYHpHQbHEp8yvHOTdSFDyTve6Bzm3MYc
 P47JOdPokoI48hmZmN/OzD2D3qWwovcKBcXSUZLJ4A16VI6ct1VPOTddT6MhsWzJm2cK
 2W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NkejQo14YoKW4YZpsBZJ/pz1ZNt0+OQHO1iaD1STJCE=;
 b=kzJF1rMwsY3AXHPpv8bVq08np7QQU5UpoGLPUcuA5xyfGcj3TH8bseRAYeESiEwxp+
 fa/ZbZS8F+xMAtqcLUsP5EfnbrvqSFv7c45fNcZUqYwVS6ob5r75D0S5So+POV81zvoq
 yzx/vi0cujnWzc4mXkKlt0SXmxBU5CsnG82cTYYPdjuKDpk8eRDxl6nxREn1ae8u0iWN
 nU0Uc0VT6/ad8Ro8lTnfJxOapKEHVJ7HYS1kfsVLSLLMTyDJV+8BRxjcg7p26cRYSdKC
 w0x0yD4xeJ7W6l3snCajTEGWDwBXF+nhlDVW8pTWYrcbzDDUajH1dpWrRK0Pzm0/z1mx
 dDFA==
X-Gm-Message-State: ACrzQf2pRNvrOTEj+86lRbi8HnlAVDCmQUVrZdBF/vTQBe62AcLAx7Y1
 /lMceSvfxPXLqQUUhnfR49RqJQ==
X-Google-Smtp-Source: AMsMyM4zvdz8LIoMjenxyb23bDxUO16gyBHdGR/qWw/+qkpKGLwdlRT2SsEADlA/fTSjKp2uMNlAGg==
X-Received: by 2002:a05:6000:1447:b0:22a:ea42:29f7 with SMTP id
 v7-20020a056000144700b0022aea4229f7mr2118331wrx.38.1664452799590; 
 Thu, 29 Sep 2022 04:59:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600016ce00b0022aeba020casm6651414wrf.83.2022.09.29.04.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C43621FFD9;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH  v1 40/51] docs/devel: document the test plugins
Date: Thu, 29 Sep 2022 12:42:20 +0100
Message-Id: <20220929114231.583801-41-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although the test plugins are fairly basic they are still useful for
some things so we should document their existence.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220921160801.1490125-11-alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 137 +++++++++++++++++++++++++++++++++++--
 1 file changed, 133 insertions(+), 4 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 8b40b2a606..9740a70406 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -145,12 +145,141 @@ Example Plugins
 
 There are a number of plugins included with QEMU and you are
 encouraged to contribute your own plugins plugins upstream. There is a
-``contrib/plugins`` directory where they can go.
+``contrib/plugins`` directory where they can go. There are also some
+basic plugins that are used to test and exercise the API during the
+``make check-tcg`` target in ``tests\plugins``.
 
-- tests/plugins
+- tests/plugins/empty.c
 
-These are some basic plugins that are used to test and exercise the
-API during the ``make check-tcg`` target.
+Purely a test plugin for measuring the overhead of the plugins system
+itself. Does no instrumentation.
+
+- tests/plugins/bb.c
+
+A very basic plugin which will measure execution in course terms as
+each basic block is executed. By default the results are shown once
+execution finishes::
+
+  $ qemu-aarch64 -plugin tests/plugin/libbb.so \
+      -d plugin ./tests/tcg/aarch64-linux-user/sha1
+  SHA1=15dd99a1991e0b3826fede3deffc1feba42278e6
+  bb's: 2277338, insns: 158483046
+
+Behaviour can be tweaked with the following arguments:
+
+ * inline=true|false
+
+ Use faster inline addition of a single counter. Not per-cpu and not
+ thread safe.
+
+ * idle=true|false
+
+ Dump the current execution stats whenever the guest vCPU idles
+
+- tests/plugins/insn.c
+
+This is a basic instruction level instrumentation which can count the
+number of instructions executed on each core/thread::
+
+  $ qemu-aarch64 -plugin tests/plugin/libinsn.so \
+      -d plugin ./tests/tcg/aarch64-linux-user/threadcount
+  Created 10 threads
+  Done
+  cpu 0 insns: 46765
+  cpu 1 insns: 3694
+  cpu 2 insns: 3694
+  cpu 3 insns: 2994
+  cpu 4 insns: 1497
+  cpu 5 insns: 1497
+  cpu 6 insns: 1497
+  cpu 7 insns: 1497
+  total insns: 63135
+
+Behaviour can be tweaked with the following arguments:
+
+ * inline=true|false
+
+ Use faster inline addition of a single counter. Not per-cpu and not
+ thread safe.
+
+ * sizes=true|false
+
+ Give a summary of the instruction sizes for the execution
+
+ * match=<string>
+
+ Only instrument instructions matching the string prefix. Will show
+ some basic stats including how many instructions have executed since
+ the last execution. For example::
+
+   $ qemu-aarch64 -plugin tests/plugin/libinsn.so,match=bl \
+       -d plugin ./tests/tcg/aarch64-linux-user/sha512-vector
+   ...
+   0x40069c, 'bl #0x4002b0', 10 hits, 1093 match hits, Δ+1257 since last match, 98 avg insns/match
+   0x4006ac, 'bl #0x403690', 10 hits, 1094 match hits, Δ+47 since last match, 98 avg insns/match 
+   0x4037fc, 'bl #0x4002b0', 18 hits, 1095 match hits, Δ+22 since last match, 98 avg insns/match 
+   0x400720, 'bl #0x403690', 10 hits, 1096 match hits, Δ+58 since last match, 98 avg insns/match 
+   0x4037fc, 'bl #0x4002b0', 19 hits, 1097 match hits, Δ+22 since last match, 98 avg insns/match 
+   0x400730, 'bl #0x403690', 10 hits, 1098 match hits, Δ+33 since last match, 98 avg insns/match 
+   0x4037ac, 'bl #0x4002b0', 12 hits, 1099 match hits, Δ+20 since last match, 98 avg insns/match 
+   ...
+
+For more detailed execution tracing see the ``execlog`` plugin for
+other options.
+
+- tests/plugins/mem.c
+
+Basic instruction level memory instrumentation::
+
+  $ qemu-aarch64 -plugin tests/plugin/libmem.so,inline=true \
+      -d plugin ./tests/tcg/aarch64-linux-user/sha1
+  SHA1=15dd99a1991e0b3826fede3deffc1feba42278e6
+  inline mem accesses: 79525013
+
+Behaviour can be tweaked with the following arguments:
+
+ * inline=true|false
+
+ Use faster inline addition of a single counter. Not per-cpu and not
+ thread safe.
+
+ * callback=true|false
+
+ Use callbacks on each memory instrumentation.
+
+ * hwaddr=true|false
+
+ Count IO accesses (only for system emulation)
+
+- tests/plugins/syscall.c
+
+A basic syscall tracing plugin. This only works for user-mode. By
+default it will give a summary of syscall stats at the end of the
+run::
+
+  $ qemu-aarch64 -plugin tests/plugin/libsyscall \
+      -d plugin ./tests/tcg/aarch64-linux-user/threadcount
+  Created 10 threads
+  Done
+  syscall no.  calls  errors
+  226          12     0
+  99           11     11
+  115          11     0
+  222          11     0
+  93           10     0
+  220          10     0
+  233          10     0
+  215          8      0
+  214          4      0
+  134          2      0
+  64           2      0
+  96           1      0
+  94           1      0
+  80           1      0
+  261          1      0
+  78           1      0
+  160          1      0
+  135          1      0
 
 - contrib/plugins/hotblocks.c
 
-- 
2.34.1


