Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBF53665B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:08:43 +0200 (CEST)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudS7-0004pu-3x
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8W-0001pb-Q9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8U-0005OO-J9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id d20so957662pjr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37l0ckMoMVGJpBF2TcV75mrqlQxEuC7DjW9Iu6LSXsQ=;
 b=ueFR14+ijZS+k2WNkkM1f0iwi4l02NH40SnKM2A6Qt3oHDjpci6YNpgbrBrTjGvWb/
 uUrIpxuOeYv8o1S0EIaO/62EvF2qqj39LV7K6Qi+mPvjfsH20I+ipJg4IzOVxnWbeQBv
 WTkXuBQh7L3rLsB9ZAML4dFiPVE6Ki67avuvOxJSwsWyjhCxQ44tYWB+X/NqubMqXFLz
 inNjn5etOjKNcu53ii/rEQsOAWlkVHO7/ky+T8Hoy1Xs56tx3i1jgkzHErostw/mLYWo
 G36kKjMetVfmozDaoN6qA7N/29KqXH5aVTQHKXGnVLbPyjwRgllUsxrCo+1fKlwr9o+4
 NtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37l0ckMoMVGJpBF2TcV75mrqlQxEuC7DjW9Iu6LSXsQ=;
 b=jec4k4w/GEsdITiUFILufpywVl8+0/1CmdjrBOpAx43TRSH2+IjbOper+N1u/in0yJ
 4RMP6tuNuphMbYQITpvyNT0sUfXXA6if3bX+oyfPl8Z51kz+gt9uT6fuUQT4A8cAfXkd
 bk/2gvAyt7ugtYzyDkPq7uK8hSG7t/sB6hYunrcNGcBn0Nkw5GqVD73Aqqhio04Zw/M0
 rShg8vmhiu6c9MA2kOOwPvaFRH4lXCZA5wCywLMzHcJ1yQgJkCJdkGgCW080rV8aR2pY
 DeTY0ag4godrDgkSXTp1dqs/ivbajcUBfpamXrR0SNL7RX1rdBxF7IcbWdHzhY/IqGml
 ZXFw==
X-Gm-Message-State: AOAM531jwpSNd9W/6NOWggpr9nojkm8/hisBVebi1UmYfd6m0NMYjmUY
 IH1dsi1aVZqWoGA9OyO8yiF+WP2mDnbRzA==
X-Google-Smtp-Source: ABdhPJw41X3W8gs9CIIKt7tP1kiFv3spMvifIyEQP0O5ABaSJYQvzhYItBZu6OAI5a1qeQxK6uRcEg==
X-Received: by 2002:a17:90b:3e8a:b0:1e0:51fa:516b with SMTP id
 rj10-20020a17090b3e8a00b001e051fa516bmr9355922pjb.151.1653670104710; 
 Fri, 27 May 2022 09:48:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 15/17] linux-user/strace: Use is_error in print_syscall_err
Date: Fri, 27 May 2022 09:48:05 -0700
Message-Id: <20220527164807.135038-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Errors are not all negative numbers: use is_error.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9fa681dea9..7d882526da 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -689,7 +689,7 @@ print_syscall_err(abi_long ret)
     const char *errstr;
 
     qemu_log(" = ");
-    if (ret < 0) {
+    if (is_error(ret)) {
         errstr = target_strerror(-ret);
         if (errstr) {
             qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);
-- 
2.34.1


