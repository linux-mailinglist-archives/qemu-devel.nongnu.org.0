Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025E37A1C7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:27:06 +0200 (CEST)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNjN-0002Ht-JX
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWs-0001pX-UR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWm-0000m8-C9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c0OSnY2GQ5IRrGmFOKggWZRRaN+aU5hoWc5lqlha5w8=;
 b=CIECnOrCk9pO6344sfqDTtLu6ngJemHX/BzYCd0/bKWgqdIKsr4MKBX966/NEB7CIPYybj
 W8YZLknjpH8YZRXP7mWs+/OlNwvCYMk+DtY0VVu2YTbsF1EmZ0lsUb/BZVkuWKr+AMXaDp
 H9VLaBXPlUzO8OIZM16I4sm4eRhA1pM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-0wuqOomTNBuNjPU52pHRmg-1; Tue, 11 May 2021 04:14:01 -0400
X-MC-Unique: 0wuqOomTNBuNjPU52pHRmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A98418030CF;
 Tue, 11 May 2021 08:14:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57FD419D9D;
 Tue, 11 May 2021 08:14:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] target/i386: gdbstub: only write CR0/CR2/CR3/EFER for
 sysemu
Date: Tue, 11 May 2021 04:13:35 -0400
Message-Id: <20210511081350.419428-19-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-21-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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



