Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677332A33A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:04:09 +0100 (CET)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6ZE-0003SR-40
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6UC-0006HK-Ng; Tue, 02 Mar 2021 09:58:57 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6UA-0005A4-K1; Tue, 02 Mar 2021 09:58:56 -0500
Received: by mail-ed1-x533.google.com with SMTP id s8so25576821edd.5;
 Tue, 02 Mar 2021 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
 b=PzxnRz+TT21E51h00VO4w6EwBK4uBXlC1idOB18LgNi+3yV1fU5phsOnJrU5RYNakr
 45TD1MtBXFcmbFMan7ALS+EzqYisulDtIvV2Z8tjR51nqKVFiXoaguBA8refjEweF98i
 WKaQLMj/+2mirtCXfH+rpe6GOPmUbHM9R4/VxGr+Y51sMjwRsaKsUbgwZ6XFhw0eIk5p
 mUb8iSvgDsvh69RpipuDaGhyRNcxBgEtmA/PuC4BpU8tR1hjx9UQgzIbw9JDPRIgeF4W
 Lx1HUYOABTY1r4WldGrla5fKkrrz3Ycbg5W1MgBHxn3l7ufNxC/K+j0rAu8z3aUj5+uQ
 wCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
 b=tfBXQWq9jdSxinonVrbnR4jey4mWfVlHIxgzbzLbV7cGuLMyPgLuPshYsGcJh8SnYp
 hv9aL8FoJsKnoqA0+Ec9Bz8K80DHESdPx/xalS4+yfCd5c2kIgWzxhJcx8KLYdwzlP3i
 zl+7s3gEdq6JGsYORe3fYlIEYjBF+Wo9e3Dr3s5v/rOewl6n3OaBbrHczMAs6ffdROBU
 /233zGHz3fj+RugIzWIkinbgDATfcW9MLD5jPWfJbM7ZC6gRHpBMQYAwMZVzxavKxlpz
 bIu9P7Euextb9Y8a2lBZZRF439C9Ob4eN67ds50/vmLaeNXBvtdYDePWyPC+OTbNs81I
 Ul2g==
X-Gm-Message-State: AOAM531Ragv4A6ovNG2ZRe966q3Km20RoUzP3dJcWPImyYfx+VC/VX/A
 8sfUK7wcEseCekJ4/Nvk7AmBphgSSIA=
X-Google-Smtp-Source: ABdhPJwVwRfRNiu2er/OHpx+xArXr0gZ7SPEHZUCgD/YEmWg0lWrzGwKDNXy+KYAT/7EtK3rnC5gww==
X-Received: by 2002:a05:6402:348c:: with SMTP id
 v12mr20696747edc.314.1614697131429; 
 Tue, 02 Mar 2021 06:58:51 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v8sm9399397edq.76.2021.03.02.06.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:58:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/27] cpu: Directly use cpu_write_elf*() fallback handlers
 in place
Date: Tue,  2 Mar 2021 15:57:55 +0100
Message-Id: <20210302145818.1161461-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No code directly accesses CPUClass::write_elf*() handlers out
of hw/core/cpu.c (the rest are assignation in target/ code):

  $ git grep -F -- '->write_elf'
  hw/core/cpu.c:157:    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:171:    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:186:    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:200:    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:440:    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
  hw/core/cpu.c:441:    k->write_elf32_note = cpu_common_write_elf32_note;
  hw/core/cpu.c:442:    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
  hw/core/cpu.c:443:    k->write_elf64_note = cpu_common_write_elf64_note;
  target/arm/cpu.c:2304:    cc->write_elf64_note = arm_cpu_write_elf64_note;
  target/arm/cpu.c:2305:    cc->write_elf32_note = arm_cpu_write_elf32_note;
  target/i386/cpu.c:7425:    cc->write_elf64_note = x86_cpu_write_elf64_note;
  target/i386/cpu.c:7426:    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
  target/i386/cpu.c:7427:    cc->write_elf32_note = x86_cpu_write_elf32_note;
  target/i386/cpu.c:7428:    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
  target/ppc/translate_init.c.inc:10891:    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
  target/ppc/translate_init.c.inc:10892:    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
  target/s390x/cpu.c:522:    cc->write_elf64_note = s390_cpu_write_elf64_note;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 43 ++++++++++++-------------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index daaff56a79e..a9ee2c74ec5 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -154,60 +154,45 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf32_qemunote) {
+        return 0;
+    }
     return (*cc->write_elf32_qemunote)(f, cpu, opaque);
 }
 
-static int cpu_common_write_elf32_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf32_note) {
+        return -1;
+    }
     return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
-static int cpu_common_write_elf32_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf64_qemunote) {
+        return 0;
+    }
     return (*cc->write_elf64_qemunote)(f, cpu, opaque);
 }
 
-static int cpu_common_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf64_note) {
+        return -1;
+    }
     return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
-static int cpu_common_write_elf64_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     return 0;
@@ -437,10 +422,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->has_work = cpu_common_has_work;
     k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
-    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
-    k->write_elf32_note = cpu_common_write_elf32_note;
-    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
-    k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.2


