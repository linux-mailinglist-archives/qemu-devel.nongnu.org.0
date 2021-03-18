Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE52340CBD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:17:53 +0100 (CET)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxDV-000170-2E
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlD-0006Xe-3P
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008Dd-9s
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j18so6468640wra.2
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJHl0X2rAu/7uON+ZeOo5+qFY2A3sY0ecP0qtxDZcW8=;
 b=yLlrJrRAedV5hgbhi6UIom6JLGOrjmONWPF+Ax66V8c33E8dUDrc9fjRsTMOI07JXd
 kiBXaIMZYaE/gFY8J7oXZF4Bi6C+D9Bhz86grKhYJvcFwEPSPlC3ymXtsHy/dxJ019VG
 WoBRjblTn5rBWwDPXv09m10IzRk94tHHn8k/6AnkCfyYjA2r9n7NpA9PnPGQ8Fsy9CJT
 1/R5aP1lXksFwf4qTtePvib1oLB0MNCIUyV4n2xsnxgjXhMRXQcaY8y+s+ltN54FkbsZ
 teelKmUSGRIFDRMcKyklX40hOuq/DqOIdTz1bldwbprriXn7I5FyPYJJ8+BSMnRLcETk
 1Sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJHl0X2rAu/7uON+ZeOo5+qFY2A3sY0ecP0qtxDZcW8=;
 b=ow7YMuO5xxdhMy5fpYZzmRBDVWsNvrfHDU59evWXkdCiTXjAkWDJLyDiZISJjizVls
 JuTUcAxmJFtWcS+yOucv6FZ3gTRGxhC6LAXitbJoKswga1H+2LrC+2ENglxoCM6kP1By
 Hn8Lwab0Yjkvf7DJSuLgRjAY9L3PrYBXQPe2x6Vdny5U4XudOb55AmEUj0osFRVA6BC2
 GC8QEzjgHtiHVzx6xwvG9Yc8AGS3SaHrFcfZZpJY7ovvrPxqr/d13OssK46TZAcYtSeO
 R9d4n8F4hC5C6fuePq/JJH8VPW9XZwxrZoCEmK6ycfaPR7c7vh8f+G6AehJViPFak0e9
 4iqg==
X-Gm-Message-State: AOAM533oSlO7IycISXtpdob5bCeyDpDxaiE7j5b5pDbP+DhDK8xuWwlO
 7qYudJFc4WgC5VjxCIbfaq2i1Q==
X-Google-Smtp-Source: ABdhPJwNGs6Sj6+Ha40W5CxmmglfdI/Uf6MGSImwl7uHh/S7Yzh3FxIBHVxU9S8QdOTn2DtUx1yxtA==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr439066wrs.83.1616089710591;
 Thu, 18 Mar 2021 10:48:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 5/5] target/arm: Make M-profile VTOR loads on reset
 handle memory aliasing
Date: Thu, 18 Mar 2021 17:48:23 +0000
Message-Id: <20210318174823.18066-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318174823.18066-1-peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Arm M-profile CPUs, on reset the CPU must load its initial PC and
SP from a vector table in guest memory.  Because we can't guarantee
reset ordering, we have to handle the possibility that the ROM blob
loader's reset function has not yet run when the CPU resets, in which
case the data in an ELF file specified by the user won't be in guest
memory to be read yet.

We work around the reset ordering problem by checking whether the ROM
blob loader has any data for the address where the vector table is,
using rom_ptr().  Unfortunately this does not handle the possibility
of memory aliasing.  For many M-profile boards, memory can be
accessed via multiple possible physical addresses; if the board has
the vector table at address X but the user's ELF file loads data via
a different address Y which is an alias to the same underlying guest
RAM then rom_ptr() will not find it.

Use the new rom_ptr_for_as() function, which deals with memory
aliasing when locating a relevant ROM blob.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408c..0dd623e5909 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -331,7 +331,7 @@ static void arm_cpu_reset(DeviceState *dev)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr(vecbase, 8);
+        rom = rom_ptr_for_as(s->as, vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
-- 
2.20.1


