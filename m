Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900B31B1C6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:07:05 +0100 (CET)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLnU-0004lJ-Jl
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLg8-0006n1-Oj
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:28 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLg7-00049P-B0
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:28 -0500
Received: by mail-wr1-x429.google.com with SMTP id v14so6083796wro.7
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/cqSvnjsoH/NNZePdyMLOBBlx6690wleUk2PleenZE=;
 b=dm9A+RQRX9ewSTex1RyZ+3J9b9P4rPNUXYv5f1afjVs+LEzZtic1obHO13u6vqGCZ6
 pSFVQkifJJM+BaqBbm1CCsquwoAUWNMQSj0qxyYwK19NtV6W2QyZXjDkTQFXPnGG7AHt
 dM2Z3/fBfc0/up/oFv+Uu7kJi4K7IKWSetpaLysvE+84u03yWPYd6CTM+pgnz4nZUDhp
 EsVWtyEFxQxWXcg3IvmKJrfWWorW0Fl89pN+fEyoRx5qKOQ+1yISJ0gmzkZGHh3MTrN5
 euHtZtZLv+ZLcmtRBmpZ7qk44LbRfyko6iiyeIjRSOg5rEWI2H5CGDs65Eik7yRpC3FT
 LdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9/cqSvnjsoH/NNZePdyMLOBBlx6690wleUk2PleenZE=;
 b=UI+4BcnL0ADq89ev+xP7oXjG9IZjMwIUgV6cQMRNVFkgGDBSWV3eRU+QB3+pD62GM0
 JfqXRAfwBHNoJiSehRG8D/WtmGiODTI5SK3Sxp5L3Z2AHF0AvqGuOPfGQkggQSz4dr6V
 ND5K4M20buAse1igune2x2HkgBAmODi9Kx3N+JlmeiY3ErhNhFsx6k1ajDggtxG/sc3q
 8eJxUQSzyUX5YX8qR814acARWT+LC/pMIXIT3ZFrZIPCiQ8zyu71DpIlT12HkDRdTiC2
 ykBUMyl4yFDEp0hx9fKSfGB1RFk0YA8Jmfc6ru/Z41mmuojt+ajAdIk2PcXgGuZGA3SA
 tURg==
X-Gm-Message-State: AOAM53375s2K79g0JHcOfJi9u7uWATqv5yUWk+s+t6wBWc85tPs00XMT
 Bh2gNpL+IWNpZmvCE+O/UJGn3hOEWrw=
X-Google-Smtp-Source: ABdhPJxcPohmsCDU10+kIvnODxsU7GHL5qkKrrVDVFu/WDvCBZMsDdD3SY9F1Glh6mY+VLdM6URxmg==
X-Received: by 2002:adf:92a6:: with SMTP id 35mr14835392wrn.193.1613325565504; 
 Sun, 14 Feb 2021 09:59:25 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm21776048wmb.33.2021.02.14.09.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/42] linux-user/mips64: Support o32 ABI syscalls
Date: Sun, 14 Feb 2021 18:58:32 +0100
Message-Id: <20210214175912.732946-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

o32 ABI syscalls start at offset 4000.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips64/syscall_nr.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
index 672f2fa51cb..6579421fa63 100644
--- a/linux-user/mips64/syscall_nr.h
+++ b/linux-user/mips64/syscall_nr.h
@@ -1,4 +1,7 @@
-#ifdef TARGET_ABI_MIPSN32
+#if defined(TARGET_ABI_MIPSO32)
+#define TARGET_SYSCALL_OFFSET 4000
+#include "syscall_o32_nr.h"
+#elif defined(TARGET_ABI_MIPSN32)
 #define TARGET_SYSCALL_OFFSET 6000
 #include "syscall_n32_nr.h"
 #else
-- 
2.26.2


