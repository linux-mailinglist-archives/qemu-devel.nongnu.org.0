Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE89381EE5
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:54:01 +0200 (CEST)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGHQ-0005mN-6B
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG29-0003g7-Hq
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:13 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG24-0001L5-B6
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:13 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id q6so1876376qvb.2
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rR/O6eCn0zcsoJsAaT3zOMU5ZGw713+1KRblmR0NHXY=;
 b=LaA54A17xisnp9+1oBC4VYSuFx53RDypObxxUKTvnDSKlM6zIkqnBVdhhKtPWxDxgJ
 WWOcwl8NMedH+emKJrsZox8yErtx4ks+uFhSPSSyqfTkrgIpvy4avFijkUwJ6ZzLyMWx
 mZ/BFag+ZkcvPu1CmmhyVsA8p5+KSbYc697mT1QoF6nuSf0g7dAeEyVUt+zz814evmVN
 hhJ93aia+IlrIWv3RnyZ2P5kd5wG4z6usVrTcMWIA7ukqIQJGg7igVCiuynUH8ibAuEW
 zR7O0e0PnHbGxMDr8gCmTHjsQRnFe0GmjjtBnKzRSVEgPEbSp9w29/Zm9rF8n+xk0XwH
 XUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rR/O6eCn0zcsoJsAaT3zOMU5ZGw713+1KRblmR0NHXY=;
 b=cZtCGr4fdC0cUWF/RQJ1oYHepmhJM3iOh67fiG+67QFIA2oxxWpF2fgtrXsvaVzYBg
 8o8gT3Kwk+SToTbIAxHiCqy3bhjkn1nzNDnIQJ2NtDLUJEOureOvXLugG7XQup7YlJAG
 dNtW3EI8UdBBROdHkykhYKIggyg3ll6gZGCQP95M5kW2eBrATUUnPJJOOOvlaiFG3NVp
 WMjP2V+WQYtZ5Ps9EBSXT9cN4M9EWVuz/kfflj2vzWqWKcMewjpUOLIKNzxDqjYj/m1Q
 /+2ntvEkodudUBJMjYZr5qnBuLHVOPg0e/GKDhTn5dsNqtMtNpBoewHIvD0SgKi/gnnQ
 xO1Q==
X-Gm-Message-State: AOAM5324mSDAqT77+mzKEB/AofH8OjWmolWezhUiPYTauBWan0l+jz01
 kpuw0N9Sus5wTfarTdh3aI2rzw17f6NFByIJEl8=
X-Google-Smtp-Source: ABdhPJzH+5bMuvV+4jL0OZBYC4iZ5nY43i1KeFJsNa41q35t08PAgBaeJONbpuxhCblMsfBl0lchUQ==
X-Received: by 2002:a05:6214:248e:: with SMTP id
 gi14mr55274969qvb.7.1621168686518; 
 Sun, 16 May 2021 05:38:06 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 195sm8180765qkj.1.2021.05.16.05.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:38:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/46] softfloat: Tidy mul128By64To192
Date: Sun, 16 May 2021 07:34:25 -0500
Message-Id: <20210516123431.718318-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the formatting and variables; no functional change.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index 76327d844d..672c1db555 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -484,24 +484,14 @@ mul64To128(uint64_t a, uint64_t b, uint64_t *z0Ptr, uint64_t *z1Ptr)
 *----------------------------------------------------------------------------*/
 
 static inline void
- mul128By64To192(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t b,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr
- )
+mul128By64To192(uint64_t a0, uint64_t a1, uint64_t b,
+                uint64_t *z0Ptr, uint64_t *z1Ptr, uint64_t *z2Ptr)
 {
-    uint64_t z0, z1, z2, more1;
-
-    mul64To128( a1, b, &z1, &z2 );
-    mul64To128( a0, b, &z0, &more1 );
-    add128( z0, more1, 0, z1, &z0, &z1 );
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
+    uint64_t z0, z1, m1;
 
+    mul64To128(a1, b, &m1, z2Ptr);
+    mul64To128(a0, b, &z0, &z1);
+    add128(z0, z1, 0, m1, z0Ptr, z1Ptr);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


