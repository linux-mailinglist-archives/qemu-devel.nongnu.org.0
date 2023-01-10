Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0E664B6F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb5-0003TT-7Z; Tue, 10 Jan 2023 12:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb3-0003Rw-1P
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaz-0001Fh-G3
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id l26so9370154wme.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIsF52FPjClqcE3nmE0+0K6eEbvB5425yRMI+7mjkm4=;
 b=RIvNTdt1Hy5egpEtuFKGrdFRyZdINZPrDzCqmkXARm6QF34+Yxo3d5VrQq8D1MkN2w
 tf09flEQOkr9yhLzlyVuoe7oPeQmTHk6YLLyMc1rydbou02StugPfkghWx2YknJMDFkv
 ovE4XbZ6k9jeKXqyMxqy/kEda42JWAhJaFNscsQJzx0p8BuF42vG2wHHrQCbb1eOmdKO
 YFcTu3jczqk8Bdjry8zvUatUo0CzmxGM3BIe0rrfgqDY4xwGP/hDlJ6bXlwGhTcwcamc
 PzY06JOVfwg/rdzdUntH9KS5ifDYnluGqg+M72C1ih9zJmvjVZ0SrKJAJmW03Lt9O/K+
 xisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIsF52FPjClqcE3nmE0+0K6eEbvB5425yRMI+7mjkm4=;
 b=Esb18Ct2Y55Ku5YRcwHbcekXMrTm0hw/lCrU8NjGbWRiz9IqvKJ6d31QclYI+8gNMN
 fZsvWwlcj1W1xDXCX5vvN/j/QTjPBbKOtI3guaok75sCSZUeWDAin+ltJvd0sWh3A5ja
 ONvOyHWQtx4Q9/xgfzPg9UI9MKyabG/ZcLTqHXmwHrXvl+PRvCxM9beAVlJ3GIZOkRXw
 FtOuz0w73lZ5p+Ug1gmL30kjaovPli1uW0m9ve8HitGSJejVwhin9RIUbdSodboSHkV8
 WHDAAxmsIxR9YHCpJSOcrTQhnmFhBcQbOeMvHZ2QxO2N3hg6v+aJMnW2DnfKXiBSz+Rj
 +1MA==
X-Gm-Message-State: AFqh2ko2FRAdIznFBN87/dqRMKhTXn69awtAzatjCmA0iKEv0vaPD6hx
 COwbaf9OrSG+VNBIXxsbi6njk7kbUyW6a5jT
X-Google-Smtp-Source: AMrXdXtUoCuraRwOjeOgcCfXudnivZeJuu5QJ07NBLKorSEFZQFClrvBEfYZ51Bk3WrkTdZkMq1qUQ==
X-Received: by 2002:a7b:c003:0:b0:3d2:bca5:10a2 with SMTP id
 c3-20020a7bc003000000b003d2bca510a2mr49675467wmb.22.1673372372105; 
 Tue, 10 Jan 2023 09:39:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm23830508wmc.0.2023.01.10.09.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 272A11FFC8;
 Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Robert Henry <robhenry@microsoft.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 17/26] tests/tcg: add memory-sve test for aarch64
Date: Tue, 10 Jan 2023 17:39:13 +0000
Message-Id: <20230110173922.265055-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This will be helpful in debugging problems with tracking SVE memory
accesses via the TCG plugins system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 7 +++++++
 tests/tcg/aarch64/system/boot.S           | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a1368905f5..df9747bae8 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -36,6 +36,13 @@ config-cc.mak: Makefile
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3 -fno-tree-loop-distribute-patterns
+
+TESTS+=memory-sve
+
 # Running
 QEMU_BASE_MACHINE=-M virt -cpu max -display none
 QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index e190b1efa6..f136363d2a 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -179,12 +179,13 @@ __start:
 	isb
 
 	/*
-	 * Enable FP registers. The standard C pre-amble will be
+	 * Enable FP/SVE registers. The standard C pre-amble will be
 	 * saving these and A-profile compilers will use AdvSIMD
 	 * registers unless we tell it not to.
 	*/
 	mrs	x0, cpacr_el1
 	orr	x0, x0, #(3 << 20)
+	orr	x0, x0, #(3 << 16)
 	msr	cpacr_el1, x0
 
 	/* Setup some stack space and enter the test code.
-- 
2.34.1


