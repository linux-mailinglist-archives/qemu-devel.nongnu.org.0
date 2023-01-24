Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6467A0EB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNi5-0005nk-Qd; Tue, 24 Jan 2023 13:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhM-00058A-FZ
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:12 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhH-00074i-0x
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso11575050wmq.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bExNgk2WJNjDRp3xoZMk58dADWZKU+V7kvdfnjGvP68=;
 b=P2O7PX+ULmRqQwdnktWNNj36ROnyPXTepdc8XIHr37Wx3Ct4mVLE+Kg5W6heZ4hLGg
 yrnckoOb4/aiUTTF+jl8gqtsUuZ/xjkMN6DV7N1fdjAMO2HT2t2SqPanduyWbBfhtNH6
 sdkbnJzNWgm01+RoiLGvxNoulC+2JUyJqkwPRb3VXrDLZS4dz1MqHqsg6uYQ5TZjea2K
 bNcazW/0rn1n+cmW6VJYFvKJqj5j2CpseYZKn9Gp45zhWIl8tarUP2C7QE4yYwQ554Va
 7/hz7Po2d/Yali0t4tk5DK5N2s/gjusGWlj9S2EmBD8E1Hpc4j1y8tba94gIjkMn8H8l
 d8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bExNgk2WJNjDRp3xoZMk58dADWZKU+V7kvdfnjGvP68=;
 b=STjUEe+RHOFfZxk1KVqMvBaprN9jbcilCgmc1Pe2UabI7vrt9/xEKOeL0Khkq/pVNy
 rGTFRum56Q4r8+sI01xvB4B009PC039+zuQ8b1sEk/jGRAh0PhCrHHbVEfHIJOionKuS
 NQGXUb/oZ3hXirVN75F1aiQDtw4nzvRbDzNxgZXYZrWZO7xHQRVbrBeYKRbyMod/dppV
 SNz28beKJ3NKmgfnssj1W8bNynLhCPbsnEWrjhV4Fsu2NFp4bwemrWKQUHBejyMky1pg
 nDX10rcFfVSL4XrePvlv+idZYOYwl7c4EdOftDZaDk2c9UsoKpMAUErdjPB2Bf4ro81d
 Ehyg==
X-Gm-Message-State: AFqh2kpZMxi3p99wYcfZjJkXfotICSy7NNn+6d9+3deSbve435wHK4pA
 ThX4iFI5Lkvmnyi3qkXuvMi/9g==
X-Google-Smtp-Source: AMrXdXtIgxgO/TO0WMZeJd53teP5Pf3iS1EXDqbCmTYD0Becr0t+LPG6ig7nDW3YLlMcpH3GjnLhAQ==
X-Received: by 2002:a05:600c:3b07:b0:3d1:cdf7:debf with SMTP id
 m7-20020a05600c3b0700b003d1cdf7debfmr27626295wms.26.1674583620578; 
 Tue, 24 Jan 2023 10:07:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c08a400b003da28dfdedcsm3115927wmp.5.2023.01.24.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08B791FFBE;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 28/35] thread: de-const qemu_spin_destroy
Date: Tue, 24 Jan 2023 18:01:20 +0000
Message-Id: <20230124180127.1881110-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


