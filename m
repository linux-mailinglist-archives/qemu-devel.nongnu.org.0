Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0236893B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:07:57 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiQO-0002il-Jd
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLE-0005Ak-2A
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLC-0007p9-5F
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p16so20353559plf.12
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lssDGPyfuni9CuU6IOfi+DPva4cgyenF8vOgPbXMLPk=;
 b=MXesaNbFzhW2/ZKO+ltPv8YM0ZD4L5WpCZBG94oPSWNzcZvxw2f42Q5xannurG2ZLg
 xCe27Xo7OWDg5Gkj5h3ylt9uhl7AzzFMal7JE6gq1l+cKzjFNZuHT1MSwe6unFWKDX3a
 DvlreW+WLHZq9ojN//Xl/GcXHpn5dJ0t/qZRKMns81VWoxp/pcY10lns6yudzU4vhdj5
 fOsgzJJCVebeBLGgkUOCuJUpuMng9+eCqT4gINgHL2o3w4jkVgJFQ+I0/ALW3d6+eASQ
 03pGgbeLy0mTEWg1ffhMD3CDW+ZKXy0a+Xy3zuJHzrP5HWwJw1ZpkajMzwHjuYhdytPD
 KSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lssDGPyfuni9CuU6IOfi+DPva4cgyenF8vOgPbXMLPk=;
 b=Sj6uWqshXRJbuHgsD5h3aVZ8wMvQqeZi+CEvQYDiNuBzi6bVkGfT8Yf2bgDVBNUiOL
 ty/HL8nxYuLNPXPVHMqsQ7RNxTQUR+N0aXB4xoWWWWnwp2MGamPXCm0BHRZH3Ukkfesw
 k31nul0EAZkA0OvnfEdK3GyuF9pJ8x6+/Fkk5YCw0mxZIdB5mTQNOfG9DrEHdnj36Lnt
 nizrgEn6pnMAGKDQ/F3v4I4/C7YP6tTm+DAhcnz6tZMcps5Q3WKIiRVojflQjOwuSQak
 v/7E0dIu99b7kJ1QcwWln/CTq3bpx0O4zTXl0E5/GcH85OV8FL8V3FIRGTgYiF1LAleP
 jzDA==
X-Gm-Message-State: AOAM531IZGjWa2RIgW0ai0Br4lBVqiPH4cjpyPKgWPMLBnVUeGi7nSP5
 qPxIiIqj0N8OIqhGjWEVvD6xH+bq9SyvIg==
X-Google-Smtp-Source: ABdhPJw4xowupFCslN6Eo7JLHn4xXwiGp03xy0w35dI1jn1zoUxK6MX0dRHuupGCOiwwIVVUClNSJg==
X-Received: by 2002:a17:902:d706:b029:e6:90aa:24e0 with SMTP id
 w6-20020a170902d706b02900e690aa24e0mr851040ply.42.1619132552090; 
 Thu, 22 Apr 2021 16:02:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in
 do_syscall
Date: Thu, 22 Apr 2021 16:02:24 -0700
Message-Id: <20210422230227.314751-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not access a field that may not be present.  This will
become an issue when sharing more code in the next patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 36169a0ded..89d641856c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9038,7 +9038,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = old_act->_sa_handler;
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
+#ifdef TARGET_ARCH_HAS_SA_RESTORER
                 act.sa_restorer = old_act->sa_restorer;
+#endif
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             } else {
@@ -9051,7 +9053,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 old_act->_sa_handler = oact._sa_handler;
                 old_act->sa_mask = oact.sa_mask.sig[0];
                 old_act->sa_flags = oact.sa_flags;
+#ifdef TARGET_ARCH_HAS_SA_RESTORER
                 old_act->sa_restorer = oact.sa_restorer;
+#endif
                 unlock_user_struct(old_act, arg3, 1);
             }
 #endif
-- 
2.25.1


