Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C0568467
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91oq-0006Bp-6R
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90MB-0006zd-54
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:01 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M9-0000oS-Lm
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:58 -0400
Received: by mail-pg1-x531.google.com with SMTP id i190so849458pge.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=klMKO6mvB3KdNJ0CCt4yxZTPLq0lPCN2Mn+ZuwEecFjZv+4BrrjeQx98hWownEMZl0
 TI17Nco3UKMsf673XD9TapV91k00+foSpg5nuCeZ0n/c7O0BI+Ba92NLH2+bQfU4n/GH
 uipRtBKN1xyBAYCSTwKmjdbbZDtAWjeFL7qF2MXt1IGNcdGeLhzPT3s6zv1/vlpiszOH
 SZB+0nFSc/moyUHPKDo2M2z+i6KVFXLhBBma8+g4rvIAAek16ZAJalIDGoVyfRlv0NH0
 aTIkO9XnrSdanPjRqf89LwI+/3QGMrTAGrH8QGcDBY/WKbmfS6jXCE7LVdNEgk6nNz6l
 YSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=bX8aLjO19H9EtBnfeo8RNyHnG8ndmpE8OnBLrf6ntd8t4Wg+q5rF8tt4cnlsisb7ns
 EtDkmUsH39BU59imM4XASiQrMZsw0qfixjUYT1ZpsKr75/pmfT3h06fb6q9UCKxUyzS/
 nBRVRy+fVtJ31kFDtQlaFJSx43p4sRrcM8vkbqdgjn1NpOykfLqd9Io+y3Oxv7WMY8d9
 RIv/zGqavyg3kqGd345kGaWRWL9mIk8PARw8mSwiFerRBucc52lj8YHbJAR8E8MkgYzq
 Ic7h5HH+lWa6ct+LaP+ktUIQIJbQzsMnudlalubCiY6chuUIIfF6IvhJsviPArWAT+s1
 kSNw==
X-Gm-Message-State: AJIora9uCUay9+hfJWXltOCX3XSdbSZBlp5YTkxmVx5EuwKaYYRsR0zr
 R/T7wMk2zx1+WHpSOGKdvPmuNihPJRcI4Waw
X-Google-Smtp-Source: AGRyM1vJPYC+UI/m9jh5mXqO0sycAPxu94ZPWVRAvU2OPw98393TA4NUMcr7aGFUAwd0xN6JKKm9Kw==
X-Received: by 2002:a05:6a00:179c:b0:525:6823:2972 with SMTP id
 s28-20020a056a00179c00b0052568232972mr46256451pfg.60.1657095956404; 
 Wed, 06 Jul 2022 01:25:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 37/45] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Wed,  6 Jul 2022 13:54:03 +0530
Message-Id: <20220706082411.1664825-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97..8fbe98d72f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1


