Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07D370FBA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:23:49 +0200 (CEST)
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLRE-0004vK-1g
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMS-0008B4-1p
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMO-0002pI-W2
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id gj14so2044718pjb.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1e+L/3PIqi6UorKNK4j6ulWCMjYwBo4gA3O0a98YIhg=;
 b=IYiooxhHXGiQDV5fO4bQRA12LS+V+bol+eXY7OC6VIz9vaZx7QsXwywqvtDBvM16mV
 AOGrs4srOMN7+4+6NuGZrQ45WxFOnZzDZtVGfFTSv9JP+fmRWIFkQPscfZYcQCIA3/ir
 tVX9p+hjSrj8M1BvetGBE/eiFOowPK40HdEEmz8p56NwM8cn5JcJ4bGnPDHFIV52UNi2
 hZJ37ipWvFNIuueh+HrZ35gKjGIdZ4U0ZMCcEfvJ5bE4mMSOSYIy+zF5GYP5VFnH9/kx
 PjRPg1vip+5sJGUcSYmcy/4lmcmJe9QSCXW9N3KaytJBei+RakELG0jslZYVL2HIvmwi
 OuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1e+L/3PIqi6UorKNK4j6ulWCMjYwBo4gA3O0a98YIhg=;
 b=DjLUIqMonh93tEktqv6/yWvxUBm4eo3WLM5IbiqUmsqt0uJBnIO1d5Hflgujq6mKWN
 4uREPES4J7MeBCb8B3LFyA2a52iCVaMDxWkl9sSYcosEkuOUnUTrM6ita+iM6OGBW5q9
 JkwpHoO/4d9ICJALnLHabZbT5opQI3XsqPwF+BTijHJiXWm0X6m9rzkHts3xNqOt4hYY
 fN+lLsfM6kNTA23LI0h00LHjdYFxSV3iguMs/ng8lGYxSLBg1mcEUV7iwesqftpT5Utv
 Sb+jlP8Jvhcox4ObcWKR4wDLATUerjmhIQGskVpXp8pxTqE73Dsx9gCDPnxvvS0MNUna
 e3VQ==
X-Gm-Message-State: AOAM532/AKA91GiUCvh1aMb0KRE6P22zoQKexGiLi/+OAWGTnPV/Wm5R
 rCrKZrUsPsV2gLXOL3ZbfJU2r74p2d7h/g==
X-Google-Smtp-Source: ABdhPJyWsm8Luydj8fwnA9bwa+dokwJOBc7lc1CVwCYSkQ+umc+PxvNH35fVlCfSexfzxZyPwiYxFw==
X-Received: by 2002:a17:90b:46d3:: with SMTP id
 jx19mr27550128pjb.31.1619997527014; 
 Sun, 02 May 2021 16:18:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/28] meson: Split out tcg/meson.build
Date: Sun,  2 May 2021 16:18:17 -0700
Message-Id: <20210502231844.1977630-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     |  8 +-------
 tcg/meson.build | 13 +++++++++++++
 2 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 tcg/meson.build

diff --git a/meson.build b/meson.build
index d8bb1ec5aa..f04565c5bb 100644
--- a/meson.build
+++ b/meson.build
@@ -1934,14 +1934,7 @@ common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
-  'tcg/optimize.c',
-  'tcg/tcg-common.c',
-  'tcg/tcg-op-gvec.c',
-  'tcg/tcg-op-vec.c',
-  'tcg/tcg-op.c',
-  'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
@@ -1971,6 +1964,7 @@ subdir('net')
 subdir('replay')
 subdir('semihosting')
 subdir('hw')
+subdir('tcg')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/tcg/meson.build b/tcg/meson.build
new file mode 100644
index 0000000000..84064a341e
--- /dev/null
+++ b/tcg/meson.build
@@ -0,0 +1,13 @@
+tcg_ss = ss.source_set()
+
+tcg_ss.add(files(
+  'optimize.c',
+  'tcg.c',
+  'tcg-common.c',
+  'tcg-op.c',
+  'tcg-op-gvec.c',
+  'tcg-op-vec.c',
+))
+tcg_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
+
+specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
-- 
2.25.1


