Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE696A0D8D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:07:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVE7b-0007P7-3G; Thu, 23 Feb 2023 11:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVE7Y-0007Oa-Pw
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:07:00 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVE7W-0006z5-Nt
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:07:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6728640wmq.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2CI8mPdmlSDFBM0Iuuk2sgvCkUlxxqmzVR2TxPIYk6c=;
 b=Ekxdl68RwRsv80jubOBfgd/zmGaJPYFGQSygxDexs25G3F8gWEtWHDjohjZLUUFhVu
 kpuBnjspAxndw8xBGg/D89w8C0Ap9rgzeDN9NVXlI4UvU+sRUNGyDFOQlsMGkgrOh354
 fsNm+hp/bVuHM14DNix66glACGsuitaKBmxw2gi6CZjaTUcr7K9JyVGpPh5bRxq9G114
 2C1+CxfNqOwWO76l7sqkftF5IU1HhwEpo8mZs7b1UmQ3OPgQBnNpEpvQEJcqC7ECFl84
 GpcGIGkihTrND40F0TzO2/iEAoBWDMjUF9qEc9aBCrOndcDbgLQzU9hq94pTb//C84WD
 QCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2CI8mPdmlSDFBM0Iuuk2sgvCkUlxxqmzVR2TxPIYk6c=;
 b=w/YeVyVhj7OPJrxTRoagUohmSukTYkcve5ceowGrS1cvWBPto6Y55KnIuNgdBedAkS
 YV0hu+LJ9L/95odQw4X49sV7bsoLS/zu7W/L7RuGtHkT4dUpn8+YdzJSmCJb2uIrcvZS
 v6P3T6BcEzqVHRJIaa1PhiBAcOcCCqhNi/qUeqs5LpdIN00op5GYRV8X7x0b5DEuw6fW
 bft1WVFZ8Qow6+tW5oTXW+Gfl9AWXTG5nu1KO2VN6ALI5Hc3Wz9TjVxRAHJplz5wrJdx
 Y45klwhj5tnMvV/lXcqaCy+somxZ/+JBGxyelqFf1i8SR8/NPYOiHqzfFP5Z5SsUdqI0
 U/gg==
X-Gm-Message-State: AO0yUKWHagN2bLcz30SabhAOT23mCnEBfBnG0dlQlrIGTibmXgsJ8XoQ
 f7o4nOzPORiGyXYlNuWLQFp0mw==
X-Google-Smtp-Source: AK7set8OOH81xE0d9WuzwXoJofjSOE9iC++uXbxXvT3OfLVUjMrDZhA2eiTaItQWOA/wsm9pMOlMFA==
X-Received: by 2002:a05:600c:170a:b0:3e2:d81:3564 with SMTP id
 c10-20020a05600c170a00b003e20d813564mr7727000wmn.3.1677168416594; 
 Thu, 23 Feb 2023 08:06:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c218900b003dc434b39c7sm5280995wme.0.2023.02.23.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 08:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB67F1FFC1;
 Thu, 23 Feb 2023 15:57:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 11/13] tests/docker: Use binaries for debian-tricore-cross
Date: Thu, 23 Feb 2023 15:57:18 +0000
Message-Id: <20230223155720.310593-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

since binutils is pretty old, it fails our CI repeatedly during the
compilation of tricore-binutils. We created a precompiled version using
the debian docker image and download it instead of building it ourself.

We also updated the package to include a newer version of binutils, gcc,
and newlib. The default TriCore ISA version used by tricore-as changed
from the old version, so we have to specify it now. If we don't
'test_fadd' fails with 'unknown opcode'.

The new assembler also picks a new encoding in ld.h which fails the
'test_ld_h' test. We fix that by using the newest TriCore CPU for QEMU.

The old assembler accepted an extra ')' in 'test_imask'. The new one
does not, so lets remove it.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230209145812.46730-1-kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230221094558.2864616-13-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index ec4f5bff52..3df2e0de82 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -174,7 +174,7 @@ test_ ## num:                                                    \
     TEST_CASE_E(num, res_lo, res_hi,                           \
     LI(DREG_RS1, rs1);                                         \
     rstv;                                                      \
-    insn EREG_CALC_RESULT, imm1, DREG_RS1, imm2);              \
+    insn EREG_CALC_RESULT, imm1, DREG_RS1, imm2;               \
     )
 
 
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 5ae58efa09..82e4576485 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       curl \
        flex \
        g++ \
        gcc \
@@ -34,13 +35,8 @@ RUN apt update && \
        python3-setuptools \
        python3-wheel
 
-RUN git clone --single-branch \
-        https://github.com/bkoppelmann/tricore-binutils.git \
-        /usr/src/binutils && \
-    cd /usr/src/binutils && chmod +x missing && \
-    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
-    make && make install && \
-    rm -rf /usr/src/binutils
+RUN curl -#SL https://github.com/bkoppelmann/package_940/releases/download/tricore-toolchain-9.40/tricore-toolchain-9.4.0.tar.gz \
+    | tar -xzC /usr/local/
 
 # This image can only build a very minimal QEMU as well as the tests
 ENV DEF_TARGET_LIST tricore-softmmu
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index d2446af8b4..b3cd56fffc 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -1,7 +1,7 @@
 TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
 
-LDFLAGS = -T$(TESTS_PATH)/link.ld
-ASFLAGS =
+LDFLAGS = -T$(TESTS_PATH)/link.ld --mcpu=tc162
+ASFLAGS = -mtc162
 
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
@@ -19,7 +19,7 @@ TESTS += test_madd.tst
 TESTS += test_msub.tst
 TESTS += test_muls.tst
 
-QEMU_OPTS += -M tricore_testboard -nographic -kernel
+QEMU_OPTS += -M tricore_testboard -cpu tc27x -nographic -kernel
 
 %.pS: $(TESTS_PATH)/%.S
 	$(HOST_CC) -E -o $@ $<
-- 
2.39.1


