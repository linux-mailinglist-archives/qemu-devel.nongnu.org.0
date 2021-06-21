Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4083AE704
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:26:34 +0200 (CEST)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvH8N-00029B-Fz
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGj2-0008If-U8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGj0-0007MX-03
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1aY/RJF8I/zuehrABzVlYhJaXc/Ugd3Uj7USiZXQHc=;
 b=S+kM3wvKic7P24Vw6fL9sEuGxoZcpT7++wJr5KNnTFww2ncaC5VbkxqQn6W59qCqjAy14j
 ydXuKpKxM51N0djJ085tz0GQ0fEqtx+oxHXjXOIBIktgfI0XzGjNXj+FN+fkEyDQsAk3+o
 rRnpLGxBtfxS1iBgsjG8hpJ7ihdaqR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-q0E5_BaRPT6St1sJzwZlLg-1; Mon, 21 Jun 2021 06:00:11 -0400
X-MC-Unique: q0E5_BaRPT6St1sJzwZlLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1586F8030D6;
 Mon, 21 Jun 2021 10:00:10 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB5955D740;
 Mon, 21 Jun 2021 10:00:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 32/37] target/s390x: Use s390_cpu_{set_psw,
 get_psw_mask} in gdbstub
Date: Mon, 21 Jun 2021 11:58:37 +0200
Message-Id: <20210621095842.335162-33-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: ruixin.bao@ibm.com,
 "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

No change in behaviour, as gdbstub was correctly written to
install and extract the cc value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: jonathan.albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Tested-by: <ruixin.bao@ibm.com>
Message-Id: <20210615030744.1252385-5-richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/gdbstub.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index d6fce5ff1e11..5b4e38a13b2a 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -31,18 +31,10 @@ int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
-    uint64_t val;
-    int cc_op;
 
     switch (n) {
     case S390_PSWM_REGNUM:
-        if (tcg_enabled()) {
-            cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
-                            env->cc_vr);
-            val = deposit64(env->psw.mask, 44, 2, cc_op);
-            return gdb_get_regl(mem_buf, val);
-        }
-        return gdb_get_regl(mem_buf, env->psw.mask);
+        return gdb_get_regl(mem_buf, s390_cpu_get_psw_mask(env));
     case S390_PSWA_REGNUM:
         return gdb_get_regl(mem_buf, env->psw.addr);
     case S390_R0_REGNUM ... S390_R15_REGNUM:
@@ -59,10 +51,7 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_PSWM_REGNUM:
-        env->psw.mask = tmpl;
-        if (tcg_enabled()) {
-            env->cc_op = extract64(tmpl, 44, 2);
-        }
+        s390_cpu_set_psw(env, tmpl, env->psw.addr);
         break;
     case S390_PSWA_REGNUM:
         env->psw.addr = tmpl;
-- 
2.31.1


