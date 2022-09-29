Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08295EF71B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:04:09 +0200 (CEST)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odu92-00042R-U7
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD3-0007Y9-9i
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCy-0004RF-DF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so618854wmq.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8JenHXqV6xiyGmjePqVC5qPckxIDo6KWDriFhBc6wYc=;
 b=FdEsBE8qaqEQraGgp7uDKv8lKyADrYLs1p464dSdzyIlPL2djTCGh3MnQYKTz4F0rc
 BBWvsqps6kjWqYNlXhLbCx/RQCWyK0+KOpholXmt1e2rCAEE1JOiOTYq9cz4kYY0t+Xv
 e7EQlQOFASFUT6kTLLyU3ibvDqz39/VDrYtYjvNW7niDlZQLziZtFG7bW6ztiHND64G8
 xeMFGoIuAlzt/vZCpsGcf3Sk63D1OsXKjttakxQgEUrMTAlNSXdfNrMtHygVj5ia2wTb
 bhWjKz+MoO0r9/i9qyQstUicCsGaZGHLYlztTfpWiaclMZR9pB+s5FudhJZDEa1HqNXR
 dipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8JenHXqV6xiyGmjePqVC5qPckxIDo6KWDriFhBc6wYc=;
 b=MzVgbDlBTDh2GWIDWanjA6Oa71XvJE7xVJKp+Z4bXfJRdQ2rPZtUuniL0Q1HnXGznI
 sLZO+8ad6aGB6B4E5e2vObIKn2xb/A/lZgaFlAJ6eAEr0kGqyu8wPdKj10a6iv5tV8ur
 nTGDDUbq8rDMFEXl2oVunkwi0KKSqNXKz3gXsuuPA3/ctN8ocI/Ss7yNSzvr6YWXPvSf
 OKwVPhl/2nqd2Pc56vi4SxUhyq8XsuimE7FHDX14PziUYK8W02d54EyA59CO1l1PavCd
 HA7ygWn2ccrL24KqiBr06fK14oTjishdNH6DZW343aeGmDRc6Weyy56c3bycqB3JvfdX
 Ez6Q==
X-Gm-Message-State: ACrzQf0/h1xa3+Oc+gnhpGnbwO6iqd/+7I8/UJOMSedQFoQsyzsw83Uk
 BDM2g9X3nj8BrZIckINKwbQM3Q==
X-Google-Smtp-Source: AMsMyM7M+EGd+9zXVuwNC0ifZROEsvvKoS6qMA1y1osxvRRaDigNeEkgQWhxx8MrVJP8aSt3GmISWw==
X-Received: by 2002:a05:600c:21c3:b0:3b4:7e47:e3a with SMTP id
 x3-20020a05600c21c300b003b47e470e3amr2003955wmj.167.1664452802316; 
 Thu, 29 Sep 2022 05:00:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adf9c89000000b0022878c0cc5esm1144807wre.69.2022.09.29.04.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DB451FFD7;
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
Subject: [PATCH v1 37/51] docs/devel: clean-up qemu invocations in tcg-plugins
Date: Thu, 29 Sep 2022 12:42:17 +0100
Message-Id: <20220929114231.583801-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220921160801.1490125-8-alex.bennee@linaro.org>
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


