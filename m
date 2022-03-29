Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD634EAAC2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:53:33 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8Xb-0002gl-82
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:53:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZ8V2-0001LR-Gj
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:50:52 -0400
Received: from [2a00:1450:4864:20::62f] (port=38601
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZ8Ux-0002BA-RH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:50:51 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r13so33936359ejd.5
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aMk137+frDiZ+7mw95lnzsIkSvSrqwQdVmUUgz2r2c=;
 b=z4A8A/kNXSScMuGJsWkk4VuX+QdNSqugPdMpP1Opvd+VPoF8MdkSyveLaWCERe3Y0v
 SZvBY3Rq9P/LFUsDmR5bm3a+eWXwyeLuiRaM16c0BEnls4eLvy2vZgEyVX9tDJz9+z3r
 a9JVDJMhG6VA+/GpugY1Unq4rf7apcZibX3J83BokLPkhPZW0+dySko/8TuRqVMNo5NT
 6Sbeke1sX1N4TnmNf1rkdz0dAlXJJAx9XdU9oYlgJQsE4R6i1U0OmDt6s/1lxYZP021t
 lx6RVR6FlLhGcKaGmR3AGfQ7jSvy4d5KG/kXkXeIsRHP5MrvCNMyBadjQPAOl6K9j6xK
 yfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aMk137+frDiZ+7mw95lnzsIkSvSrqwQdVmUUgz2r2c=;
 b=AmYZNC3JFuHgzqFmhi7p3sxNPux9x1mWlWJYTyCI8MK1CkZNbAtn9WD94ccbq3oMIv
 dxX+WnP8twdpLwHQrOXNSEKbgX5c6uocBfiGY8aO8YjkNs4jtRWzuDBTHDQ27V/cDmqq
 /wBcgmzYRjtz8mgqki0bhJqlcoOu0rDCDheXttmCD/jIqT6E7Jc+I6/L4wsSYUI+J0+R
 tqG9/M7MqsyALUgVSJDmOLRb/V79d0pcDffdH7XebEUVZX3TAurhHvSbq2adsCgr3pRz
 gmpJq+95kDpnMkuuHrtWMDzBRiNIYKr8ePWAT9TizjSYSuT1FeNBDZfPOj7ARXPOQd4q
 aFCw==
X-Gm-Message-State: AOAM533EVF2eNc+D5Yj70o1TAhFODcPZIkowAGF3kVnKKlIZUGc2GAx1
 UqcM0CmxWgltG8KVvdR3vhL3TQ==
X-Google-Smtp-Source: ABdhPJwJFfmN4OmIE3gyagfIkP2IoNDpRDrKGJ2iEJHUVKOPTIp47/3FPMP2KZOCs7ZnWoZwco87yw==
X-Received: by 2002:a17:906:6a11:b0:6d7:76cc:12f6 with SMTP id
 qw17-20020a1709066a1100b006d776cc12f6mr33210069ejc.456.1648547446489; 
 Tue, 29 Mar 2022 02:50:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709062a5300b006c75a94c587sm6854469eje.65.2022.03.29.02.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 02:50:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3FB31FFB7;
 Tue, 29 Mar 2022 10:50:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: add some notes on the binfmt-image-debian
 targets
Date: Tue, 29 Mar 2022 10:50:41 +0100
Message-Id: <20220329095041.2758355-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We document some of this on the wiki but lets move it into our
official developer notes documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 92d40cdd19..c0b2a46e08 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -637,6 +637,44 @@ The full set of annotations can be found here:
 
 https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_interface_ann.cpp
 
+docker-binfmt-image-debian-% targets
+------------------------------------
+
+It is possible to combine Debian's bootstrap scripts with a configured
+``binfmt_misc`` to bootstrap a number of Debian's distros including
+experimental ports not yet supported by a released OS. This can
+simplify setting up a rootfs by using docker to contain the foreign
+rootfs rather than manually invoking chroot. 
+
+Setting up ``binfmt_misc``
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+You can use the script ``qemu-binfmt-conf.sh`` to configure a QEMU
+user binary to automatically run binaries for the foreign
+architecture. While the scripts will try their best to work with
+dynamically linked QEMU's a statically linked one will present less
+potential complications when copying into the docker image. Modern
+kernels support the ``F`` (fix binary) flag which will open the QEMU
+executable on setup and avoids the need to find and re-open in the
+chroot environment. This is triggered with the ``--persistent`` flag.
+
+Example invocation
+~~~~~~~~~~~~~~~~~~
+
+For example to setup the HPPA ports builds of Debian::
+
+  make docker-binfmt-image-debian-sid-hppa \
+    DEB_TYPE=sid DEB_ARCH=hppa \
+    DEB_URL=http://ftp.ports.debian.org/debian-ports/ \
+    DEB_KEYRING=/usr/share/keyrings/debian-ports-archive-keyring.gpg \
+    EXECUTABLE=(pwd)/qemu-hppa V=1 
+
+The ``DEB_`` variables are substitutions used by
+``debian-boostrap.pre`` which is called to do the initial debootstrap
+of the rootfs before it is copied into the container. The second stage
+is run as part of the build. The final image will be tagged as
+``qemu/debian-sid-hppa``.
+
 VM testing
 ----------
 
-- 
2.30.2


