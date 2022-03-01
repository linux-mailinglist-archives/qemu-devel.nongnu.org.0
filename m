Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299924C887E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:48:19 +0100 (CET)
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOz7C-0001XR-6h
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOyym-0002ar-Fq
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:39:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOyyk-0005Pw-Ku
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646127571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z7bgOYTqN8Vk5/Gdg9mdalAvYtCSE/oTCBDaQhy4Xvc=;
 b=HqzXOfiBlEiXfFv/Be+Q5bPsrjyBdd+Wu1JA3s8r5Th1hG61enHdT0kpdCxNYEYzCuvzlO
 5rqjSvVYJ4d07GKfeUVQotWz056/DkxAot55RnUekiLhLpynwZ+8bf51F2SgiQAdedxbU5
 Ztopf3l+vXnq/GMfG3dxymo8EcUgra0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-35o5I1qOPHWpiwNqD-8ykA-1; Tue, 01 Mar 2022 04:39:28 -0500
X-MC-Unique: 35o5I1qOPHWpiwNqD-8ykA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42AD71854E26;
 Tue,  1 Mar 2022 09:39:27 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB7F78319A;
 Tue,  1 Mar 2022 09:39:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] tests/tcg/s390x: Fix mvc, mvo and pack tests with Clang
Date: Tue,  1 Mar 2022 10:39:11 +0100
Message-Id: <20220301093911.1450719-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These instructions use addressing with a "base address", meaning
that if register r0 is used, it is always treated as zero, no matter
what value is stored in the register. So we have to make sure not
to use register r0 for these instructions in our tests. There was
no problem with GCC so far since it seems to always pick other
registers by default, but Clang likes to chose register r0, too,
so we have to use the "a" constraint to make sure that it does
not pick r0 here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/mvc.c  | 4 ++--
 tests/tcg/s390x/mvo.c  | 4 ++--
 tests/tcg/s390x/pack.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/s390x/mvc.c b/tests/tcg/s390x/mvc.c
index aa552d52e5..7ae4c44550 100644
--- a/tests/tcg/s390x/mvc.c
+++ b/tests/tcg/s390x/mvc.c
@@ -20,8 +20,8 @@ static inline void mvc_256(const char *dst, const char *src)
     asm volatile (
         "    mvc 0(256,%[dst]),0(%[src])\n"
         :
-        : [dst] "d" (dst),
-          [src] "d" (src)
+        : [dst] "a" (dst),
+          [src] "a" (src)
         : "memory");
 }
 
diff --git a/tests/tcg/s390x/mvo.c b/tests/tcg/s390x/mvo.c
index 5546fe2a97..0c3ecdde2e 100644
--- a/tests/tcg/s390x/mvo.c
+++ b/tests/tcg/s390x/mvo.c
@@ -11,8 +11,8 @@ int main(void)
     asm volatile (
         "    mvo 0(4,%[dest]),0(3,%[src])\n"
         :
-        : [dest] "d" (dest + 1),
-          [src] "d" (src + 1)
+        : [dest] "a" (dest + 1),
+          [src] "a" (src + 1)
         : "memory");
 
     for (i = 0; i < sizeof(expected); i++) {
diff --git a/tests/tcg/s390x/pack.c b/tests/tcg/s390x/pack.c
index 4be36f29a7..55e7e214e8 100644
--- a/tests/tcg/s390x/pack.c
+++ b/tests/tcg/s390x/pack.c
@@ -9,7 +9,7 @@ int main(void)
     asm volatile(
         "    pack 2(4,%[data]),2(4,%[data])\n"
         :
-        : [data] "r" (&data[0])
+        : [data] "a" (&data[0])
         : "memory");
     for (i = 0; i < 8; i++) {
         if (data[i] != exp[i]) {
-- 
2.27.0


