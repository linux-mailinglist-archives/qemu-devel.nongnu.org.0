Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850A6A5F54
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:10:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KO-0002b4-Lr; Tue, 28 Feb 2023 14:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jk-0002JU-Ir
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:18 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JV-0002qB-Cb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:11 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r18so10893500wrx.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqKQZTDvOZ1wpytMTM7QInXR36A1/tJ8b2AKON/coNY=;
 b=FryCXJ+g78WhQfGimALybwu64Dke8UWXuGPUyiAl6rnIduENmk4uQOcR5/Tq04hwfg
 rvw0dHHoskE3bHmbllyDV1f9Kfk5zVHbSB6DdGO2goC1RB4wqX3NVc7XyiwWoKcd2JAd
 kXwZfF6HQN9N44KdFvjYSw8LkO/FXdMtGR65Qk3s/65t+9Jb4cQs2lpdNID59D0sNeVR
 Php84ip1sY9toIqekvJYFMJJcScg3T0xJNsEyoqappnPUIXn1ek+/0Vp/7y7P466bgQW
 QgNadbi7+18A7PXnbrGZKN0R3Inm6DicUY2WI9nUOOrJ7+SHYADOTMuzT29S/kV28fA8
 s9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqKQZTDvOZ1wpytMTM7QInXR36A1/tJ8b2AKON/coNY=;
 b=vvbvCqKYRUtQ5q3kzEJFf6wcY/zH3cW7S9gDfoeS49rMvlz2I6Va00UAtJt8F2q1Tw
 36V3VJ72Kj8Oi9YwboX8WOFj98WCnXU1nJfBoNunEsrqa2yP2W5o0TYwWApbJArfIUU2
 afHxxeLozYrlKMEm3l/BTZjbshtsdRHTOCe2KHY1TygdTjIHNEUSs0ha57S+kZ5eF7jh
 Gc/XUEypHeUv50DRqNvYzJuKhCJ1rDfH+dLq7SJNizqLZjaxW0cZ7X9HLo5eQjrDpUsN
 hCtVceiCaHu0dGQY8v5B33qpUQnEl8yq6rK0CsNnTjh/7ASwnayBlPvcbT2KQU+W9zwA
 sH2Q==
X-Gm-Message-State: AO0yUKWqCQ0BLiF7bDhMtxrsem67zYEYX/Al88cuieE2UklsSW/YP7K2
 3kTudJ8wY2ubOJZz4uVYcreuxA==
X-Google-Smtp-Source: AK7set8mXCsqW6sxG6XC+OTDx18gP/MZLnqOUov8watQHjtrLPYElScGXB9ysMRGcWQsMA8ldmz4Bg==
X-Received: by 2002:a5d:5e8c:0:b0:2c3:d707:7339 with SMTP id
 ck12-20020a5d5e8c000000b002c3d7077339mr10670367wrb.6.1677611219745; 
 Tue, 28 Feb 2023 11:06:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a5d4d4e000000b002c57475c375sm10580099wru.110.2023.02.28.11.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 979B31FFC1;
 Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 11/24] tests/docker: Use binaries for debian-tricore-cross
Date: Tue, 28 Feb 2023 19:06:40 +0000
Message-Id: <20230228190653.1602033-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-Id: <20230221094558.2864616-13-alex.bennee@linaro.org>
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
2.39.2


