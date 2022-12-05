Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9354964268A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:16:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Ch-0003QP-CT; Mon, 05 Dec 2022 04:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28CS-00034Q-Ff
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28CN-0007QX-DS
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnkYOrTgO+HGLMQelFOS97QjJMRgo81PYH7NJKA+HKk=;
 b=R1oPZn5waUm1MpNohvAiQEYBFMFNVxuLCpleOEKpiZK8z57kPlUmIXcZRmsk4rjItsqeQ5
 da8TbB5/1l8zb132/Gdm5XTge+UqlLFi6rD/IYQp9fs0t/WSgxT6eTiqMiOzjRrUwMIsUu
 bzjHqI//SsF4wOFcMgyimQS2g5b3yo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-8t4q3dc7PkiPR_2Ty-aeZg-1; Mon, 05 Dec 2022 04:55:40 -0500
X-MC-Unique: 8t4q3dc7PkiPR_2Ty-aeZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5829B185A794;
 Mon,  5 Dec 2022 09:55:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F35CF2166B29;
 Mon,  5 Dec 2022 09:55:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Hoffman <dhoff749@gmail.com>
Subject: [PATCH v2 23/51] target/i386: Always completely initialize
 TranslateFault
Date: Mon,  5 Dec 2022 10:52:00 +0100
Message-Id: <20221205095228.1314-24-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 405a5d414a..55bd1194d3 100644
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


