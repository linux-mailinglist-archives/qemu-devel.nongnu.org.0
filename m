Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2041832F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:20:56 +0200 (CEST)
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9U0-0007LH-08
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93w-0003At-Ly; Sat, 25 Sep 2021 10:54:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93v-0006zi-4A; Sat, 25 Sep 2021 10:54:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id i24so20541343wrc.9;
 Sat, 25 Sep 2021 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAYjmxiur5f+p7A1SrpNSihQLXDhLnmlUZZ8rIaewhE=;
 b=aQxsRYQIMX8vJbc7+lkGv7kE8uACN+7zrjpIq2yWAjSL8UvPXbHELavSQ9c9vi8Z7B
 BW3Dg2azlaaDlsw288fesgycwhPhWqxCXvCEPDpBRmsmo0gQegoANT3NAWTAaBNqDYzy
 uVAYOBukMyJFT0opo4hq5CEtygQh4lgV0HcVpf6wsEkaNn065NnbIxEhKVzmq6+m/w9v
 LEkzDKA8qPB/1np09OThfB8I6FLDhKt/S0rU6zHFmlDAXCB4vVWi9BOH62tOo+gPXYBQ
 bHYosYwl7U0Qiw+LsO9/oFHYXOwEJ8v+IDeJ1cLVE4K0wlzySH34d7pf4M4kqnOjyhCu
 a9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZAYjmxiur5f+p7A1SrpNSihQLXDhLnmlUZZ8rIaewhE=;
 b=cDZvRi/SGz8xtUjYeHrg7Yir7svJKH548VHqZzt2oDHuZ3exUCUVuepW581MZQ7avq
 D7ydnv3lCznNM9dRuuSO/tXMi+yuJSlHsWvHWHlnoMBjzwxEP6Uy16clgXygKyvn0UwU
 Bd+wpSjMb1E8GopX68IwS22vsPvw/f8md/TvMAW/rjn5Gw57ly5bAUUUI2gSP3FXRPhI
 SEED/75djhND+Pu3pa1dBWmz3N1qE5U2FykM3PVJ3B8DJGivjSjzm0jEHbUbBH8HAGCq
 K4/BEXMqCdE1DmYMw3nfVdQ2eisPVf6OKxsfSqB8t9Ln+mG9s18VIDDk4Vtgvw1XbI2E
 h8qA==
X-Gm-Message-State: AOAM531eNsk36YoTBEeSxCoi9UpoJAjd3TQz7IsrhQdKhoS/IEG11yOL
 dhnnyGun9X1K2by87IsJxJGSMTXhH1E=
X-Google-Smtp-Source: ABdhPJzLqwLC9wkrI46iPIBPW/hBXnGqEP5zHnqRLbDFPrkBdvJsIbHHen+DjFsKWtWpCby8aG488Q==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr7108728wmc.113.1632581637285; 
 Sat, 25 Sep 2021 07:53:57 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z17sm11127651wml.24.2021.09.25.07.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 33/40] target/s390x: Restrict has_work() handler to sysemu
 and TCG
Date: Sat, 25 Sep 2021 16:51:11 +0200
Message-Id: <20210925145118.1361230-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/s390_flic.c | 15 ++++++++++++---
 target/s390x/cpu.c  |  4 +++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
index 74e02858d43..22bc38e9b4e 100644
--- a/hw/intc/s390_flic.c
+++ b/hw/intc/s390_flic.c
@@ -312,19 +312,28 @@ static void qemu_s390_inject_crw_mchk(S390FLICState *fs)
 
 bool qemu_s390_flic_has_service(QEMUS390FLICState *flic)
 {
-    /* called without lock via cc->has_work, will be validated under lock */
+    /*
+     * Called without lock via TCGCPUOps::has_work,
+     * will be validated under lock.
+     */
     return !!(flic->pending & FLIC_PENDING_SERVICE);
 }
 
 bool qemu_s390_flic_has_io(QEMUS390FLICState *flic, uint64_t cr6)
 {
-    /* called without lock via cc->has_work, will be validated under lock */
+    /*
+     * Called without lock via TCGCPUOps::has_work,
+     * will be validated under lock.
+     */
     return !!(flic->pending & CR6_TO_PENDING_IO(cr6));
 }
 
 bool qemu_s390_flic_has_crw_mchk(QEMUS390FLICState *flic)
 {
-    /* called without lock via cc->has_work, will be validated under lock */
+    /*
+     * Called without lock via TCGCPUOps::has_work,
+     * will be validated under lock.
+     */
     return !!(flic->pending & FLIC_PENDING_MCHK_CR);
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3a..df8ade9021d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -88,6 +88,7 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool s390_cpu_has_work(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -104,6 +105,7 @@ static bool s390_cpu_has_work(CPUState *cs)
 
     return s390_cpu_has_int(cpu);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
@@ -269,6 +271,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
     .tlb_fill = s390_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = s390_cpu_has_work,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
@@ -292,7 +295,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
-    cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
-- 
2.31.1


