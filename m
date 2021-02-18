Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E299131ED78
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:42:27 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnJq-0000D3-VU
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lCn0b-0007G5-V0
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:22:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:38934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lCn0Y-0007Qr-DG
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:22:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA718B03B;
 Thu, 18 Feb 2021 17:22:04 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v20 16/17] i386: gdbstub: only write CR0/CR2/CR3/EFER for
 SOFTMMU
Date: Thu, 18 Feb 2021 18:21:55 +0100
Message-Id: <20210218172156.25520-17-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218172156.25520-1-cfontana@suse.de>
References: <20210218172156.25520-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/gdbstub.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 41e265fc67..9f505d6ee3 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -383,26 +383,38 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
         case IDX_CTL_CR0_REG:
             if (env->hflags & HF_CS64_MASK) {
+#ifdef CONFIG_SOFTMMU
                 cpu_x86_update_cr0(env, ldq_p(mem_buf));
+#endif
                 return 8;
             }
+#ifdef CONFIG_SOFTMMU
             cpu_x86_update_cr0(env, ldl_p(mem_buf));
+#endif
             return 4;
 
         case IDX_CTL_CR2_REG:
             if (env->hflags & HF_CS64_MASK) {
+#ifdef CONFIG_SOFTMMU
                 env->cr[2] = ldq_p(mem_buf);
+#endif
                 return 8;
             }
+#ifdef CONFIG_SOFTMMU
             env->cr[2] = ldl_p(mem_buf);
+#endif
             return 4;
 
         case IDX_CTL_CR3_REG:
             if (env->hflags & HF_CS64_MASK) {
+#ifdef CONFIG_SOFTMMU
                 cpu_x86_update_cr3(env, ldq_p(mem_buf));
+#endif
                 return 8;
             }
+#ifdef CONFIG_SOFTMMU
             cpu_x86_update_cr3(env, ldl_p(mem_buf));
+#endif
             return 4;
 
         case IDX_CTL_CR4_REG:
@@ -427,10 +439,14 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
         case IDX_CTL_EFER_REG:
             if (env->hflags & HF_CS64_MASK) {
+#ifdef CONFIG_SOFTMMU
                 cpu_load_efer(env, ldq_p(mem_buf));
+#endif
                 return 8;
             }
+#ifdef CONFIG_SOFTMMU
             cpu_load_efer(env, ldl_p(mem_buf));
+#endif
             return 4;
 
         }
-- 
2.26.2


