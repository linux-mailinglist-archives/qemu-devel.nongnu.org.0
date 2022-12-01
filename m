Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2B63EBB4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:59:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fLN-0002kQ-QU; Thu, 01 Dec 2022 03:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fLL-0002gL-5k
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fKx-0003fR-5Q
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sc9apsk13PK2+ozugtSAH9pSS99PC+V0tvFuiyMctzg=;
 b=fHNlB9cqSQHnpfXRZlDLIVkc6aJqRsyFDSII6pjpqBCzx7gnZ1AEb0KUhukR5onSTm/vfX
 irdgBOL5+taid6hSI3rc2lqx1UakzlmlDMgg3NMGC1IJHIqQJja1nAmChF0YpE+lwVCjAx
 3tsZmNxwQTP3oNyddjcLK8dwUsjGFys=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-KeqkLjAONMmNPsBGeFFtWg-1; Thu, 01 Dec 2022 03:54:29 -0500
X-MC-Unique: KeqkLjAONMmNPsBGeFFtWg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn36-20020a1709070d2400b007ba3374574dso893593ejc.23
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sc9apsk13PK2+ozugtSAH9pSS99PC+V0tvFuiyMctzg=;
 b=6Wls1bzKPVX26w4HNnB/TIzhDsGi8gcvkJ8QMn2upugDLN+xOhvOp+Z1JGnqivdEdq
 XRH0xXzZtFtuds7eOHsnaR5qVAJo7s5j5tzd3LbJMptc7Qb6N4XTsLuKSdjxNhQZJrAn
 q2CD1ulURRly3RIXa9IDV0AOD2qYv0mRYQZ/D3Jya0fq9ZEpA2P+vv9pIMpmOoeptm5f
 xzB2QTav1iQ4+6vCwSl/SlJmXyoJhI7Ow+AWpb54yHgzU/gloWqlIudDlsNFjSPUe+IK
 gG+QGIWFw50cTb67JzBU+eeUQ6CtpjbpooKibdBhRM0sHmeBl2LwH+qzBatz5cvxDYxk
 N2Aw==
X-Gm-Message-State: ANoB5pntoXME6Y40qm5+LJOVMmyffq5TTq6AUP8tDAuvFa36+pJi34uA
 CK6G77Y1ZBzx//9L25JK2y9RHUEU8Na7wD/bvz2sIowx2YpWDeJBfN0V2vWQooI24E6+YkW1a4q
 sMZrZTnwZ6tDh2iaOZySGsXGqdCoPvYwAMjN9vehlAIaukzLZUWGX3VsklHDxawN3TE8=
X-Received: by 2002:a05:6402:3642:b0:459:53dc:adc9 with SMTP id
 em2-20020a056402364200b0045953dcadc9mr1233520edb.166.1669884867678; 
 Thu, 01 Dec 2022 00:54:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4/pVAH7sPLcVCLu4l5lq6FPr+J4J9jG7K84hIynLweZOjYnnukR01Ms/zt5nsrdPF+JwrIOg==
X-Received: by 2002:a05:6402:3642:b0:459:53dc:adc9 with SMTP id
 em2-20020a056402364200b0045953dcadc9mr1233510edb.166.1669884867361; 
 Thu, 01 Dec 2022 00:54:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a1709062b5700b007c0991735c0sm1524867ejg.79.2022.12.01.00.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 00:54:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Hoffman <dhoff749@gmail.com>
Subject: [PULL 2/2] target/i386: Always completely initialize TranslateFault
Date: Thu,  1 Dec 2022 09:54:19 +0100
Message-Id: <20221201085419.146789-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201085419.146789-1-pbonzini@redhat.com>
References: <20221201085419.146789-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

In get_physical_address, the canonical address check failed to
set TranslateFault.stage2, which resulted in an uninitialized
read from the struct when reporting the fault in x86_cpu_tlb_fill.

Adjust all error paths to use structure assignment so that the
entire struct is always initialized.

Reported-by: Daniel Hoffman <dhoff749@gmail.com>
Fixes: 9bbcf372193a ("target/i386: Reorg GET_HPHYS")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221201074522.178498-1-richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1324
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 34 ++++++++++++++++------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 405a5d414a14..55bd1194d31b 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -71,10 +71,11 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
         TranslateFault *err = inout->err;
 
         assert(inout->ptw_idx == MMU_NESTED_IDX);
-        err->exception_index = 0; /* unused */
-        err->error_code = inout->env->error_code;
-        err->cr2 = addr;
-        err->stage2 = S2_GPT;
+        *err = (TranslateFault){
+            .error_code = inout->env->error_code,
+            .cr2 = addr,
+            .stage2 = S2_GPT,
+        };
         return false;
     }
     return true;
@@ -431,10 +432,11 @@ do_check_protect_pse36:
                                   MMU_NESTED_IDX, true,
                                   &pte_trans.haddr, &full, 0);
         if (unlikely(flags & TLB_INVALID_MASK)) {
-            err->exception_index = 0; /* unused */
-            err->error_code = env->error_code;
-            err->cr2 = paddr;
-            err->stage2 = S2_GPA;
+            *err = (TranslateFault){
+                .error_code = env->error_code,
+                .cr2 = paddr,
+                .stage2 = S2_GPA,
+            };
             return false;
         }
 
@@ -494,10 +496,11 @@ do_check_protect_pse36:
         }
         break;
     }
-    err->exception_index = EXCP0E_PAGE;
-    err->error_code = error_code;
-    err->cr2 = addr;
-    err->stage2 = S2_NONE;
+    *err = (TranslateFault){
+        .exception_index = EXCP0E_PAGE,
+        .error_code = error_code,
+        .cr2 = addr,
+    };
     return false;
 }
 
@@ -564,9 +567,10 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
                 int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
                 int64_t sext = (int64_t)addr >> shift;
                 if (sext != 0 && sext != -1) {
-                    err->exception_index = EXCP0D_GPF;
-                    err->error_code = 0;
-                    err->cr2 = addr;
+                    *err = (TranslateFault){
+                        .exception_index = EXCP0D_GPF,
+                        .cr2 = addr,
+                    };
                     return false;
                 }
             }
-- 
2.38.1


