Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3939BF98
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:28:24 +0200 (CEST)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEYR-0008FO-Gm
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpETA-0001Lk-MU
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET4-0000QQ-5O
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id u7so4751527wrs.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pO+1XQtifTxu7QLeU1fB8+5lGSSsnzVhaAsD9VqsQLM=;
 b=hDzhEkN9l5IAgwG6XCIfkza7/Ukj1IimO84reBGPbqru067srecpjGqotATAonFgcd
 /MCE5OTwRgWScvqQeIhTiD5DimX3fVHlXPBEyTJ5r/Qm+loxUj5zQWqiS7j9+ODpliT6
 f1GaA5ByzbM/N/ENR0VJ80DQO4lzI7vNyQgbCqV7Ou1rOZ0nd8s6uXqaISM2KqITV+9f
 GrG5vE2DDoxfrI/0qXt5uDH1SqZw1idC1KeWWPvy9wB0+Uu6tLqVclltQPO8L01xgscz
 oJWlp2bVQEFAHMvkHynRCrep1udfBexqPwGZttqq6fu/Pif7YaprXLaTbjWNfaF+Ii+D
 nhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pO+1XQtifTxu7QLeU1fB8+5lGSSsnzVhaAsD9VqsQLM=;
 b=QTA+7paUJaC5byZ/lf/eyoPUC8Rl1LH8/rwy0JxywY4Pcs/QfmCL1DhTepdlvQUave
 i4q+rhbr3hB2BN8/AJuId08dJmjQI+J+HiA+IK5QPVq/ogd0CCjaRNwshTSH8jidNq/m
 uCyKII4yhoBQufUB5xAYB/gim0r0fmlbcrdSrRtTDk02vXDr22P1fHBmjOzPtU/BJHi8
 gTWkaBx+9moeyQ5wIOKPqSPtIqsFlXLxXPCzB8NUS4ixVBJfXNxEozmPlJmoqtDPWkR6
 72/vjxo6xfFdxdwjto2r+izr1qazU0gBKt13/U+7WyAX3MjDMP6U2OEWRDEHFBw8zCJJ
 VH0A==
X-Gm-Message-State: AOAM532gxe/OaenxPcOnGARcoMHRLJVLpBN5gyhCxcsHeYHaM9Dz8rko
 HS9hJPSnR9IoX/6DdNGDtXs8kA==
X-Google-Smtp-Source: ABdhPJwxUzDUCu+JuDbQ/v2yjq7fR48+UEALA6Mdkjo0VkGe5rXf7u2YmQAkeV2hgnWGuu7C/k5BNw==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr5187039wrr.358.1622830968859; 
 Fri, 04 Jun 2021 11:22:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm6140581wmb.35.2021.06.04.11.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2040E1FFA5;
 Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 17/99] arm: tcg: only build under CONFIG_TCG
Date: Fri,  4 Jun 2021 16:51:50 +0100
Message-Id: <20210604155312.15902-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index b3c9d808f5..04b94a3bfb 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -12,9 +12,9 @@ gen = [
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
 ]
 
-arm_ss.add(gen)
+arm_ss.add(when: 'CONFIG_TCG', if_true: gen)
 
-arm_ss.add(files(
+arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'translate.c',
   'translate-m-nocp.c',
   'translate-neon.c',
@@ -31,7 +31,7 @@ arm_ss.add(files(
   'debug_helper.c',
 ))
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
   'translate-a64.c',
   'translate-sve.c',
   'helper-a64.c',
-- 
2.20.1


