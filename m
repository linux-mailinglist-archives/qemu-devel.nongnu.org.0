Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C76A41F0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcni-0003hz-Tn; Mon, 27 Feb 2023 07:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcnG-0003Ro-3Q
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:59 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcnB-0001C9-NT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3593505wmb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yei9QnFICkrpmPfGhAgTkxbxJU4xJpesTJ9Xhh8kSsc=;
 b=vYkyo7KyRR8QTCZDYg4kC6Ksm5O6KTnQIWtDb/gkUUH+ocr31WzpT/ClX/ptDrI6Zv
 Li7ASSOdh2Z8ekcmTh8TIC2igpNe2IASHCXBYCR5NsFYRfyzJuNIV0/tVw1JwofCdKdj
 N08jyfefDi+XfxH20vBVy9ILbylHFMIpGRxDuMDHMBKP9Sr9mjCoB5PAtxXQuasSZRF4
 8CYCkTfZ1RlKJ1fd/ZdFHvV8uiKtBUN7JpyepfSkoIUsM1eIeYRAPew44OB9XBIyg3vQ
 O1KryCtBZIPMZI2lROXVLCMqzxg+5yEYLO3mp4Qj8yVfs3Stdr7IuaVsYXauY2COdd4u
 BD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yei9QnFICkrpmPfGhAgTkxbxJU4xJpesTJ9Xhh8kSsc=;
 b=xCuCvpu3momxttdPmyovUYCA6DnYuhD7XTBog1Cen+9uBlhu6GRm9XsYz6ud/aaAAw
 Pc1aIS1mZmvwsca44P3PV8vA7eY+zO7KwLI1rkySWRynJglU8TRUhr1jKrsR4WMLNjFg
 5FImlzXYDEM6hhHHWaFiO8gK0HzRaCerS+z+fjGZJ6Fn58Ss3HY1hax9J6cyODq0gq5H
 aCQg5lNuRc+RV4lh5OsvkAig0TtRqltThdWN9vwAWuVHuHOFeosExoQNuhlxwjtPbF8/
 9+MlBH+vMLhH8bEPa93D9s3GIH5kJv/eddibTx/pIygp4w2VumJLo7nQ+Q97OqPD6uOX
 Tt8w==
X-Gm-Message-State: AO0yUKX1Cvt/xiscO6L+sgJUFAKu7IJNa3qZ6ag6rREsneSYqHob2ot5
 qc0SInOijBxxFZH8wUVyH4fa3BawJ53Svkdh
X-Google-Smtp-Source: AK7set+wuymm3f8mf2RJpxpT7blCylHbrDqoqTwd4lPgnv5F9dnfRebAPu9ou4yuneMTSw1Vn28KhA==
X-Received: by 2002:a05:600c:1708:b0:3eb:376e:2ba5 with SMTP id
 c8-20020a05600c170800b003eb376e2ba5mr4995801wmn.3.1677501584661; 
 Mon, 27 Feb 2023 04:39:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a1c544d000000b003e208cec49bsm19039312wmi.3.2023.02.27.04.39.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 008/123] target/i386/cpu: Remove dead helper_lock() declaration
Date: Mon, 27 Feb 2023 13:36:52 +0100
Message-Id: <20230227123847.27110-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Missed in commit 37b995f6e7 ("target-i386: remove helper_lock()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221216220158.6317-3-philmd@linaro.org>
---
 target/i386/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f729e0f09c..9824b7f8f2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2313,9 +2313,6 @@ static inline void cpu_set_fpuc(CPUX86State *env, uint16_t fpuc)
      }
 }
 
-/* mem_helper.c */
-void helper_lock_init(void);
-
 /* svm_helper.c */
 #ifdef CONFIG_USER_ONLY
 static inline void
-- 
2.38.1


