Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD49D2EF302
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 14:28:10 +0100 (CET)
Received: from localhost ([::1]:34576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxroH-0001eJ-SJ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 08:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxrhX-0005o5-IR
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:21:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxrhW-0002nQ-0j
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610112069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzNzABc9kqEGW1XlawqHqkOVM25PLG/URWvedRv0ocM=;
 b=HsOfvKzzU7TWX8wrF01h9RixAvAdqWQtctFEhw9CbpZ+BIdHxXZSj+0lUJLeMFVqQHuQdS
 O7Oz9QEJoEymTysRz1hyR0KxVMBRfHY5eh51sgQCJ9HKpFS5diPjR2Qt6IU+xqt3C0XzAs
 IFCIVyhhDoaa5m23k9ILCU3su+6E6lQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-AcfoTpzwM065_SUs7y47tA-1; Fri, 08 Jan 2021 08:21:05 -0500
X-MC-Unique: AcfoTpzwM065_SUs7y47tA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1FD0804002;
 Fri,  8 Jan 2021 13:21:04 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-168.ams2.redhat.com [10.36.114.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC0B5D9C0;
 Fri,  8 Jan 2021 13:21:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] s390x/tcg: Ignore register content if b1/b2 is zero
 when handling EXECUTE
Date: Fri,  8 Jan 2021 14:20:49 +0100
Message-Id: <20210108132049.8501-5-david@redhat.com>
In-Reply-To: <20210108132049.8501-1-david@redhat.com>
References: <20210108132049.8501-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In our EXECUTE fast path, we have to ignore the content of r0, if
specified by b1 or b2.

Fixes: d376f123c7de ("target/s390x: Re-implement a few EXECUTE target insns directly")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 0108611cc9..1901e9dfc7 100644
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
2.29.2


