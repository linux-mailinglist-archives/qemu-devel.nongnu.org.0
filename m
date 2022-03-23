Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F64E517A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:42:28 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzNi-0005uC-UT
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:42:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz98-0001vx-0y
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:22 -0400
Received: from [2a00:1450:4864:20::42d] (port=38890
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz96-00064g-MY
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t11so1655766wrm.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTAHdHlMlH0xEXpmrIT2kxqzPVJkLuBJDngJ0VV9eHg=;
 b=GG+HpQdWyqYxIhIkyQr3KsF3XRCqX52f2nF7oK76fEAxtRNifPbXd0TJQwY4PzyIVJ
 8NZ5lLsrYfyDbTdwxdqrltv9irztqxokZtRnjKqWVjRuV5TbAQfbHrsQxIIIgUmXuEeW
 l1gnNapnXAdbgmFaR/sCJgXWHaimwhCPt5oXohiwbDMs8zjlfFsAvF0hoeuqxYHtvUxW
 SNB/uUfMgP1TMVP+CEQS93FYDHHIS/6+UdyQYaRMHtIdDeNY7nZWLkDUeKmL2pKB4X8Z
 1X8dDDb1zXhP5McCstMgVw+eewXML14c/iS9veuMH3xxifHdG1bxjfNhbL6nZpj1ESQF
 SebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTAHdHlMlH0xEXpmrIT2kxqzPVJkLuBJDngJ0VV9eHg=;
 b=XaeR//r2Ib4Rz3xucGck2LVa/Z9zgVVA+OQyHCL02WYPzG0EoKszxT+7LAHeq5Msqw
 mJPN16GPsS4GI7axQSHcKx5WfIT9Hf05fv/8/0CbcVh9kiLBmrDga7vI5XxQz+BJ2030
 5bRqXKN+nyVp8QfyO2IYKNGDW2PHt96RNBGqFgEvLhoZJkwTmDecKm5SsJIZaupx3MZa
 CEl/uwqrY5ditjHKJqBmo8Jm+2nxd6CI/iWr2Fng3rhk2EPKKQq/Roda2Dfg/2mMmwzx
 wq6MZx+NneMb6OheHBqNCCLeBl+J0B4bkGYxBjFnPqEuvJqOXJoUVInCO0lh2Jq0k+cv
 cN4Q==
X-Gm-Message-State: AOAM530pjGz/HRxGJzsJLd/mFqkZYsLeqzlIMnt14hTOVB5/aVo2XeUj
 I3X2+6ORJMUICgt1qtVk6JfIFQ==
X-Google-Smtp-Source: ABdhPJzw3cep06O/EM3BQnbhFJ76dGcAy+w/4qBGGlK3XR5blCDWfb1K6L1WMGmqMvBWkQCEe0CxTw==
X-Received: by 2002:a05:6000:144c:b0:204:1cc6:7194 with SMTP id
 v12-20020a056000144c00b002041cc67194mr9442474wrx.255.1648034839090; 
 Wed, 23 Mar 2022 04:27:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm7065025wrr.100.2022.03.23.04.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E68D61FFBD;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/8] semihosting: clean up handling of expanded argv
Date: Wed, 23 Mar 2022 11:27:08 +0000
Message-Id: <20220323112711.440376-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another cleanup patch tripped over the fact we weren't being careful
in our casting. Fix the casts, allow for a non-const and switch from
g_realloc to g_renew.

The whole semihosting argument handling could do with some tests
though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220315121251.2280317-8-alex.bennee@linaro.org>

diff --git a/semihosting/config.c b/semihosting/config.c
index 137171b717..50d82108e6 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
     Chardev *chardev;
-    const char **argv;
+    char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
 } SemihostingConfig;
@@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
     if (strcmp(name, "arg") == 0) {
         s->argc++;
         /* one extra element as g_strjoinv() expects NULL-terminated array */
-        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
-        s->argv[s->argc - 1] = val;
+        s->argv = g_renew(char *, s->argv, s->argc + 1);
+        s->argv[s->argc - 1] = g_strdup(val);
         s->argv[s->argc] = NULL;
     }
     return 0;
-- 
2.30.2


