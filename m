Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2186A439F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5P-0004Q0-Vx; Mon, 27 Feb 2023 09:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5H-0003cA-OW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5F-0007jz-Vy
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3887387wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lxxzLsd3yF3kfI56WcuQb5ERK6fyn4U1SAh24VP+mo4=;
 b=SokdXwTgz0uwQy66TiLT20ejeTrSXUtyvxtc5MmnLDSnKiOYR+xhgwvZq4q8NaZgXt
 SpwJsbzhFPlb4bjqD+ZWXLYFfD5Mlz6YUByvkC2YAj0gRx/yzR9+eiF3BWC6xJ2fbT4k
 6r654/njrolo8DC4drQbI6qJIOstirJJq5A8eZK1LSU1rgSKXlZhM32HxkGDX1/n1wEs
 kkstsO/P/AjG3ILDvEw09xDdQaKDdhwpEY/QjYrfRH3Dq6W0kJgI8TrJ8C5BBw0H+1PU
 aeJbCRlQIv9xUte0fXkMhcAcwqQs2Ujac3Uk0D8f9sNqqPMGes06pkllNQts91r0dvdL
 d6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxxzLsd3yF3kfI56WcuQb5ERK6fyn4U1SAh24VP+mo4=;
 b=qV4/BbN7EzHpkOgWJfxxHq/W4Akg4CvNeve4RqL0viqnJK7ArBn8T7VqxtlPuXzAEg
 hTydd87+q6INNIjeourJID632sbRpGGzalzM2MSxHO/cXXpOLDRkXDQ/mwpCvajuyRJ9
 5eeK1TLNER8GK4hCezqoB/VQUcaQe8pw7qeS9fWza4rFdW6+Buje263+6V8Jbpb20CsU
 pP8sBZRLH5XkmUc566uivyYjW6aK/EsjPYxUKw74p12jzp+MWyS4vVSrEX8gCgJ0t1fc
 0wM0krHihfmu3SM08xYgDm2hYIHxJVxP1QYopGVeRyJ7eQfhR3s59uJ48Mj3IBnUuXnK
 ef0Q==
X-Gm-Message-State: AO0yUKXkqj76/GrHn9G0w1QZPQcLlfSLodHcT6Ynh0Qa4pC+Pn6f7y+u
 Ej4I90tYr+ugHgiUIh59vzyYYfF7SxzwdmHR
X-Google-Smtp-Source: AK7set8q61SGYf+0nRDC0Ol8mvA0/4+jl8T+X574+wJVhTx+AAv6fXkfZ03rzvLGyHy/clJFRGpItg==
X-Received: by 2002:a05:600c:4e41:b0:3eb:25ff:3446 with SMTP id
 e1-20020a05600c4e4100b003eb25ff3446mr8484657wmq.4.1677506548129; 
 Mon, 27 Feb 2023 06:02:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a1c544d000000b003e208cec49bsm19265602wmi.3.2023.02.27.06.02.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 012/126] target/alpha: Remove obsolete STATUS document
Date: Mon, 27 Feb 2023 15:00:19 +0100
Message-Id: <20230227140213.35084-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Likely out of sync: last update is from 2008
(commit d1412eb240), 12 years ago.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221217172907.8364-2-philmd@linaro.org>
---
 target/alpha/STATUS | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 target/alpha/STATUS

diff --git a/target/alpha/STATUS b/target/alpha/STATUS
deleted file mode 100644
index 6c9744569e..0000000000
--- a/target/alpha/STATUS
+++ /dev/null
@@ -1,28 +0,0 @@
-(to be completed)
-
-Alpha emulation structure:
-cpu.h           : CPU definitions globally exported
-exec.h          : CPU definitions used only for translated code execution
-helper.c        : helpers that can be called either by the translated code
-                  or the QEMU core, including the exception handler.
-op_helper.c     : helpers that can be called only from TCG
-helper.h        : TCG helpers prototypes
-translate.c     : Alpha instructions to micro-operations translator
-
-Code translator status:
-The Alpha CPU instruction emulation should be quite complete with the
-limitation that the VAX floating-point load and stores are not tested.
-The 4 MMU modes are implemented.
-
-Linux user mode emulation status:
-a few programs start to run. Most crash at a certain point, dereferencing a
-NULL pointer. It seems that the UNIQUE register is not initialized properly.
-It may appear that old executables, not relying on TLS support, run but
-this is to be proved...
-
-Full system emulation status:
-* Alpha PALCode emulation is in a very early stage and is not sufficient
-  to run any real OS. The alpha-softmmu target is not enabled for now.
-* no hardware platform description is implemented
-* there might be problems in the Alpha PALCode dedicated instructions
-  that would prevent to use a native PALCode image.
-- 
2.38.1


