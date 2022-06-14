Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29854A349
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:53:50 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0uoX-0004MU-Bs
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udM-0008Lc-7y
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udI-00051k-LO
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id z9so3813520wmf.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTYvOPYimtqM/KUU0VaNRoqw7uwfKMsI3e1IclJoUjg=;
 b=hwg/LMkd26RImHJJSmAtPVmYbTnkPwAQtrjyISyJ5335zUkTx+tT+X5m75UGsQr8QI
 HbaXTmcoQv7Q2qK0M+YK+LFKmoLswwMBg1pkNbIJpUe291X5wwX2SbzktuF2Q12Sy0MV
 W9W/J5St8iNIRYeaeReAomEZsx4RubVTPOFCBkgXfSmuLM14foRn2ib+2V/bD9I0XSei
 L7S9gPFnZmhbaF8CJHUfb1UmR84gpv2NDAC+gzemwT+A6FRM8S4rf2/02kHfZ09t1yey
 X284vOj6pn6zoIN7+RoAenqgeYD115hcteZ+TZv9CSxoFe6ySDnXqDiQZWgqNQAxU/o5
 MT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTYvOPYimtqM/KUU0VaNRoqw7uwfKMsI3e1IclJoUjg=;
 b=dvM7RTSZdvNAVGsfrMD8zKSFNgoUHnoUHUm9F1xqn+rRh1CqHOXHlN89rwG5NUvrZU
 N9vkM54LLAtjxNLe8v+FV7JLGbfGLFyer7Qm6e0aLd1jQ3Ev0fUD6OvuvUljX4QDvls2
 7XYUpUpYt1f0I/ZgSIDjONWM6qDxKLBp1Sk0eP02QWHcHrYbP4YluQ5qFquG/x0/Rvfz
 lC6ebfGGwB4j2DrIP+D4CgSlf+bJdaK3T4tj8wvt93I7eTZcNoM64MkhkGGBlDcCDi3W
 aYo1gV6HfNTSWhXKnoRQm8FbvafxmUEZwKOjrlWUbV7EemcCyCLgpcT8O9LTUQ1s6zqH
 pMDQ==
X-Gm-Message-State: AOAM530SdCqTSN+wuFs5MEXnmPYPjpwEksXM1M89T3LNEUiAlfMaznec
 Ep+fIj7Q518OVwRAJmLeFFKouA==
X-Google-Smtp-Source: ABdhPJx+isTZ/Y7P31G9tenK37jyGTWqiQ2tkAaK80yZoZy2PNShv9n78P+J8bKue58ciT7uUGlK6Q==
X-Received: by 2002:a05:600c:4fd0:b0:39c:6565:31a5 with SMTP id
 o16-20020a05600c4fd000b0039c656531a5mr1360456wmq.60.1655167331252; 
 Mon, 13 Jun 2022 17:42:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c2cac00b003942a244f40sm16096213wmc.25.2022.06.13.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A1361FFB8;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 1/7] test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
Date: Tue, 14 Jun 2022 01:42:03 +0100
Message-Id: <20220614004209.1970284-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220604032713.174976-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220613171258.1905715-2-alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 3fe237ba39..7df88ddea8 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -20,7 +20,7 @@ LDFLAGS+=-nostdlib -N -static
 
 # Specific Test Rules
 
-test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
+test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
 run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
-- 
2.30.2


