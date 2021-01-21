Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB42FE9D2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:20:21 +0100 (CET)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ywm-0004CH-6Q
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2Ytd-0000Or-FZ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2YtZ-0005aS-PF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611231421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+8j1hH7jeUDhRL6r6WJYjLKhvbx9A4qNKtlkErNyew=;
 b=hNrq253025nXIAhodaze3x6kbhuRpyToZ1zEwG9EH0QS887c7oRVd6LOHviUZZHEOJO/Pc
 HMcO3+0NsKsXaBkQ8C+xz1DrJGB2+N5270GIkYNGgdXH4si2yAs1NWZPXNTh6d7lNJsC8V
 IJLiDgMDv2qIdKGKMZ7GsG8ZxMt/uS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-rquWPXDyOqyJeEHJWuB3qQ-1; Thu, 21 Jan 2021 07:16:58 -0500
X-MC-Unique: rquWPXDyOqyJeEHJWuB3qQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD6DBEC1A0;
 Thu, 21 Jan 2021 12:16:57 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 620F710021B3;
 Thu, 21 Jan 2021 12:16:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 9/9] s390x: Use strpadcpy for copying vm name
Date: Thu, 21 Jan 2021 13:16:29 +0100
Message-Id: <20210121121629.530506-10-cohuck@redhat.com>
In-Reply-To: <20210121121629.530506-1-cohuck@redhat.com>
References: <20210121121629.530506-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

Using strncpy with length equal to the size of target array, GCC 11
reports following warning:

  warning: '__builtin_strncpy' specified bound 256 equals destination size [-Wstringop-truncation]

We can prevent this warning by using strpadcpy that copies string
up to specified length, zeroes target array after copied string
and does not raise warning when length is equal to target array
size (and ending '\0' is discarded).

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <6f86915755219cf6a671788075da4809b57f7d7b.1610607906.git.mrezanin@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/kvm.c         | 12 +++++-------
 target/s390x/misc_helper.c |  7 +++++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index b8385e6b95d3..dc27fa36c99a 100644
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
index 58dbc023eb54..7ea90d414aa8 100644
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
2.26.2


