Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD75A8F60
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:09:07 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeK2-0000sG-5t
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe41-0005uu-Pa
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe40-0003Gu-3C
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id az27so21014549wrb.6
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yfnHu4EbbnRvw3l+CBQz1H5c9gnGaVUZEDhcbvAt58s=;
 b=ic3hhYqnPJ5I0nsVaP+B4tQS1ELAfQC4B0QPJnYOXLTSg0mXdETrZd0ileEs7LqMj3
 Fmz3zHNH6ml/ad4SA9lGzAzh3gjbGGdW4g+xKTzW0rlKEQfHyCK5eUlVUBGrOCiPj4h8
 PFDthGaht+LJ3jPsIccb1pArT92miBNu+9meLynSqO3MsA6h+huSRHaN+TQkswGYOASe
 TRwhWvDTth/uAN66ilVBY2EoyLpiJVZjQj2J6v88Bq7t3DD6zZoFPBaGW/eSm0768Xk8
 KDx46A+smCE7YiLNqVE4AcASbnC1Uqs5gPPY99PTorAlH/9bSb08LIZ0oxnld2Mfxyhi
 y/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yfnHu4EbbnRvw3l+CBQz1H5c9gnGaVUZEDhcbvAt58s=;
 b=QgT70uxDrdXtteR24ouiV7WqDV/NIx+DIlFgUm4r59L5j3A3cndu2H2XFMyS447WNx
 VWt8jrZ5w0jKxRNkVj8S2U19QRkGYxyJ/QuFMQ+g7AKSGzOkOldEsTbLFtqv3S3ytXys
 B+lLb/eWP5Ifkcd+Lhe+JjF1VXp4SvoJE5a6aHQ4zWoweF6Xo+cqMmJDkcySHYFfrvEG
 wnDSijRSG3nnFw/UmdY9eYHvB1dddJnlIcPGBulC/dUapo0VHP0fNBu7mxGust3DSfPk
 WsJqMBfADfy3yYS6PFkMzYZ/eveoqCtJNvwxObdCD4GPiq3LPhdj2IQh/cocnaV8AgFG
 pX9g==
X-Gm-Message-State: ACgBeo3k+pOHSGvcFQbj/0Al6nwFosSi1OO77sjLhS9EGKXuS9j3mxYD
 Pl03agEW9UzjZAVdzzYi37WdOICyghaCADB2
X-Google-Smtp-Source: AA6agR6twWaBoAEkebxSL9onk6TeWqSCgEKxJOtFX/RyKJhqp4mmNpzIYVyS/RR+gYt3Av37hfsiqA==
X-Received: by 2002:a05:6000:81b:b0:226:bada:a5 with SMTP id
 bt27-20020a056000081b00b00226bada00a5mr13698448wrb.539.1662015149937; 
 Wed, 31 Aug 2022 23:52:29 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 03/20] linux-user/x86_64: Allocate vsyscall page as a commpage
Date: Thu,  1 Sep 2022 07:51:51 +0100
Message-Id: <20220901065210.117081-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
got to mark the vsyscall page executable.  We had been special
casing this entirely within translate.

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


