Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1825C045B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:38:27 +0200 (CEST)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2jy-0001qo-2F
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2ND-000758-O2
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:14:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2NB-0001VY-Ob
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:14:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so2720735wmb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GoEs9/h2LLepKNbeRIHGFuvJURS7q8MKK6QKHpul0xk=;
 b=JyKI51tvaaRmGJEvtwLZkNMg1pNweSuN79tWCjShG5iLTQEZRlc3Nzz6/1ehh16kmw
 ri3VdHTqBd/yRwL1JlMKwS8WfJsMHAgOGmM9n7kzZ1SGSw8bfMgZuZo7kSYeY9tplrdu
 XhhyUqxJRI2tcmniWNmeJXTCF2P7C1fL3YEnnPXpiBR3/fJe3JaX2GZx9/DxW/2iP8JU
 m84gDp99s54rFN7PpyFREuzbzop9lCset84v2X1Rwvyw+7HaMhxbV+Z32IvD8Ch3Y0BV
 rRypTxRN1i+4pyoSnwZZI3ktd4MMoNH7qDg+yNYPHOR4dcYg3ULSlfz+4Me9R4HIpdqu
 Yzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GoEs9/h2LLepKNbeRIHGFuvJURS7q8MKK6QKHpul0xk=;
 b=D9z9jp+5PtEOqfR6BjUxs7s8Ms0R7KbMC0uBAjCvN2qTAcKD7q230AtX2TqlWgRK9Q
 i+71m9T9F/iresKdnsc85mJTCa6UZH6Y2mFiF+2b4LvuMM9NJ6C2U5gbmURPSM94T8Us
 A49o709Mhb5AKiLX0QRZRSURPSvNoBA70cucgFyrjycdBN5N4uFv4LEglApf14miRy2/
 64oCLffCKmI3gy8mMmUdsMlZTE3nKqD5jDiTuwoWe4e02+qPo3pXN5c4MUUjdrLERzUQ
 zlli75fwhHpcgDdLPcm8bhbo/C2OG+tvFOMXsFqkqs1rQyFPvApnXsOFlN6zSOpA0yGY
 hb6w==
X-Gm-Message-State: ACrzQf3x8VjmvvHNJQKfeFqc9RpKVISKlJz97cpSk5yZfxkZ2YaIimzK
 VswuMmQTDkVUUx1C30ijT1KQdg==
X-Google-Smtp-Source: AMsMyM6kYJVDJTUx48OQtp4d3cM83SM9P21pcTTKIyEAOGspuz70GJJkne483hjjuvE9efftWuW18A==
X-Received: by 2002:a05:600c:4ec7:b0:3a8:4622:ad27 with SMTP id
 g7-20020a05600c4ec700b003a84622ad27mr6786719wmq.88.1663776891802; 
 Wed, 21 Sep 2022 09:14:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bu23-20020a056000079700b0022a3a887ceasm2889808wrb.49.2022.09.21.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:14:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B8EF1FFC2;
 Wed, 21 Sep 2022 17:08:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH  v1 10/10] docs/devel: document the test plugins
Date: Wed, 21 Sep 2022 17:08:01 +0100
Message-Id: <20220921160801.1490125-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


