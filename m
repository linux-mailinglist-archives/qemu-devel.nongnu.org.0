Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15C33DD2E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:13:15 +0100 (CET)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMF7z-0004Ku-02
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMETS-0004y5-Ok
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:31:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMETM-0004tf-HW
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:31:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E691EAF1B;
 Tue, 16 Mar 2021 18:30:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v27 19/20] target/i386: gdbstub: only write CR0/CR2/CR3/EFER
 for sysemu
Date: Tue, 16 Mar 2021 19:30:34 +0100
Message-Id: <20210316183035.9424-20-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316183035.9424-1-cfontana@suse.de>
References: <20210316183035.9424-1-cfontana@suse.de>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/gdbstub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 4ad1295425..098a2ad15a 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -351,22 +351,30 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
         case IDX_CTL_CR0_REG:
             len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+#ifndef CONFIG_USER_ONLY
             cpu_x86_update_cr0(env, tmp);
+#endif
             return len;
 
         case IDX_CTL_CR2_REG:
             len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+#ifndef CONFIG_USER_ONLY
             env->cr[2] = tmp;
+#endif
             return len;
 
         case IDX_CTL_CR3_REG:
             len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+#ifndef CONFIG_USER_ONLY
             cpu_x86_update_cr3(env, tmp);
+#endif
             return len;
 
         case IDX_CTL_CR4_REG:
             len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+#ifndef CONFIG_USER_ONLY
             cpu_x86_update_cr4(env, tmp);
+#endif
             return len;
 
         case IDX_CTL_CR8_REG:
@@ -378,7 +386,9 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
         case IDX_CTL_EFER_REG:
             len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+#ifndef CONFIG_USER_ONLY
             cpu_load_efer(env, tmp);
+#endif
             return len;
         }
     }
-- 
2.26.2


