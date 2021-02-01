Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43D30A512
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:12:02 +0100 (CET)
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WBc-0001uY-Cb
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8t-0008U4-AU
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:55330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8p-0005mf-Qj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0A84ABD6;
 Mon,  1 Feb 2021 10:09:06 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 02/23] target/riscv: remove CONFIG_TCG, as it is always TCG
Date: Mon,  1 Feb 2021 11:08:42 +0100
Message-Id: <20210201100903.17309-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

for now only TCG is allowed as an accelerator for riscv,
so remove the CONFIG_TCG use.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 567f6790a9..60d0b43153 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -617,10 +617,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-#ifdef CONFIG_TCG
     cc->tcg_ops.initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-#endif
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.26.2


