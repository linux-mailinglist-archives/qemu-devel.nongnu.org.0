Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA2312955
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:29:00 +0100 (CET)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xER-0002B2-EH
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSr-0003Hs-5L
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:49 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSp-0006GO-7U
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:48 -0500
Received: by mail-pf1-x429.google.com with SMTP id t29so8740928pfg.11
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzll/P0wtV+vx8SpfL7JfV6f6jbtOfqckGjdgSv5tbQ=;
 b=QCIVrdZt8v+LF+wkl5axc4RGmnZhZR7gaq65Ufj8qI+SRWi809WK/1ldmcTyN0HE7Z
 fb8sxrZxJWHCI5cjQnT+ltaQfhjbgIrRwc6HGmDtTbb2H+r76/V8sffD6D4QINCfhxzl
 JEdPBiD869ezHA4v0vwM7lOy1gMQvm0yQuvrYgFlP4bf39a6Ft68F4KeWYzo96VYU7LJ
 FkM/hFySFmHMo6nCszMWFuaE84oK/HM6NUZDPOOPBYGn3DV5UZmGBMU2u34i5f37bKDE
 Lx/wyiNE8KwrKmaf+4aGJlIjAWYQnk6jXvVUdvpF7g/7yY3tGCBMZYhlUAJbL7wQnSax
 WC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzll/P0wtV+vx8SpfL7JfV6f6jbtOfqckGjdgSv5tbQ=;
 b=AiEStRkTbiPG+OVjYKPjZ5gjekd/xjAvQ1SOr+C2fbOTOg+UM+j5Dp5qKHPQnC4ANj
 QELy3YLJohqae5Xp9+E1KSGvY+Mnyg1iSdHaQF/7la0zUZD0mxAusxJ8OCEV8XKx3tsI
 xpLAA8bcyN5ZaXiCgzlp11tkwo2TdU+dJyIwjiAAovohZaEw3bcbyqmxzzPWkXP/Oq/z
 xQrnZTccRYCIHvgkK+dlKoVoSrCXfXXIHt/oUaBq/cCcXMggxQouckDcXbLb5sXGyQyQ
 X8wfbEGfUOwzXDXnBmDQ5/lDEV+1WcquQczSL/k0b85aYoKbTnZ0Zx0s2Oo7cEzljBAn
 5qxw==
X-Gm-Message-State: AOAM5302I/XgWGIqZ3elDPPuno/N7F2hBDHEQz+/tvY6ZrVoshgbT0AX
 t9jWEPyF6xmQRyw3AQcmizqRZi0TNf1VqA==
X-Google-Smtp-Source: ABdhPJyD0aHbyOm3uv+Bh3Zs0icSFidg/DGOAjwWKaGBAsnYozjMjA5cNX0VQ2oJDT/ah3IUsagd+A==
X-Received: by 2002:a63:e10b:: with SMTP id z11mr14919554pgh.40.1612751985974; 
 Sun, 07 Feb 2021 18:39:45 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 69/70] tests/tcg: Increase timeout for TCI
Date: Sun,  7 Feb 2021 18:37:51 -0800
Message-Id: <20210208023752.270606-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The longest test at the moment seems to be a (slower)
aarch64 host, for which test-mmap takes 64 seconds.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                 | 3 +++
 tests/tcg/Makefile.target | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index a34f91171d..53d0a32bc7 100755
--- a/configure
+++ b/configure
@@ -5790,6 +5790,9 @@ fi
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
index 24d75a5801..fa5813192a 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -77,8 +77,10 @@ LDFLAGS=
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


