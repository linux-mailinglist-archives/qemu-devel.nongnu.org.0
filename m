Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12F665EE3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcqh-00052V-4F; Wed, 11 Jan 2023 10:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqe-0004yN-K7
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:04 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqd-0001Oc-7D
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:04 -0500
Received: by mail-il1-x136.google.com with SMTP id u8so8011665ilq.13
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DNzttjb32EOmWWwU7OuFf4Ug13G2VErbHqLK1dunUrI=;
 b=5OnCJx2DQ2YPZddkymZOYHAixFsEZCcKJypXzfB6F2jyUJTeej9sqlPJiZsJTRGJ8E
 1SZQ8cbE9xSt9/KfxM7tWL5vXab8bJFROF5XGRhq7Ef7D4nksRVh96iMyV7TRZo7+jgD
 +ZN4SghyaxKoHQdhr+sBzFG1Bg0OHGI8DGjUHJzHrCgzaCZDpkPVxgNQbMd650cAd4D2
 IqLwErKu8f2UbYtSB3tB95HbdFsnkUUOrKJw6X6nDZyH7mVKZel16dyqg6Y+IHErFTvi
 cIhi+n2oqrWqBOvYCiLStE1KrMjCN3Hw/FC52GIioSz9rlJ5M4WJdTSY+1tATwjHfQgi
 wzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNzttjb32EOmWWwU7OuFf4Ug13G2VErbHqLK1dunUrI=;
 b=7gV0QvzBEzlSdTraO/cUIO+KOCIKsoxTg1iSBvHjqIcxgvkXuoFXmY5Med4Kz7zrOz
 uWA/tKIUDUiVHQ9wPUxJB0EgseD3kr+ZNNwCwi0FOCYOt1Y5gvxmMVlAImiMWAFeDOMv
 n7l/YrMuYAIMpEsS/bsMxuUZVzz1rJ2P6vv0s8RsXt70Sj2JcIkKID9hmEwF8mZUFG0D
 +23bYVQNrkRDwQ+qx/TK7Pv40rD0JGa6MtgjHgdquCeYwq41sBS94idZ3Ju2nBhF6u/R
 NhIUlWaFTfVuFudzmfZhVCf9RDL09d+ppBBKcpQ1BOXxxKKUX+FTrrowh5bk3abpErNu
 U1mA==
X-Gm-Message-State: AFqh2krg7Sm76xu/bGYTdh4fhg8j9j87+sl+j5q1oFcSYtpn+TxRGAAe
 cnZgOULg9Tf5hl3+ti1jl5oScOfkSgHuxO2Ie3U=
X-Google-Smtp-Source: AMrXdXtLfAbnDW23WVy0MZnKRnV3//x08cYhLCRzmXDd/4h1t6Svo9v17dU+GTjBSM/EiLl66IOa2g==
X-Received: by 2002:a05:6e02:18cd:b0:30b:fb78:6f0 with SMTP id
 s13-20020a056e0218cd00b0030bfb7806f0mr57105945ilu.5.1673450221798; 
 Wed, 11 Jan 2023 07:17:01 -0800 (PST)
Received: from localhost ([37.19.210.30]) by smtp.gmail.com with ESMTPSA id
 a17-20020a056e020e1100b0030c186ea94fsm4504531ilk.55.2023.01.11.07.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:17:01 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v3 3/5] thread: de-const qemu_spin_destroy
Date: Wed, 11 Jan 2023 10:16:26 -0500
Message-Id: <20230111151628.320011-4-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111151628.320011-1-cota@braap.org>
References: <20230111151628.320011-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::136;
 envelope-from=cota@braap.org; helo=mail-il1-x136.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
---
 include/qemu/thread.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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


