Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C847B8C5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:59:28 +0100 (CET)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVNA-0006pk-3s
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEM-0003j6-Mf
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:22 -0500
Received: from [2607:f8b0:4864:20::1029] (port=43565
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEL-0000Cd-0z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:22 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so1817611pjw.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHsxRB8KyaG7WhuzCtkZtRVF4Ccf8PekyBx+hSykVAQ=;
 b=rqalFPFkC7D6+9XeYByvlxdC413CYAZRlevg4Jbw3i3urdreKeqZwN4TWMEcQyTZfa
 ulvpXxBwyi2aJHbZsK1kE5f3VNrVVac2x6tVI6kCBA85drwa7aRxI8M4kWwbSQZ8KRHZ
 a2aKvrOZbzG7mhwLeWdhv1bK6khOydQJYuX8CWg9oUGUWAmwErt6ytQTRDmDeYRRJH7V
 Qx14bXB+q/YPVw7uZsEeHTxKGNyLfaQ9Q7tSZ+QLVb2O1NYqwG8p5HaI7cw9/HeN+/fr
 DgVLi5/WXMW519wM0cSl2dFX9GAmfNw3DzCr3ueehTcZ04y/pf/Qk4EF5ih2nFatTz7k
 UZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHsxRB8KyaG7WhuzCtkZtRVF4Ccf8PekyBx+hSykVAQ=;
 b=N5aij3X96hWGrWCjZmK3BpEJhFuQ6w4F8zUl7TLGBSZNA7UsCYODyh3orPlLTYwYNI
 BAuLuEqBuAKBPgzBXsdE1fr85LutBYJhyLG/kb8BbjbIEqY1iDGulUOmexXW9k7Fyw74
 0sjvgI9wm6MlP2yf4JK3IJeK3TpCbST7WipKPNnz8bOrYQcn2Tcj/acI0TMoZj2IuyJ6
 8Y+Pv3IZofRs9+UsIRvd/dV3pl/XeLm1j5oInsfQ+5HFqMH1unEZHcr8VuHQSs03BTW9
 o+54NcecHY8kNwZyUcx2nswLxN6yq0raocALAZL+GmySA/7lQ3Lxs2eC/IXD+zpRy90t
 PHTw==
X-Gm-Message-State: AOAM5323iALJNlRYgpYqbICia4i7ytnmQPvuo0+fx3qr7z85Xaf04Az/
 CPNGy+/aqBoKLjc+Q4zOv8XH8IhppmUJ0Q==
X-Google-Smtp-Source: ABdhPJxZtgqBmmYvOMYz1Wsw/TIITg0lHsVAMufXwQV9so6ac6cvqK0zQZEEI8/hk0Vphw/Q6+ge0A==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id
 oc11mr1349168pjb.174.1640055019680; 
 Mon, 20 Dec 2021 18:50:19 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] linux-user/nios2: Fix sigmask in setup_rt_frame
Date: Mon, 20 Dec 2021 18:50:11 -0800
Message-Id: <20211221025012.1057923-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not cast the signal mask elements; trust __put_user.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 20b65aa06e..80e3d42fc9 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -168,8 +168,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     target_save_altstack(&frame->uc.tuc_stack, env);
     rt_setup_ucontext(&frame->uc, env);
     for (i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user((abi_ulong)set->sig[i],
-                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
+        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
     /* Set up to return from userspace; jump to fixed address sigreturn
-- 
2.25.1


