Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A553AC7F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:11:27 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSoY-000116-6T
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj6-0000rx-UH
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:51 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj5-0004x0-Cx
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:48 -0400
Received: by mail-ej1-x634.google.com with SMTP id fu3so3885613ejc.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QBVk9BlGsjPeQ1A/asALKwEg/h8wn3ZSor/zRm2l0pY=;
 b=kboRYuQnFLkWTTKJy91wyaYCKhHv68Avme1dv/ZSG1RnYjJmzN53PQh5vBbjjGn1X4
 A/ksk4I/FmNoO8zoG0dZVDejp6Wosx2+736/vLNV3ZwNjkUkV/WjFUGRYPxTIGr3z/bW
 v4QVBOwOaK9qSCKxibvsfj66pdDHnq8xnJ++VQQWyrDjdRVFBIPG4BdVvAnLkjnZUkzx
 xukBaqv4CXiCd6uUmAobNBjPBdR66/OuSJe/MItuKrIjWx2l8F9wRNUXfvwatz9nCdxd
 r4EFsSUBo/dRozNTBMjlb7lDDEcG5w6vzBTR/VKKi6rSFxNplS+H+/XARaUGs+/Fp1JI
 4u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QBVk9BlGsjPeQ1A/asALKwEg/h8wn3ZSor/zRm2l0pY=;
 b=Yz0SS9/gRb2FhFyzDpEz2hqFq0WgqH74eUQ1LB2Im9x5ovATgkxu+1S8JmSWMQiOox
 0xY1jmn+h0YTxb8NKgC0/s9gHLGJHklfbIVbFA/Qu4YAp688uZ58/O3gHYN/872o34Em
 8Kr6pcSD+0v5EWdQmTlxIVFAjHa3KgSOgLgS8jrL6KXKBXt65394zH4pU8e+z7Y0V9it
 Sfa4dartihiUV5V6/wV9oBt+aGiLL56npJnbseimuu+fQCBGt1Va1Hn2tQBbNDPyB7Fe
 XBlgRXwfaHliOZprrAWHIwXGqFK+7Tqy1eJfpeVZsQir5+4Hva/3nH2lzTrk/MEwHZIE
 HkGg==
X-Gm-Message-State: AOAM532ktDyg9SMMPlPviJTL9T+UUiOXsTokWmL5prXTiPHokwZus7Vi
 SnjSkuKkGVMbJr7wuQEO40JaIHvD8gzgxw==
X-Google-Smtp-Source: ABdhPJwEPaGw1XV9BqVOKOLGY7tfjRHTFJQ0EMds/G9grMuZHWb2EZEaAPQeZ9TznHEC4DQEvq0E2g==
X-Received: by 2002:a17:907:6e88:b0:707:ea6b:5e15 with SMTP id
 sh8-20020a1709076e8800b00707ea6b5e15mr680117ejc.57.1654106745671; 
 Wed, 01 Jun 2022 11:05:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056402150300b0042dd3bf1403sm1271778edw.54.2022.06.01.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CE711FFBC;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 04/33] meson.build: fix summary display of test compilers
Date: Wed,  1 Jun 2022 19:05:08 +0100
Message-Id: <20220601180537.2329566-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The recent refactoring of configure.sh dropped a number of variables
we relied on for printing out information. Make it simpler.

Fixes: eebf199c09 (tests/tcg: invoke Makefile.target directly from QEMU's makefile)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220527153603.887929-5-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index bf318d9cbb..bc6234c85e 100644
--- a/meson.build
+++ b/meson.build
@@ -3735,12 +3735,8 @@ foreach target: target_dirs
     config_cross_tcg = keyval.load(tcg_mak)
     target = config_cross_tcg['TARGET_NAME']
     compiler = ''
-    if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
-      summary_info += {target + ' tests': config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
-                                          ' via ' + config_cross_tcg['DOCKER_IMAGE']}
-    elif 'CROSS_CC_GUEST' in config_cross_tcg
-      summary_info += {target + ' tests'
-                                : config_cross_tcg['CROSS_CC_GUEST'] }
+    if 'CC' in config_cross_tcg
+      summary_info += {target + ' tests': config_cross_tcg['CC']}
     endif
    endif
 endforeach
-- 
2.30.2


