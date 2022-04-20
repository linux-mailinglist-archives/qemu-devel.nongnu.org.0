Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1772508F99
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:40:50 +0200 (CEST)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFFx-00063R-PG
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEks-0001uW-SG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkq-0001Yy-Up
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lc2so5132339ejb.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yti9kIOm/U1VFu1+Eg0kWl9o9QO1lkMwbluZQdTBCw=;
 b=Jzk/h0F6ySv7saCCD7TTKk7iHoswGsNZsiTbE4wEkQte64HSEovo+K/vc749QtYZxz
 XyV/b7lNsGiB5Le1do8nglP3+Y6dCrgnPe8KzxS+5pajI5G8/icbFt5y4hxWVm136MGG
 qLgpSGVJ4rafd6Paun/AcBxUlfnckNujC+luF+KQGon1xFGFzxTg49A2xfYm7VIScpO4
 6iB/UyHzbZ2C9ZAggGAx+Eg9MIriD1xwt/JMRQQeL+Ec/iBKj3ZpoFz+AADXOFCJ1bqj
 J4s530em3Lep+vFFeMqweP18vkRShVwmy1rj6AcjHLoxenhLuiTJSl0hQVX7gkDslpUB
 I0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yti9kIOm/U1VFu1+Eg0kWl9o9QO1lkMwbluZQdTBCw=;
 b=c01OLvLfayuYGXTUp0QmXBcL8coEzTyaouOLAYgSipnmZefUvbsV3Ysl/T/E3VLjxz
 e5fhFaVwJ/WxIgGzQQ13Pe0DQ0Ezxm0vwi6DLbZSrH/RtnSaOXj10uC2rUZHXUnQvt6v
 Ujel8uMkRYtlM7I5HAaBHXi7nRlgr5BMpoEKdl0CZFgiNxaIfhtNw7wKkcvHYis92OAF
 PlwwUBuvPNwNFgHwmDORKroh2J8YMMdgF0NWq98sKcluuZyw6Y0f1KAxZbKjkSfkjgWa
 HVWD9cW+8EuN9MK4pbBe6mbfw453Ov74kaWsIKazoEtq/R/biD4j8NaMDwrnsW65Kfmy
 4ubw==
X-Gm-Message-State: AOAM5301UcjT8f2AXoahaMVhg29Rxq65nfDg33BDPK6c/6PgEMvh52od
 9DfSmrpV9xN8LuHLQsdYEsjblw==
X-Google-Smtp-Source: ABdhPJyq5setsq+KL8J8+v9LvJDZLmS24b0VDK7tY64GejKPsOtq4zINbCO+Aq13TkLYnwyY3IpqVA==
X-Received: by 2002:a17:906:c14c:b0:6e8:6526:7647 with SMTP id
 dp12-20020a170906c14c00b006e865267647mr19280925ejc.257.1650478119500; 
 Wed, 20 Apr 2022 11:08:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 wc6-20020a170907124600b006e8816ae3a3sm6907037ejb.125.2022.04.20.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 745461FFBA;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 02/25] docs/devel: add some notes on the binfmt-image-debian
 targets
Date: Wed, 20 Apr 2022 19:08:09 +0100
Message-Id: <20220420180832.3812543-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We document some of this on the wiki but lets move it into our
official developer notes documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-3-alex.bennee@linaro.org>

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


