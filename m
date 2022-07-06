Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871D5693ED
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:11:43 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CJB-0003S1-Ho
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMV-0000oq-MY; Wed, 06 Jul 2022 16:11:10 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:35507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMS-0003kX-8s; Wed, 06 Jul 2022 16:11:01 -0400
Received: by mail-ua1-x929.google.com with SMTP id s3so4001942uaq.2;
 Wed, 06 Jul 2022 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xepP0Kc6zUoeZEcwe2XSFP4MbJh/OxFvDzVUvosynVc=;
 b=c+0HmK5PcbGIqoGQBN5GO2c6dj5Cv1jLVFw12KyRuco/yz+uQLWJCpDT8DpwBc0xY3
 XsgUwCyfkh8rjqzvWVspKJ2iIDaVezuf29vGHipRh7FqMcR4/KBGpt2b1VBfOrC9TFM9
 qi1exm/W8pdMFn9dV7IxgjwcPG978msu6M7CF5MxJD2qP9o+1TkHZyzIyUCC1Vl8rHUn
 hnxQxcaETQuOu46DxZhU9lhpDas0Ty+Kxwauc8MD69imfyuaagBEa7R3iE2YQKCqbIff
 UQdm4/hZGoPaAyVfjSFGtN7rqwgdD21fzJHVx6d0ZGezVRBnFPIEfndJxCd7c3s1R7I5
 pC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xepP0Kc6zUoeZEcwe2XSFP4MbJh/OxFvDzVUvosynVc=;
 b=ICVvWbfx2H6dIImspDnDQlsb2HTtG7jqimLoLA9WQKEzd4ctdz6kKSib+gf33h7juW
 vsz0u1HjLVV8p2XjMOV36Da6QrO0Jy2zgClafFa9dbJtEX03hcbYhcqbDHv5REWBAPwu
 HGfuSSIIzHQqqtQojseVljRAYxeak2N9gyarj9W6/+/+nQQYIw1ZXCA7B2+1RBq6Az7f
 vyhkyhiZpq0QTyLYYzSwsYDy8Htdv5sF3mK8WPLbeRuqhdJL0VKLUHnzdTzP79j2azrl
 YbxJ9PN4rzx7K6xnXwu1C2L9hJn1/f23KPGl8cshIUaXMtHO/Ze4zkUcZOphcsPgihK4
 BXLQ==
X-Gm-Message-State: AJIora9MDiOcnm+33xE3ZaKoXXWTwzjRNJx+tP4EXo4n4GUXtkOhJB6O
 65RHL2z65afHQJyVMJPd1YoNlaROZhk=
X-Google-Smtp-Source: AGRyM1sddh6oIOYgswXZmeL1wEcGHycbHrmznnpkG2rPLfmrGFmC3Uy9BhuW5QvrsuajsJb1EG8lkQ==
X-Received: by 2002:ab0:2556:0:b0:382:c380:9a9b with SMTP id
 l22-20020ab02556000000b00382c3809a9bmr5942816uan.120.1657138258736; 
 Wed, 06 Jul 2022 13:10:58 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PULL 34/34] target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
Date: Wed,  6 Jul 2022 17:09:46 -0300
Message-Id: <20220706200946.471114-35-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Pali Rohár <pali@kernel.org>

Commit 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
changed core type of MPC8555 and MPC8560 from e500v1 to e500v2.

But both MPC8555 and MPC8560 have just e500v1 cores, there are no features
of e500v2 cores. It can be verified by reading NXP documentations:
https://www.nxp.com/docs/en/data-sheet/MPC8555EEC.pdf
https://www.nxp.com/docs/en/data-sheet/MPC8560EC.pdf
https://www.nxp.com/docs/en/reference-manual/MPC8555ERM.pdf
https://www.nxp.com/docs/en/reference-manual/MPC8560RM.pdf

Therefore fix core type of MPC8555 and MPC8560 back to e500v1.

Just for completeness, here is list of all Motorola/Freescale/NXP
processors which were released and have e500v1 or e500v2 cores:

e500v1: MPC8540 MPC8541 MPC8555 MPC8560

e500v2: BSC9131 BSC9132
        C291 C292 C293
        MPC8533 MPC8535 MPC8536 MPC8543 MPC8544 MPC8545 MPC8547
        MPC8548 MPC8567 MPC8568 MPC8569 MPC8572
        P1010 P1011 P1012 P1013 P1014 P1015 P1016 P1020 P1021
        P1022 P1024 P1025 P2010 P2020

Sorted alphabetically; not by release date / generation / feature set.
All this is from public information available on NXP website.

Seems that qemu has support only for some subset of MPC85xx processors.
Historically processors with e500 cores have mpc85xx family codename and
lot of software have them in mpc85xx architecture subdirectory.

Note that GCC uses -mcpu=8540 option for specifying e500v1 core and
-mcpu=8548 option for specifying e500v2 core.

So sometimes (mpc)8540 is alias for e500v1 and (mpc)8548 is alias for
e500v2.

Fixes: 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
Signed-off-by: Pali Rohár <pali@kernel.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220703195029.23793-1-pali@kernel.org>
[danielhb: added more context in the commit msg]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu-models.c | 14 +++++++-------
 target/ppc/cpu-models.h | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 8538493061..912b037c63 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -385,19 +385,19 @@
     POWERPC_DEF_SVR("mpc8548e_v21", "MPC8548E v2.1",
                     CPU_POWERPC_MPC8548E_v21, POWERPC_SVR_8548E_v21, e500v2)
     POWERPC_DEF_SVR("mpc8555_v10", "MPC8555 v1.0",
-                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v2)
+                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v1)
     POWERPC_DEF_SVR("mpc8555_v11", "MPC8555 v1.1",
-                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v2)
+                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v1)
     POWERPC_DEF_SVR("mpc8555e_v10", "MPC8555E v1.0",
-                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v2)
+                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v1)
     POWERPC_DEF_SVR("mpc8555e_v11", "MPC8555E v1.1",
-                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v2)
+                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v1)
     POWERPC_DEF_SVR("mpc8560_v10", "MPC8560 v1.0",
-                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v2)
+                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v1)
     POWERPC_DEF_SVR("mpc8560_v20", "MPC8560 v2.0",
-                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v2)
+                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v1)
     POWERPC_DEF_SVR("mpc8560_v21", "MPC8560 v2.1",
-                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v2)
+                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v1)
     POWERPC_DEF_SVR("mpc8567", "MPC8567",
                     CPU_POWERPC_MPC8567,      POWERPC_SVR_8567,      e500v2)
     POWERPC_DEF_SVR("mpc8567e", "MPC8567E",
diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index 76775a74a9..1326493a9a 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -184,13 +184,13 @@ enum {
 #define CPU_POWERPC_MPC8548E_v11     CPU_POWERPC_e500v2_v11
 #define CPU_POWERPC_MPC8548E_v20     CPU_POWERPC_e500v2_v20
 #define CPU_POWERPC_MPC8548E_v21     CPU_POWERPC_e500v2_v21
-#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v2_v10
-#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v2_v11
-#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v2_v10
-#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v2_v11
-#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v2_v10
-#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v2_v20
-#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v2_v21
+#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v1_v10
+#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v1_v20
 #define CPU_POWERPC_MPC8567          CPU_POWERPC_e500v2_v22
 #define CPU_POWERPC_MPC8567E         CPU_POWERPC_e500v2_v22
 #define CPU_POWERPC_MPC8568          CPU_POWERPC_e500v2_v22
-- 
2.36.1


