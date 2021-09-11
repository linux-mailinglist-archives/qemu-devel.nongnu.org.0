Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D54079AB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:57:02 +0200 (CEST)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6JJ-0000H9-MT
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HG-00069p-5y
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HE-0002DD-Ql
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id u15so1435460wru.6
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZvvlRpa8DC97DN+aH7Pj/vVpZZsHFPzTcOdAGwjWjs=;
 b=B2cPwU6uBkt0E42CdgO+HC0TFDfX0nWohCtyQyAdOmLaWPvG85p0ybjK7XLniieQGw
 bF2iZ0ClIKdO9zFCtX/jgvOMGVCahRf2pwWdVVxedz3CwbZCE6aOkSX8u7xmu26dBHKp
 ZG+Ts4twYkoNsuBRk6Q91jZsnC/oNDHZr7VG+gGqy6CPhnaSBc7zqJYRwGt7WEMeFO8S
 RfL0JFRrBcmaUQzGy2av0UEODKf508xnbxOWhRPDwRW6nXogk2jgUWkiuLpH4TrdnPJ0
 y41EH7SSbgf0tEnZuuiAAxGrFLNexoUpvihIIJ/nhoOecAhFVIetWBkhGWVJ8m+y2f8h
 vYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NZvvlRpa8DC97DN+aH7Pj/vVpZZsHFPzTcOdAGwjWjs=;
 b=7qHUwHHlF7VQ9hVO0pRJdiW2h2pBs3yrd5aENAbFK2BGKXASFUBA4BPGqAUVgx924X
 gWmGh3UAjYF6gfYNSpIbLYWyXb1idAetsUZEHS1qDUaTaGUOhRfHQ5IbFJNo/VsVNKjb
 uPOASs/Kkt0Ws7Vf6C0wGRY/Yg41RJMHln1jIpNCdOcGGgdPpTHRCkZU5wJf5HGhpoDi
 3pgYQuWF0h+/deG515kB0Y7wiBXazztxZvOnzceAiHx6tsydhtFLO2vHYgM8M4u48v0x
 1rd6y24joKFluy6FCDNcigrzTA3c1GT/XeAzBI0MmIZDOGN8t68BmUvhHQqIF1XH154P
 oBtg==
X-Gm-Message-State: AOAM533BXKaJxcA81YRVcMazfppiB894luGI+aOVIW1O4UgqFH3w2GRB
 742PR/rLruUblIKDFcOIBmSbM0CNzLE=
X-Google-Smtp-Source: ABdhPJxT6i3ughafuEm8UkGbUNSWX88JY7+BJ9t4NGFnaML1XNt/KB3Wx91gTBGLZY+swQ6kz9VAvA==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr3802445wrl.388.1631379291288; 
 Sat, 11 Sep 2021 09:54:51 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y18sm2174002wrq.6.2021.09.11.09.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:54:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
Date: Sat, 11 Sep 2021 18:54:13 +0200
Message-Id: <20210911165434.531552-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge two TARGET_X86_64 consecutive blocks.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/seg_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 3ed20ca31d7..dee7bef68c6 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
                    e2);
     env->eip = offset;
 }
-#endif
 
-#ifdef TARGET_X86_64
 void helper_sysret(CPUX86State *env, int dflag)
 {
     int cpl, selector;
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
                                DESC_W_MASK | DESC_A_MASK);
     }
 }
-#endif
+#endif /* TARGET_X86_64 */
 
 /* real mode interrupt */
 static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
-- 
2.31.1


