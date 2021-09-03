Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDBC4004C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:21:47 +0200 (CEST)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDor-0005wf-4m
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDQ0-0001YA-Lx; Fri, 03 Sep 2021 13:56:00 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDPz-0000va-3b; Fri, 03 Sep 2021 13:56:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id u16so9297149wrn.5;
 Fri, 03 Sep 2021 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=no54DBHygRvQO4Ut1DPMpDN6V0TFHDniNPGIJAMWDds=;
 b=HY0bSqJUHzy4EekHXFO1+tizVqtdClsne8oqcFdklQHAUIl/bMbtGEfhmBPL3p4lUS
 ddv+QXsYjkbjejZ9qB0h7Kprq1VlgUKLHXBJvN0da8w3rCf23UuKOwMse2ubihOjdY4f
 NI/92A9ZUl3n7x7TplUKJY+k22pTAGRmwoaezXoNAHXM9FR4pfKnXW+oniR5pQRtrzKA
 d3wx9x7bhGERD5BvPTeWY5kYGULK8KZyONpaov/YbdDmg/6U00NWgLbVIomYfUbMyFAe
 ZlBzcc3uGgxpljLIEp+Ddy78niOZV6LXW4OoNxk1JZbs567dbgposFrBAKcFnoohQKua
 CspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=no54DBHygRvQO4Ut1DPMpDN6V0TFHDniNPGIJAMWDds=;
 b=J41JSscdjC33iRK9iHAOZW04nWO71Cftq0/LCCmTtpNlSwWuqEasuPKNgFI8/tHHJm
 sZlbnPY5m0a3AErRJZCqXAKsjcQdsD63hrYuCux66MIM1fQuPPHvSSHKd97WMsuvWFox
 zgQOfnuzL9jXPFjr7rIa10M0IqQ7GGy03RUxaWgmgPLodb/F2NN6Zt53pv6BbPk86IId
 gfdLa2I8ygoP6V5r9B5bpsH4CdMcV7g7sMXVv2EmmDi/lsPvJ3oNagwbPj8NKRVxNGVB
 3aRfxdo+G1beiDXM0hNe5xA7/94Q26REQ2B4Ffs2rH048y+ZagwoRJbdDtcP0a7czRFc
 a9Gw==
X-Gm-Message-State: AOAM5311ktyaLJBblwldXVVepaPHuH0WL2huCGjVJywyusYEnon7FgD/
 VM74Iy6xVA9KJA1zMY7n4aje7NPOvQE=
X-Google-Smtp-Source: ABdhPJwuz7MFgaTaUJslXIyo0UnvG+6DkDv5ji/sUicbfAx1LQmp3cP9IP7JOTw5/93dCwHRNZ9ASQ==
X-Received: by 2002:adf:e509:: with SMTP id j9mr315878wrm.320.1630691756644;
 Fri, 03 Sep 2021 10:55:56 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l15sm73606wms.38.2021.09.03.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:55:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/30] target/s390x: Restrict has_work() handler to sysemu
 and TCG
Date: Fri,  3 Sep 2021 19:55:49 +0200
Message-Id: <20210903175549.756092-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

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


