Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8465424E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:03:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8M9E-0004B1-Tj; Thu, 22 Dec 2022 09:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p8M9C-00049D-M0
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p8M9A-0002Jv-Pg
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671717727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=psYpXFZJd9iMBCgIXFCT667Wt4KdIeMQMYQbJ2QeeZk=;
 b=Urmccq0DUxCcPd4bsTmDKLtcHAAmSMcwa3ftYz1z1EKNwr29R+dBwwF5PIiXc+qeD4ndQ2
 GLa/YPpMKvdEP9urzOztZtOHeeCLDUxRevdS+s7VBmbyUBEoDBLWw9HLQ55USfb2pbFFJA
 Ipmg4zu0AQSlI19jUn4ATiUhrQBaPmM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-KroXwitFMYuCvrIuq4lxuw-1; Thu, 22 Dec 2022 09:02:05 -0500
X-MC-Unique: KroXwitFMYuCvrIuq4lxuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F32D38149B5;
 Thu, 22 Dec 2022 14:02:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5521E51EF;
 Thu, 22 Dec 2022 14:02:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 stefanha@redhat.com, peter.maydell@linaro.org, sw@weilnetz.de
Subject: [PATCH v3] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Date: Thu, 22 Dec 2022 15:01:58 +0100
Message-Id: <20221222140158.1260748-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

To avoid compilation errors when -Werror=maybe-uninitialized is used,
add a default case with g_assert_not_reached().

Otherwise with GCC 11.3.1 "cc (GCC) 11.3.1 20220421 (Red Hat 11.3.1-2)"
we get:

../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2495 |     d->Q(3) = r3;
          |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2494 |     d->Q(2) = r2;
          |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2493 |     d->Q(1) = r1;
          |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2492 |     d->Q(0) = r0;
          |     ~~~~~~~~^~~~

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- use g_assert_not_reached() and document the compiler in use
---
 target/i386/ops_sse.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3cbc36a59d..0bd6bfad8a 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
         r0 = s->Q(2);
         r1 = s->Q(3);
         break;
+    default: /* default case added to help the compiler to avoid warnings */
+        g_assert_not_reached();
     }
     switch ((order >> 4) & 3) {
     case 0:
@@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
         r2 = s->Q(2);
         r3 = s->Q(3);
         break;
+    default: /* default case added to help the compiler to avoid warnings */
+        g_assert_not_reached();
     }
     d->Q(0) = r0;
     d->Q(1) = r1;
-- 
2.37.3


