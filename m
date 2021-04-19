Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52759364CE4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:10:55 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbAU-0005x4-Ce
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQO-0006yV-E0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:16 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:34723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQM-0002TB-Pv
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:16 -0400
Received: by mail-qk1-x733.google.com with SMTP id y136so5097234qkb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yfv64dvMhdyEtoyrk3pC9NLOz70qBRB1xfI2zMRjLVI=;
 b=d6DmnOsKPEMOwJIhV5jigan/+j0IzvKP4qJwp/AFeFhul7j/0FhxT82VykeWS+Xj/Z
 m85bTLoMRFKdNFqZ1Kafs1wsw0u6BJLyv/7nqbIW+tBzCwgsSmc6FChtj+/0AAAav9CP
 f2jLtZuT2DH4sPg8MLdRGWmElyCSB4BHNM1V7Np+RqBH0jZ8Y9iMuJ28Lpo3yY7LO9iC
 wCzRp6huA1F4ubaty+6YCrW1PQcSILz2JR1aWPmSGfRoTOUuuBxhkb6+D4KE5UNM2wx4
 DCvTmUVb93Ddd8X++2rA6fPkhj06oGI/r/u7f2harn5vtuYpjmkCFj9J01mmSJF07So/
 haQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yfv64dvMhdyEtoyrk3pC9NLOz70qBRB1xfI2zMRjLVI=;
 b=X7DdFJ9KdHgiQRDzcB4Ow7xhS9MI/LANRzQlYuG/aisUcwtaXlIdBh87RcOLrM5pbm
 oBSzXWOk3A644qFfGOW3EDflq9/+Zf+0X0Daq7TcmD6c2VUN1AZFmFmAkoW0LnUIBPn6
 zjGd70P+1x2WBvMRW8m7gTTGndyUItU38tWd3eSri3qZ6itZMzVRsP66LqEikd4sPjDR
 tLBmRN4uqQ9iqAxauOla9rADBo0MZO1TPOoVhv8+qXx9cgRFYtpkuKeEmQsXNnAgENOm
 kts5LOBx3XvkC/pTI5/f3jTq2+6qC7A7yHgAyYurUHZeBMSeUauRXVmSUBHS3KYwbm6l
 UFDQ==
X-Gm-Message-State: AOAM533chXrKoSjHlHcpbo980Q8+u/gBFgPucR01l1gDV1abcqRaC+Xj
 5MrB7SWM+wvbbxdOoSW0uE96Avvn33Wa7zVm
X-Google-Smtp-Source: ABdhPJxak8XSvc9sO557NIpOTFS9zHU6lsN4K5EyG1AcH1cCkM6yht/STccZfKEpje501vmI0mF4JA==
X-Received: by 2002:a05:620a:1254:: with SMTP id
 a20mr13950049qkl.15.1618863793832; 
 Mon, 19 Apr 2021 13:23:13 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/31] target/arm: Use cpu_abort in
 assert_hflags_rebuild_correctly
Date: Mon, 19 Apr 2021 13:22:33 -0700
Message-Id: <20210419202257.161730-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using cpu_abort takes care of things like unregistering a
SIGABRT handler for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4aa7650d3a..8275eb2e65 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13257,11 +13257,10 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
     CPUARMTBFlags r = rebuild_hflags_internal(env);
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
-        fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
-                c.flags, c.flags2, r.flags, r.flags2);
-        abort();
+        cpu_abort(env_cpu(env), "TCG hflags mismatch "
+                  "(current:(0x%08x,0x" TARGET_FMT_lx ")"
+                  " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                  c.flags, c.flags2, r.flags, r.flags2);
     }
 #endif
 }
-- 
2.25.1


