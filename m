Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99155BE7C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:44:27 +0200 (CEST)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o641H-0002LO-1V
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Ev-0002BJ-Ml
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Eu-0008Fk-96
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:17 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so14628330pjl.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+d9/jr06nswWZQd9Uw/cJzKLCMbhQR5Mz1vx++OuQjc=;
 b=m2BdSOuDP/An0yZke11I+RfufApZBTFYghcf61IYewiSeOUVWISuF/xaDKerW4M2rL
 hKF6rHsiXmTPwtRcGptOGPt3rj+FHN1GcOs4iuZlH47O3GIEn98gOAgkl0VeZddlLXu1
 GHTN9stlJmr5ZW9j1hW5mqd0kF79UryqVmVtncaWi55zJ1CryfSKDGiJE/lMuX8l+4S3
 nBjeQ6x7ihUU5vTNFRAluJdMrbqWenKwnWejYBfhA1IZHYXa60J8suine2fcpdsSxEzZ
 Mc2Ece3nu6hRVWowuczkNBkgpZ49gsq5/zJ1A5m5Gj2aHh3hJU9iVY5pR85WBb23NLEd
 cE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+d9/jr06nswWZQd9Uw/cJzKLCMbhQR5Mz1vx++OuQjc=;
 b=3kE/NwVkAv4+Uhtfl1vyamFui3gPTWnX0ABhSbQoNvgUahXEBN589D2kZzwXmNRprJ
 LIAFX1nIme3rPszSGXhP9nJsMii9naETWAtL/yKsj/gykNB4qlpO5F50NkM0ken/ezg3
 fL/rrPFEGSHtBsiTkuP0qnlygHQLBKJ5bISJoTBeo02csOTXP2LGh12HcsUtRi+oWJxl
 fvK/NCaHFu5jtF2QEGknlSpIiwcEYXcY5sXXsZ4fYcB8Tg9OGktD8nGfMNtecDLShP57
 n/QCsKDN7SUu5sRV81qWz57xFSg/xonzCWPRX6zzMk67lfUM/DW8N9SHZd2cQbCZPlQF
 xVrA==
X-Gm-Message-State: AJIora9WbglV+HZ3r+/4ZNyWX04DMm+CEWmyfZwaodfphdmq6I6g+kXi
 CcjlvWdxvCELQ6YZ1kZkJmvgfnCQtD9GaA==
X-Google-Smtp-Source: AGRyM1vgnFlm4QvMI8hbpqF0VueS9mIaKILjLu3XbfiPIlyeGpdbDYWn+IIamHF/9PMXxAOGtcjoOg==
X-Received: by 2002:a17:90a:404a:b0:1ea:e936:b69 with SMTP id
 k10-20020a17090a404a00b001eae9360b69mr19594783pjg.133.1656392055506; 
 Mon, 27 Jun 2022 21:54:15 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/60] semihosting: Improve condition for config.c and console.c
Date: Tue, 28 Jun 2022 10:23:06 +0530
Message-Id: <20220628045403.508716-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While CONFIG_SEMIHOSTING is currently only set for softmmu,
this will not continue to be true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index ea8090abe3..4344e43fb9 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
 ))
-- 
2.34.1


