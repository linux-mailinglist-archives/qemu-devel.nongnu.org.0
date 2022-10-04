Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3C55F4521
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:06:23 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiYv-0002qW-Lu
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhqB-0001Lr-52
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq6-0001sD-Kl
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so1703696wrp.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+EAMPNccITJT6MPq/SX1010khU+nXYZGC3lTu1OYiqA=;
 b=h7T5CIptIHcQJPhYsS1IrQ7pWxNJ4a/uUfSTQJgZS2YjArZWgcxaLzasTpbUq2vzsJ
 xdxxAPZ4rOBe3DQb4kU7sgLRkvX19I3Xn26zje5IyHLcgdHzJDBalv1tmD27s2xiFErt
 PCtioQw/6o1QmXENHc6QjjTmMJHx9vixtv8CBWp7xxlAh+02rUaVeWysH4f16aG3sFHX
 PFRsp2ad0dqObaqwBrvdAl2xYazy9wD4+tRWiOC5UgbG8lNq6rtPLMXrBKOcwKczTLtj
 2kYtoTM06xm157pdEjW5VgRxJUlDPbjikoSh6X9YLSpxMXXp2bwtHHE7BM9rHyCcJy2z
 6v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+EAMPNccITJT6MPq/SX1010khU+nXYZGC3lTu1OYiqA=;
 b=Q/qfXZX5+0HFdoABqipzrsq8j3e5GRq1kcrw6q6GHb7PEIa8ykxIfy13r/dRrbNB1d
 h2hswF+TdTll8hrfeiRIUWdtsrvQWWbCHaUSDs3RNDbNl0FTBT30F1DYHNGYqisOdXF0
 L9aBcCfXO3dcRgkch0bR4EYZBX4sp0537aoO8M2qP8P3QpbktJy/ZDg1iO/qLqxeRT1X
 w/VUnqHWnNE/2iW2zjw1xchx09J+yxxABR1A1iDlss4sSEWfd20QSCvWWEZz0wFPsCnV
 apUKhoK346EXi8FCGgEpCAacolc+ZO7aPTCZJOk/scVTNDeVrP4406SPiIFaG7myGBZf
 W64A==
X-Gm-Message-State: ACrzQf235P1ylkrmI+pokHXq0lPFwP52ZkH9SY8xvmHIT4RJCX2aXs83
 x7mLQWjLgqHMsuxa+43Bo3VBpA==
X-Google-Smtp-Source: AMsMyM5K2NdTgVRbRESyKlPawCuOhtJCCjTzooNdaUHIRX4n03CIoCqDhm1Gd2aK0yC2gztT5wz/0g==
X-Received: by 2002:adf:fb05:0:b0:228:6463:b15d with SMTP id
 c5-20020adffb05000000b002286463b15dmr16395546wrr.534.1664889599471; 
 Tue, 04 Oct 2022 06:19:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003a84375d0d1sm20615327wmq.44.2022.10.04.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F2C71FFD9;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 37/54] docs/devel: clean-up qemu invocations in tcg-plugins
Date: Tue,  4 Oct 2022 14:01:21 +0100
Message-Id: <20221004130138.2299307-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Message-Id: <20220929114231.583801-38-alex.bennee@linaro.org>

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


