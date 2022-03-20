Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C84E1C7E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:09:15 +0100 (CET)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy7G-0006QM-NA
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:09:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyi-0005Kt-5t
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:30 -0400
Received: from [2607:f8b0:4864:20::62c] (port=45959
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxye-00066J-DZ
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id k6so3632902plg.12
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycCrVDHaX+NhN/QEfInARNi2pTX1RkKDreGfUOz6ZME=;
 b=F1eQcjsr8sK2HmVNUeJ6dmN7CZFMLm559lkYcFZThshh5z5eRdJDyQ8OqvSmdmzMr0
 9edKWOHeNX75Q2jDpep/urW4EWZlEzw+RE36ngjctF1yWZqR+lLt0GBVTZqpwyNC7IU/
 G2eZFjIqM7Mbx/3ynMPCihKsVihHGlle1jb0knDewDAY/KtFpfAFbHjJVgSHPZItn7fF
 HbMO5vEXdd33hPPw5K9yHVI0TwVsyB0bICaenhoYPsY7xPm/jjIAmQcY6AuGbzTNMrW4
 RunUKOsM6VAjdz/xS1sMKpokbIpxpqb5bOLDHzLURlCyYfP7j3Q0cmpoL+y3ca7orzYp
 EQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ycCrVDHaX+NhN/QEfInARNi2pTX1RkKDreGfUOz6ZME=;
 b=PteQcQY1pZ9Owf7HpV8Bp22b9e+07pF4SPYn5OTEhOIaOU+rcOmV9VfBzopf2/vL1G
 ip/VK/lyQidrCfNDKgZ3tg3CsMZ+TOnoFhGJLWvkL9IREuvQzx0TNdEyPw9kO55b9n6A
 LoxFPEgistcDM+rKP5p10KwoAB0dyxU3md35r0NoH+8rny8TqOBHbJC3dZPB1Y/VuHP5
 SG6Y/U58/AxYcSZzpG+2AZs8oE9ReJcArv0Log+nM8n2B6i7nTDa5vHvSvRv21kkCbpI
 65VvbQSKt+gtWLe0Tv/nStT2C2TsQP4FBOMgpY4EpH3VF7qBoIqmWbFXioIOGgj+efPc
 eLvA==
X-Gm-Message-State: AOAM531VkpFT2qXkZiJpFm7SGN7/mI6uLtlBYAK6hbDNkA35FUuh+iSz
 tw186J9HTvlxdGGCoHM8Cztw3vCB37lTJw==
X-Google-Smtp-Source: ABdhPJxELFw1JkCNHYQJBh11F7n7m+tji2JRi3Uua/uZl+5J+J6tCIKgXIEfvX4YOjAeSsqnkzPMjg==
X-Received: by 2002:a17:902:720a:b0:151:d7d7:6ac0 with SMTP id
 ba10-20020a170902720a00b00151d7d76ac0mr8668143plb.128.1647792018128; 
 Sun, 20 Mar 2022 09:00:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] linux-user/nios2: Remove do_sigreturn
Date: Sun, 20 Mar 2022 09:00:07 -0700
Message-Id: <20220320160009.2665152-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no sigreturn syscall, only rt_sigreturn.
This function is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 517cd39270..133bc05673 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -185,13 +185,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
-long do_sigreturn(CPUNios2State *env)
-{
-    trace_user_do_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
-}
-
 long do_rt_sigreturn(CPUNios2State *env)
 {
     /* Verify, can we follow the stack back */
-- 
2.25.1


