Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF447C42D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:50:37 +0100 (CET)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziLU-0002ab-Cw
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:50:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIh-0008FU-VT
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:43 -0500
Received: from [2607:f8b0:4864:20::102d] (port=45741
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIf-0007aD-IA
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:43 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so3725100pjq.4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Py+EjlgiNuKFcv4guGE3lJAZOnNjGvtb46J0VGe4hU=;
 b=TkBcyIExVGJMc+rwT31njotMvU6wmfPztJcf0g7M+iubcIrR4F9JGTsqvc5ofzamt8
 EJOM7xz0wl9zLNGjicUHTwO9KbtbNSXdHbjqtPl7XI2iDlXpFt9HTGUwa8GAPbaJcRo9
 DTxBdmCIm6KUIqUH2/7y53qQbrHImNICpPjVmbdxoAqEH44iGI4suN5ufY429z225vZz
 1V9LzOh9Rr/IaPUCz5Q/YFxFALtijUZEJTWY0/46yPEgXEDujhQVhrNvFYMgfjy5hpVt
 MvP3QqqxOwPdzlZxe0egc2AgH/Yw28mJA6ZOi2q95Ab+0VeI+dRkHnOSgljNP3pKQ1k8
 kqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Py+EjlgiNuKFcv4guGE3lJAZOnNjGvtb46J0VGe4hU=;
 b=voJAfR1mPMR60hfb6E8VW7/rQZv8XysTyq+qHPoUSb6sKbmOYKICikf86TzXbodlUc
 jRTEWx/rgySjTxqsNwp0vivo3XGOgKupmMiJ41dcsAE/AgBe+5uaCIiD9h74MwnLRmLE
 LUaXkXYSwHdnxLQX8Vb85KlfT4jjPsSgPEps7DT5ROhX4wmXEdVjTRaI/LjaUn4AmJ7t
 Ni9P1oH7vJCt+YeA8Fjb/c7IwbQo2JuqX+6hBmmepaUaHnUxomoHcgDAQZQNaafQ4Ujq
 JnwqFJeYtsnGX/qNLE6yBs7h1KMGfAvdUgf8ZuCT/OZgUJpoQ3Gat4pMxfaXQhcCSN7D
 T2jQ==
X-Gm-Message-State: AOAM531BTWOAt+33r3A4H4lq9KiUH5jLqeeN1fe1Y0G86wsQyDmPUGvw
 C7/WEQ4pYQdpT4ha6OdM0G62mC1gMxnmdQ==
X-Google-Smtp-Source: ABdhPJxno/IqHlSY/aV1rdb6m9fkht8orgb0nIRQ2rE6ATh4g4I6uWxtJphAaC206j4PU1OoM0s4jQ==
X-Received: by 2002:a17:90a:d792:: with SMTP id
 z18mr4961289pju.182.1640105260154; 
 Tue, 21 Dec 2021 08:47:40 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/31] elf: Add machine type value for LoongArch
Date: Tue, 21 Dec 2021 08:47:07 -0800
Message-Id: <20211221164737.1076007-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

This is already officially allocated as recorded in GNU binutils
repo [1], and the description is updated in [2]. Add to enable further
work.

[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=4cf2ad720078a9f490dd5b5bc8893a926479196e
[2]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=01a8c731aacbdbed0eb5682d13cc074dc7e25fb3

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-2-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 811bf4a1cb..3a4bcb646a 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -182,6 +182,8 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
 
+#define EM_LOONGARCH    258     /* LoongArch */
+
 /*
  * This is an interim value that we will use until the committee comes
  * up with a final number.
-- 
2.25.1


