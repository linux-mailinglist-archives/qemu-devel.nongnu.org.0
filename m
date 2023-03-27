Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762946CA56F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:19:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmkw-0006Tq-1c; Mon, 27 Mar 2023 09:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgmkn-0006M2-Iu
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:19:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgmkl-00068a-Rc
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:19:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r11so8753404wrr.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679923153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jckH08pqbcbbsLcUW/+VqUgPktbh3N/7nJ1YFZfolzs=;
 b=KG4P8opf65Nk8Oo8SUyC0S0j0IC0jBUfTHCH5hrjEfyPfH8gbTiiKCb4rMVYkQpM9e
 thOZASh69ckVIfCyLLPl/Pbp8qfM2oJuh42hOa+e8YhJeHeCplqpli9lcIe28QsPtLTz
 Lm+lxveYVXx77YXje1C8fMeDCdQ9R1SGivl8K9ffz8NGT+8G7XO3cVgmCr4AOo1oF841
 qWaViPgsN8BiMgr3n0xepig7JhrspA0LFVnn08qQbzQp2Y0wwTZ8AWPq5i+B9tMgruSf
 +V9n1kUi4SxDRYNJKnI9CfV/LNXjCQUX0WriRsgBnkzWq7/TOp7vUXhF0SMKSFB2oQuf
 5VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jckH08pqbcbbsLcUW/+VqUgPktbh3N/7nJ1YFZfolzs=;
 b=gQBOyOYbnIdU1hexcv4sgRZaV8UQdiOFP27L/0zUEfY5edu0Gv8sfmn/k8Kkt+GQwF
 WXoJhMpiSLRaE7wrfmA9eV25M+yPvrq6isYUlJV71VbFTwmVWU5ZMc7yriBJZqCCOGbf
 o5dDB0Q0Je63WWGKgdgnIU++styYr3/Eik6r399+fruSnHbq0md0rAnw3wbVi7uxASLG
 udivBLnGr2Ezf5N2GUfmjjiCnjkp36r17ZaxsHEZ/v0Ysyq9u+RbcRwcg/TUZMmgyORW
 sW5GIxViHj81tkQXyX4WHy/kJKQynNw4T52GOQwRplrUfk/KKf64PrnPcI/98QTftYVb
 rztA==
X-Gm-Message-State: AAQBX9d4gb4MH5nySvADD87R7nwoij5b/5ByXvrs1oeknf1dj9lvJqD4
 XTN1SzCGcIqdePPS2cgrOhTxWMrdYW2PHQlohxk=
X-Google-Smtp-Source: AKy350YZiTRuoBhacxVw788DpbyVQmpMN1fCMzmZRogCKyzBfU4ezTEbyKfpJmmGawd0fB/UMbYcTw==
X-Received: by 2002:adf:f807:0:b0:2cf:efa5:5322 with SMTP id
 s7-20020adff807000000b002cfefa55322mr12338076wrp.14.1679923153123; 
 Mon, 27 Mar 2023 06:19:13 -0700 (PDT)
Received: from localhost.localdomain
 (4be54-h02-176-184-9-157.dsl.sta.abo.bbox.fr. [176.184.9.157])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d6508000000b002cea299a575sm25161681wru.101.2023.03.27.06.19.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Mar 2023 06:19:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gregor Riepl <onitake@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Zach van Rijn <me@zv.io>
Subject: [PATCH-for-8.0] linux-user/sparc: Don't use 16-bit UIDs on SPARC V9
Date: Mon, 27 Mar 2023 15:19:10 +0200
Message-Id: <20230327131910.78564-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

The 64-bit SPARC V9 syscall ABI uses 32-bit UIDs. Only enable
the 16-bit UID wrappers for 32-bit SPARC (V7 and V8).

Possibly missed in commit 992f48a036 ("Support for 32 bit
ABI on 64 bit targets (only enabled Sparc64)").

Reported-by: Gregor Riepl <onitake@gmail.com>
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Tested-by: Zach van Rijn <me@zv.io>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 614a1cbc8e..cc37054cb5 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -61,7 +61,7 @@
 
 #if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
     || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
-    || defined(TARGET_SPARC) \
+    || (defined(TARGET_SPARC) && defined(TARGET_ABI32)) \
     || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
     /* 16 bit uid wrappers emulation */
 #define USE_UID16
-- 
2.38.1


