Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CE41832B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:18:17 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9RN-0002hQ-8G
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93r-0002ro-IG
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93p-0006vq-WE
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id i23so36577578wrb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=bDq37a/lE37CTk+jAcFOz8DtR7um/Nas8YPLtoPubNP0GVjmacrXEmmp82NEhryl3L
 XtpAGISmw5dsRbMYJZFrjqdfdhV8SF1VLkSBCv91yXv7i3qmk9JEsVh6l/MGB2bR5vZm
 CbPWNSh/UORzJ0zexmLNPEXdvF1UFuCqdxJxY29cNboldwZymlZrDFu6V5rLxCffjtHg
 5ycRMSx8pSO0J3g1f+WoRM+46Fmn3cojWN7m283oGRAz9Z7exfLry7lf9BSskc7t4FF4
 DaYnrJaMcXqgQgLydbqHfVqN/S8aSnXqdoyEvtvMYKLc2I/0km1XJqMXh2oSRVIBzrH1
 hQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=Y98U/wsDGNc525j+KYtIHQxcWKDrqR4NVtw7nGrt45JJhpN0inCDYou9GZw0nqnn3P
 XPbnIJcYIKnZfsOdzeTx335w0/PfbWr90qFOjlIk5lnKAQ7iGftujAfUyOikHuHCUCcv
 dvuBf567OlF+mo0Ue/ZgY4eQdpEmbXb98DfqwYWtn0x7uoaLBVnBN+HpIEwlCXkgAhR7
 XhvJWMxAlrL7VyOYDNwvrAnL5TbeNJ6dgTUwk9yTn//fdUAW7J2VZYAjlmkyzttfSWOE
 Epc3zi/slveoph3UbYY9IN3nfuR4wqyKo2/1d2aLQ0IWn9auuPrlTFW+VBSJk/o/Fswf
 1E3w==
X-Gm-Message-State: AOAM533JAXu3FwEST2iTRHdv1x4G5xQtrJJd3HwrnBzU5Jt6cSmMQ/vS
 lH45CAM/928Qk57f2gzo9d4if00zu+4=
X-Google-Smtp-Source: ABdhPJxqRk3Iz8r3gtAsPOe/BWHkD0LluDyj+kPazr3JUmal6maIuI6kPTDUDx0mvo2M5WIfPpjimg==
X-Received: by 2002:a05:6000:1b90:: with SMTP id
 r16mr17805204wru.250.1632581632326; 
 Sat, 25 Sep 2021 07:53:52 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a75sm12144010wmd.4.2021.09.25.07.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 32/40] target/rx: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:10 +0200
Message-Id: <20210925145118.1361230-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976d..ac6b40b2716 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb->pc;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void rx_cpu_reset(DeviceState *dev)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = rx_cpu_has_work,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -206,7 +209,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
-- 
2.31.1


