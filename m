Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199B4E56B0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:43:26 +0100 (CET)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX44z-00032C-5t
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:43:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX3oo-0000vJ-G8
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX3om-0000Fb-ID
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648052799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMdJ3RUKWs8EouPEYWjz5BDHAJ7RA4XRurAaCGHvQTA=;
 b=PFGY4a7Vw3cdzvli/wUi9McJRb9d2Kckj/4jQalpFbivJ0LW8DscNPZ3hEqKWcNC6fFKPA
 0IisRVWxuoFkTJfVS5ehOEj3sVjOlak2KQt/Zl0GR3sPlxWzqZfp8EPlW1UD+t6HctAAWa
 PihtBdirmgPjXlVC2gvPBa8wlm+gNls=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-vawnbkdFMoGWPEpsh-GO6A-1; Wed, 23 Mar 2022 12:26:36 -0400
X-MC-Unique: vawnbkdFMoGWPEpsh-GO6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E2863801EC1;
 Wed, 23 Mar 2022 16:26:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC6C1112132C;
 Wed, 23 Mar 2022 16:26:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/s390x: Fix determination of overflow condition
 code after addition
Date: Wed, 23 Mar 2022 17:26:20 +0100
Message-Id: <20220323162621.139313-2-thuth@redhat.com>
In-Reply-To: <20220323162621.139313-1-thuth@redhat.com>
References: <20220323162621.139313-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This program currently prints different results when run with TCG instead
of running on real s390x hardware:

 #include <stdio.h>

 int overflow_32 (int x, int y)
 {
   int sum;
   return ! __builtin_add_overflow (x, y, &sum);
 }

 int overflow_64 (long long x, long long y)
 {
   long sum;
   return ! __builtin_add_overflow (x, y, &sum);
 }

 int a1 = -2147483648;
 int b1 = -2147483648;
 long long a2 = -9223372036854775808L;
 long long b2 = -9223372036854775808L;

 int main ()
 {
   {
     int a = a1;
     int b = b1;
     printf ("a = 0x%x, b = 0x%x\n", a, b);
     printf ("no_overflow = %d\n", overflow_32 (a, b));
   }
   {
     long long a = a2;
     long long b = b2;
     printf ("a = 0x%llx, b = 0x%llx\n", a, b);
     printf ("no_overflow = %d\n", overflow_64 (a, b));
   }
 }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/616
Suggested-by: Bruno Haible <bruno@clisp.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/cc_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index 8d04097f78..e11cdb745d 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -136,7 +136,7 @@ static uint32_t cc_calc_subu(uint64_t borrow_out, uint64_t result)
 
 static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
 {
-    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
+    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {
         return 3; /* overflow */
     } else {
         if (ar < 0) {
@@ -196,7 +196,7 @@ static uint32_t cc_calc_comp_64(int64_t dst)
 
 static uint32_t cc_calc_add_32(int32_t a1, int32_t a2, int32_t ar)
 {
-    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
+    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {
         return 3; /* overflow */
     } else {
         if (ar < 0) {
-- 
2.27.0


