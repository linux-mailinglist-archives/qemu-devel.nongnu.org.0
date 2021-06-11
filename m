Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBB3A4BA2
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:11:35 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrFN-0003O2-Vp
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmq-0002zU-Aa
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmn-0002kE-VL
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so6725246pjs.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYv9tcvc0r6vqymr5HM4dazO/PQp1jnHK04uYsgFVEA=;
 b=H+3Uncb8d14Dt53JbLo6+lZp8HApGG3t8BXr1sGiLfx3S2ens9SjAtNLRpd50J6tFx
 YcvkW+80ZEaeU1A0DQXjK+OIJPWq0G6LYJK/aWy+HZnV/ZAqP0ejVmMRWT7u4b2ijWcQ
 Ir4DJAQzixM6dEQb0xAu41RuJgq1u8Drv6yF+KSa3EtiqmjKWApnuDBLMfc1MT7Gdg+p
 Ph+6ALhN6ULoubu6oHuyAasGkHr3Ss+AOrV4x+87yHx/+6WummqIJmgn6u7OM2Yc37tE
 cu38g/a7XKHYy/+xvuexD20PTNtW0Jr5XOM9Hgqj3kAANCVMLNDzOaYvUPu5x2e3Mudd
 xdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYv9tcvc0r6vqymr5HM4dazO/PQp1jnHK04uYsgFVEA=;
 b=Q6slM48FxRX/htQh1aQkU1kLwm2Kb9EESVRdrJjLcxtUVn/HGPXWHHNnuuG/0gyUTz
 Suk1KUxIhBrTXMBHfKKGU9gxaklvJvCowZN4tVkWVIZ4k2z+3upM/Yjbfs58yqnCdeUy
 fNGeGGCGcWME9Jv+jc79N//RsY7ZOwQ43ZZfKr/9PFV7rJ4/v3uSEQhNkMzS8ASRuoSr
 ofLLASgRsV5MR9GoK6TUqObKmzop2Oppz//3nS4Bakw92sirULo/l2P/tsaUQqJt22aL
 fbjwYumCqN3UL1Ri8ZSKjKwViGUKOjFN8gGfwijyo9UHy33kDV1+MvfdsW2Pvg7Qesbi
 4luw==
X-Gm-Message-State: AOAM531kCMHxMSOYL4bsz78rv2kVXlprQzJ7k611AAR5gZq27fxIVRo6
 WbiVY1SKkgx5Nd+cMsRhLvnFCgKOqWdEsA==
X-Google-Smtp-Source: ABdhPJzO+3UO/Bwq5h9JJPjLj4j0ljPASHD3LEhdBVN9bRdPQh4chheQ2QQ6BsKh/xK8uelQ32yvCA==
X-Received: by 2002:a17:90a:ea95:: with SMTP id
 h21mr7012566pjz.90.1623454920663; 
 Fri, 11 Jun 2021 16:42:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/34] util/osdep: Add qemu_mprotect_rw
Date: Fri, 11 Jun 2021 16:41:35 -0700
Message-Id: <20210611234144.653682-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For --enable-tcg-interpreter on Windows, we will need this.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 1 +
 util/osdep.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 4c6f2390be..236a045671 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -512,6 +512,7 @@ void sigaction_invoke(struct sigaction *action,
 #endif
 
 int qemu_madvise(void *addr, size_t len, int advice);
+int qemu_mprotect_rw(void *addr, size_t size);
 int qemu_mprotect_rwx(void *addr, size_t size);
 int qemu_mprotect_none(void *addr, size_t size);
 
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..42a0a4986a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -97,6 +97,15 @@ static int qemu_mprotect__osdep(void *addr, size_t size, int prot)
 #endif
 }
 
+int qemu_mprotect_rw(void *addr, size_t size)
+{
+#ifdef _WIN32
+    return qemu_mprotect__osdep(addr, size, PAGE_READWRITE);
+#else
+    return qemu_mprotect__osdep(addr, size, PROT_READ | PROT_WRITE);
+#endif
+}
+
 int qemu_mprotect_rwx(void *addr, size_t size)
 {
 #ifdef _WIN32
-- 
2.25.1


