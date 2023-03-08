Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F776AFADE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZhLi-0006iV-Jh; Tue, 07 Mar 2023 19:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLg-0006i2-JX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:08:04 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLe-0006KL-OM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:08:04 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f11so13803709wrv.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 16:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678234081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Z+l5lLhyUCymqMMafbnduCJEX6nzmEFdJWVvnb/OjE=;
 b=gib78X3PG/TJ/j+yPcPIDQtFo5ZLLQx5cpxV+NlKLh+xNt3c4NXc48E6EuzyExs1s1
 Wam8HYee63RxnhSJfW5zCIyY9T55ti2WsLBHKgT7GTo01YQqF6qBrBKXTrrmscIskKGB
 MDUqvhPpe2Ck8mcfftn86cdKUv5VjtQPGbDAYYWuVCZ9AJ6rAzxul/B73MPBFpp83Oh2
 dg4UevThwwnGKJaoLXkbR0MW39g5wIw+p/gmCctWVQnqWjcdeVX9yJjPoWCbai2SiPaH
 g1ly1f7uSMoUklWPng/OBf05+pbtmXVxUe6uw30TASYUx9zBC3kNnmwL53Dmk5HX+Wai
 HQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678234081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Z+l5lLhyUCymqMMafbnduCJEX6nzmEFdJWVvnb/OjE=;
 b=Hxgr56bl5oLv5XmV41gxxwIMHrziY+lDoeWqG+5kDTwAaEXXjUcW6ZRL1wIW2zoatC
 E7MTlO8pIqOFMkh61edEYLvqPW539qm4QGdkIYiivjVhAcje8F4nix9pf2x+wrFXabsH
 qDXkxAv7RagJ6Xgpk+TlZPFrXm1mn5iqSmJeaiu7gKRg83glG58pM9MOXVXe0RKTleTu
 0KS9R0OmYaTC4mP5U0b4ufUk8zRmG0OtjmLC5/M+M1o8ZnO75o0y78UzFNpkG9VTO29L
 lb1fdebnXuzoSDCrsYP92sWRv5XVU6ActSk7k6aCI7ksA1uZrdzG6pLMBF+7j2gclmvH
 R5+w==
X-Gm-Message-State: AO0yUKUJ78KbwgYMaUzKTLxsvSleJ+ip8gZnq9t7ZV3n3hzk5LIPovjo
 M3MzHUc1qiWHF9xmgYdq6afN+UkyHi+AStN+MZg=
X-Google-Smtp-Source: AK7set+p87fOLNzzyK+PVzGQj4HBS5GpgTZuyoY0/KL0ASWBeJAjnituPcTBbe6B5uDY4d2BRs6XOA==
X-Received: by 2002:a5d:4f0c:0:b0:2c7:a9ec:3 with SMTP id
 c12-20020a5d4f0c000000b002c7a9ec0003mr10436952wru.65.1678234080802; 
 Tue, 07 Mar 2023 16:08:00 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d500f000000b002c561805a4csm13788739wrt.45.2023.03.07.16.07.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 16:08:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/4] configs/targets: Have all MIPS targets select FDT
Date: Wed,  8 Mar 2023 01:07:43 +0100
Message-Id: <20230308000745.56394-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230308000745.56394-1-philmd@linaro.org>
References: <20230308000745.56394-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

With the introduction of the MIPS virt machine in a pair
of commits, all MIPS targets will require libfdt.
Define TARGET_NEED_FDT in all mips*-softmmu.mak files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configs/targets/mips-softmmu.mak   | 1 +
 configs/targets/mips64-softmmu.mak | 1 +
 configs/targets/mipsel-softmmu.mak | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/targets/mips-softmmu.mak b/configs/targets/mips-softmmu.mak
index 7787a4d94c..a5c1db82c9 100644
--- a/configs/targets/mips-softmmu.mak
+++ b/configs/targets/mips-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=mips
 TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
diff --git a/configs/targets/mips64-softmmu.mak b/configs/targets/mips64-softmmu.mak
index 568d66650c..398e0fc244 100644
--- a/configs/targets/mips64-softmmu.mak
+++ b/configs/targets/mips64-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
 TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
+TARGET_NEED_FDT=y
diff --git a/configs/targets/mipsel-softmmu.mak b/configs/targets/mipsel-softmmu.mak
index c7c41f4fb7..3ddebca575 100644
--- a/configs/targets/mipsel-softmmu.mak
+++ b/configs/targets/mipsel-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=mips
 TARGET_ALIGNED_ONLY=y
 TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
-- 
2.38.1


