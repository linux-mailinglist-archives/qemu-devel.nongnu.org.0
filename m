Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3D5EA899
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:38:13 +0200 (CEST)
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpFM-0003JM-Qf
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKJ-00022A-D7
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKH-0005fO-5b
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id ay36so4546464wmb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PI0lzKVBNSGjEUI0jEXjRiLwo5dV6hN1IML/GBrLC6Y=;
 b=loBEqcBt2PNYeExZwPhAsE0NmiOkGgD5hTe4yKNpUZtD6IYaWU+8CtjQexetZrE5/i
 VHJMROOpBMYFL89CnyEvHOBEju6q4H0iPGKpZa3PyCUv5FZHLTmcekCDfV557FO+2Nmv
 scbsZc2psCZsu9QWOTU84uDZZHohmFTfbRwqCVeNo7oT4mks8ARcP1VpjfyfdWh8PDam
 Nb09uhNcbggyCR0d6+wjFGSCB43MizvL8yxg8F011FyoaR0f/asMHfzXWzwYqvacy6e4
 PshRAOVmwUVEEyjH2TP1XzAKkH0qiOVc+NUS1/HU8yMQ8UAY1HTClVX9MhPndsJqeUi+
 0qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PI0lzKVBNSGjEUI0jEXjRiLwo5dV6hN1IML/GBrLC6Y=;
 b=ZGMPAIQTW6DO37iqBZGG71VzJOyN+5fWaVRBPCko/NVVwV8etKVjrK7z0jYOcuHFrt
 kyEItHPM4D8ane5UMV4E8wUXRLoOJCBfMBA5PscVn7toHC33wVWyo3xPCV4VDzT+Iv3P
 5PVnASVkAlq9v07YOswWX7H+cDtKD2GX1WsCq/ZZjaKfsi7loq9GD57VmwGpL1iTvTOS
 IA9DOg0HF+SqPPm23SpPZ8WLDND7VTRypfGY3ZLwd23WNAEYObySbVhVOzX5N4FKVfiI
 bMXf/y8NeVlHCyhPliFXtpioCcHw1pidt2lsGiMJC/wKYE6PdwS6Zr/TIDUjyfeQZzFA
 bCSA==
X-Gm-Message-State: ACrzQf2oyqURja+XP3gYcT4+d2l4edWeOWxLsCx86eFKBcAYrLNmfMWW
 AHWEInj+OjDpIT81v4KeczLXxw==
X-Google-Smtp-Source: AMsMyM63Qz+OppKvFxOpZP2eQ4f5DfPgfSzF9K4hxy/Ivnz1khSKGOrraXcQXvuldmBZopbpSxiy6w==
X-Received: by 2002:a7b:c056:0:b0:3b4:e007:2050 with SMTP id
 u22-20020a7bc056000000b003b4e0072050mr22266153wmc.38.1664199551517; 
 Mon, 26 Sep 2022 06:39:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay16-20020a5d6f10000000b0022af70874a1sm18448548wrb.36.2022.09.26.06.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C73D1FFBF;
 Mon, 26 Sep 2022 14:39:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/11] configure: move detected gdb to TCG's config-host.mak
Date: Mon, 26 Sep 2022 14:39:00 +0100
Message-Id: <20220926133904.3297263-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When tests/tcg gained it's own config-host.mak we forgot to move the
GDB detection.

Fixes: 544f4a2578 (tests/tcg: isolate from QEMU's config-host.mak)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configure b/configure
index 0bbf9d28af..fce677bd4a 100755
--- a/configure
+++ b/configure
@@ -2481,6 +2481,8 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    else
+        gdb_bin=""
     fi
 fi
 
@@ -2565,6 +2567,11 @@ echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
 
+# versioned checked in the main config_host.mak above
+if test -n "$gdb_bin"; then
+    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+fi
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.34.1


