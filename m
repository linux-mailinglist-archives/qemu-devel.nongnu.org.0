Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346AF4E1C82
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:14:10 +0100 (CET)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVyC1-0004QH-AB
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:14:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyj-0005L8-Af
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:33 -0400
Received: from [2607:f8b0:4864:20::102e] (port=52744
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyf-00066Z-Uy
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id v4so11198476pjh.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KZBECJuFzSTuUllaWSNHHnhE+hoPlqid0qBz/DeJefU=;
 b=O+qkYok2WTe2y+ObCm7xx7AYQTVqg5ujkrnJqDwfC7xbrex+/cc/pDl5Gz6wdeS+D4
 gHM6SYBEbVE7Lzmoe1R+H8rXQD62N31TQULShjIkRKJ8bIfCIu0qNnSR4d7MKBFrfV4M
 RWqbaoMTDOU8MLPgvK1Ujs8wo14ZWNiCdJ8e9rjVr/fpkIDI5XmOiu0TVi8kItERYTTf
 1EN/Ka9okeygAvD1j9/pFfI5jS27GSMkh/v4pl+nL56D+lm/lJwzFcNVnx0gBdiYcv50
 qCUePzczT+UT3e9Ma0rIfu54Ik3HYjPrlpnhOM31TRygG9ngUzIAEt8g8F0QIk2OiN3I
 pX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KZBECJuFzSTuUllaWSNHHnhE+hoPlqid0qBz/DeJefU=;
 b=d92H3inqcdUuqYM1bqjkbIUn1CdDNL1hTkkirNjYeLxFgmhiw0fueo5GLUaORgQXX4
 zBI2zzuR8rXIi1qZYzcPLMEdVnT2QxDjCgyQEiZHRiPDcG0ExOCQN/7nb8PqFG06iHyH
 aXo5WukYewlkGJzN6VQYDRcyaX4BCFW9d/y8MiJDoM//kjMenqVp1KCuemjSb9uKlDJ5
 UzppgxIxKWQXFXFaZgYaAVNA31XQ0H9xGYZJuqCj82W+XYrUWtjeRQyIRP+hQM3r2PCc
 jpYPmCb06VGHg6vXM368kMpPlbQ3BEaYWWN2y9pGu5dyPnOmSiRDROCNR3F0BCJumS9+
 fAnw==
X-Gm-Message-State: AOAM531o1SsDm7x0DzZ4RVQf56jJTX3R57C5/9j9f2endZXToc2j5DH/
 3T0eRsxVtz+IznPzUAhTFK8aaz1FxuXJ2g==
X-Google-Smtp-Source: ABdhPJwfsArgpvCLGd7o6CxHdEir0VuFw1X+ijQgplhRB4yFAfn9OuLmLW0unufeJ028WsYSytUlJg==
X-Received: by 2002:a17:903:1108:b0:151:9c42:7d1 with SMTP id
 n8-20020a170903110800b001519c4207d1mr9078334plh.54.1647792020138; 
 Sun, 20 Mar 2022 09:00:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tests/tcg/nios2: Re-enable linux-user tests
Date: Sun, 20 Mar 2022 09:00:09 -0700
Message-Id: <20220320160009.2665152-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that signal handling has been fixed, re-enable tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.target | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
deleted file mode 100644
index b38e2352b7..0000000000
--- a/tests/tcg/nios2/Makefile.target
+++ /dev/null
@@ -1,11 +0,0 @@
-# nios2 specific test tweaks
-
-# Currently nios2 signal handling is broken
-run-signals: signals
-	$(call skip-test, $<, "BROKEN")
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN")
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.25.1


