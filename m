Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50133407043
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:08:43 +0200 (CEST)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOk13-0002RL-8F
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOjzY-0000aL-0a
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOjzW-0004a1-H5
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631293625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J6grQHEVtN6t6ceYCiTjy1J8psdb3VCBa42DzLh0ro=;
 b=Wz1G1lUT4qZLfBQWVezrKm40Lsi5P04dx/4lLBRmE3/LoJ08b3o3/inkLbWdoKcz2td2+B
 BfbITM1wdqKMja4DIadEefgI5FsfgKtu55DJi5onSqWaRcyK8WvSNgvS3mx/ASDm0uHXcs
 oT0kvHkXGesVZVMFLK5oCMlBQlqLpW8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-Pz_zh2KQPVOFadhictixpQ-1; Fri, 10 Sep 2021 13:07:04 -0400
X-MC-Unique: Pz_zh2KQPVOFadhictixpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so761878wrr.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+J6grQHEVtN6t6ceYCiTjy1J8psdb3VCBa42DzLh0ro=;
 b=6ksnvVNRA1cZ6zl4W3qDw1vZjl12cxiWYokP55qhndN/NhWzq5cWs0Jd0/rUobqkCF
 OtHFzfphe/ukifmbbXcfn8IMAnZmAXOBQfqgGNrB6X7v5B0soS7KeHF2ezF9IhEa6RvM
 Cc45dwh3sW9U1PnMTvnz9ZnFmwNqpSP++uPgxnW/1LJFIc0rutAA1qtM555YSBtdKfoI
 4Wb2747K9Ll9UKKOvUhHodvqvVNwK2y7gX5of+vOiFFOfrPwiDXM7X1zn/uc8u3E/Pu7
 ZxIXsvAoI7c++zoOmvhGeMFpgFNx99EyJYekWkWQC0/3/t9Lezvx/ptV7VKndVmooiub
 FHfQ==
X-Gm-Message-State: AOAM530qpYpP1q6ZXM1IjbjvDx832f7ILQyciE7mtDeOjrgD1ChkE0pw
 QIzwhcgpEzarWAlKL7UpOHvNY3cqpC6WmgOH88HQfoedtCvJqP/PgNYhIppjNHrXEsuLoZNMynj
 ZDVlsttIBDdgLJndruv3v76OZMWocdxdZ54+WzFRpVaSaxol7e1w8/+qlNqIu1sIA
X-Received: by 2002:adf:e10c:: with SMTP id t12mr11044275wrz.36.1631293622959; 
 Fri, 10 Sep 2021 10:07:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLEuQvoH8Q4d1gl0AIR6gDpffsEipUhurj8eO/D6QvQQ3qUnATr9au9snwEJq1wsw2L1iVZA==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr11044239wrz.36.1631293622698; 
 Fri, 10 Sep 2021 10:07:02 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u16sm5233423wmc.41.2021.09.10.10.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:07:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] elf2dmp: Check curl_easy_setopt() return value
Date: Fri, 10 Sep 2021 19:06:55 +0200
Message-Id: <20210910170656.366592-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910170656.366592-1-philmd@redhat.com>
References: <20210910170656.366592-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that we aren't checking the return value
from curl_easy_setopt().

Fixes: Coverity CID 1458895
Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Informal T-b tag on
https://lore.kernel.org/qemu-devel/20210909004313.1dadb24e@192.168.1.7/
Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

v1 from Peter:
https://lore.kernel.org/qemu-devel/20210901143910.17112-2-peter.maydell@linaro.org/
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
2.31.1


