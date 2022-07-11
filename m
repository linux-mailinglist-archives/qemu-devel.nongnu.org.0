Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA95705E3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:40:01 +0200 (CEST)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuZs-0000ta-PN
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvj-0006hL-Pp
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvd-0002nQ-5k
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id bu1so5948297wrb.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m/AOR0tE++/JatDV791mjXVdOhyKmyy8clrV8yxXoMI=;
 b=Aybkf3luW4WNSsT6/FZwKEyDSC8u7GPbuN1BxsiyFz39s39Uy4jEjJwlddwujMDSzf
 sD8ajcvDDhSPYP9jSktlecCKN2fXr0ZWsg+ikJCmAZQAT57oUGN53D3OxI/4a/Q4aiCk
 s/C0F/EZoDE4i6J08ysxBM9J8Yq0KKA8AJXr61MEcVFJ1QBVFfejhWGs0ZuG8MJw2aSj
 LKV+f6LF/OZ6HIl1qbHpvrYJpJGPNVlwG9a9IFlhN81fVclkYU/y/gnJ7S6nWVjV6jDV
 2AKfI2wMUSs+Z8zKBQ1R8HvqH78vGc4bHtvKvVlCuYPvMod9AbTeKfrzTwWSGwXI5uIC
 ZMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/AOR0tE++/JatDV791mjXVdOhyKmyy8clrV8yxXoMI=;
 b=VeWv8V78wUnvVZplTx21n06Jbu2XaYkgH7btVJAUpav/jXscYgEThQMRTluePaM9m7
 p1R687k7sbKoH8UPaTN9VQckUvs2aPfnXY5L8+idZ7wY7N2LZi+4xout0morBa1vVRIN
 gknO5va4nSk8+M8DLxaB1hen8RT5kaxv/FRn9456bojKs9ce7ThHl4ASXJpue+fiWa/z
 MB6shVVE5G6KLBnPXEL0NYKVEHRoST2uyyf1RjBr0B6f1tK3qriJaWeLKvMpKkez2kou
 lN2oc41AmaM19e2oloYiXBQxuA4fmz37022tz0wx81quPRmY6HUspfffl/K306SycA+M
 6UPQ==
X-Gm-Message-State: AJIora8baP7hZ/9J81DXByjnLRn+Bj4MDdTr4lu5x/gdBln9drJJQfWd
 SAj5RoHYzaN/ERSVbtG2Bu8dgCRKgnHt4g==
X-Google-Smtp-Source: AGRyM1vtAFlIo7D9YXEHVOzjqr/CMu/7RCXhlLMNORBYL2ZGNqp+tlw9W5bK3Ve6hGFifkDf1m7nGg==
X-Received: by 2002:a5d:5151:0:b0:21d:730b:c64a with SMTP id
 u17-20020a5d5151000000b0021d730bc64amr17337911wrt.392.1657547903092; 
 Mon, 11 Jul 2022 06:58:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/45] linux-user/aarch64: Do not allow duplicate or short sve
 records
Date: Mon, 11 Jul 2022 14:57:42 +0100
Message-Id: <20220711135750.765803-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-38-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97c..8fbe98d72f2 100644
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
2.25.1


