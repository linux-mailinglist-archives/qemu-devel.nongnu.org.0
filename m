Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AFD346539
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:32:02 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjwn-0001dh-7z
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjGW-0007Z6-2B
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:54990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFv-00012G-F8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C3CDAF13;
 Tue, 23 Mar 2021 15:47:08 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 54/55] target/arm: tcg: remove superfluous CONFIG_TCG check
Date: Tue, 23 Mar 2021 16:46:38 +0100
Message-Id: <20210323154639.23477-47-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

modules under tcg/ are only built for CONFIG_TCG anyway.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/vfp_helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 521719f327..0cc6c85270 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -21,10 +21,8 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "internals.h"
-#ifdef CONFIG_TCG
 #include "qemu/log.h"
 #include "fpu/softfloat.h"
-#endif
 
 /* VFP support.  We follow the convention used for VFP instructions:
    Single precision routines have a "s" suffix, double precision a
@@ -40,8 +38,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
     vfp_set_fpscr(env, val);
 }
 
-#ifdef CONFIG_TCG
-
 #define VFP_HELPER(name, p) HELPER(glue(glue(vfp_,name),p))
 
 #define VFP_BINOP(name) \
@@ -1110,5 +1106,3 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
 
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
-
-#endif
-- 
2.26.2


