Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC53265E3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:53:59 +0100 (CET)
Received: from localhost ([::1]:49582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgNK-0004qa-0p
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3b-0004vO-9j; Fri, 26 Feb 2021 11:33:36 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3Z-0007ln-Rt; Fri, 26 Feb 2021 11:33:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so9180968wrz.0;
 Fri, 26 Feb 2021 08:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=baCqRvN00Z/k/DEXOAL/5KZeUutEyX82NGJVX6NTZLs=;
 b=u9dJ4pVzXSwxq5IiQhegu1sOjFWEW7egjSz/FQoJsphQZou4dOyYMt0eyvd1ZgYI6r
 zqw8JHbducASA5HS/LZ3IDuoCxy/JoYX7PmwaANwfv1Bt2SEWk1ESZ13U652VxxjYQcA
 chHDFzB3YckwqnfDNaOi+A6mErQGQNHVzHcCmjtSipUb3q/7Q52B+ef0+5arwqIKxXGs
 c2m4stWcUo+fvEELRbJmVZjoPiEV8XVgtNdsjt4Mko0ETa5Q4OzMZezwFlgDHwg6t1fl
 9og7VK24NfaTw4gzWLjpa73mLaO+wnVBT4cca6dgJXNwAfR9uX2xvLRSNbyt3Qqr5nJk
 j07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=baCqRvN00Z/k/DEXOAL/5KZeUutEyX82NGJVX6NTZLs=;
 b=FAU3wRZYClB+mHLdsjhMwJgXCXpkdWzpm3AzdkkZ93qcxwKdeAREwJ5bHlOMpr7vP4
 Q5WK8EoAQYiN+sf/V7pCpZFxC48o3k7+fPcMQP7rP/JnME6bfD8Q58suLmJYIhVQsXUZ
 funXQKoaDyAq4ymIywMjcF6eE7YTnxMWVO+dNS1Wszu0H8v532904ksAl5ItFDaRkrHt
 ryWJEMorBGWRhnDTbvBEQCTtZAw6ziWXX8fZ9rOsOTps8KtNTvY1UCNHQj8IIQBI7wNQ
 42JtpmP9xCUXk3VfqJ3bB9eNr2swuBBqTSDonSUujnzV1LxEdt79BqfvCJgKkhUxs5kG
 Acwg==
X-Gm-Message-State: AOAM532aRaBHdtM1fd3jmv2Q+p96beG4omQaFe9Dtlevws+gb2axb4Jd
 FlCdycJNQUTanRGYf3/KE9FqEskDjbQ=
X-Google-Smtp-Source: ABdhPJxjCs2JxncQfVm0YSDcSrxNvscTyYbwl/6+HAP3K697dMGc/y0VN2x7nHDMh7k8w+9BY14CcA==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr4035012wrv.176.1614357210978; 
 Fri, 26 Feb 2021 08:33:30 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm16664975wrn.0.2021.02.26.08.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/16] cpu: Move CPUClass::get_crash_info to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:21 +0100
Message-Id: <20210226163227.4097950-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_crash_info() is called on GUEST_PANICKED events,
which only occur in system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 6 +++++-
 hw/core/cpu.c         | 4 ++--
 target/i386/cpu.c     | 2 +-
 target/s390x/cpu.c    | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fe85a1b81e6..87186e85d44 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,11 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
+    /**
+     * @get_crash_info: Callback for reporting guest crash information in
+     * GUEST_PANICKED events.
+     */
+    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      *       runtime configurable endianness is currently big-endian.
@@ -166,7 +171,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 86b65624a9e..ddf5635d87b 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -220,8 +220,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
+    if (cc->system_ops.get_crash_info) {
+        res = cc->system_ops.get_crash_info(cpu);
     }
     return res;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae7f7763dfc..9692843256c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7421,7 +7421,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->get_crash_info = x86_cpu_get_crash_info;
+    cc->system_ops.get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 8ba8a96b4d5..f9107cb7179 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -518,7 +518,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_s390_cpu;
-    cc->get_crash_info = s390_cpu_get_crash_info;
+    cc->system_ops.get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-- 
2.26.2


