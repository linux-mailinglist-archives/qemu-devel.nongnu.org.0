Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAD5F44F2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:59:05 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiRs-0004Ar-VA
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgW-0007ml-4n
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgT-0000Hc-IN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id bu30so1360299wrb.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Gc5efp4TKI9Un8YLuLzBs+j1jFkZeAySokvshtzhWKI=;
 b=ZDmmF2EG5SuxME74vWpDuUCYL7PoVEkha7ulqN4MJtmiuKUnn7AlBPt6iF8PFAU9t6
 aDKiviydgBeFqQrtb7yWapuqh546zZ41j+u5G9OKXhqDkT37Jb5zfAw4JbEcDVD27m7L
 hY1EMRX977q37gEfbwlV32jyyRT09hrDy6/liQ7u67GsRnXRGe9YInQvY/7gB/xTgPnT
 SP03Q4NvaUUzUY6sM0cobo3OuQvAi4Nzaf/vtgYIsgYHjGyLEGaKRbtDsTN+mOLWPSAn
 WVd0Wz68OaSdmCOabrmJwPeEnii4mCI1YHF4zSlhKcBgJPEGC/bYMlwtdW/6u2tGo/SE
 G26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Gc5efp4TKI9Un8YLuLzBs+j1jFkZeAySokvshtzhWKI=;
 b=7Ay0rD33pQat7UFU068DDAfW85Asp1PRn20T9JQnKTLHdqc6JIYeWeZcbQImCcHvwF
 /AwgyYGOt8cbxyiWj9eiDL3Q+UaO4r13o1aP4oX+Jh9Ec+bIAaWW2clFoBj2DU8VQmiP
 He2Q0/DYGg7W47XXP+KEJeoFLv11Y2lcl88ZY4B2slOQLN6JfdiqAmj/kLho4RhuboAg
 8Pl13UXB7gbnw8Tns+UxLyQKjZStzT1cUVTqLJE1ldYH0MbtxT6XCwObMbJ1pc7wJagC
 zXygRi/UpwuuU/6CZeKt0gvhCRzEVq03hqgFvMIF7yDeGzol2PGp59JITQGFHUEhEMYo
 b5eg==
X-Gm-Message-State: ACrzQf2k+/YhqLaZLGUgi/nZ4oaAm1Od2bhPKTJQPJU7AzTUzpZeuoah
 zXpOvoDncvxGRVV0jaH8Q2hV+adqOrlvDQ==
X-Google-Smtp-Source: AMsMyM768tuRfnDM3gFyD9Kf8y79YuBA5/btVloyy9uWAEz/AEizKwPiqlns0NKIzBJqZamFTX1NTA==
X-Received: by 2002:adf:db03:0:b0:22a:dd80:4b45 with SMTP id
 s3-20020adfdb03000000b0022add804b45mr15674036wri.111.1664889003990; 
 Tue, 04 Oct 2022 06:10:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b003b476bb2624sm14140278wmb.6.2022.10.04.06.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:10:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C43371FFDC;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 40/54] docs/devel: document the test plugins
Date: Tue,  4 Oct 2022 14:01:24 +0100
Message-Id: <20221004130138.2299307-41-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Message-Id: <20220929114231.583801-41-alex.bennee@linaro.org>

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


