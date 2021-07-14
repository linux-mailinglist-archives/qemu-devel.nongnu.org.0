Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCB3C8738
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:17:56 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ge3-0002pU-Ay
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUo-0006LM-DK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUm-0003wK-J1
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso1643021wmj.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYjpqfSEzxq/cYdDqk2TnBut/PBRcqLRysFivAHVebY=;
 b=orlj4CCFwNNOWkqmFe1h7C38dsLDLBaPJwMq8vvMJWolsPW39awAknUYwHBT71sM8O
 Ql2ZCwDSWKJrGNYQqZkxOqoe3LsZo3gQrAw4aD0SR494TOq0cZcDFHFyBA4MXmEzlaja
 MGWuragpllRMy7oEm/HsBwR/xmENUEI0S5EKgGaaeO1CDEmCmNPB4gdfATdyDcGthmJi
 po/InI51u/OjVCmEosAvl1pnZuakWPtrI4/pOtXQXy5wpL6c+Nst/3WqFkXNCu53oxdP
 ZWOLA5C+RWJnAJdujRhfAN3DI48OTPZ/kB9aA/9qzRcfIPYqsTViTOvjvWkq35PEUjZN
 RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYjpqfSEzxq/cYdDqk2TnBut/PBRcqLRysFivAHVebY=;
 b=KnupkqH0qmj+/kRix2hLiAb3ieYG+08YizAzUFgfPQ7+gcmEVngE9BI6xQER1cnIsj
 Q+raGRHzDqsLoNNLA/Y5fhW4m+9jVQe3s0kx7fNg1MYl8jMF+qUqDE9/6sWbJRAH+Ned
 PJy32DLfFVUDkvb00VxzP0fZ/9O8UeqVSZeqLxREqtaazdDkuALB3J22O5LKA49zOkHf
 NABuQM9VhWVW7iRtJ0MZ5Gxwdxl/Shokye+cPMIpiYw0XMulzWv81x/JaHxLZSosjPKF
 pDwshv+Z2xMsyTRJ9U5eM3bl7deHkG5nh0X7UCzkm/dmfu/6QsjC+SqODzznny4uK3se
 X/Og==
X-Gm-Message-State: AOAM530varPWHCk1F+TA8zYDx0IjiE5MN6IhgzUi42yaszuLxie+agEv
 PusLEj1kvpiNyXR5kDjmI8CASw==
X-Google-Smtp-Source: ABdhPJwo+s5DO1Uq0Ngl28hK9S09fTuR8vlLbMnhp/XLjoBIhcxd/DVZFr75EZaucHi/vMDoZ6HUqw==
X-Received: by 2002:a7b:c1cd:: with SMTP id a13mr10968194wmj.94.1626275298548; 
 Wed, 14 Jul 2021 08:08:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm3075086wrq.10.2021.07.14.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 049C61FFB7;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 30/44] meson.build: move TCG plugin summary output
Date: Wed, 14 Jul 2021 16:00:22 +0100
Message-Id: <20210714150036.21060-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's put it with the rest of the TCG related output with the
accelerator.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-29-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 89c09ed7ea..c6dd70c400 100644
--- a/meson.build
+++ b/meson.build
@@ -2833,7 +2833,6 @@ summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
 endif
-summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 if have_system
   summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
@@ -2949,6 +2948,7 @@ if config_all.has_key('CONFIG_TCG')
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
+  summary_info += {'TCG plugins': config_host.has_key('CONFIG_PLUGIN')}
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
-- 
2.20.1


