Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754015B8976
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:48:56 +0200 (CEST)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSl5-0003ox-Jy
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSML-00082x-90
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMI-0000bC-9E
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id bz13so25705697wrb.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rTB12Kd3V2NAFpRhE4AcHzoc+HouSttzxGrYvX7ucFI=;
 b=tzYAvW5iYfZYsdDAych860+Uua6bGC02vEOexfyco/ScffNwMR+VMVlEsyoPMJ1g6I
 mOp0MSfk4EA7M9Z4k1jpslubtE+ZluqEYC/GrhgaCWMnrVH70IheJtXEMvWNpFAqtSg9
 C6Ng+rkYn3I1WdNL9p8gC36XLPViVYodi6O2v61oX37vY9sbRz0kDsMwUXU8kCDKZBoY
 j6ViV7voN7Y/HZ1Imt7wtvZKHr9fQXT4hbx55gZYHPo0hxhekX0m9vkMp4avebu3pZGt
 Yq+7bjhYpUmCSpHMkFuhhm2BJcTbDvKF2t9hSpqklp0vVL8OjN8fjyDlSYKPS0yFrj+g
 dncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rTB12Kd3V2NAFpRhE4AcHzoc+HouSttzxGrYvX7ucFI=;
 b=H0jXpC0sEfNhlhDAjljLMItNdCuU3vcswJUnUOvBiTNLwtQa5smSlxcVIJbdzLNEVk
 q5PEOfz1TNhbILnd0sRkr1VAJ8RKFtoI4+Ux4qXULQHXjOf/km6UxCNLn2TC+1KXKJYn
 o4C98+HILDchmV2gFg9tsM8PrG2WE0fqCDmcRabUwQCjkTQhBESTpjeFtPURU0BchpLF
 3TlJ3w/N0gnN331fFw+NewEjkXdr4D3zoCypDDV4ApWJTToTZzNPxcU1YvUzStMh6lMQ
 /rmi6e+NlIuM5JcX48FA6RPLPJi5Yn5qWonMd/en119N77DjU38hJLkz09bSXP3ageiM
 OLWg==
X-Gm-Message-State: ACgBeo14H4sHxbgptOv951zM46P3qVD5iWb8qRI+EJNdtUbhtRGfr3YQ
 yZG3Ye8D/BKEuLmOhy/3F0xclVmJfHcT4MYd
X-Google-Smtp-Source: AA6agR48CZZosf1OJmlCgtmgh8JYYIcRdZnpfzd8PmyDYAtf+p4zG9CqrTxiu9PitVpvEAqqVLyMwA==
X-Received: by 2002:a05:6000:82:b0:228:db8c:5308 with SMTP id
 m2-20020a056000008200b00228db8c5308mr21088535wrx.164.1663161796915; 
 Wed, 14 Sep 2022 06:23:16 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/11] target/m68k: Honour -semihosting-config userspace=on
Date: Wed, 14 Sep 2022 14:23:04 +0100
Message-Id: <20220914132308.118495-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace.

(Note that target/m68k doesn't support semihosting at all
in the linux-user build.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822141230.3658237-4-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 4b3dfec130..a96a034050 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -203,8 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cf_rte(env);
             return;
         case EXCP_HALT_INSN:
-            if (semihosting_enabled(false)
-                    && (env->sr & SR_S) != 0
+            if (semihosting_enabled((env->sr & SR_S) == 0)
                     && (env->pc & 3) == 0
                     && cpu_lduw_code(env, env->pc - 4) == 0x4e71
                     && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {
-- 
2.34.1


