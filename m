Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239040D4C3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:42:20 +0200 (CEST)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQmyJ-0004Vg-AY
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQmwG-0003AB-W0; Thu, 16 Sep 2021 04:40:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQmwD-0003Bg-3r; Thu, 16 Sep 2021 04:40:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso3936999wme.0; 
 Thu, 16 Sep 2021 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o9v9aZyaxH/kp+xO8nJbkSPAYjr8v/bDGPQl+vTnQ2A=;
 b=eGnKiFJG84w7eXN2zTkhgkw3upbL3FlsTujm1MJweSXvJI9S7rQZp/whGK/5RQUYzw
 Adt9hOz1zBPr9vSrn62OrHmXXEiszukg5u39LyorqOfrhhW374We3g6c7mvvt+R1SMr1
 atNhxpQys82nkePYGovmLEf0k2ht8EVgcfv9WpScmP3z9B7Nk8vlTAchmWZjZkdRdNk2
 GrFhHPvGkVC5E891Ojmg9nazljMzmM7PXB4Hm1uHFhwMRwr3ZbOWV4Dd3MLDO9o9BfF+
 SxK0aVKwflBrXiUrnAfO4Z5aZB2O7C2XVMW8Mj9JUfzHUJUyPIgqUuXzoXsUtqD8wOGI
 SUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=o9v9aZyaxH/kp+xO8nJbkSPAYjr8v/bDGPQl+vTnQ2A=;
 b=vWEdgu+X9fxLbLm/DcbseICFlD72ZZZtsOFMlQs8AS19CAhcNjxInE2zB6N+75+6jO
 mPI6tEDtCDpaIZZuwnkxo7JO8paHe7HWxZcXl22YBHcTRtQaqehiBZJVEcKpGBqiD9CV
 +kPxJq85vldM4QOval72aieG77C9x9wVu8ZMP2gnHY5d75ayRWUb1fJbIFSn/S8Qr9o9
 314lnG4VDMTlsId763Pfi9N/XiDEsC3I2aTGo1+ICmBdGlvqwQ7BEt0DcU7kSYWmNRJr
 /gbwb9qGFDmoSKLbNdmS4MT7zxPJkY32hevq/QqnkIweS1ahnqIrmi9OVu0YWFX5wLjD
 1qQg==
X-Gm-Message-State: AOAM53229x+GlqkQSMc8/lt5oyCfNCy/NdaZed4QN5fw3iF1NZLyvQ/K
 wD9hL9wJKVwK2VgldL1z+wQuri9tB+g=
X-Google-Smtp-Source: ABdhPJzlBU4yTC1QNtSCPHsWwAAs7S1eDaq8zcFVKQLaEWhN0+FFjjgbxkIsSgVmTXszLzT1YHAeKw==
X-Received: by 2002:a05:600c:5126:: with SMTP id
 o38mr3886055wms.64.1631781604475; 
 Thu, 16 Sep 2021 01:40:04 -0700 (PDT)
Received: from x1w.redhat.com (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id b204sm4805905wmb.3.2021.09.16.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 01:40:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/sparc: Make sparc_cpu_dump_state() static
Date: Thu, 16 Sep 2021 10:40:02 +0200
Message-Id: <20210916084002.1918445-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sparc_cpu_dump_state() function is only called within
the same file. Make it static.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.h | 1 -
 target/sparc/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ff8ae73002a..1f40d768d8b 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -571,7 +571,6 @@ extern const VMStateDescription vmstate_sparc_cpu;
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
-void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 5a8a4ce7506..21dd27796d0 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -612,7 +612,7 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
 #define REGS_PER_LINE 8
 #endif
 
-void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
-- 
2.31.1


