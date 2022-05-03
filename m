Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F604518DBB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:04:24 +0200 (CEST)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlykx-0004yI-3R
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVy-00012N-Az
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:54 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVw-0003Wq-Ow
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:54 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so3204444pjv.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yYl4ubh19IwlWlMYqHs938Y3A5pmp6ChkIekWgSMVhY=;
 b=CQu8NFjI5KIdFmNP/grBRFku9EHiYne5J99g7KsDQ51F7cdNQy1FgMjKXaO4s6Ibmj
 iJtzQHeUaYCH6SaKP4Jc+oenaMHto58Oo++eZiOanUDowgZTS9CdHu2AZPX4VqznmVZC
 OLcUc2ig+xGJ1jZ2fA/jsgcTrxDZylPtYHOJnSswOH5J9TLLLHJhclF7is7rSj6gLl4v
 QEXoKE2RBKTdIPRmNmJRILOVH64j0m1itiDt+MUDtPk5y/f5/ruNavNmLW01KTqWImHO
 OIWgc0v8eez6DyP8pi1fCxRxgDBI4l/NV2GDudSWznhAfL0Y+yqQ0r/0eZTdpckSkugg
 EEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYl4ubh19IwlWlMYqHs938Y3A5pmp6ChkIekWgSMVhY=;
 b=onmYkiPfuVmpjVgYs2AZDSvzbgGHSrTRyAfI3rXTusvxwwpxKWBE+ALQhWRNS8ctS9
 lMIBmviRCFcCdJYVyLMM/gyg3raGvePR704ifgcCfiCErGOYK0M2Td/hcQ7s52P5XS6D
 o4Ewi+AUzMRnYcgnpdCjignAOzoWqYU5JzlYRDYeetr/+J/ErtLaA60quasWbUdH1g6P
 v2sqE2xuqfx0FoGPT9xm6BaAZG5xFAo93iTiKIOyDqSSNDR4/3Sals5Vkkf7CU1Z4eAf
 mta9tthoY8Kj5SDvJNFvezlCKxZACV/goQ8c8abhpUEQYG59zWUZLV4UOi3wkwcD3v28
 tU0g==
X-Gm-Message-State: AOAM530qVPxMyKUAvq5Aj3vqOABKh4N7XKYQWkld9+BoQvcdGogX2Riu
 RXj3PcW6z4YvRJaE1JMYYZtOEo8eOUM9XA==
X-Google-Smtp-Source: ABdhPJxudx7FFpHu8ylMbNS36088GAYHlonuWxlsDqc46Q2dOiHnkbo7BJAuSSadXqU8+lWW6fE7GA==
X-Received: by 2002:a17:902:ecc8:b0:15e:9e46:cb7e with SMTP id
 a8-20020a170902ecc800b0015e9e46cb7emr13056067plh.111.1651607331472; 
 Tue, 03 May 2022 12:48:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/74] semihosting: Simplify softmmu_lock_user_string
Date: Tue,  3 May 2022 12:47:35 -0700
Message-Id: <20220503194843.1379101-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

We are not currently bounding the search to the 1024 bytes
that we allocated, possibly overrunning the buffer.
Use softmmu_strlen_user to find the length and allocate the
correct size from the beginning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/uaccess.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 3cd809122c..f5fc94c401 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -54,20 +54,11 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
 
 char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
 {
-    /* TODO: Make this something that isn't fixed size.  */
-    char *s = malloc(1024);
-    size_t len = 0;
-
-    if (!s) {
+    ssize_t len = softmmu_strlen_user(env, addr);
+    if (len < 0) {
         return NULL;
     }
-    do {
-        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
-            free(s);
-            return NULL;
-        }
-    } while (s[len++]);
-    return s;
+    return softmmu_lock_user(env, addr, len + 1, true);
 }
 
 void softmmu_unlock_user(CPUArchState *env, void *p,
-- 
2.34.1


