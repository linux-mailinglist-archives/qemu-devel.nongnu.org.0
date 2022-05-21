Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6452F6FA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:47:18 +0200 (CEST)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDH3-0008G6-Qm
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCf0-00036D-4u
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCey-0004Zx-LW
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so12758063pjb.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xw5S8AgSS2kdVT0yNtWxbG47quJl+p2/OpzczA7b8dk=;
 b=BmQRxlsZhIuR8m12n1phxPEEOZfGP3j/r1vBCi99O7keHdMFNHlfbXcrR7lY170uFV
 ZlCkIgTpOk1aZx4469FinLrTMm3j+2xe7TwT0ADSv1aUNdMVahL22/SBn3tHIEQVAWR0
 dOXkqS332gjuF6DyfAbaSEC7Z3TW5qrkiY0LCsoXv+n4SRlxF67nB2pVNWpABhpsMjf1
 5C4qkaln/XtHFsZyLnBNeMBUToas/6U3tj0KBt+tjOZWKSK4EXtF5PWW3YtkMkNTZ0Mg
 RQrZElZ8ySmiAwofoQjY+l/7Y8yayyJygK3kQQMofwj6486Vkc94wvaBlW6frqotDkek
 IE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xw5S8AgSS2kdVT0yNtWxbG47quJl+p2/OpzczA7b8dk=;
 b=q3Xwv3W9suojYlJGQJTA2W78fNOlDDA3pUuJXiwcu64nNN7hVL4ENfxBmexdZ3/XuI
 Q15NmgAalYL4wBo5AZwlTPnOZdtv/iirf9fuuMwS7OAHt6hNmF3C0oM4DWg/MP2G6Lti
 6yIyM4XP3pE1OG5MOgSuAQlSur11DCHRiCakgIQBKDUS/NMdQ+5WLrDlyjKBejg3T6T4
 yhFZ+e7EMT/0813rLgXgWzhMYib3m/jm1SzbfkNOrxTdZ/VFo4oGzDd5J+s3NmOsoJ4a
 LO2QaSGS/Jd3HjvyMCe69piWKThw2K7T/9b6zWbMDJHLFfdV8PtC0VjeTRaTVGjvjgj/
 mLnQ==
X-Gm-Message-State: AOAM532OJalMCtAcXsZ0fqVRM4gjnw3r4Id1EbgQIx7A5V0VX5DjhXzM
 nymyf+bbsiFNeycJR6Q1WHUBM3eEnzk3WA==
X-Google-Smtp-Source: ABdhPJx0UzE+brqYN9IOkZpMdeCDapBuS+fQpavpqV54YQbmAnoi6mH8+tyDjqjsHrzuJQT9UJVDxg==
X-Received: by 2002:a17:90b:38cc:b0:1e0:1c6f:d3e3 with SMTP id
 nn12-20020a17090b38cc00b001e01c6fd3e3mr74434pjb.86.1653091674938; 
 Fri, 20 May 2022 17:07:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 47/49] semihosting: Use console_out_gf for SYS_WRITE0
Date: Fri, 20 May 2022 17:03:58 -0700
Message-Id: <20220521000400.454525-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e24e9284c2..1e4c931327 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -424,8 +424,15 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(env, args);
-        common_semi_set_ret(cs, ret);
+        {
+            ssize_t len = target_strlen(args);
+            if (len < 0) {
+                common_semi_dead_cb(cs, -1, EFAULT);
+            } else {
+                semihost_sys_write_gf(cs, common_semi_dead_cb,
+                                      &console_out_gf, args, len);
+            }
+        }
         break;
 
     case TARGET_SYS_WRITE:
-- 
2.34.1


