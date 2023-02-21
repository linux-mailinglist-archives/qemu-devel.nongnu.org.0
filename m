Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F0169DD22
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:47:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE9-0006lU-D9; Tue, 21 Feb 2023 04:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDx-0006Z1-Sy
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:14 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDq-0005l4-Kn
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id bo30so3151221wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1ygqzeQVGCuPcwoBCSUGziqmUHDcFPufoB7wqrTRgA=;
 b=J5h8kjwW/iWGZuqekQXR0ZmQg1orMIMAlxi+jQGwkXbRgcoCYs7MroysKOqYb4hxOP
 t95+zuXRs+buvQI6HeVWgTDCzbICOoI7jMguLomueMzjnFQWBDwFb60FkxJemXiUTBA8
 lkTk7c+ORBkwxftef0igkUDifoZii5O8HEezpGILulyrmrWCZn9PQk6GcZ9k8595wq8i
 BL/MeGhzAgeeoswy5b88SZ6emS6zBYiAGEYi0S9+Mo+gxECHVJPuUivrppbnE3RQ9GOr
 HP4Pa3TFa2O39/nuGxtKrxDw3EYqO9VW8OO8Cde6TeQ4Mx46G0cWi6WTbt4p1B16CmO6
 WPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1ygqzeQVGCuPcwoBCSUGziqmUHDcFPufoB7wqrTRgA=;
 b=7JKuhP6R7Tt3+oMK2cMQQcF+WAtAma8mBDPoo51gJ5dr1aRbxbEga6YlaorF6062e8
 16h9/bs/q3Pfeki8t1u92skpKy2N1vs5L4NsR5zd2UEAtki2mxLLpg6wo8+tsAlP0PVi
 G/FH9h9yneR7AFo+B/EvOTMKjvRjJyjyimMlI4JwNDffOT5m8UejQ/p5fiQq/XolLfW5
 6sZeJeNJ62oThH8MmZOFOWqtOVb8LTPIxuBNcGt6kuMD0VIRd8qQI/Zu66kchx7TphDn
 /HNYVJnrxyJBhnxb9HGpd335t9oo5SybI0Qs3FqrztRC64OXA+44vVSh7wHyguGI9W8D
 229A==
X-Gm-Message-State: AO0yUKUz9xBNSnIYeSzFfaFDq9fv0QyW+0n8YdGyc5XfNGx7jj/sHoiT
 QKYgOz8HDPZjZ8kffNPWrhyzHw==
X-Google-Smtp-Source: AK7set+XVS4phynWnMGZm+t4WIv7zWLphZoF1xdOp8bvzKmT7CSSV4Ta6cjgpcpRtGmQ0Rg+fMa4Tg==
X-Received: by 2002:adf:f2c6:0:b0:2c5:5fc7:2862 with SMTP id
 d6-20020adff2c6000000b002c55fc72862mr3493319wrp.69.1676972765278; 
 Tue, 21 Feb 2023 01:46:05 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600001cd00b002c6d0462163sm2758868wrx.100.2023.02.21.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:46:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 742BE1FFC2;
 Tue, 21 Feb 2023 09:46:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 12/14] tests/docker: Use binaries for debian-tricore-cross
Date: Tue, 21 Feb 2023 09:45:56 +0000
Message-Id: <20230221094558.2864616-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


