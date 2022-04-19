Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F03506782
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:14:15 +0200 (CEST)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngjw6-0008CX-5D
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsU-0005JC-9n
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:30 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsQ-0008JK-TM
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:28 -0400
Received: by mail-ej1-x632.google.com with SMTP id u15so31495216ejf.11
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfyzv/itU9SEN9fxyUmMdmNwMeyB+oe9163CObc2A6g=;
 b=aDDvUFyAK/U8Ury5sKI5jixe2GIlvFbGIdMCB4T9KFWxqljsT9d1nRwnlmge82j+zI
 Hpb9hbBrCRlotOCkKfcyPT37Y2NDgkit6oq8rzud3QYMtXSWGBOwaa1X13HimvNTtCfC
 0qXU0Hg2CGDZo4dbcHTDvaM/TNeYS62axCYrZun6bCrOHA0MlMPDn3R9B+A81pdQZqYI
 UFEu4a6qbh1cjZKRBP3o35vmXKHsmVd+BNW4lLoEzqWaWQdlEmXSA7C7E4XLpY+V7rn1
 fiDu7T+TzDT0lFoeaz7d8Hi+8DGBwT6f4GDkmggghBA+RbDovbKr91MzqeTsm4Fp4Wq9
 GwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfyzv/itU9SEN9fxyUmMdmNwMeyB+oe9163CObc2A6g=;
 b=Y/g1cfN6e6hmH1CesF8u8UdP/t/UXnyDsUmyrC27cme7jhcjktRoluRrctXyTStag3
 +Zcktf+ikewE5SS3wANZnyR8hVCofJzkCLSgBLYmBj2QmT4aLEZlpdmLRCssQXryPW3h
 1YpgNpkOpKCotkiL18Q8JLPcytgLmhixteBTqXBa4EoXgBm9K2BS73TsUJ3eSOHjZcxy
 IAARcHcq4nsSOjarOsv1EqWONWH96OBnqLpR7dgRgGvvNMDE8JhzTsc2rRJfjIOd3fJf
 PhmKmagQuicaM2/uzjGSDMgo3j73nA7lfYUd12CQ9YZnh1efEvHO5meJAtvOgRyDzxcg
 FGgw==
X-Gm-Message-State: AOAM531n/SrAKv3FEfKtQooePiqy0LFvYZSbln7JL3arF3avh8BNAWVV
 nXCFIenasoeT7ITkHJKPDHaTcw==
X-Google-Smtp-Source: ABdhPJwKQ8aZvxwrAplzfEsvcb2+0XPPOo66lEAMINWAWoRvKPkYi/7GsyBidtbhRQ+LvXyaaE6f5Q==
X-Received: by 2002:a17:906:1c0d:b0:6e8:94a5:c5d6 with SMTP id
 k13-20020a1709061c0d00b006e894a5c5d6mr12359198ejg.134.1650359425147; 
 Tue, 19 Apr 2022 02:10:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 fy11-20020a1709069f0b00b006e8b68c92d8sm5380265ejc.162.2022.04.19.02.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86C841FFBA;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/25] docs/devel: add some notes on the
 binfmt-image-debian targets
Date: Tue, 19 Apr 2022 10:09:57 +0100
Message-Id: <20220419091020.3008144-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We document some of this on the wiki but lets move it into our
official developer notes documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>

---
v2
  - fix some trailing ws
---
 docs/devel/testing.rst | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 92d40cdd19..5b60a31807 100644
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


