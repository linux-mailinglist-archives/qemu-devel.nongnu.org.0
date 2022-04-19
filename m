Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1441506816
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:53:05 +0200 (CEST)
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkXg-0008R1-Vm
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1f-0007UQ-5m
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:20:01 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1d-0001RE-KJ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id g13so3857549ejb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JFCx3h9+6IkiSUPwDfnta1g3m759MetaQg4zKGaDjt8=;
 b=wZJKc47igZV3XKY4NaI+GQYL2Oi0ZkHxEyJjypUJDBSX2ceP0xX/17TxTiv5/heQeA
 jzfjRAGRo7XOt8TTuIU1OJ1HghwIDB9SbKflFnTFZxNhqrursysh+g/sVXAArG0zSYao
 kKZv4Eswbsg4a41kHdEJWmEwqWUeBk8gdfX27VY3QKeVUoPclHPhLixiQ+iDg1YUIreW
 OJML7jJwbbyopWz4gh/jESmLUXBujIzMRV+s1iYlFrCq40MEev81fU4amfnxa361Gcim
 hM+9XgI1uRvjAVdVJ267qTVw5HKcW0opd4wVYbRRvD1tSbQiwL1r/tiaDyDk12VYoWY+
 KCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JFCx3h9+6IkiSUPwDfnta1g3m759MetaQg4zKGaDjt8=;
 b=As+lv5ECZS/LbB9nQwgSRJHT7H3wPoGEB/XswWjOslvOPArbIrxxNALgwtsDL5OoQr
 9hVB69Y5BPI+NJTlEbwPmQyw9aZVzjSbl/+Jn/eO6qGUI0gZHXqDLja7SaoSZmK+pPXj
 Cdowuy+lzOlahYwxM2S0nNAk9qINrOv12lzaysOnOFu3p8Mye291UC5/mHSH0nAPJ3I2
 icKSjY23FpqZl8QNJm+TCHuFUNjU9J9R+6KJlYkKtkw3L7YuKe9zRNiCI6Zg8k4Xy3We
 k+2cBFnG+vJ/M7bLePHJbBJapvkd5S2PkPCeaLWE5H4ASec5yhwfnnhaKOxmLn1ETgsb
 +iCg==
X-Gm-Message-State: AOAM530s6j2WleL7W8DaCMQWen1dBNn9gbYvOW94wa1Hue3Q87VyjlK8
 9CgPuXR1Qa4P2R4e9h1wyabRxg==
X-Google-Smtp-Source: ABdhPJxOUYz8S6Qxcp0V2kbAJCOSJfe5jZXacgkbyRklV8zeOr+77ZqJbPpdjP0VULDu15ZDJFdqMg==
X-Received: by 2002:a17:907:1ca0:b0:6e9:9eef:a8d2 with SMTP id
 nb32-20020a1709071ca000b006e99eefa8d2mr12283427ejc.719.1650359996280; 
 Tue, 19 Apr 2022 02:19:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm8223362edt.80.2022.04.19.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2BFCE1FFCD;
 Tue, 19 Apr 2022 10:10:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 21/25] tests/tcg: remove duplicate sha512-sse case
Date: Tue, 19 Apr 2022 10:10:16 +0100
Message-Id: <20220419091020.3008144-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already generate the sha512-sse case in the i386 makefile which
works for both i386 and x86_64.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: f8a4c6d728 ("tests/tcg: add vectorised sha512 versions")
---
 tests/tcg/x86_64/Makefile.target | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index f9fcd31caf..b71a6bcd5e 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -22,10 +22,3 @@ test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 
 vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
-
-# TCG does not yet support all SSE (SIGILL on pshufb)
-# sha512-sse: CFLAGS=-march=core2 -O3
-# sha512-sse: sha512.c
-# 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-TESTS+=sha512-sse
-- 
2.30.2


