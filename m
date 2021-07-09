Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54D3C2606
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:34:31 +0200 (CEST)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1raI-0004hq-VU
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWY-0004xc-Kc
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWP-0005aX-Di
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d2so12480283wrn.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfoGHez+gPo5YY5+v/6dp1kX+Q31nwpzr/cnxR7G/zc=;
 b=IQTvoIgWN/Mib15w3xCKEg0NoqPGGf32olRTjpy10ZGw1urf5vTt41XTO4oeghsFmU
 gxW30eF2195vBEdCY19f7T/Evm1OVnEgHtExHcrbT2fT4aHptKgOW/13nF+88XZG7jL8
 B0kTgwbERhfoYEECasf7GSs98AWQELmP1MHmtvJDIxGSCQI8ftb0Fi9nSGZlH5zQv4hx
 aigd5bvD3ytKuyc0oziU/LK3ULvxythbDkvIofkWO64X5CMGa5k5woJIkK5yyaBn7gMm
 TGJQMnlXwA1r5Iym0TCNg512JWc3oHzX46XIsAsyDlCKSGYPV+ZSrCDlsepMZiBJsWkE
 shNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfoGHez+gPo5YY5+v/6dp1kX+Q31nwpzr/cnxR7G/zc=;
 b=d2WUzMBr9ybfC8GmeneCPNiCNNOadeDZ8KpwKgu7Ku9y8pB8MD46OtgeSUZpMs0473
 znjflrP2aX38HfYNHXkIjR1GUgCcB5wHw/S80CHWb8qCtV8YJvJUkcRjVvYg5MGN1jDK
 T90B37/TzFA7dgPiacSDjWSbw7AaeW1Qe0xxOLmyDV6Ik3FBWnaRVRYj3YcW68rwzMkx
 GcHPP8i5ZecL9wIwWjSGlf+8MOxXF3FVDUbmF4+7GAqw82x2gaxBzXsV8I6S4anWFpYD
 +Z18hog2OwC4vMiVxkBu6enuU4P5/C347doVGPkMyrLyzmkexw91CQ2RzM03REWuMlTz
 O+GQ==
X-Gm-Message-State: AOAM5324CQrIBvZ0IXCt+riSJcnpPyYLtVYLxIxG2VH9fzlUAphU8+pq
 CScnN7e/QkWZaPnwJsgYaBNPDA==
X-Google-Smtp-Source: ABdhPJzOiymkBiH/vEYpPFIxg+AsR0IdVlNjlAZKXEsKP5GwVYtwHHsoT11NMWpZ+vSkrA6LaHSTaw==
X-Received: by 2002:a05:6000:180b:: with SMTP id
 m11mr24349410wrh.6.1625841026594; 
 Fri, 09 Jul 2021 07:30:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l20sm5091935wmq.3.2021.07.09.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E0221FF9C;
 Fri,  9 Jul 2021 15:30:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 15/40] tests/docker: fix mistakes in centos package lists
Date: Fri,  9 Jul 2021 15:29:40 +0100
Message-Id: <20210709143005.1554-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.

spice-glib-devel is not use in QEMU at all, but spice-protocol is.
We also need the -devel package for spice-server, not the runtime.

There is no need to specifically refer to python36, we can just
use python3 as in other distros.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-8-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index ee52305646..5f1c57b4ad 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -21,16 +21,16 @@ ENV PACKAGES \
     libgcrypt-devel \
     lzo-devel \
     make \
-    mesa-libEGL-devel \
+    mesa-libgbm-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
-    python36 \
+    python3 \
     rdma-core-devel \
-    spice-glib-devel \
-    spice-server \
+    spice-protocol \
+    spice-server-devel \
     systemtap-sdt-devel \
     tar \
     zlib-devel
-- 
2.20.1


