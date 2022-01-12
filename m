Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364B48C34A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:38:18 +0100 (CET)
Received: from localhost ([::1]:53572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bxJ-0008WN-E2
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmu-0002cE-GS
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:32 -0500
Received: from [2607:f8b0:4864:20::930] (port=36515
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bms-0003Nf-D8
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:32 -0500
Received: by mail-ua1-x930.google.com with SMTP id r15so4128240uao.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RloSuI0Jr/ZxHwMFrsFKsR8b4g1vVCA7iOPpJ0mZCiw=;
 b=KhBSd0N4aei+wy1/WgWm3lHY+Plhcuzuw4HVg9dP1XbcaYsHJaW76vEYudKjlze9ZQ
 YJQ3hUdTGzuwUVGpPXH0X0xkE0l7zDOqxrnfuK9Fa3S7PIqOVT63SIXEk+JEF3xYmKq1
 m1nKaX3FyFnlhmbbeqAsgpnJGSQyLXzhZU293y5f9r6BfLvJgqwqKozUJRJ5PG4JaXwr
 c/2q3pai0UnF8sqZ+N9S/GzLPPrqj3vl6DZ8tNGeVWAFHFLfyaWRx+FVBRy1dCdK8x9v
 ChZnhmhJ8IeXf9rTNyxCT5tLWnl7/4Sz6QB9kJ3cWe3fj0ZsLDagq34xxMkLrqJLec4P
 wCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RloSuI0Jr/ZxHwMFrsFKsR8b4g1vVCA7iOPpJ0mZCiw=;
 b=zm0/ekjea2j8GmsjzGyN/50Xm3mteFvUPufdDEiXi1PGlu1wne+9JwYm7fr6MMLo2C
 XltYy8vWVzDmEgEu0c1n3UEFHeHQPHPv5Eyz/LhspgR2OorgxiXxYxdwGIeRCtDH+RpN
 aAR/kTGu042votCNaKgIIrsEHIhlAGSE9vMHppgdqNv88tgQkejwK5UmU8ugLHRYmjbf
 obxeYr/gO+EeJNgVpZAzXbTMI9zdjQJhge1dDwDtyegH4uxACxs62mjQLWtpGpuTRhdp
 aOb+WWplhVOrKtoDNKHeBcXnDWONgUTTptPLMKEQXv9JJlUIGe8Pq5LZ5Vs79qWWCxij
 e8DQ==
X-Gm-Message-State: AOAM533a7WTv2THyEDwgovuwTxLyfC+y4G0Ltx89bAD6cdI3JFHpm49H
 O4hVkEjF1Bkume07fFrV7u0DRg==
X-Google-Smtp-Source: ABdhPJxgU0kA7wcGWwNMQW76iRZyaYWbIlDwTw6te9ui5Wou21BxX7+6YgFbR58dIfPI+qVEDUROLw==
X-Received: by 2002:a05:6102:ac3:: with SMTP id m3mr3977069vsh.1.1641986849536; 
 Wed, 12 Jan 2022 03:27:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f1sm7063861uae.5.2022.01.12.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F5891FFB8;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/31] ui: avoid compiler warnings from unused clipboard info
 variable
Date: Wed, 12 Jan 2022 11:26:52 +0000
Message-Id: <20220112112722.3641051-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x930.google.com
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

With latest clang 13.0.0 we get

../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
    g_autoptr(QemuClipboardInfo) old = NULL;
                                 ^

The compiler can't tell that we only declared this variable in
order to get the side effect of free'ing it when out of scope.

This pattern is a little dubious for a use of g_autoptr, so
rewrite the code to avoid it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[AJB: fix merge conflict]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-2-berrange@redhat.com>
Message-Id: <20220105135009.1584676-2-alex.bennee@linaro.org>

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 82572ea116..5f15cf853d 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -62,13 +62,11 @@ void qemu_clipboard_update(QemuClipboardInfo *info)
         .type = QEMU_CLIPBOARD_UPDATE_INFO,
         .info = info,
     };
-    g_autoptr(QemuClipboardInfo) old = NULL;
-
     assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
 
     notifier_list_notify(&clipboard_notifiers, &notify);
 
-    old = cbinfo[info->selection];
+    qemu_clipboard_info_unref(cbinfo[info->selection]);
     cbinfo[info->selection] = qemu_clipboard_info_ref(info);
 }
 
-- 
2.30.2


