Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE70C65E978
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNzm-00083b-Nn; Thu, 05 Jan 2023 06:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyy-0007qG-RO
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:48 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyu-0006IA-N8
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id ja17so27723943wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vl2bKvdlhUQu+78u9aV3x3sYRwtJe9J/MBR+ONrqiEM=;
 b=l1zJCxXfV2Wk42zQ/QVbKYOwJiPRlwkeopjdYgmJmZgjAteotMWEfKu/NzF1PoRGy0
 OhfbOV8qtIXmVlBUzyOeZ7EBdZKHjzPWXsuceZl2//J4PL+4PSIlMaLqFYs5uplMnodE
 soxv5sojx66+8eue87/k5JGz2SGxEq35tWFe9zFL3PYTgaIx+y16Icxoa6ngKjqtMlxv
 nO7XNbaMI1Xa717/6KdhkS5SemLjVV/Q+YZRFS0LAZc7f8oly2XUYuIRYcCH4w5MHsiY
 Qz7esmllicq5Zl7/QCjYwrePLZfpQWUQ/yQi25leHC3M9MMzFuKQPWsUwAvoxMrNEReL
 4f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vl2bKvdlhUQu+78u9aV3x3sYRwtJe9J/MBR+ONrqiEM=;
 b=YPRjB3cFeBTYJqwxyamit7q7sn+sifBah3em/MwvJKlL/gKhFXHbw48gQZObVucDNR
 bONxlou2rIUZNKHhQNKOpVmOwReYUjpT2x0oVSrrhjM+LV+4ulQ0T6/b+SX6tvNOOBEG
 Xg6r8DdedXLKHgVaa3FqRkTGxE8jtSPCiVXhUY46uH/3rk0RYwOubfErRaIsBQea8/52
 1/fBfAq8Ru0o7KalrlIFMQWSk+0gDp3s0JqQFJbIytZcobUquDZUJi8GtdvFs/DePwBk
 YNSmJNDR7cPLuRUAHt4VguyhV5oHOKL8YJuCZo6axJqCXqbf+ABBEOUAc8k3sNO9ojLP
 vmxw==
X-Gm-Message-State: AFqh2kpmjK5bx/8vzGGvUIFq9d+svhJAXEiq2OF6hZjKeiIm1oosoqpv
 X9thWz0azz1Z66kun7jJPScp6g==
X-Google-Smtp-Source: AMrXdXuY1DAFjzwZgeVWoal7CEf5swEhe2IL7CoiDmHlgMhn/JOC0dMVBFt/oiWhKv1lG7GLO593pg==
X-Received: by 2002:a05:600c:3caa:b0:3d9:cb4c:af5a with SMTP id
 bg42-20020a05600c3caa00b003d9cb4caf5amr4058579wmb.33.1672916409680; 
 Thu, 05 Jan 2023 03:00:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003d1d5a83b2esm2274566wmq.35.2023.01.05.03.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:00:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A763C1FFBB;
 Thu,  5 Jan 2023 11:00:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/4] Makefile: simplify path to QEMU binaries
Date: Thu,  5 Jan 2023 11:00:06 +0000
Message-Id: <20230105110007.1977399-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105110007.1977399-1-alex.bennee@linaro.org>
References: <20230105110007.1977399-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

We've had the new build layout for a while now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 7b9a5f4..6905b8d 100644
--- a/Makefile
+++ b/Makefile
@@ -61,10 +61,10 @@ ifdef TIMEOUT
 SYSTIMEOUT := timeout --foreground 10s
 endif
 
-QEMU_ARM = $(QEMU_BUILDDIR)/arm-linux-user/qemu-arm $(USRGDB)
-QEMU_AARCH64 = $(QEMU_BUILDDIR)/aarch64-linux-user/qemu-aarch64 $(USRGDB)
-QEMU_SYSTEM_ARM = $(SYSTIMEOUT) $(QEMU_BUILDDIR)/arm-softmmu/qemu-system-arm $(SYSGDB)
-QEMU_SYSTEM_AARCH64 = $(SYSTIMEOUT) $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aarch64 $(SYSGDB)
+QEMU_ARM = $(QEMU_BUILDDIR)/qemu-arm $(USRGDB)
+QEMU_AARCH64 = $(QEMU_BUILDDIR)/qemu-aarch64 $(USRGDB)
+QEMU_SYSTEM_ARM = $(SYSTIMEOUT) $(QEMU_BUILDDIR)/qemu-system-arm $(SYSGDB)
+QEMU_SYSTEM_AARCH64 = $(SYSTIMEOUT) $(QEMU_BUILDDIR)/qemu-system-aarch64 $(SYSGDB)
 
 all: usertest-a32 usertest-a64 usertest-t32 \
 	systest-a32.axf systest-t32.axf \
-- 
2.34.1


