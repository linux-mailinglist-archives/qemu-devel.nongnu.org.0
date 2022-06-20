Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA495523C4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:20:59 +0200 (CEST)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M1C-0006Zr-Jp
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdJ-0002s2-5J
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:18 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdH-00022U-BT
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:16 -0400
Received: by mail-pg1-x531.google.com with SMTP id a14so1290245pgh.11
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=phNaTt0FT1JCXz9Ao0ivgD0b4uUncrAq8aIV43cwIOScdPt1U7soMr8TMy5LrxkX4D
 HyHF5VqI7EbyoyM1Y+MkihpDfQZx14PbnXU0KTiQZIkN67rVgtBk+hakE97FgOK+EysK
 lm/ulk0jBuwxuv1/mbBgxGgj1PByJT8THXgLUFGp4OG5H/0k75tqYg47xGdE4KaFa33t
 8oUW6l4s48jzk+8Fx+C7OxQTTS/pOchXJpNP2EEiLdk9e0hnk9pyLIWK/XYbTeKhT+0S
 xmT2Cz6EH7dRdvhCwj8OoiYBL+Pc/cFQCHippndhkrV4dV6wHFft//SOlN1h93PeEZ20
 rmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=sU4Nk5UXD1A9Cr+9kyYptxPiiMYrNEJ1REXYp7IHhdAufehrLTuFZTCXn1WFLEO8uT
 InujWjM/jmHdvCBdn9JXx2JE9XrmhBQavxV0iN44Xd1azWpWyAGBOqesV93MUk6gfDO3
 5LwkW6zxpmSCFSA7sDiuTKYw5Z/SLSdsAzRx0spVxIbw5qW2ME2IP6uRV80fLKZW76Dc
 k4Rbq7G9kr36iAkLfcdvieve2WCYSGy9U3r85bwTMcSfVMFsuSRKx40HIBVf0Qov28Nn
 npC/KYDu3ERQ8L9lBVSKS/XG7vbcq/V1v/gNJMsaLuzGbEZc1jQ728yC4GeYjzfCbpPI
 lGrg==
X-Gm-Message-State: AJIora+SqUBOrZgXaieeKm5QxznOIM5Y9lN2kUu+AirTWRBGuiLgU7am
 D0RBy3V4gSD0aLaj0qxepunZnXxysQLoBQ==
X-Google-Smtp-Source: AGRyM1vLvC9RERLY+YmU0KyevCDCBeOeS+Csb40XKrnRRa7Bn4iYa/+BAv4Cqx2Tc4LDGzc/2Jah2A==
X-Received: by 2002:a63:ab01:0:b0:408:c856:f70a with SMTP id
 p1-20020a63ab01000000b00408c856f70amr22726557pgf.109.1655747774070; 
 Mon, 20 Jun 2022 10:56:14 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 43/51] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Mon, 20 Jun 2022 10:52:27 -0700
Message-Id: <20220620175235.60881-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
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


