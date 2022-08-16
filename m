Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF35963C1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:38:10 +0200 (CEST)
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3KD-0002t4-G7
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GR-0004h1-DE
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:16 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:35430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GP-0004U2-OL
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:15 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so12939958fac.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=X+2CEfgvZFxpq8e6EY+n5lvWBzz+vc8fFcrenQ8ZGDI=;
 b=wxp36Q2md0qnMRWC7iJRWrPljfk3YY4ss/v5NNmDqz9qd8HChkrMXEGw0Loj4dkLge
 Wt+QpOsbZhnimu1x3djtflOdpVih/xCGv9eTfUjj2tjuWiwMJ5Ldl+iDOlevU0ZLaER0
 GLVx3J+sWamaF93Oaekmt1B/ku/w8KBZ/EdabhHGvyewIGKKVzMKXUbWaCwW3JEXyRBS
 PfNEKlL2fUst1eK4mkqlJMk3Y+2Mth0a+w8GRQAcB27FBiOsUqBOyd2ziSAzBsQRllAu
 6Vkd4Z26TZ6Ev+NKzA5Vl11jrVX70XrkqWltEQGdCLey7vTXNc9IxaJV4ut3KRveN8KV
 zc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=X+2CEfgvZFxpq8e6EY+n5lvWBzz+vc8fFcrenQ8ZGDI=;
 b=Md7gHTwk77qY+vclC9oVmSzcZkFrN33p9KMlHiCBtd4c/sGgsGPz1eFUMB5mjLTfwh
 8Cnk/1032rcE1SSZbkzRiQWMiQV/Pp7E9kKwFR7MAjrNQa4eA8usv5mz8jzCJeKARkg7
 xZYm3NpWOpLCMG6sYx14OFPEM5+T4KlmSb7Lx5M+4LcRm22pKwceKLMocAXFTkZjtHbc
 iwlMsoFT7W0ajZNaV2NKya6kOGEdUVb2blN+DdZzHNoDOXmzr+31lcPdhiVM0r71av4s
 IVR+NCTzS8q3s1N1eV13MkmeMqXlPPuoHODxcGbb+o7FB+mBoMqKryhegHFZ0T85uaFw
 l0WA==
X-Gm-Message-State: ACgBeo1Bb4LVuQy6RQgJSIlMChGld7QkSbWuyJyFn4/txdMxATvGBByv
 fT/jR0U2adu1dFsPKv6KH7BuycWOy0kc0g==
X-Google-Smtp-Source: AA6agR7AIyM0meJ38Q6g7vrxciJvzvnNhOeXxjVBeJC07Wx/zrjRlGJ0TyATHceV6K26OZb1lTWVVQ==
X-Received: by 2002:a05:6870:4251:b0:10e:6ca2:5a29 with SMTP id
 v17-20020a056870425100b0010e6ca25a29mr161727oac.100.1660682052144; 
 Tue, 16 Aug 2022 13:34:12 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 03/33] linux-user/x86_64: Allocate vsyscall page as a
 commpage
Date: Tue, 16 Aug 2022 15:33:30 -0500
Message-Id: <20220816203400.161187-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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

We're about to start validating PAGE_EXEC, which means that we've
got to the vsyscall page executable.  We had been special casing
this entirely within translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 29d910c4cc..d783240a36 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -195,6 +195,28 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
+#if ULONG_MAX >= TARGET_VSYSCALL_PAGE
+#define HI_COMMPAGE  TARGET_VSYSCALL_PAGE
+
+static bool init_guest_commpage(void)
+{
+    /*
+     * The vsyscall page is at a high negative address aka kernel space,
+     * which means that we cannot actually allocate it with target_mmap.
+     * We still should be able to use page_set_flags, unless the user
+     * has specified -R reserved_va, which would trigger an assert().
+     */
+    if (reserved_va != 0 &&
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+        error_report("Cannot allocate vsyscall page");
+        exit(EXIT_FAILURE);
+    }
+    page_set_flags(TARGET_VSYSCALL_PAGE,
+                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+#endif
 #else
 
 #define ELF_START_MMAP 0x80000000
-- 
2.34.1


