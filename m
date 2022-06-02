Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10353C113
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:52:28 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtg3-0007dw-KO
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001ii-49
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskM-0000vY-EN
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so5860855pjf.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHd4rex5KLokg6+1+Y3fFNXszj9You6Kl613kNttCcU=;
 b=jFrq7X3n2vOjm1EoiPKRlOOc5WkVJw6gGEw0kWR/bZ5oYbkfVb2Fhr26iBhmYMG7rw
 FbLbzu+lw4gXzax1v740DlIF4uhnBMyCb5qdKQAsW6OyViogpkwI5oIdDytGAxjEiQlF
 wPBxVBHOyqNsLAdxYE9H5R0qiBvqreCRL6SsGexL7pJp+pGKMb1f3PbPqZjSYL2lHjqP
 E9VB4J0qtGOxNFPVOOKd47CajEPQDuMmXef8rpu563KRJck+Fyw3JhQu9263eOCf32Bp
 9T3ppDmwjyndHiRY1XxfGz4SUfeeZ8XwuhkEf8rAuN/XEGBZFFODYbvTtnoLwryqVPQF
 675g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHd4rex5KLokg6+1+Y3fFNXszj9You6Kl613kNttCcU=;
 b=4FcnO0VZgkLP6a4oBG/4Ydf3OfHMJLl1HQ9IOU3mu9NMsqVvEf85v5Wthtd4cpBaTe
 gezTdby4XpD/ucKN0OrSMt26257AOX5TAzdm0vS1SG6VxP7cITTUEiK6+G1V1Aj5qEJR
 YajANcB4SEbf9pBh8tu69kEsRc/vMMGfp/liLnDzxhD239q27VhgBELzNOScecD6f1xE
 Hlg+HkenpNuHrXNdypQ/UteyrJewe4jRU3FnMrnB5kZhdAyI9OX+Wtc0Bv+pZPGfNgPO
 UEUHB3/EjAGMnNAW7Chs2X1NNA7DpVa/qH2xBNwfbOnl2Mn7zfLW96yB0+5cQ0FLhYwT
 31GQ==
X-Gm-Message-State: AOAM533QOFrPSg4iyQK0rP6ESIMn0GiQcY5v8xBvtOdw2ZzCzvNXXCtT
 MQgf8wNT25IVBrV4I78foIqJrNI1CI+osw==
X-Google-Smtp-Source: ABdhPJzi492VvwtTo4Lxrm+ONs+Sg8sDfeiad1LA6iotPWIu6P72tGD6p2uZk7HMkFufz6x7/YtvWw==
X-Received: by 2002:a17:90a:a384:b0:1dc:a407:b5ac with SMTP id
 x4-20020a17090aa38400b001dca407b5acmr7499555pjp.11.1654206769627; 
 Thu, 02 Jun 2022 14:52:49 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 63/71] linux-user/aarch64: Do not allow duplicate or short sve
 records
Date: Thu,  2 Jun 2022 14:48:45 -0700
Message-Id: <20220602214853.496211-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index e9ff280d2a..590f2258b2 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq_cached(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1


