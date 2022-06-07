Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86E541BE4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:56:33 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhBg-00038Z-Cu
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwx-0007Q5-VU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:15 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwp-0008EG-KU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:15 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so16437566pjq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=QNhECIZfk7oXX4TE9R87booFQt9t/T50LAmiq+zoqQAZWrgkT2o3S0mGBjzposkb3R
 mjlJu02Yf2dyBm4Qk8xn5vqhrpZoX+NSPyRjYV2+33wvHUyUrvsajSKKQR/01XZZfJh7
 6UKU7JjIf38Lqwjgfdb9gbT7gZf2G7t2GbM6BntHq58P/hPgSXbeusjsYQckeA/WtA6n
 w4ebrTZUJKCRutmsTRUn7ngtRmcJptOYxYewcJUCQ1392Df3avAEEfuuEvRRhCMkHVDt
 R1PmDBkVhgBDyOd9I6+wtQFj+cYYFV3hppR0yDqZbsa1Z0wTIlg09E0aOxCJE0Lpfpmc
 sOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=Se8IwUeqDnipzfdbm/yTcoJ0BJvsqhqc55HGhWMpz81ecKW2t7ccfvNKB6XAH4Htyr
 LlmkimwSJ0XkEd8Ui3GHwduB/WE2y/U7xoo5fAAAk/J85AHRPlZOt6zMhAara5sFt/nT
 xh5O2j3fPTOBJ4lAP5BTVEfNFsOtBseur8zD0raSvBQsfWx+iQYKXHriiW9t7OlqPf/U
 G83jDm+Ufz9cIE0Ik/QvK+FYo0irIkXQy79Fz+ooNoOenqZh4DXSAaeOAZge6Qtjhoz8
 43tkZL+L2Oqhc7m9pPCu3lle7KN+DWGsuJkQTnIl2yY8g7B0lSW4gfCDykzSS6F1TlY8
 EPQA==
X-Gm-Message-State: AOAM532thAfos7zLdGF6e5QDbT2qFGHIyHghw2MPVVGhY8MB9r7yXYPi
 R4/rID7MGKAjrwYB+PHCqovHSD6QAMAzOw==
X-Google-Smtp-Source: ABdhPJyYDX8Sz9L6YeNXCXmAX0L+YGForVYpAU+/sm8dtYydW71MxkGOC+xpb+HTi+I9m/7OF/3v8A==
X-Received: by 2002:a17:90a:fb93:b0:1e8:a809:af4d with SMTP id
 cp19-20020a17090afb9300b001e8a809af4dmr4690771pjb.7.1654634226886; 
 Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 64/71] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Tue,  7 Jun 2022 13:32:59 -0700
Message-Id: <20220607203306.657998-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f..9ff79da4be 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1


