Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1435C0431
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:31:59 +0200 (CEST)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2di-0005tR-TW
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gr-0003U8-2N
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gp-0000c9-0l
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g3so10617389wrq.13
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OfFvYONTn8YFltPiyuXy+wM30XdQW8jQu5P1PJa3mLM=;
 b=C0L2FrhWZ6mFlKL4eo4kX3F/iuqpx0X/BfSKyXRAStIb/aituXdAN4C4vbOYUfxMfA
 A41duVDmOfaghLZq1/p1qcWc/4hVQNJSn/c2FiUwqpv38Qa+sC3e6h4lhCqgKgVHLpJg
 x2y5025B5lSGWMN2MCDNr23lMIQUay7QuBgNjQpM7bC38jxWVqFjE9freKXMg48k5n+h
 pf2wFAmgQWU1+YlThBmr+qPjpjqjP0KIGt2X8UNqu5TYiIc0GBI6d9dzRpQ0h9GFE2vS
 HBChE3X17eVdZb/6wllceq39qQTZEFxlf9c5rOSm0DJCMx5cIb+Vojffjx8sVI3YTd+v
 HR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OfFvYONTn8YFltPiyuXy+wM30XdQW8jQu5P1PJa3mLM=;
 b=FkokS09aUyjfZxx0alnG/w5NonR1XUiHSWKH2UIUkIgdoG+wDbDkrgqskn8I2S2U58
 mm6L7dE7VepPNRyOROvi66+qwV1c4LxSqZc9Pmj8aotGPKHAHSSoMO/xMdBGKJlg1rnK
 X7ZLIYsQEoTF616hEn6DU/jc91ltz82X+3sR0OBN+jBiR+5wX3XsXFZTeGFSxptcQjfc
 Pu67Sa3L3MhDTpR10UJjaDbNvyUc5JHxOPfnLdzWnLtqH3zrH+IJBGDuYYECGYCk2PBr
 U60b7RqFIXkOgAM6LImM4q17lMkN2bvalwvV5xpClElKc70h8vEozvGdsGlso1TqxZ/W
 XhLg==
X-Gm-Message-State: ACrzQf3R27NENs3FN3iWrBGMlOq8ZeOs6Kmy1JFaBNyouKnlUB5gniry
 N5Im2IVRikOQU6HKxcABXyjfOA==
X-Google-Smtp-Source: AMsMyM69LVtlV+rVmjcYIsrOhVJf7tyK4IT1Uj1dr5DD7wDmB1BElFuhC+fzUX/aa2l4ojbPoMw+mw==
X-Received: by 2002:adf:eb84:0:b0:22a:917e:1c20 with SMTP id
 t4-20020adfeb84000000b0022a917e1c20mr17526363wrn.223.1663776498092; 
 Wed, 21 Sep 2022 09:08:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a1cc904000000b003a5c7a942edsm3224847wmb.28.2022.09.21.09.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD9321FFBF;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v1 07/10] docs/devel: clean-up qemu invocations in tcg-plugins
Date: Wed, 21 Sep 2022 17:07:58 +0100
Message-Id: <20220921160801.1490125-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

We currently have the final binaries in the root of the build dir so
the build prefix is superfluous. Additionally add a shell prompt to be
more in line with the rest of the code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index a503d44cee..a6fdde01f8 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -172,7 +172,7 @@ slightly faster (but not thread safe) counters.
 
 Example::
 
-  ./aarch64-linux-user/qemu-aarch64 \
+  $ qemu-aarch64 \
     -plugin contrib/plugins/libhotblocks.so -d plugin \
     ./tests/tcg/aarch64-linux-user/sha1
   SHA1=15dd99a1991e0b3826fede3deffc1feba42278e6
@@ -186,7 +186,7 @@ Example::
 
 Similar to hotblocks but this time tracks memory accesses::
 
-  ./aarch64-linux-user/qemu-aarch64 \
+  $ qemu-aarch64 \
     -plugin contrib/plugins/libhotpages.so -d plugin \
     ./tests/tcg/aarch64-linux-user/sha1
   SHA1=15dd99a1991e0b3826fede3deffc1feba42278e6
@@ -220,7 +220,7 @@ counted. You can give a value to the ``count`` argument for a class of
 instructions to break it down fully, so for example to see all the system
 registers accesses::
 
-  ./aarch64-softmmu/qemu-system-aarch64 $(QEMU_ARGS) \
+  $ qemu-system-aarch64 $(QEMU_ARGS) \
     -append "root=/dev/sda2 systemd.unit=benchmark.service" \
     -smp 4 -plugin ./contrib/plugins/libhowvec.so,count=sreg -d plugin
 
@@ -288,10 +288,10 @@ for the plugin is a path for the socket the two instances will
 communicate over::
 
 
-  ./sparc-softmmu/qemu-system-sparc -monitor none -parallel none \
+  $ qemu-system-sparc -monitor none -parallel none \
     -net none -M SS-20 -m 256 -kernel day11/zImage.elf \
     -plugin ./contrib/plugins/liblockstep.so,sockpath=lockstep-sparc.sock \
-  -d plugin,nochain
+    -d plugin,nochain
 
 which will eventually report::
 
@@ -348,7 +348,7 @@ Please be aware that this will generate a lot of output.
 
 The plugin needs default argument::
 
-  qemu-system-arm $(QEMU_ARGS) \
+  $ qemu-system-arm $(QEMU_ARGS) \
     -plugin ./contrib/plugins/libexeclog.so -d plugin
 
 which will output an execution trace following this structure::
@@ -365,10 +365,10 @@ which will output an execution trace following this structure::
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
 
 the output can be filtered to only track certain instructions or
-addresses using the `ifilter` or `afilter` options. You can stack the
+addresses using the ``ifilter`` or ``afilter`` options. You can stack the
 arguments if required::
 
-  qemu-system-arm $(QEMU_ARGS) \
+  $ qemu-system-arm $(QEMU_ARGS) \
     -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
 
 - contrib/plugins/cache.c
@@ -377,7 +377,7 @@ Cache modelling plugin that measures the performance of a given L1 cache
 configuration, and optionally a unified L2 per-core cache when a given working
 set is run::
 
-    qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
+  $ qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
       -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
 
 will report the following::
-- 
2.34.1


