Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5739B2F1B4A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:43:45 +0100 (CET)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0IC-0002cG-EG
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kz0Dm-0005gN-9C
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kz0Dk-0000Z6-Ki
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610383147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tW7i05tAjAUYUi+ApZdtCCAcOR+Q5y3i0kouOwQaj2w=;
 b=gqoCJk/8eOlcoivGo7+RlP/eOw2UHeN+iMbIq9R0kbIBXU06xqooE5M9JNfdlwwGqH6kWV
 idyxwRBih9zazpw/GGXY8xx7G0AxHj0K8ZboRm+8irVKo5YDcJTwDpOnCfkkXaCA/bJ4E3
 R6eXQviga63+E+nzj3sLs8zZ6SMNtCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-fa80lBdINdaE1XgChgGpbg-1; Mon, 11 Jan 2021 11:39:04 -0500
X-MC-Unique: fa80lBdINdaE1XgChgGpbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1376019251A1;
 Mon, 11 Jan 2021 16:39:03 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-103.ams2.redhat.com [10.36.115.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5191971A;
 Mon, 11 Jan 2021 16:39:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] tests/tcg/s390x: Fix EXRL tests
Date: Mon, 11 Jan 2021 17:38:44 +0100
Message-Id: <20210111163845.18148-5-david@redhat.com>
In-Reply-To: <20210111163845.18148-1-david@redhat.com>
References: <20210111163845.18148-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current EXRL tests crash on real machines: we must not use r0 as a base
register for trt/trtr, otherwise the content gets ignored. Also, we must
not use r0 for exrl, otherwise it gets ignored.

Let's use the "a" constraint so we get a general purpose register != r0.
For op2, we can simply specify a memory operand directly via "Q" (Memory
reference without index register and with short displacement).

Fixes: ad8c851d2e77 ("target/s390x: add EX support for TRT and TRTR")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tests/tcg/s390x/exrl-trt.c  | 8 ++++----
 tests/tcg/s390x/exrl-trtr.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/s390x/exrl-trt.c b/tests/tcg/s390x/exrl-trt.c
index 3c5323aecb..16711a3181 100644
--- a/tests/tcg/s390x/exrl-trt.c
+++ b/tests/tcg/s390x/exrl-trt.c
@@ -19,7 +19,7 @@ int main(void)
     }
     asm volatile(
         "    j 2f\n"
-        "1:  trt 0(1,%[op1]),0(%[op2])\n"
+        "1:  trt 0(1,%[op1]),%[op2]\n"
         "2:  exrl %[op1_len],1b\n"
         "    lgr %[r1],%%r1\n"
         "    lgr %[r2],%%r2\n"
@@ -27,9 +27,9 @@ int main(void)
         : [r1] "+r" (r1),
           [r2] "+r" (r2),
           [cc] "=r" (cc)
-        : [op1] "r" (&op1),
-          [op1_len] "r" (5),
-          [op2] "r" (&op2)
+        : [op1] "a" (&op1),
+          [op1_len] "a" (5),
+          [op2] "Q" (op2)
         : "r1", "r2", "cc");
     cc = (cc >> 28) & 3;
     if (cc != 2) {
diff --git a/tests/tcg/s390x/exrl-trtr.c b/tests/tcg/s390x/exrl-trtr.c
index c33153ad7e..5f30cda6bd 100644
--- a/tests/tcg/s390x/exrl-trtr.c
+++ b/tests/tcg/s390x/exrl-trtr.c
@@ -19,7 +19,7 @@ int main(void)
     }
     asm volatile(
         "    j 2f\n"
-        "1:  trtr 3(1,%[op1]),0(%[op2])\n"
+        "1:  trtr 3(1,%[op1]),%[op2]\n"
         "2:  exrl %[op1_len],1b\n"
         "    lgr %[r1],%%r1\n"
         "    lgr %[r2],%%r2\n"
@@ -27,9 +27,9 @@ int main(void)
         : [r1] "+r" (r1),
           [r2] "+r" (r2),
           [cc] "=r" (cc)
-        : [op1] "r" (&op1),
-          [op1_len] "r" (3),
-          [op2] "r" (&op2)
+        : [op1] "a" (&op1),
+          [op1_len] "a" (3),
+          [op2] "Q" (op2)
         : "r1", "r2", "cc");
     cc = (cc >> 28) & 3;
     if (cc != 1) {
-- 
2.29.2


