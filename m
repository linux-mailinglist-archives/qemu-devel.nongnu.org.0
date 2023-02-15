Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E6698477
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:26:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPb-0006nF-8X; Wed, 15 Feb 2023 14:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPS-0006kq-BS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:42 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPP-0001i4-1U
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so1392992wmj.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1ygqzeQVGCuPcwoBCSUGziqmUHDcFPufoB7wqrTRgA=;
 b=I/oM8+D+GrSfvNQPpiDGm0TisB+8JUD53RZfysZAY5P0rvpowslOp97hpLY+VjgSPk
 TV6hnUmP3zlITqsNAEsFGsoJMVGq/L68aB++vHlQcGnIJlqGZK+UKXlWjfqrfFXpuc3g
 TDWmzl0uvGn0oRq2ryiVeD2YdWdMti2zlhuZ5Uq00L2GlYKQHbyC6F6G1eicq9W0mmHP
 9Gj7qE7/G+OSMk+rXtiLCzhuCH2JqTzo5lBMaUWNWukWSDQ46PJbF9XEnmDCa5wJ+Snc
 ZqE8F6DQlCeYd8eC8DVJR5wdXCEtzv0s24bZxfRrYCxT4F8HiVBwuqWBrg97BIpE4M2T
 GdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1ygqzeQVGCuPcwoBCSUGziqmUHDcFPufoB7wqrTRgA=;
 b=w0lW9iHedbGdZ8fStVy5FqCg7Vc5QwvLMMJT2iJyyZvY26EdQ7mSZpqPAD12QxP8ig
 vfF+HO5OrsaoXph5VugVKRNLhqrAhCep+SK8RF3jFcms3ibowemPHHW5Y44cC05eb5Xc
 tXhGo1gB0lEOEi7rbxWf8gZISR3kbj7Wb1SfVJ4BcKASF2jO7EPVajUjWl9aQEPl/86D
 yR6ZGwzMrXzcCF/vKyGVBEcngDiy9bg31uwLaPK7xLFPeyD1Go8fZ1YfwRp2pmFmcTd6
 UN6j1GmJGM15lQcGBtlVPfnOVWgjIxKyKDQ1Ib6TvMo0v91mAXwknT8INpRO6oGo3fhg
 CsaA==
X-Gm-Message-State: AO0yUKVHT9tFUiWOmIcJKkfYouktxf9GflMBcWN4YCSsCld7F/BQYHkM
 avUONUkuUtZpzpXbp6Svnw5P6NPDxrvlcMo2
X-Google-Smtp-Source: AK7set8XZ94621CMDUnGggVrIKm0eTxQxaRABgwbUjyI+WZf7iLJpl1IvG8/rdKYYr8h7Raozc0l7A==
X-Received: by 2002:a05:600c:5386:b0:3df:9858:c039 with SMTP id
 hg6-20020a05600c538600b003df9858c039mr4233323wmb.14.1676489136046; 
 Wed, 15 Feb 2023 11:25:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b003e200d3b2d1sm3079714wmq.38.2023.02.15.11.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B97AA1FFC0;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 10/12] tests/docker: Use binaries for debian-tricore-cross
Date: Wed, 15 Feb 2023 19:25:28 +0000
Message-Id: <20230215192530.299263-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 tests/tcg/tricore/macros.h                           |  2 +-
 tests/docker/dockerfiles/debian-tricore-cross.docker | 10 +++-------
 tests/tcg/tricore/Makefile.softmmu-target            |  6 +++---
 3 files changed, 7 insertions(+), 11 deletions(-)

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


