Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C46FF7DE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:57:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9b6-00024o-OY; Thu, 11 May 2023 12:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9b3-000243-Sk
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:56:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9ay-0001qw-Iw
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:56:51 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315735514so293366085e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683824205; x=1686416205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wFt47iAWfkAOg9Z4w+C8hP2TaBgxy/gspDnpan9Dm4s=;
 b=jcCVKVK9VwXcBkWm6yDOWYwQ7DBRLFHcqnLfupvykDvKmwEGYaCk9EQ7CgynyZTzZp
 JmlVO7WmBi5BygMyPWorajemtcMW8ywCmHD4EPJqx2jO7drdAUkIi7CwOVMiLvgRQPt2
 Kfm0p9AgBBYVPReebzQH26C1cdNtRd1zVQAqmbbrnof1TqS4VclyaZTsPJNv6cOSQ+vy
 ABkWH5Ylcw9OLfEofOrM34FE9gLfB5qq/gZ2SA5Y7HcQVqo5sIXSTomFiYiIgmBmifgo
 ZVCwmjUTlqxiRnMye3+ivKtoN5MvW3Zddoel3VEZoM3r9ZCQAuK9EYIRnw8WwqUG79Zx
 ZRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683824205; x=1686416205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wFt47iAWfkAOg9Z4w+C8hP2TaBgxy/gspDnpan9Dm4s=;
 b=Mok8/wiguboV9XYtBli6fbq7eNnO3fFyTVuTNR7aeBpVGjHn3IVhb48fH2Gl3rGKsu
 1YE/nB/PI38oIqywc+FjKI56HZGKFtUtumHU3HZyClxo4tbCeMwbm+IsDB79Z4asrQqy
 4TyipEvSJ+RvV9C83DhdnEw1FcwIkCL9hGbM/TPVbG1l42NcbsySn5EgGP2qjXdQzN4N
 IQ6GaYqZ3V5cJZE96pMYQnrDmRQ+E1th6Zr518va7mhIvAIOz5LJMOUQ949C/2vLhZ2/
 Hboj+uTs+QCY3YcYivF8PYBqzhGrg5IKL+A4yKeNQzSaeqevp7RlRVYb4Y+/+1JXtFja
 fSlA==
X-Gm-Message-State: AC+VfDz7PfsBg0HRGT9wy8Iq5w9KTB43ai1/43xH5zoIaS9mFH5j3bZY
 XjIKdOQbcoPeVcTBK/g1Izp4ig==
X-Google-Smtp-Source: ACHHUZ5wDuMCl0V1bfbv60kH1pJyaXW1UwavusJMctB3/YXGJKw9bZjEg5ZoKA+QZ04Wd2+jSnKuew==
X-Received: by 2002:a05:600c:3b04:b0:3f4:2736:b5e6 with SMTP id
 m4-20020a05600c3b0400b003f42736b5e6mr8758113wms.14.1683824205191; 
 Thu, 11 May 2023 09:56:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a5d508b000000b00307a86a4bcesm7652769wrt.35.2023.05.11.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:56:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B0E11FFBB;
 Thu, 11 May 2023 17:56:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH] Makefile: include gtags in UNCHECKED_GOALS
Date: Thu, 11 May 2023 17:56:40 +0100
Message-Id: <20230511165640.1862868-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is the mechanism we use to avoid defaulting to a build dir when
we don't need to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e421f8a1f4..c566aeb418 100644
--- a/Makefile
+++ b/Makefile
@@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
 quiet-@ = $(if $(V),,@)
 quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 
-UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
+UNCHECKED_GOALS := %clean TAGS cscope ctags gtags dist \
     help check-help print-% \
     docker docker-% vm-help vm-test vm-build-%
 
-- 
2.39.2


