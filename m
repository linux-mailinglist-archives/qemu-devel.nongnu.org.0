Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C99442D77
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:03:59 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsWE-0008OO-7V
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhD-0001b3-Li
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:15 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:38541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhB-00020C-Py
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:15 -0400
Received: by mail-qt1-x832.google.com with SMTP id h4so17869324qth.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/CJUXQvBCEoPlihnnAPxMwhS0SfN83B4jFLy6O6YSI=;
 b=HkmiMGnyWOOqa4GQSEbtV6qObdJv69K1qJh4yUj+/Ejafg4m9CoNLBbTIrypKWWRCh
 /2IpX9BFAeMknOr1zl2rtkTzX8LTx2fnpSHAZYpPHrkAI9DBRZxsYTOajWT7YA3pBXjD
 CTW2tdsSGdWLxhQKNP90VdWhHxDf0wY7olmcyUTFJAqox3xnAYbSzhhDEZ34r5iYWNJ+
 wlJZnHXgkmm8b7n6uGY3ODcwCpZjxmjWqYfDhkQCUcRLIPVbWdkB+KeotSgjAI5TgwhK
 kR0ZwZjVoobV5woLHHYjmbAiEkP38nPXxn4r3dNIncB11QAez6nyxtOGPWaEucf6RAs4
 jUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/CJUXQvBCEoPlihnnAPxMwhS0SfN83B4jFLy6O6YSI=;
 b=pnK1RhZ5ae4Ut5MVGy/VmEvQm67CMnoRADuJESWBl4HNk7q3N9Oz9S2O6JRZiOaFeY
 cKI+t9VCpk6PQqKMMAmznlW/Y3Yj8/J9z5H9E9Kvl2dx+vNjgSTsb3b95zD2L5fKIGZ5
 0mqHta96WAAnBbujrU4K7EGtHC4Qi6NiG+r/y/wcqzppiECgrcAdKBu5bfvS2dFDRVIR
 kc+tSd0dufG/zrK6UP/1j3x31kU7CCM00zosHGyB9oC5dJfOjCtwglGaJ0b3XR9v9PhC
 1qbjQATS8FNOCDNfvj2rhDD72ToFRDCClRFPxnXndsDdEahWVo0BJG/iHjvdJ5GaeR15
 PzNQ==
X-Gm-Message-State: AOAM533KAIETVrPMXPtevPkzZmacB+BwNnjfOGoQoWCCuqfKECGNjH1Y
 yiF0Rl/XwbDZPGsAkIpsZ5tiLL0bI6yAKg==
X-Google-Smtp-Source: ABdhPJxdb52HZ3Za43UhrnYP+bN3QJOdiEHPEGTx396bs5SY5Fni85n+S44DcFldFbRx28jKinU1og==
X-Received: by 2002:a05:622a:2c2:: with SMTP id
 a2mr32279346qtx.305.1635851472960; 
 Tue, 02 Nov 2021 04:11:12 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/60] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Tue,  2 Nov 2021 07:07:33 -0400
Message-Id: <20211102110740.215699-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c996dce7df..752669825f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


