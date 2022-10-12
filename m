Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977BE5FCADA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:45:25 +0200 (CEST)
Received: from localhost ([::1]:50576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigjM-0008Gx-G7
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSd-0002BR-8I
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSb-0002x8-LE
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665599284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYrWjblCHmULZSazFrPa6IAwo3d8fCc6y5fvFxhGKUA=;
 b=dYy9IRQyOWi722aIiV8gO9qNBDOjNkKA4I4GB60pSczw05TGPw/JMmsj3FLZR1NxxSOCP7
 CWtFyFlt26hqE0eh2VHxuiX+GwlzJEvprU6IxthKBCRXBhSXpwLJcgdSFpFXP2u5rfXGqX
 ELrldw7IYM5lgDEevdRXaGN+iKlCqdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-u4QtYEh1OBmKOyspJP-JOw-1; Wed, 12 Oct 2022 14:28:01 -0400
X-MC-Unique: u4QtYEh1OBmKOyspJP-JOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0096811E87;
 Wed, 12 Oct 2022 18:28:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B77040449D5;
 Wed, 12 Oct 2022 18:27:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests/tcg/s390x: Test compiler flags only once,
 not every time
Date: Wed, 12 Oct 2022 20:27:53 +0200
Message-Id: <20221012182755.1014853-2-thuth@redhat.com>
In-Reply-To: <20221012182755.1014853-1-thuth@redhat.com>
References: <20221012182755.1014853-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This is common practice, see the Makefile.target in the aarch64
folder for example.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index c830313e67..29c8af8207 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,6 +1,13 @@
 S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
 CFLAGS+=-march=zEC12 -m64
+
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-march=z14, CROSS_CC_HAS_Z14); \
+	    $(call cc-option,-march=z15, CROSS_CC_HAS_Z15)) 3> config-cc.mak
+-include config-cc.mak
+
 TESTS+=hello-s390x
 TESTS+=csst
 TESTS+=ipm
@@ -18,20 +25,20 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 
+ifneq ($(CROSS_CC_HAS_Z14),)
 Z14_TESTS=vfminmax
 vfminmax: LDFLAGS+=-lm
 $(Z14_TESTS): CFLAGS+=-march=z14 -O2
+TESTS+=$(Z14_TESTS)
+endif
 
-TESTS+=$(if $(shell $(CC) -march=z14 -S -o /dev/null -xc /dev/null \
-			 >/dev/null 2>&1 && echo OK),$(Z14_TESTS))
-
-VECTOR_TESTS=vxeh2_vs
-VECTOR_TESTS+=vxeh2_vcvt
-VECTOR_TESTS+=vxeh2_vlstr
-$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
-
-TESTS+=$(if $(shell $(CC) -march=z15 -S -o /dev/null -xc /dev/null \
-			 >/dev/null 2>&1 && echo OK),$(VECTOR_TESTS))
+ifneq ($(CROSS_CC_HAS_Z15),)
+Z15_TESTS=vxeh2_vs
+Z15_TESTS+=vxeh2_vcvt
+Z15_TESTS+=vxeh2_vlstr
+$(Z15_TESTS): CFLAGS+=-march=z15 -O2
+TESTS+=$(Z15_TESTS)
+endif
 
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
-- 
2.31.1


