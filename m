Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A26A5F5A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KD-0002VC-OW; Tue, 28 Feb 2023 14:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jb-0002G9-TL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JT-0002oG-1O
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:04 -0500
Received: by mail-wr1-x434.google.com with SMTP id e37so8391554wri.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5n0PF6Nzsb2L9pU8FStkO5ltsqIAi0CEb9WzAVfdpXI=;
 b=CCIJyPOOhP9hZGwLu64d8XAy1iaQ4UyYxp0KUclv2PLJP9MtjlT/3qtZ+2LV2BM5Gf
 Wwyo4jKXPXIQ9F3tUaSrbQNQJrmXlkpdFOQJ2ZlsIAmPn1zdb/hBnH7zFKi75+VvD4Ux
 poxDrQ3+fwJK+rO2KPE02GHURQ3k1t2cqKYQu7N6z8amIVlYQyu03kiRlx6+3OqVD6iJ
 o0h7s/qjowDJv5N3Yr29z1MXTT6bLWderRShRCIliaoJ/mQLM05nQFJlUf7EM5/XyN/q
 uWP6nQ1ycOYH8RcVIIry9FbrsLPy1Q3IJ/mfM/8lzW481HbmsUbq6Kul5z03IRy/C0vj
 xnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5n0PF6Nzsb2L9pU8FStkO5ltsqIAi0CEb9WzAVfdpXI=;
 b=l9brPZVl20Bqpl41YsFyF6URbKf6TR2oRzvtie7iAeEVHza20famnPMwyRlfWZTApO
 bVm1Z1gKO/dd5SrOccw/bmWCEu84yQwPPWkoBSWAQKA2uZEq8LtVuLu3b3pk+SHJH1dN
 M0VmZsVk8e+1gsdtmnrv4r3jttTtM+RUkqeskVcyX/f2elEqS3hKt9F7QnTtBEicmV2a
 eJu7tFyBuHJX4O2ium848kpHgsiZ3ENy3Rg+FeFTW+MaaVqAnmfiSQutDbwjRM6hrOKV
 DJceFZbA7wvH09A1K/Nle71ehWm+3ifLat9IHMk+wqfq40J8USxCY945uSooypRBVfdL
 O1pw==
X-Gm-Message-State: AO0yUKVOW3qbGcQ1n4LnVQKMHaNM0YaiYbuA7bwkkEFwlwQ3CcBy8grz
 7mDxTJg0w9J9bCHmnd/v52RLzw==
X-Google-Smtp-Source: AK7set8KMRK8ER6JfEQNQmyafLjpsOyH0dwh/bbWfktfsiC6vy9Bt5jdUxhk3YMj4OQXv7MAxe0UTQ==
X-Received: by 2002:a5d:50c4:0:b0:2c7:b51:65d6 with SMTP id
 f4-20020a5d50c4000000b002c70b5165d6mr2653070wrt.27.1677611217011; 
 Tue, 28 Feb 2023 11:06:57 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a5d44ca000000b002c6e8af1037sm10606277wrr.104.2023.02.28.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1801D1FFB7;
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
Subject: [PATCH v3 07/24] tests: don't run benchmarks for the tsan build
Date: Tue, 28 Feb 2023 19:06:36 +0000
Message-Id: <20230228190653.1602033-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
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

All we are really doing here is checking that TSAN builds compile and are
therefor a tool available to developers. The benchmarks are not
representative of QEMU's actual threading behaviour and they burn
precious CI time. Indeed switching to check-unit reveals many
unaddressed issues which have been logged at:

  https://gitlab.com/qemu-project/qemu/-/issues/1496

So for now disable the make check and make this a build only
test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221094558.2864616-9-alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d903c42798..7b92767689 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -463,7 +463,6 @@ tsan-build:
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
-    MAKE_CHECK_ARGS: bench V=1
 
 # gcov is a GCC features
 gcov:
-- 
2.39.2


