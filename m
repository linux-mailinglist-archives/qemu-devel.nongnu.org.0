Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CB67C9E4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Lg-000427-1N; Thu, 26 Jan 2023 06:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LU-0002sq-Bj
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LS-0004EY-Gb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id b7so1441399wrt.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A69+dAntaMgm9t8HgL26p/jUP8rIwyImyTd2jAKYUvo=;
 b=guI/7Ul4red8NI9cBLMlhm/aBAMprxCKvAMunwXfmVhueIgGDu6er6LJFsRrWOg7iT
 x7JXDNgSoY5uZocjM1ISCsO2xjIGYHlnrNBizvGEEocbsyC+6z2b0z7HlIdbmt39a0Ec
 ox44I6Hz6ak813OJRElceWrK6cpQIwbjupSjkdYL2CMJSKaiubPUa0dofX30PQ2RNJ6K
 7WzLPspgqVaXpVNX0iJ1EkH7w4eqLAxTjopTvCXXlp9cNYCZBNjIj9dpb8uicJu6J/rG
 PaJ7tAUdNFOMIn8I5zmC7dwjxDbw9da6uNO/gn1xZqeNr2sk/kSsRjI7UapI/RohQuyJ
 G2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A69+dAntaMgm9t8HgL26p/jUP8rIwyImyTd2jAKYUvo=;
 b=hRNPJqDPIK/RxIlgCP74R2QgES06gOEZWcy0zPs0SvDJCpNbrIW1W91raLPIj83v04
 LPzIyVQFordAP/TEq+tx52VkmoBFIH3oHApcv+uOe7B52jZ7nLfaclD8GnSLCdg92n2s
 Mk1lmuiFXlbAp7n5o7cVwyaBtXHRVtaFfmvoB+ZXC0bLp1wTVhU36ul4M1xfZaaGmOJT
 UXxBfVl6KjhB65xu0j9U2qXUdekPmaKJ8mIwBNvjKmP+w+olFujzAZBAL7ySJctudJvj
 wq4hf84YsPzix7y4zmKp8CQyw4q4irvrMtZBBp5TeBiwXUA0Seus+MDzi8xOmLHILr0w
 a9sw==
X-Gm-Message-State: AFqh2kpGSP1Ms0nXA1qwDoGC2LjWw5JIIaURr+cnhkeNLWSc5wc05yQa
 lT3vJb22N2PPRe8eeH0a2AjniA==
X-Google-Smtp-Source: AMrXdXuZN5kM23AtlRHeh0Us4excqzEUtTstGvXjU/n+wcC7pLN8R0X3be+cLDI89qQksGS3pzLrIw==
X-Received: by 2002:adf:f242:0:b0:2b2:1db6:a6bb with SMTP id
 b2-20020adff242000000b002b21db6a6bbmr30761960wrp.20.1674732185002; 
 Thu, 26 Jan 2023 03:23:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d6b47000000b002bbed1388a5sm1063695wrw.15.2023.01.26.03.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D0D771FFB7;
 Thu, 26 Jan 2023 11:22:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 28/35] thread: de-const qemu_spin_destroy
Date: Thu, 26 Jan 2023 11:22:43 +0000
Message-Id: <20230126112250.2584701-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

From: Emilio Cota <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111151628.320011-4-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-29-alex.bennee@linaro.org>

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 7c6703bce3..7841084199 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -237,11 +237,10 @@ static inline void qemu_spin_init(QemuSpin *spin)
 #endif
 }
 
-/* const parameter because the only purpose here is the TSAN annotation */
-static inline void qemu_spin_destroy(const QemuSpin *spin)
+static inline void qemu_spin_destroy(QemuSpin *spin)
 {
 #ifdef CONFIG_TSAN
-    __tsan_mutex_destroy((void *)spin, __tsan_mutex_not_static);
+    __tsan_mutex_destroy(spin, __tsan_mutex_not_static);
 #endif
 }
 
-- 
2.34.1


