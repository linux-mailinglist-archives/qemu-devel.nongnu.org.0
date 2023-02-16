Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC7699AFA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnE-0007zZ-I1; Thu, 16 Feb 2023 12:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnD-0007ye-74
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnB-0007pp-Lg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l2so2593670wry.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1+Kck9JVYjKMa8PaarZ6RWpFOfo4WuN9uUAQ2s5nrFI=;
 b=Gi+qmk5aWfOfjUNcIj3kK0gwWHUxcy11vgC1NJ9p+bJ0ZYWOj6v01y/MaQuIAzsngh
 qB7U21GzrlJ4ASSgmBZa4TfJxPZ1b5lFssh4Fl2wd6Qo+y9uclW/iEzWkLK7MFv305fn
 GRtCsu7Rh8kbCsTH0KcSbLHL2Md4sS149PpKg8QKOjQf5UJvPoWIIsk+gvyeYDRrftYQ
 vhepcCJUnb7J2dEc0kK+zOJIYalyAlApmlofBp39D55mBw/llH1BmbKMQSSLDFV0TW7O
 Nh5KwfDnvNB1+vMDED3ak8lJe43UBvq1M/BILNVsBrk/Pr8RwtAT9CcNj17/ZFww1veq
 QYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+Kck9JVYjKMa8PaarZ6RWpFOfo4WuN9uUAQ2s5nrFI=;
 b=B5wvKivPsoarxH1hilOgq89XMj1RWEtJjUR/1uhp5+YefHXxvqSDeCd2udX+WtyMYx
 XTmxi/Lh1EsSLEmgLcrjROtseRfb4cMOoF8QKBH+HjFP3/QQqUIXtwDPTpkQz0VK0yBY
 DgEiLAjeR2Jdl02H3as8gwVXBq4cqsg2XQQ+oHvdd0pCHRefPn6o6MNY01ssZZjhnWsT
 zOAWNI1pvmpGlYrVxh5JZ4qWZo1+2AFciK+OTxQ1aHc1qBRXUDPBcrc++d27weOZzlmS
 EQjd5d8qeEs2IFShnUnMQAKF5yp91NOFQobhXPgNaZS/NnC383M6k8IA0pbOuhvk+iaP
 rLwQ==
X-Gm-Message-State: AO0yUKW9r2a4ZLnKlrKjVmsVOC+rS9mgg/3knr3H3cFOickKcb34tEJz
 ZYlCNY4ghTaqxNCqflw0prZwtA+TtRL3etFD
X-Google-Smtp-Source: AK7set9iHd9jza29nG31RZf7FNTg/d6HDfk9C0VtNgGy5XF6sq0JzIERT5vgyWnUHKQmc/1sDkYlng==
X-Received: by 2002:adf:e8c8:0:b0:2c5:a07e:4bb6 with SMTP id
 k8-20020adfe8c8000000b002c5a07e4bb6mr1005570wrn.33.1676567492310; 
 Thu, 16 Feb 2023 09:11:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] target/arm: Restrict CPUARMState::arm_boot_info to sysemu
Date: Thu, 16 Feb 2023 17:11:01 +0000
Message-Id: <20230216171123.2518285-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230206223502.25122-9-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 002082eb5b6..a574e85b769 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -768,8 +768,8 @@ typedef struct CPUArchState {
     } sau;
 
     void *nvic;
-    const struct arm_boot_info *boot_info;
 #if !defined(CONFIG_USER_ONLY)
+    const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
 #else /* CONFIG_USER_ONLY */
-- 
2.34.1


