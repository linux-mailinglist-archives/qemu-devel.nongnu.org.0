Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9B03AD2E5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:32:28 +0200 (CEST)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKE7-0004RG-4h
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBm-0001WY-Ik
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:02 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBf-0001Qa-Sc
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id v12so5196280plo.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xc89iOQ6Z9A7jmI+2EVW1gXxkL96LTZi3hKVzfLFP0A=;
 b=PmixQGL27Pxfz3A6w5dAYzho9T5gEWLniESYkDMaxFolfWLUDVGboa5mn0NuCZBSk7
 yYhM+Cf08JMP+4SqQdyLIoqERrYSENEZYmpPZDAMcAeFp6Ca2WJPpe6GT+xtlIjXGBx5
 bIeAKiQPIiEFSjfLpilGpc7SrBe7lz/Wn9stiQrdVXHaC1J5uXrtlVLzmdWf6fQ3MPov
 y40gKs2IZovY93iqFEzxLJk4fnY17Fr5AfPK6tVkjeE2Ns7QET4MlZjFjSPnWYGQ4H+T
 f7Vopma8RPtaFxuuDMJuwWHTQDlW6sczI2UJ0A5jOobZ90r+fMdfF8A/rWC59IQ9y/iB
 kt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xc89iOQ6Z9A7jmI+2EVW1gXxkL96LTZi3hKVzfLFP0A=;
 b=qti8bhiEaTaUOGCBSfMgkHV0VvvGeDc4widOPY1ybo5ss6huSJ7XSO/pbKyYW/CuI/
 +6LFXg9ysot/JG+2c00dB6g4yAGyMc98JtRdzUCqDKkyrGveABQey3KsbytQI8vpva/y
 WHwPBG7uby0Gx6cRCxs2YV3jNDwZuxn287e66BEb5qc7C+yl7POt5OnPYVsch8VHFmZm
 dkT6W9CDQvuE9dPOg0KFqjQ9n6UCCJnTCqZe14y+o734Tm/r8nGvczeF2bWpko3qjIRX
 AA5VhLam7y1uDkdbwADQX8TyngLaVga5kPFhlxzNMKFRb/xNvEoLJQ1iQpPB1WJkuuDN
 qfqg==
X-Gm-Message-State: AOAM533deGsPZVGbFmS3Zc9o8n2O78Z1IFroFLcIi2I51A79mhiOElrn
 bGqrXMOBGVu4JZmHu7L554VkIqXvAhT0Yw==
X-Google-Smtp-Source: ABdhPJwzgCU0eb6qiL8x/wJBYfMVU6g/VQDpTlJlJ5hGV576UARtXC55f079tApajlq1uPHU0h99FA==
X-Received: by 2002:a17:90b:1bc6:: with SMTP id
 oa6mr6085300pjb.36.1624044594623; 
 Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/23] linux-user/arm: Force v2 frames for fdpic
Date: Fri, 18 Jun 2021 12:29:32 -0700
Message-Id: <20210618192951.125651-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value of get_os_release may be controlled by a command
line option.  Since fdpic was added in v4.14, and v2 frame
were added in v2.6.12, this makes no change under normal conditions.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index cb65623965..2d30345fc2 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -167,7 +167,14 @@ static inline int valid_user_regs(CPUARMState *regs)
 
 static bool v2_frame(void)
 {
-    return get_osversion() >= 0x020612;
+    /*
+     * We do not create fdpic trampolines for v1 frames.
+     * Thus we force v2 frames, regardless of what uname says.
+     * Support for fdpic dates from Linux 4.14, so this is not
+     * really a behaviour change.
+     */
+    int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
+    return is_fdpic || get_osversion() >= 0x020612;
 }
 
 static void
-- 
2.25.1


