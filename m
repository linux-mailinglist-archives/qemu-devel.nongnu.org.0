Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0C454ACD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:18:51 +0100 (CET)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNe6-0001TS-Ea
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQQ-0000fF-OD
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:42 -0500
Received: from [2a00:1450:4864:20::436] (port=43802
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQP-00034z-CN
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id t30so5632595wra.10
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wf8sidbCeve0P0JaE6VQCRWBZsCGCNB330akAsLUJZk=;
 b=bqrY9/wqKCxhSG4/k8IDVXcQ/PHp7lbhZwJZce/l4povg+/QIgVbrFbess06LZgOPb
 tNJT0G6u5t3KtaYswNE7bYBnnI+ReK3WVkX2z5Ve2ofoFAwDpeqZdjITcTdl/wogDks4
 XNJaYkIaXoCGslwa61x6PKBYVQYlbtYU0XLrb2RhBj6meV9Ru99zjlaw3mGPTzbb9wZm
 cJyqAkiy/zAuvfs7cDV4Y0WUumKkhERK7VmvXFbOnKDh4EQMJ1Ydv97lbGLSJau0Oixm
 iKcGd0R1XnjPmCkPabZ1j2SqNMUetfP3LiJFcjMG5+g06BKjyZ+xa0Kn5oMlF4bU0Fu0
 eiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wf8sidbCeve0P0JaE6VQCRWBZsCGCNB330akAsLUJZk=;
 b=LFd1Are6SopOAJH1iSAcdmq7jPT4MCwbfM2jkz3Kn3MlTM+HTjhO7a+EZ63ZLt7H28
 CJQFyu9Zo0cfzIs+tpCCdOC/pvZC0rwG8vitVAMquZIMIsLetItVcuRzsm3AtMA5RXAf
 pMS1hiuXuToPUOyg40+H0BVHfhDAkb5Yjf31fXrgC4seVZvxA0898IcNO608T9fmdZQX
 Ql6ZgLaGs+Y1MM+iRl1adkCupOMd9pOROGI0q1siQ8pdD1XsyNUBtIjpL14YD/CzNfKP
 WSTxgoTZKGx+g7SkQi0q7PuMqI5ChSmfPOA2rSvoYr+VtgOqS6Z6aZIi9yms3eNacnMz
 hrDw==
X-Gm-Message-State: AOAM5314VFJBeBGgwTlWrrlCFzlw6MW6A13bbf6tZg//3T3hXWWj6FqV
 f2KL6GNmrfpvxLYEg0xSBbXLXk8dAwXvwR65FwQ=
X-Google-Smtp-Source: ABdhPJzM9Zg+huEmospIPMwcGME+hHa2sa+xl8a8ubLl7MH3VvJ7Rzu8v5n8SaLZtDBnvviK9kXBlg==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr20419484wrm.259.1637165080149; 
 Wed, 17 Nov 2021 08:04:40 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/17] linux-user: Move thunk.c from top-level
Date: Wed, 17 Nov 2021 17:04:10 +0100
Message-Id: <20211117160412.71563-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far, linux-user is the only user of these functions.
Clean up the build machinery by restricting it to linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                   | 1 -
 thunk.c => linux-user/thunk.c | 0
 linux-user/meson.build        | 1 +
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename thunk.c => linux-user/thunk.c (100%)

diff --git a/meson.build b/meson.build
index 387f7fe1c9..9f59c57909 100644
--- a/meson.build
+++ b/meson.build
@@ -2614,7 +2614,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 common_user_ss = common_user_ss.apply(config_all, strict: false)
diff --git a/thunk.c b/linux-user/thunk.c
similarity index 100%
rename from thunk.c
rename to linux-user/thunk.c
diff --git a/linux-user/meson.build b/linux-user/meson.build
index bf9d945504..fcf7d40f23 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -15,6 +15,7 @@ linux_user_ss.add(files(
   'signal.c',
   'strace.c',
   'syscall.c',
+  'thunk.c',
   'uaccess.c',
   'uname.c',
 ))
-- 
2.25.1


