Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA164EF3A5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:26:39 +0200 (CEST)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJAd-0003ZS-1F
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:26:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7f-00011A-53
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7d-0000r1-LS
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648826612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxUM9gXylkG6Gj+SSFfAy4oYM7r8dYARxB6sPw5viT0=;
 b=Ztll4EpU9FTLrxPUxoHNQl1NK5odn/dh4pUf6XeSQSiNWMjTKPDsRyoRF5ty1DFsze4W23
 LTPvuSOGB5KlM/NAzZy6nBUe17nrVDvnpcqn47RooJ693oNDnQAmAW2knwVTZ4PP/BIVsM
 up6GuUpJvUQOG/N+jkv0jgZ0F4bcGxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-jsvheyM9M-a8SMgbvy_sxg-1; Fri, 01 Apr 2022 11:23:30 -0400
X-MC-Unique: jsvheyM9M-a8SMgbvy_sxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9D36101161B;
 Fri,  1 Apr 2022 15:23:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89BB92166B4E;
 Fri,  1 Apr 2022 15:23:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] target/s390x: Fix determination of overflow condition code
 after addition
Date: Fri,  1 Apr 2022 17:23:19 +0200
Message-Id: <20220401152323.52519-3-thuth@redhat.com>
In-Reply-To: <20220401152323.52519-1-thuth@redhat.com>
References: <20220401152323.52519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Haible <bruno@clisp.org>

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

Signed-off-by: Bruno Haible <bruno@clisp.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/616
Message-Id: <20220323162621.139313-2-thuth@redhat.com>
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


