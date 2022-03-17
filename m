Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C500B4DBE7E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:35:49 +0100 (CET)
Received: from localhost ([::1]:58126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUinc-0007Rf-TH
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:35:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKi-0000pV-RJ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:56 -0400
Received: from [2607:f8b0:4864:20::430] (port=33389
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKf-0002EZ-Lr
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id s42so5987288pfg.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO5qDCidg6tXT/kBs+ctrp9mOI+zlSE5VUcpn5RQSbI=;
 b=dtWNXL17CIp5HDLx6Usl05GimCNgKBYWhw6gnoUq9u1PEguLaSGg1VlY3KDhu4wwSz
 VR+Zw72Dt4z1kSbYouQdDkCB5sEndpbTfgIErnNkteYYTjQpH9qDUEBEHunTThVSmA0o
 C0UWLl/w3qCtNLN8hptwPaTvhgmmq02qIQisWVhHRQ2iQ1B0vqBEttChKCz2eupo1Y59
 J609yoUFeUDvw4W0QTnAUlG4E2apXvlF7VR4M6wB8Mk7AjkhIHgB2WBqk2myiepxauEE
 xJpoapolAYRtlgEqgoiPkwnQ3X9QVqxwXac2rXVPRhdiwtKtLdljgtpn18NtC1BKsYA4
 oIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO5qDCidg6tXT/kBs+ctrp9mOI+zlSE5VUcpn5RQSbI=;
 b=AFzDs/ahZjiLRlG0Igy7vBeyzqH2zvrRt2/8xbO7jcABEkjSmFStzAYMuiK2aC3TRZ
 YFOudRB1sqAgZJtTyD+D1ZFNEIwFPNkmjtA5AvSYDCh7jUf+JChus4HxUt7qCWsexeNN
 Tsn1eOaZaCrsKYE0WXD9hAks2LU5/opNnMr3qksOD5ZVIpf0jZTUW9MpfNEZrHAO87/9
 b68W3FrJMezVgMwMGyHlDCVOofE7ktEQ/TBZ7eLfC5T1oNdurkQu3f65oVbRGDdpxE+8
 QYGVi/hIRWmPtcUXvj0aDDL5YflU0vvZ/ZpQxE/hjQfJ6Cl1Zv6NgtfpQBuKG8NZLnp9
 gWyA==
X-Gm-Message-State: AOAM531USEHu+7I2rO42PAUMd0Wgiehi1+tXqa4qKXwN7tYVz62IItmO
 64kolcy2ArcCb2g9ygDysXUKPZFJM/8g3g==
X-Google-Smtp-Source: ABdhPJxt8h1Q5sua9HvhWAw7/f/1eitnCDcSXXmflhgRxZulim4OPULZ1bAkIsfqqCQsTvaLKg67Aw==
X-Received: by 2002:a05:6a00:9a9:b0:4f7:876e:1e83 with SMTP id
 u41-20020a056a0009a900b004f7876e1e83mr3204380pfg.71.1647493552192; 
 Wed, 16 Mar 2022 22:05:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 12/51] target/nios2: Clean up nios2_cpu_dump_state
Date: Wed, 16 Mar 2022 22:04:59 -0700
Message-Id: <20220317050538.924111-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not print control registers for user-only mode.
Rename reserved control registers to "resN", where
N is the control register index.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2e486651f5..45fe2f9a05 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -783,16 +783,18 @@ static const char * const gr_regnames[NUM_GP_REGS] = {
     "fp",         "ea",         "ba",         "ra",
 };
 
+#ifndef CONFIG_USER_ONLY
 static const char * const cr_regnames[NUM_CR_REGS] = {
     "status",     "estatus",    "bstatus",    "ienable",
-    "ipending",   "cpuid",      "reserved0",  "exception",
+    "ipending",   "cpuid",      "res6",       "exception",
     "pteaddr",    "tlbacc",     "tlbmisc",    "reserved1",
     "badaddr",    "config",     "mpubase",    "mpuacc",
-    "reserved2",  "reserved3",  "reserved4",  "reserved5",
-    "reserved6",  "reserved7",  "reserved8",  "reserved9",
-    "reserved10", "reserved11", "reserved12", "reserved13",
-    "reserved14", "reserved15", "reserved16", "reserved17",
+    "res16",      "res17",      "res18",      "res19",
+    "res20",      "res21",      "res22",      "res23",
+    "res24",      "res25",      "res26",      "res27",
+    "res28",      "res29",      "res30",      "res31",
 };
+#endif
 
 #include "exec/gen-icount.h"
 
@@ -904,10 +906,6 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUNios2State *env = &cpu->env;
     int i;
 
-    if (!env) {
-        return;
-    }
-
     qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_GP_REGS; i++) {
@@ -916,13 +914,14 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             qemu_fprintf(f, "\n");
         }
     }
+
+#if !defined(CONFIG_USER_ONLY)
     for (i = 0; i < NUM_CR_REGS; i++) {
         qemu_fprintf(f, "%9s=%8.8x ", cr_regnames[i], env->ctrl[i]);
         if ((i + 1) % 4 == 0) {
             qemu_fprintf(f, "\n");
         }
     }
-#if !defined(CONFIG_USER_ONLY)
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
                  env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
                  (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
-- 
2.25.1


