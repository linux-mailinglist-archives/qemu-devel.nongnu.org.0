Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9042A59EEB9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:11:32 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc7P-0002d2-K1
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1v-0008Gr-LU
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:51 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1u-0001Pu-3n
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id pm13so6323479pjb.5
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nZZ45pMxOHvR/MX8ViZjTrfSqbkn36lcVu6HChiZ8OQ=;
 b=cChtaknjKhnoPvTgrP8fOhPUSokcE98dVPDkCCRWU9exQL0UcbmsGMeJxX5v832Inx
 +NqyMQ+7rVLEHDsZcBxjlJ2UNkMvlH1L3/21Fj9IBe/LFQIu3c3IxIIHuGNkxLi46aFn
 1FDhcJo+Ge+ixOLjKpXOJoOdrDofOpOK8BLyq7owUnTRYHw4klTGjjB1d3IHVRljxZzI
 Z3TrfM6I7bCjuUQBj4KWDAmfFutAj8SnUiyNuNp15gpkQFonildRLi3L6Ykn7ZbCqmpp
 CJN6nLm5snm7MxcH4KZNub4smasXkHPX4bYVn5lb2bSkwzssM4d1/lIUtiD+XDGT028z
 aBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nZZ45pMxOHvR/MX8ViZjTrfSqbkn36lcVu6HChiZ8OQ=;
 b=G+GEM//Xqdx0GeOR7z5otxBREP3/kaRvKX/14NRCH52KxvNpcTEfTMx6066WA/c5wr
 UInDdWQX6FSAcyBHhGtLhRXmv9y1vpC1l+KPrufSey7E/3ZeSCdocOwtW4bPjFx8YyiL
 1GRp89sRdf9vDHrSG9M6QNi+EJ7twZuyh4dm1T5flFkdncTzVhCLoq8Tm7prQRnYOPjc
 Il9D4dS+0dp44ANmr+is/4LepSSfX9gUYDR/rpsk55yG5A89K6T1UNXWxAz4bIXwyvP/
 xKTarimir1+nWyOHXRZSkgogYcS+qc97dHET6YoDYDQ2Q7+VgAGXvtaTlE39AYXl4JJ8
 hG7A==
X-Gm-Message-State: ACgBeo0ZCvM1wQI623u6Ofdav+zZUluDIpI7XbKmnbHo31HdVPRrm1il
 Qt5ZTvnV4y9tjfS15ETtYFEi8HPwXYMHaQ==
X-Google-Smtp-Source: AA6agR6JUXHvsGyje5Iro+L9t5AE24dSpDmLaD0dFmlVgROwPzvpxVNzs+HzY1hUE77sLRMOsrOFMg==
X-Received: by 2002:a17:90a:6707:b0:1fb:6461:695d with SMTP id
 n7-20020a17090a670700b001fb6461695dmr4786824pjj.158.1661292348583; 
 Tue, 23 Aug 2022 15:05:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 03/20] linux-user/x86_64: Allocate vsyscall page as a
 commpage
Date: Tue, 23 Aug 2022 15:05:25 -0700
Message-Id: <20220823220542.1993395-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

We're about to start validating PAGE_EXEC, which means that we've
got to the vsyscall page executable.  We had been special casing
this entirely within translate.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 29d910c4cc..b20d513929 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -195,6 +195,27 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
+#if ULONG_MAX >= TARGET_VSYSCALL_PAGE
+#define INIT_GUEST_COMMPAGE
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
@@ -2360,8 +2381,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 #else
 #define HI_COMMPAGE 0
 #define LO_COMMPAGE -1
+#ifndef INIT_GUEST_COMMPAGE
 #define init_guest_commpage() true
 #endif
+#endif
 
 static void pgb_fail_in_use(const char *image_name)
 {
-- 
2.34.1


