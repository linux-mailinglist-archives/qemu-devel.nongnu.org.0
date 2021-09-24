Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F000417000
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:07:54 +0200 (CEST)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi7V-0004OR-4F
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhy-0006XY-39; Fri, 24 Sep 2021 05:41:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhw-00083T-Gx; Fri, 24 Sep 2021 05:41:29 -0400
Received: by mail-wr1-x429.google.com with SMTP id t7so25386146wrw.13;
 Fri, 24 Sep 2021 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUBogEzePDVOMR5F40RC1OgAVa089kvAJx/8ALSm6vg=;
 b=TRbCXATlimzfFn3xJILPImXwRPAEdONDFO7iEG7mXCPKW8VvkvvaQHGfk9cFP4vJff
 xXgaC3VM+jC0KyJLV1wCa67d0QDExIEI5aBqVi4FD+zfTsE3upWxOrCEhlwv6i9cfILw
 h9SBDMf7eZhTPMD+WplXb02QO2GAhPcedE2u8h+xjXBx9WkawcQkixMoT/j92wLfe+UE
 /JV227kiO4kMS5RwJv3VdxojqaLEjMdEe3xkxWUcEseZiPSsJAB9E2t2lJ7uVTOlVP46
 0yQ1KQC6LrYiNDton2yFfnrmmrqyLlQ/SlaapnV28wpf1uX7YnN7mtvp4KZq2ESpEK2/
 DIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oUBogEzePDVOMR5F40RC1OgAVa089kvAJx/8ALSm6vg=;
 b=7FvJuI0MdatprnIP58aObW5JfgV0w31T8wYWbdvTMF0AeS1vIQfgsNz3kZkoQwOoh1
 44f80ZLgxFURY7xtrzeAX1WoN283+KgUMzCnJXIBas/Wg+wcMDLGCYXL1+y+UzdOlaTy
 ZOvqoMxF1+Tu2xj7RDfmoMGTiv2fVnus6XW9Y1dbUOmOE+VjMriz7doo+pH9JrMZS9f8
 HmRs+LCLRVhIfHz/xaBXW2HNarSWtLEbjUbDJIgat/Zc0wObHyE/tJhoprL+cfAfny58
 oFR7mB3iH8cxQo+lARb70JfQ/xDW6KnhR+Oyg3A++9Gza6oAdqRseTE0CIZLza1dNc9O
 Vohw==
X-Gm-Message-State: AOAM530EgyzI4O+1Q8nVPJW/fS72Bz/JyrkB6x84tD4iEpUdzgx5In00
 nny9yP5nc0LyVI8TNmcoDPJHlNR6uMw=
X-Google-Smtp-Source: ABdhPJz+7nyxHF1nrxxG5t8WS9urjYReQYkBJ39tztYmgXsQ5JxMIjUgkRvK9B/q+rwq8Pq8lQIQuA==
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr1042384wms.81.1632476486188; 
 Fri, 24 Sep 2021 02:41:26 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n14sm6141369wmc.38.2021.09.24.02.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 33/40] target/s390x: Restrict has_work() handler to sysemu
 and TCG
Date: Fri, 24 Sep 2021 11:38:40 +0200
Message-Id: <20210924093847.1014331-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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


