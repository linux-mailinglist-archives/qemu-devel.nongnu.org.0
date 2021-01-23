Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFE3017E9
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:56:36 +0100 (CET)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O5L-000327-Mj
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzU-0005C3-Uk
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:32 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzQ-0008Eg-LL
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:32 -0500
Received: by mail-pl1-x634.google.com with SMTP id j21so547470pls.7
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+XTAgpbLP+ZIDnz+giRotvFVeNq2GJ4eMelxbBgp91w=;
 b=ZpL8O6jKFBCXsgdOQeuNAMYhkiFqPT107HSoYPvbU2HgWcY+uZg5BHHMh7EhTCAUCc
 HWRh34E7kkcHkaoJCYAWGNONVXUN44lFOPOp3SBw5eb2isE8JNdM9DU8K0BNQhgGG5h3
 f6G391lyQB8sNjpzw1BG8UJ97Sy1JhiYeWRo8ltdK96ixSRRMjQ4Ejxq5t6A4JPxNiuK
 EZ9Ccpi+aV4XTdIOt/eonudFgNLwCYPNnHutd3olZ33UN3nPlI3li1fNyi0AGdepO82D
 9bnjJzJwW/qdx1V3RJT8fW6htbQ9+67RmiMz1yU5UyBOD5kIlwtSC0Euxbf0+O5HhduB
 Lsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+XTAgpbLP+ZIDnz+giRotvFVeNq2GJ4eMelxbBgp91w=;
 b=PF1fsxXzD0Gp5sAsacv3CIXqEHbA83z0LlvUzIj3x5KDlkQE3HDG68wQmqS4IVDG/S
 P8le2GtDLJFFnSViV6BkywsuDbJhaTa/XvYHAZkWyf3NbMStth5UOsMItWCVuYVNT89X
 DGqp5Gb/hvmUFbw/7YH1koV0wU61RAgBlGQrNdx8fNFrbo5HPyF8zKwqrnZT28lgEGA6
 2pY68lgetJiPZVljAaIPQT+jlHUpZK3C44kigzAepYPyP+oUVGcJiIOPyre7DKgVKw3h
 bIZaZXwudLuzcyQGBmxcwHpW4RjtYKoX9xfsuOFkqKvdg7pQMEOeuyCgGgTdI0ANJ/il
 eLeA==
X-Gm-Message-State: AOAM53069qWs63f4mdLSR8ZWWgkCxCvIrPW/6aaGzvHgzUypVDGAzPj4
 qpyheBpIGeOhxqJ42SyXhiCCE9f657K7Bg==
X-Google-Smtp-Source: ABdhPJwxM+fy01R7HYqrHpir2E1orSvc5ABkmA/SxPwlWvYhNIfhRBkLX5KI8/RgcgZR2dB9xcPueQ==
X-Received: by 2002:a17:90b:3786:: with SMTP id
 mz6mr12925603pjb.19.1611427826983; 
 Sat, 23 Jan 2021 10:50:26 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] qemu/compiler: Split out qemu_build_not_reached_always
Date: Sat, 23 Jan 2021 08:50:12 -1000
Message-Id: <20210123185020.1766324-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a symbol that can always be used to signal an error,
regardless of optimization.  Usage of this should be protected
by e.g. __builtin_constant_p, which guards for optimization.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


