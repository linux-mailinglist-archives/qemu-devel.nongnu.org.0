Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356BD2FE9E4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:23:44 +0100 (CET)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Z03-0000jJ-Af
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2YtT-0008Ms-8V
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2YtR-0005VL-Rq
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611231413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvwtAN1wmmmjhDqyF3S6nl214jeE5+L/RUqdwPExcaA=;
 b=HwjwZr2J6QsEW1E+nSLfwwd9VdFk7d4ecNqHwSbLVaikFAwM2Gl9337zTcbbscb8oQEBcH
 Wx/IhUHQxpXBZw2WFH9CJ5Bw9albE1e5/jhrTEDTt0VrHvE0+HeYnvJjIcUqwkcQXArJY9
 OqkMjPjs0iCJRwrV9OUbldWRoU0AXrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-ihxs_-avPKGy0IL45DGpKA-1; Thu, 21 Jan 2021 07:16:49 -0500
X-MC-Unique: ihxs_-avPKGy0IL45DGpKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C731F190D340;
 Thu, 21 Jan 2021 12:16:47 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD382100AE35;
 Thu, 21 Jan 2021 12:16:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/9] s390x/tcg: Ignore register content if b1/b2 is zero when
 handling EXECUTE
Date: Thu, 21 Jan 2021 13:16:25 +0100
Message-Id: <20210121121629.530506-6-cohuck@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

In our EXECUTE fast path, we have to ignore the content of r0, if
specified by b1 or b2.

Fixes: d376f123c7de ("target/s390x: Re-implement a few EXECUTE target insns directly")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210111163845.18148-6-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/mem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 0108611cc959..1901e9dfc7c6 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -2473,8 +2473,8 @@ void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
             uint32_t d1 = extract64(insn, 32, 12);
             uint32_t b2 = extract64(insn, 28, 4);
             uint32_t d2 = extract64(insn, 16, 12);
-            uint64_t a1 = wrap_address(env, env->regs[b1] + d1);
-            uint64_t a2 = wrap_address(env, env->regs[b2] + d2);
+            uint64_t a1 = wrap_address(env, (b1 ? env->regs[b1] : 0) + d1);
+            uint64_t a2 = wrap_address(env, (b2 ? env->regs[b2] : 0) + d2);
 
             env->cc_op = helper(env, l, a1, a2, 0);
             env->psw.addr += ilen;
-- 
2.26.2


