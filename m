Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BE59158D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:41:45 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZbM-0004JD-9o
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5E-0003i4-G2
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:32 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5C-0006ZH-Sm
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:32 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so9069184pjo.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
 b=bSCP71l0DqojHC87bomEzD7pShba3IoTEr+nDTV9Y7ssoz3/48akMFEnb3USjI42g6
 9jbOf7mByveComiogBqDtKw72nYtAoYKN7DhMiJJRFLoNtnyEKK+hp0lghHK4ywz+Gro
 VGjozr1JgYo4wxI4JuT3RqB7lHI/hXZ3VGtkREm+5jElATCSiYo4+IRd0L7LG38LBAa0
 UjuKMYGcpFVHSB9jU1JXHicPoRlydRV7BYV/rhpiWg6mW82hkrDLwfxxo0ZxBrEWsoss
 NKZZudR2FxKLJRXl3in+NHYq211l9baastZCYpQWXzmliPOey4XZ2o0EiDfqDyl12iAH
 xlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
 b=ohiXvIo98gDv3T2F8+wB1LjlGd2uYHRuxn10AeFd/YayYdYV9GpksXkrlt/+/GayVL
 qcoqkPqLr02iiE3V4RBDVjsNLST6Sx5080N1AuXzA8LWRWhqt1ww67/143gtp8EEHeNl
 iMydc4f2pTSygKWfgxh10GKlwxPMFj5LooeXpxs9dov3t1l6KvFIcI07/p3ZE+v41azk
 p3EAn64qSbRG5WmcZfU4z4wVj84C4/qNgUs6kErnaZtgzcaDY/Ysd8yR0cuiQUXPq5yc
 4W7PPtLQQU294dxyu8pJWOwv4frXH8yB9oiLUFXZB7j7meM9kZeGSaO0n1x4ot6Q+dId
 nfzA==
X-Gm-Message-State: ACgBeo3Cfx86NS5TphGLjOAeKcTCP7wZjyOqI/MlIe1ndxgAeRiVQWJI
 kAsmE60d/fDXwCubW1KFZ1sAV5jj0B+MOA==
X-Google-Smtp-Source: AA6agR7jzhIe+kwJ6pZsof3eGvNOwF2UupF6RIfCwujGQgAev6L7FgAxxhszYEid4Ff99gkjzz5FIA==
X-Received: by 2002:a17:902:744b:b0:16d:cef6:ffe8 with SMTP id
 e11-20020a170902744b00b0016dcef6ffe8mr5157015plt.163.1660327709524; 
 Fri, 12 Aug 2022 11:08:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 17/21] accel/tcg: Introduce is_same_page()
Date: Fri, 12 Aug 2022 11:08:02 -0700
Message-Id: <20220812180806.2128593-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Make the DisasContextBase parameter const.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..0d0bf3a31e 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.34.1


