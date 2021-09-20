Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4394C41176F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:47:46 +0200 (CEST)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKa9-0002dR-9h
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9c-0002ly-0T
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9D-0000kH-PT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id t18so30265288wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oJWGG0JdBpLhOwy/LInBc6DCuO9q1gJ124d/ZYIe79E=;
 b=MhwQMSCdCC/nzqcHe1OdBzaE6Z9wDfyNqo4XgGuinbf8V82HM7Zx0W53AKiwCvb88V
 Y9I30metp94JWlwHwwyAAFfrthf3VghBioUtipHx1OwG9cvii6HLvLtufbyUAwSuM1in
 sUbaeaHrPt2XFEXXZIWG/AuAWF8eTkgPOOZbOLBZp+pzrryykWkhXvpQxWfXtJxjWXqs
 SIeVr/UiUvDaiYoPL0pI1VTsC9u4euHQNKfCdEWZsKJupQI6Q+iPEyCyRvyUwGawx/5C
 TE6IvDyMiP9ArQ65ILx6r13/jxVIf1DJd1FWK0M9tgn4EsNiCS5sCvUz6/t8KJvGZDz2
 AIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJWGG0JdBpLhOwy/LInBc6DCuO9q1gJ124d/ZYIe79E=;
 b=b3YCxbkS0g7PF0QSSvAiFG/6ecP70E7hYrCCsDbn67Lws3IwscbTXhC1L9TgxoG7LH
 VA1MzlHe51HJIdvjit0sQxFyVPPls25ezVOa7EDA5awesBkAKmFZtnymc7rQNSGSFrPC
 NWzTX3gOOaPgYU7BTf0uNX9kt9yEEPK57jA+Ny2LCEqR88AC3uvAnW9kTYoY7N8OJ9Kq
 Y5M8br8MKbIgiveBUtnKh0fK2JPfwrE1CpE/fyzKCHvMdSI5ACFV8J8Ui6o02twaCSIy
 2ITn1EPUO+F7AIxaRdhufkKeSwTJaIfooteo0O4EB1pnoyKtgMQfKdHUPSYXkAxM2b2g
 YYqg==
X-Gm-Message-State: AOAM532MhRVonS2egT5/eLqczKWReuJJ5A9b6DPIsOxW2DXrPRdmYF5x
 4EL8JlQYauMBwzgJX/Kw2Zyoj/6iTqIOoA==
X-Google-Smtp-Source: ABdhPJzp7OTyPVo9nVTA+AEYIq2zUyYz0JDnIwuT2kxmTcHmWIfyixHQyD2wLsXGkkCNKsCG9y8EQA==
X-Received: by 2002:adf:8b52:: with SMTP id v18mr28267153wra.1.1632147590109; 
 Mon, 20 Sep 2021 07:19:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/27] elf2dmp: Check curl_easy_setopt() return value
Date: Mon, 20 Sep 2021 15:19:21 +0100
Message-Id: <20210920141947.5537-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that we aren't checking the return value
from curl_easy_setopt().

Fixes: Coverity CID 1458895
Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Message-id: 20210910170656.366592-2-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/elf2dmp/download.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/contrib/elf2dmp/download.c b/contrib/elf2dmp/download.c
index d09e607431f..bd7650a7a27 100644
--- a/contrib/elf2dmp/download.c
+++ b/contrib/elf2dmp/download.c
@@ -25,21 +25,19 @@ int download_url(const char *name, const char *url)
         goto out_curl;
     }
 
-    curl_easy_setopt(curl, CURLOPT_URL, url);
-    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
-    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
-    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
-    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
-
-    if (curl_easy_perform(curl) != CURLE_OK) {
-        err = 1;
-        fclose(file);
+    if (curl_easy_setopt(curl, CURLOPT_URL, url) != CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) != CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) != CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) != CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) != CURLE_OK
+            || curl_easy_perform(curl) != CURLE_OK) {
         unlink(name);
-        goto out_curl;
+        fclose(file);
+        err = 1;
+    } else {
+        err = fclose(file);
     }
 
-    err = fclose(file);
-
 out_curl:
     curl_easy_cleanup(curl);
 
-- 
2.20.1


