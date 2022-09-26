Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42EC5EAFAF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:24:13 +0200 (CEST)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsm4-00044n-V6
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrak-0005gW-FI
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrai-0005R9-7g
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lv9JEtvC8Q9NR3hoGvVfp5npEXHwNUmNVmbvcxZPzPk=;
 b=JsRMDA+M1LThg/ANijT7IrGhk++RibAfMTtTbpUDN4UNZvqETr/L5Y/KvOcI29vKljY2G/
 TIXH0x6r8h1ZbzjXrwTEUyuTEKAALcHD5vMBE2qpQaLTBX5LtUcUAp8nJVZ36w5HNacSaq
 EoI4hcPNxVIgH6CdvPJONCAD9YpACbI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-VRMP4OcsPDulBoxNtWb4Xw-1; Mon, 26 Sep 2022 13:08:18 -0400
X-MC-Unique: VRMP4OcsPDulBoxNtWb4Xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE7EA185A7A4;
 Mon, 26 Sep 2022 17:08:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24332140EBF5;
 Mon, 26 Sep 2022 17:08:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 04/14] target/s390x: support PRNO_TRNG instruction
Date: Mon, 26 Sep 2022 19:07:54 +0200
Message-Id: <20220926170804.453855-5-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

In order for hosts running inside of TCG to initialize the kernel's
random number generator, we should support the PRNO_TRNG instruction,
backed in the usual way with the qemu_guest_getrandom helper. This is
confirmed working on Linux 5.19.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220921100729.2942008-2-Jason@zx2c4.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
[thuth: turn prno-trng off in avocado test to avoid breaking it]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/gen-features.c              |  1 +
 target/s390x/tcg/crypto_helper.c         | 30 ++++++++++++++++++++++++
 tests/avocado/machine_s390_ccw_virtio.py |  1 +
 3 files changed, 32 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index baadbf4517..1e3b7c0dc9 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -757,6 +757,7 @@ static uint16_t qemu_MAX[] = {
     S390_FEAT_MSA_EXT_5,
     S390_FEAT_KIMD_SHA_512,
     S390_FEAT_KLMD_SHA_512,
+    S390_FEAT_PRNO_TRNG,
 };
 
 /****** END FEATURE DEFS ******/
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 106c89fd2d..762b277884 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
@@ -244,6 +245,31 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
     return !len ? 0 : 3;
 }
 
+static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
+                            uint64_t *buf_reg, uint64_t *len_reg)
+{
+    uint8_t tmp[256];
+    uint64_t len = *len_reg;
+    int buf_reg_len = 64;
+
+    if (!(env->psw.mask & PSW_MASK_64)) {
+        len = (uint32_t)len;
+        buf_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
+    }
+
+    while (len) {
+        size_t block = MIN(len, sizeof(tmp));
+
+        qemu_guest_getrandom_nofail(tmp, block);
+        for (size_t i = 0; i < block; ++i) {
+            cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
+            *buf_reg = deposit64(*buf_reg, 0, buf_reg_len, *buf_reg + 1);
+            --*len_reg;
+        }
+        len -= block;
+    }
+}
+
 uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
                      uint32_t type)
 {
@@ -281,6 +307,10 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
     case 3: /* CPACF_*_SHA_512 */
         return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
                             &env->regs[r2 + 1], type);
+    case 114: /* CPACF_PRNO_TRNG */
+        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
+        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
+        break;
     default:
         /* we don't implement any other subfunction yet */
         g_assert_not_reached();
diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
index 438a6f4321..78152f2ad1 100644
--- a/tests/avocado/machine_s390_ccw_virtio.py
+++ b/tests/avocado/machine_s390_ccw_virtio.py
@@ -66,6 +66,7 @@ def test_s390x_devices(self):
                          '-kernel', kernel_path,
                          '-initrd', initrd_path,
                          '-append', kernel_command_line,
+                         '-cpu', 'max,prno-trng=off',
                          '-device', 'virtio-net-ccw,devno=fe.1.1111',
                          '-device',
                          'virtio-rng-ccw,devno=fe.2.0000,max_revision=0,id=rn1',
-- 
2.31.1


