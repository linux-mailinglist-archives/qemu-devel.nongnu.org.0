Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19A2FC051
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:49:11 +0100 (CET)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x02-0006VA-63
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wAX-0006iO-9F
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:55:57 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wAS-0004NR-3l
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:55:56 -0500
Received: by mail-pl1-x62b.google.com with SMTP id be12so11048581plb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uAL2T6hL0VNfqKmXHRv2i6zPWgXaNJCsr5tm1nJ2i+w=;
 b=pchnoq/K+93B1yTlZ2wEDY8BSgCVpCbwkmEsTOVapxx95HA4tdATS10dHCsfOId3j5
 rYLVfAYtwPIkzJ72fvVk0dzM7JTGDcWfw01SqwC+dgfDqjo0Ds/+eRi6hwQVAfyKtWYo
 jom3J/dinN0z1C93TVtX4I8hhEhQzrZut1OL1OsWrjsrHne7qua0neKmjIN2iunS10LN
 WtZX3EnkTXC5ZaA1fy7JBtZ+TiLwhP+L9o/8MiQ8yn/KajOOWFBc1wmyw3bkzVQIpHx5
 8W0mLkiUsf046bBHAg6IlSxAKeMvDonvp7w6L3lTFCxs2yvrMkM7s9+utD95vgkV2Std
 saqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uAL2T6hL0VNfqKmXHRv2i6zPWgXaNJCsr5tm1nJ2i+w=;
 b=MhOf6N2eLK09onlgdV2D12Eqow4bpMBnQwc7rUcL+HCL/Oagd+ae1YoDmxm0VvdDP5
 swOjtvh0DYNK6EP9N5su7CNZ7qYgbb/EZEyAnI4oPqV+uXQI7jLkptbIW/LDTZxBgWqB
 cW7GNLhpIOUpxhznY9E7W9EIEjTB1nbEpD/qjNHVLwPWZo9HKgUFUZsEwUGnuzKoFJly
 bY1i7EsLkzbrxyfJmCy+dVlmA6u3jemKjMFtVD3AXe/srnhETbMcCsp1iPK1DgfE0iMw
 FOy1GblZSn0ZXMfId/Mgyc8ZT0Sts3daxcDxhXeoAD4HZXoC9e0dGi4S10i/OaMOLjkQ
 UdRA==
X-Gm-Message-State: AOAM531/HLR+l6QgKfmrBA5Job9uBUge3V4t/Zs6WdR7bVihTwMoPWep
 V9dGdRc8Wb/USNATc/IJ8DAEazZqSNA4IA==
X-Google-Smtp-Source: ABdhPJzQYCYgRIETZV0ZINFUmaoeS4NmuToQ7kd06vpvobDXW1ZqPge7hi9yBH/Vj2a+0OZ9yg5ucA==
X-Received: by 2002:a17:90a:4490:: with SMTP id
 t16mr1201415pjg.55.1611082547012; 
 Tue, 19 Jan 2021 10:55:47 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b203sm3209624pfb.11.2021.01.19.10.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:55:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qemu/compiler: Split out qemu_build_not_reached_always
Date: Tue, 19 Jan 2021 08:55:41 -1000
Message-Id: <20210119185542.628456-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119185542.628456-1-richard.henderson@linaro.org>
References: <20210119185542.628456-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a symbol that can always be used to signal an error,
regardless of optimization.  Usage of this should be protected
by e.g. __builtin_constant_p, which guards for optimization.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index d620a841e4..cf28bb2bcd 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -215,9 +215,10 @@
  * supports QEMU_ERROR, this will be reported at compile time; otherwise
  * this will be reported at link time due to the missing symbol.
  */
-#if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
 extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
-    qemu_build_not_reached(void);
+    qemu_build_not_reached_always(void);
+#if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
+#define qemu_build_not_reached()  qemu_build_not_reached_always()
 #else
 #define qemu_build_not_reached()  g_assert_not_reached()
 #endif
-- 
2.25.1


