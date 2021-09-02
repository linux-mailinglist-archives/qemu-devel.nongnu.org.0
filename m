Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291663FF18D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:36:56 +0200 (CEST)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLphv-0002eK-82
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOo-0000i0-MZ; Thu, 02 Sep 2021 12:17:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOn-0001cz-2l; Thu, 02 Sep 2021 12:17:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id t15so3838481wrg.7;
 Thu, 02 Sep 2021 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
 b=NaB65rpK4UK7+XbBO28oZxFusXeQWuGTndzQkKqs4x497OOBypBPU5uctaWGbkSibX
 gbzbf0uKBllL7IMK9jeerTaWXdNmmwfHar32fZ/NCC0Cj626RXCkU3d8hlfsPo25otel
 OL/nvXSML0UuV9hTKCtQARxXaxraFStiKn4xGZp+OALpmFXy+6sqXkWFwBJFR6EcXMpL
 +gEhWt3eW2TEXJjoPvyiNmFQPJOj0yOdhR7ZZu+zEVqND+25gS72HJlWm9AWHklxn9DD
 TkIjI2aJpOFpKyf44h+zUsWbE/UTizlwAkVSUgam/bJtjGLksKc8rvZbllkWj5mw988x
 UXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pk3U565FofhMNBdH085OA9aU3aTnCsU54QbFBxwfMI8=;
 b=h3thKfneraVB+p5yU/BbssyzB7b6D9bIdabd52NHS1xDAOHDfsFE32u0CqxtUzZoPw
 Y74jPnwxRAgPmB/tMAtoOM/sGfF8Y6J+Z7BYzkM16FIi0yYwX1jZ5m19jO6dirNtZK6N
 U+LZfNbbRKJppljC9Mme88OZqrodvPdmKHiSTWdEtdEEemPQQBe+o9iK/nOcKRu9TdTX
 8HA66CpJ8X7JMZyYf3ZCJoUEvTdQPmZTlN4RQicT96eTZl+UQ/3NJouo8bR9XrERW+Z3
 m3kVaKCuCCTe0C3eS+wxQpjOVYgxIMwi8iMJ+bcUyQ447JEqK3IeIgTqhITxox9yG3hN
 1AtA==
X-Gm-Message-State: AOAM530bU18pzGboNaRixhfC/t1e6b8MBo+ryO+EXSLI+IbSAzg3CEun
 crVAdVoXoIf3ds4J0bVDgUMVoEWdvH4=
X-Google-Smtp-Source: ABdhPJxJ0WzmriUMp5BLtv/IKodEKm5HtzrJCRMHsGjbOs/WMzY0lZa1I+orMo+J9P/Vgaj+G+An4w==
X-Received: by 2002:adf:f991:: with SMTP id f17mr4751225wrr.56.1630599425756; 
 Thu, 02 Sep 2021 09:17:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y4sm2068566wmi.22.2021.09.02.09.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to sysemu
 and TCG
Date: Thu,  2 Sep 2021 18:15:26 +0200
Message-Id: <20210902161543.417092-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bfc..cf1f656218f 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -147,6 +149,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -163,7 +166,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1


