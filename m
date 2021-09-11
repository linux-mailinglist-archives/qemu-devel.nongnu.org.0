Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F94079AD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:59:00 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6LD-0004hk-Ev
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HL-0006OF-VC
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HJ-0002G7-GG
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id t8so2459030wrq.4
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LWud8OdJVFwV057VSOD2zPTsJ4r3xLQGTPSjELmcjM=;
 b=X6FJpsz8P9UaBk4Ir5VjesV9HtdzOe6FoBcBEeXquRqJSOJ8chVwUvdxm68nEy7m0l
 fuGm5aNCCHgRTo4adU2O8T8W3/hoIEMdli+mwAtPcmew6ggt5tuUfZ9c61CzHk6W+JUt
 +v88AnochnTIkM8JLgVNEv84pvX9yc8ZrL+8+WQ9TivgAthORajTZEcKb2rI2xRxHsB/
 oTPFhFyeiGwQn5uQ4wZs/Kk1Vn07q5u/eQXlzYuYyPFIIAwHlKgxDUil/5Nw0oX2xcp4
 B7w7R+Y2QC4hs0OiZytXGF4PbMgBU925uhwDT96Looy+k/JLbZaHmTCsj+gBTpnXzNf4
 diPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/LWud8OdJVFwV057VSOD2zPTsJ4r3xLQGTPSjELmcjM=;
 b=GRHMFURtPHNT9Okanb7GRpbo71y9p0aUJtXkLn9pYtUhinXxa98RhTKVM8iYbgkDKI
 4Tpfb+42684fih+6PD2zDK0pJhfWYEuF4PtWnqrM85Y0Knv4D/T7+w6Ppvy5cQgd790i
 c3lCV6sTLOfzNCeY+e0/NoDD4dhDR50zep23cYtOZ3zlaJ61cenoDUuxPxuX4JgsYTbG
 XlFE+scGgAG9np6kfPUodYVLcpDn2ofRzlvvCldIgLvTNtOzD6KM08jcHwUHGb/6Rie+
 pSPjx5Tp0yVQAUXCVGLeMkVdMRXIj65buVJ77IqSdKN909Q2VAEIuTD/HMaEq/F7Q8Gs
 dbAQ==
X-Gm-Message-State: AOAM530Ru2jny8IpxcA/IhUt7gF/u4KAXYLCWIi2o/+4b0ijOxuV3PqP
 fWKzmdFzZz0XDCqrOETDpS7NubUWvJw=
X-Google-Smtp-Source: ABdhPJw4UMz4wjRHdKMg+A53oZ5IRnc56l7F5ybt7t41jI8B8J1cqOA+Xmv7ED79sbtY4nDeWEV4hw==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr3858728wro.432.1631379296014; 
 Sat, 11 Sep 2021 09:54:56 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u25sm2019941wmj.10.2021.09.11.09.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:54:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/24] target/xtensa: Restrict do_transaction_failed() to
 sysemu
Date: Sat, 11 Sep 2021 18:54:14 +0200
Message-Id: <20210911165434.531552-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The do_transaction_failed() is restricted to system emulation since
commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c79..1e0cb1535ca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+#endif /* !CONFIG_USER_ONLY */
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
-- 
2.31.1


