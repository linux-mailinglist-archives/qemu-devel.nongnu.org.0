Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF5611298
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:24:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPKY-0001Bf-KM; Fri, 28 Oct 2022 09:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKT-00011r-Ix
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKS-0005HH-2r
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQTd/N4u8GTtmggLpy6ZYxwRE7RFMpIVgXLfILp9pk4=;
 b=Ucfl5zW7t4/MUEjiHEAxaCP1oPDyLlWYtxfJZ1Ik/R/ePKdJXiRSFPuHfh+G+sht3K/Inh
 Rw52P/ywK0+/LR5mKJmThFPfY6ByAPErQ+8H+bTLoDVFT5hC3YKKQ8bJHVdd720dsBTyxU
 Ob11/ixlmUjFfMXtYmGPd32p2DZ4oWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-G91tbr67M6e292xWeLGjCw-1; Fri, 28 Oct 2022 09:23:14 -0400
X-MC-Unique: G91tbr67M6e292xWeLGjCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62D6B8027EA;
 Fri, 28 Oct 2022 13:23:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFDA51121319;
 Fri, 28 Oct 2022 13:23:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 04/21] tests/tcg/s390x: Test compiler flags only once,
 not every time
Date: Fri, 28 Oct 2022 15:22:47 +0200
Message-Id: <20221028132304.829103-5-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is common practice, see the Makefile.target in the aarch64
folder for example.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221012182755.1014853-2-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
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


