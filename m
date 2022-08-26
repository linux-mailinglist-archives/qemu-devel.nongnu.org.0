Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98005A2D7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:29:18 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd8v-00035k-Ru
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1b-0004LR-An
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:43 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1Z-0002Lu-F7
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:43 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e13so1648704wrm.1
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9MOnu1ec0euQQzlo0EzPjCl31y4DT+jd3bOgAm+WB8M=;
 b=hBl4EWTaHql0/oUQAHIeu5nLnBQCpL8QYOPtYz4G4ivcelHD7jmIS71zjydF47VXF9
 NK9DSleYcmCRxWtUy4fu3+2r0g2wG2YJMjNfD5Hbec4VqyYE9+q4BsIYZrq/d44QgQUw
 SngZQnc0DAv8KFvcI+PzCVBiGSJrshOMcJDIg+QlOqIzb83heoPoOHtnyHe2VaLIHhGv
 M8PVeBUhnBfh1wq9UnSdvfnvt5DiBYJyHtgTom4a3e/o0Rj2fm12K22z2SOYlwC7KYZK
 zliQmj26XR2s26MOAQqzPoYOogqeXE/yoo/5dLS1vHKgMDt8px5fd2r+k2i6EbgRiDTT
 t8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9MOnu1ec0euQQzlo0EzPjCl31y4DT+jd3bOgAm+WB8M=;
 b=LNY9/SrR65co2tHNIkgNMWfKOxXQIHTvQvudQmNuS0wxcB5nQKLojkfzRz5vPdL5NX
 xMWbNHmL1+Xx6Kod7/TviZg1xsIkv6A34J3ZTOTwrygneizPBN4UUtIUtZSKXCTRL9PS
 t2yHEJsBebYxkxi2+oq5fFMGPMyNXSOqHux5EvJY9bmGDnt2AwE5NQMkHOb0R4iZ6M9J
 UzeUBMk62V5Yb/UZiYLw8L2i0ilHGUpn1Zm/746F0lYMlKIKoUwnIgEROcbxZpY12WF7
 L70r9qVMXss9ikSEvmYR2ImcPkSHcEp8D6OZWPrGORIenDZeDnR/B5xq2NiQK1AJhOJl
 geoA==
X-Gm-Message-State: ACgBeo0G7AqL36SLF9/tuizR7ibf7rMKoj8MtH355a6sHQF4Z/hd/VeM
 tZtSTFSWUeT6e4LlZzDN1wUkig==
X-Google-Smtp-Source: AA6agR73vSsTODmxLWgj40xnivO4QQd9zAZJpP4zEqpEfz5QO17EVN0IWl+W9xcUVYk3/HJXuObHnQ==
X-Received: by 2002:adf:e38e:0:b0:226:cff1:4b21 with SMTP id
 e14-20020adfe38e000000b00226cff14b21mr387938wrm.226.1661534499915; 
 Fri, 26 Aug 2022 10:21:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f15-20020adff44f000000b00226cf855861sm237181wrp.84.2022.08.26.10.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D33951FFC4;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 13/25] gitlab-ci/custom-runners: Disable -static-pie for
 ubuntu-20.04-aarch64
Date: Fri, 26 Aug 2022 18:21:16 +0100
Message-Id: <20220826172128.353798-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The project has reached the magic size at which we see

/usr/aarch64-linux-gnu/lib/libc.a(init-first.o): in function `__libc_init_first':
(.text+0x10): relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 against \
symbol `__environ' defined in .bss section in /usr/aarch64-linux-gnu/lib/libc.a(environ.o)
/usr/bin/ld: (.text+0x10): warning: too many GOT entries for -fpic, please recompile with -fPIC

The bug has been reported upstream, but in the meantime there is
nothing we can do except build a non-pie executable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220823210329.1969895-1-richard.henderson@linaro.org>
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 3d878914e7..85a234801a 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -16,7 +16,9 @@ ubuntu-20.04-aarch64-all-linux-static:
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
  - mkdir build
  - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ # Disable -static-pie due to build error with system libc:
+ # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie --extra-cflags='-fno-pie -no-pie'
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
-- 
2.30.2


