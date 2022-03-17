Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F594DBE6D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:34:32 +0100 (CET)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUimN-0005Qz-SC
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:34:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO2-0005dN-5A
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:22 -0400
Received: from [2607:f8b0:4864:20::42d] (port=35709
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiNz-0002dw-Un
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:21 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a5so5946853pfv.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUIv8mPilapal9RFUm8fJDHj8xhqXeKP3105ESvQPFk=;
 b=MuWBDkilK6RwZrzwYnJYcvxoy0Ttys8jHxhKMwxWcc3TlNrye96rytrsInaYD41kZu
 85G4FUUl7v/sCQRpES2mY/HPve2p5zBOeppRXJd6GX8/PR1BHsVVKlnIJ6g+03BS2DOq
 82nKU1aaCsrFeS/cTIjbw2RIBMrdbkRYmcoe3hpZbLPLEKV0NoDXFJ0HUvYPLNqhhJ1G
 WZydO+DnmyuSjA/jXs4i2zHVu3fuc9klOqR7qq12I71yfWiRTMHZujm0zhGZPounIM5T
 /NMa4XNsWphpwKajjIF8VPi52S9pp7yFSjGRF+luLA8A/yUHx8tZ8qT+3XFFe4nZIdgS
 kKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUIv8mPilapal9RFUm8fJDHj8xhqXeKP3105ESvQPFk=;
 b=Ngt/8gm0CjsSDdjwV3K+UzXxpDmf8hO/fqvhoAyMfDGMZPAYVWxUwNO1UvfNXZb3vB
 GkU8obSpz8p6r6d8YwzjXcJrVb10HDPtg/ezS164rSdP9OlBxIjGOzy/cBk0JeUpTjzU
 JWk+xUuhxSr2rZI4P3tODfxvG1pmr9WBAktH0KWLvzVb9ajb9Bi3ZluL7bhBNDwiE28r
 wEkph+gjC7eWcPiU2Q0kd5JO/RKuUaz7FskVebVU8QcqKUa5d35BV3jTiP46FZSd/QZi
 AsI71Cn/v3eLcXzuJLgbdf9pEL62Szd2B9mCAcY85HwFm2usS2lF0xl61GzIxmgnGu7j
 pqHA==
X-Gm-Message-State: AOAM533cJoVQL+4vtWQF/KzfIFzvo2kLHwVyfQRyDTyWT/JEDL3uA9PN
 hz9I4TdfQ6N9Y/zUKrJUUJ3lyzSZxBxQ9Q==
X-Google-Smtp-Source: ABdhPJy9Mmed0eXc01SGYSuS8NtVKrvwn7FinEu26pF7VZEzhoF3Rwe9WSexegtgtUzn7kJSHSTYiA==
X-Received: by 2002:a63:6843:0:b0:37c:43ce:32e8 with SMTP id
 d64-20020a636843000000b0037c43ce32e8mr2313511pgc.456.1647493758751; 
 Wed, 16 Mar 2022 22:09:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 40/51] linux-user/nios2: Handle various SIGILL
 exceptions
Date: Wed, 16 Mar 2022 22:05:27 -0700
Message-Id: <20220317050538.924111-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We missed out on a couple of exception types that may
legitimately be raised by a userland program.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 67220128aa..f223238275 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -49,6 +49,14 @@ void cpu_loop(CPUNios2State *env)
                             env->ctrl[CR_BADADDR]);
             break;
 
+        case EXCP_ILLEGAL:
+        case EXCP_UNIMPL:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
+            break;
+        case EXCP_SUPERI:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
-- 
2.25.1


