Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE539BE86
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:21:40 +0200 (CEST)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDVr-0003Ho-Un
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkt-00007q-Gi
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkf-0002D5-N2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so8286499wmk.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HF2MyB2aBKBLReV9F/D4V7kzFy2KuqmCJBZnZnN5/0=;
 b=JWn9SNFgYVkwm9qFq/ksZND+Q+z/XCqtk48kb3QP45cWyRSsmNqgqmsHUqttVuYsSe
 GLDs7ZsoewEUqx87JkjllAhteaaDzYlqbrdm2HYKXfNPG4/0YC0VmD7nnO+X2G7+BL0r
 eLKUCW8coqNhB3fbZn993pa21hz/mXbTTTxehLtXQ0rhpVXQU8LX0awYCbg/rYOLoXib
 ru8UftqTEIsFdFbAtIXjZQR5kTBLQaLmF18qU8RHN+sFSOgCrc5lcLPM+VBcir4cF1OJ
 QCSVxGT79Zwydj5v/K7b5GfZu2dBlQZIC1Zn8vZbYoMGGeG5qK6Pd8f+JXoXxZHOxjdp
 BNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HF2MyB2aBKBLReV9F/D4V7kzFy2KuqmCJBZnZnN5/0=;
 b=U1FamiIenaXQ8dD1LRhkBY/fvygukGbEpQfScfNkWfVrB5m5YHwtrwFr+ckYpFNB38
 sEU7MTeXrn0QAw76VEkVCnwpwsYxUppaPZGW4ckWVuDPozqble/hf9LcAaVQTVS/fEqW
 6Cer9rLF4Mc9PHQUYIazPxxFC2tzQRjcCa7Tm+1GY3qddFWQs0L9REXFkVjMFlcaiyec
 gKC53p2b/CiacOm7M0TRtRzWvJZ1GYyEv9Drt4tWd7wvnhA+BX/dSQgm852pEh4uZbpq
 NwJfmY+W1Ky8Alw585n81Xo7k3fH9MEZnlq5JkN1oYcERN5lIAnybwjqxm3pteXfj2HU
 osrQ==
X-Gm-Message-State: AOAM5338cFIw1UQnVOUdvxaZikUajUM6ADWp+gfA/bzTPDYWcKklSBeK
 iffF7r0x39f3HwLs5E0HWm2ewg==
X-Google-Smtp-Source: ABdhPJzlOqvd2yCmX9rj1EKu/hDCy4KqDY7vREHS4K8eOptVQ3tOi3B1Szy+ltFbBWknpSJL9WAK8A==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr4691118wmq.112.1622824372346; 
 Fri, 04 Jun 2021 09:32:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm7192329wrm.2.2021.06.04.09.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8E8E1FFCF;
 Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 57/99] target/arm: remove kvm include file for PSCI and
 arm-powerctl
Date: Fri,  4 Jun 2021 16:52:30 +0100
Message-Id: <20210604155312.15902-58-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

The QEMU PSCI implementation is not used for KVM,
we do not need the kvm constants header.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-powerctl.h | 2 --
 target/arm/psci.c         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
index 37c8a04f0a..35e048ce14 100644
--- a/target/arm/arm-powerctl.h
+++ b/target/arm/arm-powerctl.h
@@ -11,8 +11,6 @@
 #ifndef QEMU_ARM_POWERCTL_H
 #define QEMU_ARM_POWERCTL_H
 
-#include "kvm-consts.h"
-
 #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
 #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
 #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..800c4a55d8 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "kvm-consts.h"
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "internals.h"
-- 
2.20.1


