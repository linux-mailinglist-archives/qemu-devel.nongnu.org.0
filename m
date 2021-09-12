Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CBF407F10
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:50:14 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTcJ-0001kP-Gr
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIF-0000qO-NZ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIE-0005KX-7W
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id 140so1528567wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=hbDGaydAvhJKRhIHrs1wOE2jFFW8hw1hANVpINkL+wNFSjgGoHVNnPqW8sZpCyB+1D
 4FrqoGNasAfj8aySzIi6fLpRBw+0xDwZHhqwEQJABjZC2REAp2J1A6deRf/VjjZzyjfJ
 NWwZ+euhIOCMAY/P873fCJkqgaGfJ8hn12/9H+p4E0GE2OMlHCVWeF6tiFovasaDDTuA
 bqeYY4/krIacM3FYz1KvxKaJsYx7LXx3Uvm5bKYkrwFeko8ublNQtsgByAHXeY8qBJjs
 Amu9j9/OdjmWQX+axj2a2OeHnQS1CV5dOMTrpKGK7RUZpF+B5PzwCuSQjbbIBD7QkE+e
 poEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=EI+0zyZs+cMH5ZIVfYabxYEzMbCmeN+iNQy7sxBPvzIcDI2E5R5lteW4AiE6yZTHeq
 +OFb7e1YmQV/ZRSciXiwZaKuaYS1qbVgIFrHddi4c5yS2X681GOcF975CV3+3C0SiQdX
 PPwe4SR66lsaGF06XwEllI4hcCL0mZlATaPThwt11EGa0OKkpQQlf+BNJR/ceD79OZeY
 g+9WIBNxBcduSUt02k7HucSHpPRXK1I+/Oi/vXD15Jw9R+5aF61lpwn30VmtUY0qwoxA
 bCDrlw5RrE9ueIftP5P4i3Sjn9LHctmuRr3X2+4gG/aCYqWqq7tAMTAJn2JUQL5Ut9ql
 FmcA==
X-Gm-Message-State: AOAM533eTQlfJ/wP+h5cqMr26+OlIbieTFMR7sCMoq6lqEUXUOBlLpqT
 ieiBrvkWiERIqZO38itlnmw9EKHppO0=
X-Google-Smtp-Source: ABdhPJyr6YzdSfUIvVCYY4RtQwCmu3xX3QidZMG9CK9wAdcDRJZQ85/ofzLRA6gRYDcmRRs4KNVQ0A==
X-Received: by 2002:a1c:80c7:: with SMTP id b190mr7403236wmd.87.1631467764822; 
 Sun, 12 Sep 2021 10:29:24 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i27sm4588332wmb.40.2021.09.12.10.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/30] target/rx: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:24 +0200
Message-Id: <20210912172731.789788-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 David Gibson <david@gibson.dropbear.id.au>
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


