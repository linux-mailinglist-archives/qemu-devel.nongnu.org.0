Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E533A83F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:35:11 +0100 (CET)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYOE-00067B-AZ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGp-0005pZ-To
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:31 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGo-000880-DC
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:31 -0400
Received: by mail-qk1-x731.google.com with SMTP id g185so29901207qkf.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1cuceYNpYXAOK1j2QgIU1zwSZCr6xgnUVgDKM+l7ys=;
 b=BxmStJdcfxjEqRQEw3k9KNk7H2E4/bQw8U2CX4w+ESt28UmVFMca4Q4qtwV/RRHx4v
 JGuJ7u9zB0++Uq3yYHVECsSzhR2LyHLkTtx+s1bwY+IXlAP3gYCxl7yl5WoeESFgjyMA
 fxt9XVh+9zWpF+sMZzrpuAuNtlEGcCs0MZtO2PNyG1OatA1gYox3aiDj8qiy+Q5BT+ta
 fcpcNGo1emHe3ooedjqvLB1qkuHXfozIrpnVKiDjZAsGsyKIaMR1WKxtpBPZaYLzaVhN
 6Ox83lhf2OIg4pdoHfwWgNdL7nZO2B7mtbx/ANYobKkHrQbNa4Iv4w/l5FYt0zF6hnIe
 Z1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1cuceYNpYXAOK1j2QgIU1zwSZCr6xgnUVgDKM+l7ys=;
 b=ReHs7T7iilfZaXswxjTIDBxhi4GUeLlpqy960UsU5kszJnJojl72PE7TzFeeGsSkBk
 a+S/0culbG/oxCY+VxgwcLXZ1fRA+Slq2Bby/ShKlcwVdKQHsWpsfrI1he2bimMJEmSA
 iLJvIacTCVUaaV3Qbw4ckgiu3vZY0j5bZImjpb1kzgDw2iIqPTEFn9gYLReaNlehmtSu
 ccmdGESetjH8fMAtUvo4oyAQ8x1MreEUM/nWJT7aqM6/Hn5q9KXo7fB2KHQJBCuo72jU
 gyCWhgkc4pO/OetCTu8VyKcw0RiXfkHxgkKBbpAdx2X9FOcjzt5Q0MOZVcqhNpCaTZc1
 g0xw==
X-Gm-Message-State: AOAM532fVNa1EImrliMyY4F6ct5z1ZYQJsN68ZWt5fiIXx5oI5hQtprq
 lIv6Y8fljXeJwimMoy8+nuhTCEwFys6S6ae8
X-Google-Smtp-Source: ABdhPJzVxbBzScfY5gv5cH+9lmkygYrJgKH0bWvzcymlbjujYlsLNbuHc9ZnUgZ9fwc+jR/lCwiilQ==
X-Received: by 2002:a37:a404:: with SMTP id n4mr22137321qke.439.1615757249427; 
 Sun, 14 Mar 2021 14:27:29 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/29] meson: Split out fpu/meson.build
Date: Sun, 14 Mar 2021 15:26:57 -0600
Message-Id: <20210314212724.1917075-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     | 4 +---
 fpu/meson.build | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)
 create mode 100644 fpu/meson.build

diff --git a/meson.build b/meson.build
index 742f45c8d8..bfa24b836e 100644
--- a/meson.build
+++ b/meson.build
@@ -1934,9 +1934,6 @@ subdir('softmmu')
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 specific_ss.add(files('exec-vary.c'))
-specific_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'fpu/softfloat.c',
-))
 specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c'))
 
 subdir('backends')
@@ -1948,6 +1945,7 @@ subdir('replay')
 subdir('semihosting')
 subdir('hw')
 subdir('tcg')
+subdir('fpu')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/fpu/meson.build b/fpu/meson.build
new file mode 100644
index 0000000000..1a9992ded5
--- /dev/null
+++ b/fpu/meson.build
@@ -0,0 +1 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files('softfloat.c'))
-- 
2.25.1


