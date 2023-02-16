Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EA9699647
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSedW-0001fU-0C; Thu, 16 Feb 2023 08:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedU-0001e5-Gy
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:20 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedS-0001aY-JW
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so1738587wmj.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCtcRsma4Lb/eGzY1J2Zycrim3J1natcTOS1qZitV64=;
 b=C1MfzGHNVCp+pBBYhVUS0NTNG9RwririohC33e773ZBpWMUMPROJJk1aiSI13Mnkgv
 xfNp84P09NCy8k6rmkB1W8SKALeoscPNgPkK3UW2oWpfjIWmoO7V8t8G7N3wZfs37SsX
 bx9AR6uZCTkvsgITvAQb5SzwYXWQecZaBXf07Bq64OExGwgjliZ/kI6QBPghqkF7yfBu
 W27wVWueBGNiMfaMIUNAvZoHh1wJjnAE24Y2GvIgv8/+Xu5yEnEgKNH2Kxt9RQ3JMFi7
 rDdamuSQMFauisCYnoKV5uYLlMHk9z77S1wJnTCFo1AHw7tKCZHg0HmfqqJ7dedHJNqi
 QwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCtcRsma4Lb/eGzY1J2Zycrim3J1natcTOS1qZitV64=;
 b=WafZl3Zcr7l6Sm8cCQcrMMWRNC03cV/CTMgwziBupPV1sBaKbAZpENl2/smB7FaVlj
 IdrTKMlljI9sS+ZLBPXiB1vtJSW3k4tyJotWwVyKB4DyM81+02CGtP64xjnvMj5Rf4Qk
 umoNeWmbjpjJH8ULMZri5zhTuabXcnwOXvbALpEx+o17Y178Pv0OSPLrpBL9cyTghlfO
 JcUIDKFXakTLql2EXd8Qbp3cMr5LM4b8ax724sODjpvy8QUgdZ0P5/X2VLEm1fr5sI1a
 jZodKbRenKwhFAyqsU2ShXohGoPEEyQXK8We28ho58pcjo9DZH2601O5PLO+HTzghOvZ
 WNVg==
X-Gm-Message-State: AO0yUKWB/I1shQzAO4fzhjnFB+VtG80z1adH75YU6axZUY7UZVyQgCHt
 1nY6pVSTjvWRzNVexCWd/fcp5p2wzE5Hy5YRGLk=
X-Google-Smtp-Source: AK7set+80B1mbcZ2UtDiBHFl0Y62ELvc7k+hEC/ju9e5WD9eqbKmQN0Vk/erKURGY7Kle/sb0kqTvA==
X-Received: by 2002:a05:600c:3d92:b0:3df:ee44:e45a with SMTP id
 bi18-20020a05600c3d9200b003dfee44e45amr4938641wmb.15.1676555356886; 
 Thu, 16 Feb 2023 05:49:16 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003dc0cb5e3f1sm1557933wmq.46.2023.02.16.05.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:16 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 3/4] qga/vss-win32: fix warning for clang++-15
Date: Thu, 16 Feb 2023 14:49:10 +0100
Message-Id: <20230216134911.6803-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x329.google.com
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

Reported when compiling with clang-windows-arm64.

../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
    return hr;
           ^~
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qga/vss-win32/install.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index b57508fbe0..b8087e5baa 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -518,7 +518,7 @@ namespace _com_util
 /* Stop QGA VSS provider service using Winsvc API  */
 STDAPI StopService(void)
 {
-    HRESULT hr;
+    HRESULT hr = S_OK;
     SC_HANDLE manager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
     SC_HANDLE service = NULL;
 
-- 
2.30.2


