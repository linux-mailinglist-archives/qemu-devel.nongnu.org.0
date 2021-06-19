Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842DA3ADB63
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:37:24 +0200 (CEST)
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufqN-0006T6-Fd
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV0-0000xL-Tt
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:20 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUs-0002NI-IS
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y21so467595plb.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9tP7H9IMjyOF2K2LwMruR2nM1MsyWjxrSP/yzA7RVlo=;
 b=sRj8/bFnE5GbRSN8keRbpb64VAbChpQXCeVzHlZAmJGVvVVmw0MVPQubgh74BVxciR
 NupdFlOBnsJGxsTHkuYlwqjUWopm4nYGYhFOa96I3p03dlIJUgqolLGnNik5MGe0Rfo7
 Nrnp094r0r+pS7jJsJWiO8G0u55KKXiSI4ReDvNeYWIv7JIs1CeFgcUyOaRFPomqtR8p
 Q1DAmReiJ3Sek4t5oUaUfl4ehEDboIekaRNUo6MQbHfzqGwKSfjdR5BYtL0PiMhEIDn1
 1cYPODBHcVpmau+GPiTsWbZAp/L+SIsqa14BV/TlRnZERVC1FPJpgF6WA6mnVFTp7uCR
 jUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9tP7H9IMjyOF2K2LwMruR2nM1MsyWjxrSP/yzA7RVlo=;
 b=V5q1FC8u4TfTcF2SDUvkyvB12pCcd+jZLHJgYnb9aYQD6GtSZwVP5SMDB6v3+aKjsU
 U4lHW3ryOYNai3jq6Q2fWxLHukZN2RB4YPN9XfiiuJmMm9SlZBCaeKCjSew9Rw6HqTon
 Km+r7BGF46JvHKLu4UMH9qIBtuoe2aW9LHw0kdMJwdzZ8t2/R5yTfn87sKYnNRYAZXYg
 1F80DfABtnhJqGANUxD/9DhJ7Ut/mMad35yezg8wOs9AnOVQ8uvR4ZvQIYpDojVcaNmW
 oQvsKbKQcJpsn2IZLrslj9Vxl8BEBxC/ddbVVqGkh4RoxlpNj2S8UeF+hMCsO+iCmAc3
 1KAg==
X-Gm-Message-State: AOAM532WX0g/GJtfQ+8LtaYvs9XqVlopynY8lt6E7QPis9y0PfDHOOI+
 svtmJ3VJng9WWuOGoc0dVdQrIzNRfOT/hQ==
X-Google-Smtp-Source: ABdhPJwiYmkFSBCxfX+hA6wkNKamTF+aYf6axzXzHOoq06VO9rrfcWtkD2En5UHWfBJQVy1efXcEAA==
X-Received: by 2002:a17:902:b288:b029:f8:fb4f:f8d3 with SMTP id
 u8-20020a170902b288b02900f8fb4ff8d3mr10165757plr.25.1624126508594; 
 Sat, 19 Jun 2021 11:15:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] tests/tcg: Increase timeout for TCI
Date: Sat, 19 Jun 2021 11:14:46 -0700
Message-Id: <20210619181452.877683-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The longest test at the moment seems to be a (slower)
aarch64 host, for which test-mmap takes 64 seconds.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                 | 3 +++
 tests/tcg/Makefile.target | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 262ab71802..55b85e256d 100755
--- a/configure
+++ b/configure
@@ -5803,6 +5803,9 @@ fi
 if test "$optreset" = "yes" ; then
   echo "HAVE_OPTRESET=y" >> $config_host_mak
 fi
+if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
+  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
+fi
 if test "$fdatasync" = "yes" ; then
   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
 fi
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index b29fae4630..63cf1b2573 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -81,8 +81,10 @@ LDFLAGS=
 QEMU_OPTS=
 
 
-# If TCG debugging is enabled things are a lot slower
-ifeq ($(CONFIG_DEBUG_TCG),y)
+# If TCG debugging, or TCI is enabled things are a lot slower
+ifneq ($(CONFIG_TCG_INTERPRETER),)
+TIMEOUT=90
+else ifneq ($(CONFIG_DEBUG_TCG),)
 TIMEOUT=60
 else
 TIMEOUT=15
-- 
2.25.1


