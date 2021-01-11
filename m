Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093F2F1BEF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:11:34 +0100 (CET)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0j7-0003Pc-EY
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kz0hS-000264-Hr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kz0hQ-0006AN-MB
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610384987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=DAlTZGhIdCns2CGdpg7+SlQVh33iem4kbY1C1OfwB6w=;
 b=fVqTPstscxaI5MS6P9cpUkh7cH8cgs/JAJbJXkobcFwSayFyODDneFShKORt+0eOtjxDhr
 Ow0teXyh4St8y98ROCDMdBrbgHPSUvkZffb7SjrbPeBvihVOFwu71zOGKUlDt03hKQaSw+
 20lSJaR93ejiflobWWgL3pi2yt+Km/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-dNrCCTkkNYqAu3XQA_CQWQ-1; Mon, 11 Jan 2021 12:09:45 -0500
X-MC-Unique: dNrCCTkkNYqAu3XQA_CQWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131CEBBEE0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 17:09:45 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7399F19D9F
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 17:09:44 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] s390x: Use strpadcpy for copying vm name
Date: Mon, 11 Jan 2021 18:09:41 +0100
Message-Id: <7334beb15bb36de2f9472264bea284f91abf686f.1610384501.git.mrezanin@redhat.com>
In-Reply-To: <cover.1610384501.git.mrezanin@redhat.com>
References: <cover.1610384501.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using strncpy with lenght equal to size of target array,
GCC 11 produce following warning:

   warning: '__builtin_strncpy' specified bound 256 equals destination size [-Wstringop-truncation]

To prevent this warning, use strpadcpy function that will enusure that
provide functionality similar to strncpy but allow copy strings with
length equal size of target array (and discarding endint zero) and
ensure array is zeroed after copied string.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 target/s390x/kvm.c         | 12 +++++-------
 target/s390x/misc_helper.c |  7 +++++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index b8385e6b95..dc27fa36c9 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -29,6 +29,7 @@
 #include "internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm_int.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
@@ -1910,18 +1911,15 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
                                                     strlen(qemu_name)));
     }
     sysib.vm[0].ext_name_encoding = 2; /* 2 = UTF-8 */
-    memset(sysib.ext_names[0], 0, sizeof(sysib.ext_names[0]));
     /* If hypervisor specifies zero Extended Name in STSI322 SYSIB, it's
      * considered by s390 as not capable of providing any Extended Name.
      * Therefore if no name was specified on qemu invocation, we go with the
      * same "KVMguest" default, which KVM has filled into short name field.
      */
-    if (qemu_name) {
-        strncpy((char *)sysib.ext_names[0], qemu_name,
-                sizeof(sysib.ext_names[0]));
-    } else {
-        strcpy((char *)sysib.ext_names[0], "KVMguest");
-    }
+    strpadcpy((char *)sysib.ext_names[0],
+              sizeof(sysib.ext_names[0]),
+              qemu_name ?: "KVMguest", '\0');
+
     /* Insert UUID */
     memcpy(sysib.vm[0].uuid, &qemu_uuid, sizeof(sysib.vm[0].uuid));
 
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 58dbc023eb..7ea90d414a 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
@@ -369,8 +370,10 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
                 ebcdic_put(sysib.sysib_322.vm[0].name, qemu_name,
                            MIN(sizeof(sysib.sysib_322.vm[0].name),
                                strlen(qemu_name)));
-                strncpy((char *)sysib.sysib_322.ext_names[0], qemu_name,
-                        sizeof(sysib.sysib_322.ext_names[0]));
+                strpadcpy((char *)sysib.sysib_322.ext_names[0],
+                          sizeof(sysib.sysib_322.ext_names[0]),
+                          qemu_name, '\0');
+
             } else {
                 ebcdic_put(sysib.sysib_322.vm[0].name, "TCGguest", 8);
                 strcpy((char *)sysib.sysib_322.ext_names[0], "TCGguest");
-- 
2.18.4


