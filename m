Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BFC2F0A8F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 01:17:09 +0100 (CET)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyktQ-0002PI-HT
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 19:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyksa-0001x9-PU
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 19:16:16 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyksX-0005gB-Ir
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 19:16:16 -0500
Received: by mail-ej1-x634.google.com with SMTP id n26so22311112eju.6
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 16:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4H44edmGbBssX2juyIV99D6rMCfoLIg7F4xjMwjZBIU=;
 b=ItU7NRWMzX8RzPD+701pr36ksgUCPxhza0pEPX8OnWxKRf7UtWu8MdgvZcG6cTHC3Z
 TqyrNeDsUiB7Td36xxfF5xDGR2K17M/Fb2cqX8NC6iZvAGWQbcKF+LNiBKEAx9gtkfBp
 7YI2jOTxjT5lJSDDZvj/W3gvoINOHso8YGH0wLm6em6DHXHz01Ow29vCjUBMQKYZqY+1
 WVjCBpBfbvE0f+BiCcNW/Z8vHkxfo2Z4sgQWzqlhw4z2AoGtjKfFhXf6CZ6zGkU56oWm
 eU94WT+k+3K9HD8y06mAxZ+B31su5XE2877MEl6lmH0Rm1ecSl2U6mCSpOoXiPGbirQd
 FGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4H44edmGbBssX2juyIV99D6rMCfoLIg7F4xjMwjZBIU=;
 b=pYJFp1VX+dWeD35eWIKm/K7mLmYYVYvOPN8163N2/PQc7Vm+ZRFnQrLe9rbxzrxRbu
 kDJW+BlIukMYyLa7Gd1ZzihHV5h3AVz11SR/8//NKNvc7JXT1i5PQT0QZYiFcy0cDwH1
 aJ1NlYp0E958HUuBJfLX+aUGEH+DO7isC1/MT5dLsLC4pVZjtMYPeh2cycOgw/yynH3e
 KtxKRzawwSbDMaGM6ruaRYUgIJSjjtdiudn2cqjlDgLhY4k6d4MJ3mFlGVLqThHU4Ggd
 q8sLyHbaidJnVpTYK7b0mQn3B1LTKTpVEnLfm5mpQwkozzZCsn0JooMXI+KRFltJ0iwn
 25Zw==
X-Gm-Message-State: AOAM5331eyRfGclu/I9dAoguEMO7j676c8eASBI7dnzeVr0EecQpUxoE
 UnUiCwWd128xR2HMifKEPjxvSlSbv8w=
X-Google-Smtp-Source: ABdhPJzBqjy5C45isevQVysqMZUA2dLUcRHUND1ryW9FcFSOiA1W6IUgVz7aY2h78W4FL8qwb03qCQ==
X-Received: by 2002:a17:907:435c:: with SMTP id
 oc20mr9503916ejb.286.1610324169972; 
 Sun, 10 Jan 2021 16:16:09 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id g18sm6946421edt.2.2021.01.10.16.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 16:16:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] util/oslib-win32: Fix _aligned_malloc() arguments order
Date: Mon, 11 Jan 2021 01:16:06 +0100
Message-Id: <20210111001606.1122983-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?=E7=BD=97=E5=8B=87=E5=88=9A?= <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit dfbd0b873a8 inadvertently swapped the arguments
of _aligned_malloc(), correct it to fix [*]:

  G_TEST_SRCDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/tests
  G_TEST_BUILDDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests
  tests/test-qht.exe --tap -k
  ERROR test-qht - too few tests run (expected 2, got 0)
  make: *** [Makefile.mtest:256: run-test-30] Error 1

[*] https://cirrus-ci.com/task/6055645751279616?command=test#L593

Fixes: dfbd0b873a8 ("util/oslib-win32: Use _aligned_malloc for qemu_try_memalign")
Reported-by: Yonggang Luo <luoyonggang@gmail.com>
Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Suggested-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/oslib-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index e6f83e10edb..f68b8012bb8 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -59,7 +59,7 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 
     g_assert(size != 0);
     g_assert(is_power_of_2(alignment));
-    ptr = _aligned_malloc(alignment, size);
+    ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
 }
-- 
2.26.2


