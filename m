Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B916DB8E4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 06:43:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl0Oy-0007Yj-5Q; Sat, 08 Apr 2023 00:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0Ow-0007YW-5k
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:42:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0Ou-0002cX-Em
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:42:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 90-20020a17090a0fe300b0023b4bcf0727so339371pjz.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 21:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680928926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/R6K9j2UDTmlrhY8unJfWDiWZthhSfm0yGTDLYttVEY=;
 b=Ei2X5YB44XcDKuqiFoF54BPeHtEOPGX+ibZtCXWibl+zXSYzFM0BFncJqiSAxbjV4q
 W/TsZLfwj35KaWfaogVAVDu+VqZDFXpwIpLh6xZaw5COc5zCayKo4om5SRMkklRmhmJ5
 tD16TnY9rYVkReS7KQYZnM0xLiCc7OUv0mtrUGbEuh+mbZcsYIRpZV8IGQk6O2PidKsF
 3BKx94BWD/pGDm3ssBSpmDeT46kYhVGrE2gz4FKrH0eUdzHD/FqOqvfvCudWEPKO/l4w
 c3uS5hXOJ7j4UyA/Yi8po/uzfbjVyhTwkvROxC6E94NAB5iChJEjCnapm5YGo8Zu7nhr
 zd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680928926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/R6K9j2UDTmlrhY8unJfWDiWZthhSfm0yGTDLYttVEY=;
 b=2e5VOlVnF6MQ3YKJCHioV0w9uN9L4zQvWYWFK0Wntpj1N2HXakmfUuZXwKpeNO2BxZ
 5IHfYHDyA+vHQrH8dLrhg1FreyQ3gupyI0WPCrtjvHWAAkQRrrOZaJAI4a5aIMxWjWUi
 UEhvwfsT+6IqMf6lJ/tJm2tYtQ80+eyYh5wUj7v6BurZaE27Pqv9VC1xyUhY7ORifdNc
 jeVj5e4ElLzswJuWZvwXpzVJIPh5y3z7jHJtEXKqxBm5Y3lgX9ILaw247/OwnE+oePMl
 1aQtzZGrpp+P9AVC6mQBiMBDyUbUoYGuUActLeBDxSmMeP2/w/hJzfRLAUvA10cElJ+P
 yq9Q==
X-Gm-Message-State: AAQBX9eco6O67gE7V6lLrD84SwVn2HJvCkrRpibITTgCUSRyKfOOazPi
 zNdoV+WcfISDr8AznD7yYOMjjq8mIjo4+z/5hNg=
X-Google-Smtp-Source: AKy350btoRP9moqHRPmFFx4SnmpW1orwm8yAtSc41oc4afhPFOCzinSQdmStpMdY6QoHiPW0Lh6jSQ==
X-Received: by 2002:a17:90b:4a8e:b0:23d:4e9d:2eb0 with SMTP id
 lp14-20020a17090b4a8e00b0023d4e9d2eb0mr1236333pjb.36.1680928926278; 
 Fri, 07 Apr 2023 21:42:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902ea8200b001a1cf0744a2sm3670559plb.247.2023.04.07.21.42.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 21:42:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0] tcg/mips: Fix TCG_TARGET_CALL_RET_I128 for o32 abi
Date: Fri,  7 Apr 2023 21:42:04 -0700
Message-Id: <20230408044204.3484337-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

The return is by reference, not in 4 integer registers.

This error resulted in

  qemu-system-i386: tcg/mips/tcg-target.c.inc:140: \
    tcg_target_call_oarg_reg: Assertion `slot >= 0 && slot <= 1' failed.

Fixes: 5427a9a7604 ("tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 88a8137bcc..88d45245e8 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -84,13 +84,14 @@ typedef enum {
 #if _MIPS_SIM == _ABIO32
 # define TCG_TARGET_CALL_STACK_OFFSET 16
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_RET_I128     TCG_CALL_RET_BY_REF
 #else
 # define TCG_TARGET_CALL_STACK_OFFSET 0
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128     TCG_CALL_RET_NORMAL
 #endif
 #define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I128      TCG_CALL_ARG_EVEN
-#define TCG_TARGET_CALL_RET_I128      TCG_CALL_RET_NORMAL
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
-- 
2.34.1


