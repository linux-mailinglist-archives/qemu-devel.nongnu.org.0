Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF96F4804
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsZ1-0002rA-3A; Tue, 02 May 2023 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYg-0002lt-Va
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYf-0000bQ-8n
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so40228455e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043731; x=1685635731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rrz9M9TbqlhgVjUVbycqe3VtoE3QrVAsV7Ge7VQZ3uw=;
 b=hrZfkvFdg6gm7Ztg58vy6gzrEx2+euFRT+2zezJbH+C5vmGIWYsOCMWnzja6DgPymq
 u7p8bAfWEiGZILff7tQF/F2JQb23ncCV9DAjXLMBLbLAGSB9ucufKig51J2Yhb5VKs+u
 KBK2xNOZjRbMFq743kWu4RtH2EFviIgffuvuaeWZXMcrkUzdS0oWE7zpZB8ACdOrN/5W
 1jsJSbswXebOILZxiR+dQdR0oGc2goO71qHb1ZPAKYZpDhzbqyxc1vcigfKxuUu6UIYn
 Sd5eEDWBiL+kmjvR2rEo9/q7NpNVZUCtBeNLZ5yXQC5IDl+2mXA7VEUqEuxf6coHsBjy
 WWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043731; x=1685635731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rrz9M9TbqlhgVjUVbycqe3VtoE3QrVAsV7Ge7VQZ3uw=;
 b=JwzOIGeSoUy1/TVeu1rUQuV7FbqDu7ZUoM7hiFoXoP51LqnK+fj11m8dlNCv+hnz1r
 G1t5850s+4aWC97GG8hcx/J4Mb0vvO2KFG2tkUsvQtHWiVrmQL6lkmIe71vJu5x92pjI
 B4eypn1ylp1ffn/AntChO8pv5OMiGR83dID3ZBS5CPO2+vrqBPmEeywk/qCZs+B72qXS
 mHh63ehYu3jAymf0S4j5KO0w5hhfGrtJCo4I2VFGEA3gLPStO9qb0Kd8284dktwEfhsj
 3F4Xwymm/uDp48i4tJxHW11+qDVMCivLrg8oAZ87IHwagAcukrbvsiTd6m7lkZIuDDKl
 Alxg==
X-Gm-Message-State: AC+VfDyMYcOXsuoae3lboqF8/wa5FctJw3lQ9AaLO/oFO3VDaBLq06sd
 SfGerc3Se9jKIXAiDMSk6lnfR3o+Kjw7JEOdYNZ8zQ==
X-Google-Smtp-Source: ACHHUZ7K1JpYTR209//duMoJu4rElM+Fn3bKGI4p4vwzOvH0t+D/IgEuIMrVryAef/F3sV/vPxgohA==
X-Received: by 2002:a05:600c:2051:b0:3f1:7581:eaaf with SMTP id
 p17-20020a05600c205100b003f17581eaafmr11819619wmg.4.1683043731046; 
 Tue, 02 May 2023 09:08:51 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/16] target/hppa: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:35 +0100
Message-Id: <20230502160846.1289975-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/hppa-linux-user.mak | 1 -
 configs/targets/hppa-softmmu.mak    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/targets/hppa-linux-user.mak b/configs/targets/hppa-linux-user.mak
index db873a8796..361ea39d71 100644
--- a/configs/targets/hppa-linux-user.mak
+++ b/configs/targets/hppa-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=hppa
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/hppa-softmmu.mak b/configs/targets/hppa-softmmu.mak
index 44f07b0332..a41662aa99 100644
--- a/configs/targets/hppa-softmmu.mak
+++ b/configs/targets/hppa-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=hppa
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
-- 
2.34.1


