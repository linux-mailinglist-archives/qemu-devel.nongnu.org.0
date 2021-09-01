Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571063FDDEC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:43:56 +0200 (CEST)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRT1-0002zI-AW
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLROW-0006UT-Tw
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:39:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLROU-0007GG-Ou
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:39:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id x6so4820821wrv.13
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jv2xWtDIw2LfDLHnT/A2nMBA0chq8cqfSt6+2jGOSyI=;
 b=Z/itiPK/HNQo1AQvPxPy2Q5LugRE8cN0vXoS9f1WpG1PY6iBqChwHar2kMH4tQfuKZ
 yoqYH4XluYRaUkovoel+pny46ATlF3sbsQtrZVqrHmpdQdvIwx3KBfEX9hJseDoQ5OgZ
 C6vYf77G+hIIo35KaY1mJpPeyMKndMiOoOeYtaIimoKgOFJEAwmnTm+fcQOqu5dBcHyi
 MmePNu7jy6TS3rvJms0M4GcTDfL+os+/KzXAw+wXeIt2S8sfuaYUSHwWHQGXhMEkwCd8
 VqMwYWI13ZVmkFbtzk9u4bamHTpFAd9j6x2wpIzocw7WaLH96ENVJvgWu2zyBiA8YW5A
 Disg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jv2xWtDIw2LfDLHnT/A2nMBA0chq8cqfSt6+2jGOSyI=;
 b=uipW0/8fdJSraWBvmcSU4hUaJ+Um4BDiC7wL3kdTCDBpPgpVjxHb8XXHYeb4Oc337T
 iJ5P9F9Pv9PwYXRPJkg051OWGEYjrdfrjxT+zqYsDEdlceLLxul+zvBrKanZcx/rDRuA
 yX/MMliatHYtqLZd54N8Fyf6p2jI2Fsy9PjWFnUQXD7XCE8nhydpDVcnTq9jw8RdQo1t
 sazSRU/YNDcbPErixaQpzv97T/wZrDWcCbefHZZneq1aKix1b//ex8y6lOI1RZWSFFMy
 uu4KrQUATT+nFC30sL6KKoxQwC3wlnUU7c9q7epXoHI5dSFs6/N+xa3xxsomoD+0ZE5a
 moLg==
X-Gm-Message-State: AOAM5321pA0YAUd/Yd3EjTxjppz5v/JEnmuiPTy5jF6hyUbFwlewEwlD
 GHDDrHSyrUojLFjGwdPNV29ULDkFNGGmJA==
X-Google-Smtp-Source: ABdhPJxbwxK3k8nicXAwDtu9NGuykPOGDwUJMscnlHshuMNHmjQMqX0ZAQppmvpuPnTmmPcgSb5ClA==
X-Received: by 2002:adf:c452:: with SMTP id a18mr33169956wrg.225.1630507152952; 
 Wed, 01 Sep 2021 07:39:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r10sm16907461wrc.85.2021.09.01.07.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:39:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] elf2dmp: Check curl_easy_setopt() return value
Date: Wed,  1 Sep 2021 15:39:09 +0100
Message-Id: <20210901143910.17112-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901143910.17112-1-peter.maydell@linaro.org>
References: <20210901143910.17112-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that we aren't checking the return value
from curl_easy_setopt().

Fixes: Coverity CID 1458895
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/elf2dmp/download.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/contrib/elf2dmp/download.c b/contrib/elf2dmp/download.c
index d09e607431f..01e4a7fc0dc 100644
--- a/contrib/elf2dmp/download.c
+++ b/contrib/elf2dmp/download.c
@@ -21,21 +21,19 @@ int download_url(const char *name, const char *url)
 
     file = fopen(name, "wb");
     if (!file) {
-        err = 1;
-        goto out_curl;
+        goto fail;
     }
 
-    curl_easy_setopt(curl, CURLOPT_URL, url);
-    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
-    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
-    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
-    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
+    if (curl_easy_setopt(curl, CURLOPT_URL, url) != CURLE_OK ||
+        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) != CURLE_OK ||
+        curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) != CURLE_OK ||
+        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) != CURLE_OK ||
+        curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) != CURLE_OK) {
+        goto fail;
+    }
 
     if (curl_easy_perform(curl) != CURLE_OK) {
-        err = 1;
-        fclose(file);
-        unlink(name);
-        goto out_curl;
+        goto fail;
     }
 
     err = fclose(file);
@@ -44,4 +42,12 @@ out_curl:
     curl_easy_cleanup(curl);
 
     return err;
+
+fail:
+    err = 1;
+    if (file) {
+        fclose(file);
+        unlink(name);
+    }
+    goto out_curl;
 }
-- 
2.20.1


