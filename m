Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA11EF040
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 06:19:00 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh3op-000676-LM
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 00:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nZ-0004Ct-G6
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 00:17:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nY-0000jE-QU
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 00:17:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id q16so3121335plr.2
 for <qemu-devel@nongnu.org>; Thu, 04 Jun 2020 21:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRhkmFyLy+CEyb6J1D7iziceaKpzHBPMdBM2JQyWlqQ=;
 b=Vik2TrY3sbDhCQs1uBFALhsFBWnCSqhMTMGUe8vIHSiasqnFFjmoYlnOhCNyvtquBC
 6juohJ7GcuV4bxqiP07vD8fDhV2lTtf0Kcma4nHAB2TsSnD9FdskV68LR7tZmRTlf7s4
 coy0I9HR1cslWBpgA6D2J3CXk9KmceJI2BqdsQgA77T6hLP+LWhaheywD+RmQhyZVu1v
 HuadP5c0poLmf++YdVB6aogMIa9HI5MKsjqCj3AjqI18afaKUE4KgOt5WXK68M0egpD8
 JODNzDJMG9ZDB11/1StKL6Ay/wnEH9RIgQUZAMbaENF1NWZ995nrvZQ2juvAQtSspVc4
 uCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRhkmFyLy+CEyb6J1D7iziceaKpzHBPMdBM2JQyWlqQ=;
 b=Fjc9NYrmSIOgfMM6PnMtq5ndImetSFw+/3CREPRhBsY49ATmZJm2P82djQCB7w2aVN
 3ansqDIpX5ZOJG6+fx8oXx/Pbc1A6/z58Myp7EDVeTdMwv+OHCioYfhErwelRSaegaaN
 /b5jLjhSUpxWeXPmUg84RzgD3WpDVpe4oB366DFOh4OmqYvUix3BVRYjgJwxNoaFTIvi
 0muSDJ/1MCpi+MgpakWNp5KgRk1KDHzsdl6X/cVHIH/PE46bT32R9Y+qHlR96WSovPmt
 0rQSNnEP3kQaInFSg8wM+Yk75ENIpneKZzRTvyNyZ8vKEqPT4xN6AX6kxF+v0CsJANdk
 4giA==
X-Gm-Message-State: AOAM531VlNeNmCRR2xIXhhwsQNXQcl7EzJJsGa7VMhJQex/yQmZVzjhi
 P5rFG8GeNTOZzWGGEaBwWdTQQgKN9Gc=
X-Google-Smtp-Source: ABdhPJyli7hHRAflUuzYSn+oNzwISJOrnmSwDDnh6TBBuYBLrsBTHl4raY1YQ00q0Bt/lKIIll4Jwg==
X-Received: by 2002:a17:902:9889:: with SMTP id
 s9mr7367283plp.299.1591330659134; 
 Thu, 04 Jun 2020 21:17:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] linux-user: Check for overflow in access_ok
Date: Thu,  4 Jun 2020 21:17:19 -0700
Message-Id: <20200605041733.415188-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that addr + size - 1 does not wrap around.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index d36b18b678..2bf35e66ac 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -467,12 +467,19 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1 /* implies read access */
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return guest_addr_valid(addr) &&
-           (size == 0 || guest_addr_valid(addr + size - 1)) &&
-           page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    if (!guest_addr_valid(addr)) {
+        return false;
+    }
+    if (size != 0 &&
+        (addr + size - 1 < addr ||
+         !guest_addr_valid(addr + size - 1))) {
+        return false;
+    }
+    return page_check_range((target_ulong)addr, size,
+                            (type == VERIFY_READ) ? PAGE_READ :
+                            (PAGE_READ | PAGE_WRITE)) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1


