Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB743B009
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:31:29 +0200 (CEST)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJjs-00045v-2h
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbY-0000uV-EU
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:52 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbW-0007Qy-Tw
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 136-20020a1c008e000000b0032ccae3b331so1004038wma.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V4F6dTXCtxB2YfTwcmr2qdGp59H8NrXj+DIueaarNm8=;
 b=lDBfBtBXvrT9bZFoMDrRBkCnePQNF5uMrvVmiwTgIYEHbSUphvAXAjoQx5H/pJ9hnc
 0NbOJmYfczp3zxHB4veVwp5L4WxLe8H36bU1JTzCEPkZ7EIlOdqvo0JQcaKSbeXfBfKM
 ErhHkvZ+X9qJuvCJnbvcQIcerNH5D/zfNq7VEWv9G1cBg2Be0aqgzMkg1DC9oWeV7PR2
 H3e6382qpH8vNzy22nHUr+6pTj4JJZYNM3nFpUeEBNecTvFSY4BEfElU8bvw5FWso5mk
 UrCOk1iN+f6t80hcykU1U6OuWwflcFZkF5yZ+TAdCMcBsNzH4Xab3bJm0S9gAfDYrpm+
 z6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4F6dTXCtxB2YfTwcmr2qdGp59H8NrXj+DIueaarNm8=;
 b=HoqJ0eoJwRFcWPyvjCWCblW5mC+RsgEYbmIkvth62JAMrNtZhF7+Wov2MRWHuN+/0G
 w9rDgxaJzzmuiSUGR4TLst9STDIW9sWS6jZF/8BA4DUBFpDHkcMI/QbeXwv6haSkoZIe
 9CjRTsJVtj//GRF/XEhqlssnyqu7S66ESRlYf644ozVWYG+sQsbAGvS9yy+CgzY7vv/g
 a0zo/D3Mr1FfdqH1B+XMaoTyEDqBNm7r4oi3mVjs5fPoMNgj/oArqkO9AJB6krbbsaxv
 7TI5O14S2H1IJuy4PGvK6yvscbn3+HSSKv8iy0dkxg77bSgvf+kKx+r4Doqv0lVLofeF
 Gj8w==
X-Gm-Message-State: AOAM532sPEJQkPPPIIo9vTiI6TEvb/pMDfSSpYRR21dBRRgioWOGwI5e
 lnJlSInLuDllwTadTPxQ4ty3gsd63E3SWA==
X-Google-Smtp-Source: ABdhPJzATStZ9uoo/tJOX1ZPGV910J22PfHoyFgvyt/Y+XKGh02H9dmHu6oIQBiq2PLMZs9e6WXPBw==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr12949722wms.44.1635243769709; 
 Tue, 26 Oct 2021 03:22:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm7652008wrv.54.2021.10.26.03.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC1581FFA9;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/28] tests/tcg: enable debian-nios2-cross for test
 building
Date: Tue, 26 Oct 2021 11:22:17 +0100
Message-Id: <20211026102234.3961636-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have a nios2 test image we can start using it to build tests.
However signal handling in nios2 is still broken so we disable the
signals and linux-test tests that trigger the bug.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                     |  1 +
 tests/tcg/configure.sh          |  6 ++++++
 tests/tcg/nios2/Makefile.target | 11 +++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/MAINTAINERS b/MAINTAINERS
index 108fcb799b..87d67f19ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -222,6 +222,7 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 0d3ac839ee..34f6dbbc20 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -60,6 +60,7 @@ fi
 : ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
 : ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
 : ${cross_cc_mips="mips-linux-gnu-gcc"}
+: ${cross_cc_nios2="nios2-linux-gnu-gcc"}
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
@@ -159,6 +160,11 @@ for target in $target_list; do
       container_image=debian-mips-cross
       container_cross_cc=mips-linux-gnu-gcc
       ;;
+    nios2-*)
+      container_hosts=x86_64
+      container_image=debian-nios2-cross
+      container_cross_cc=nios2-linux-gnu-gcc
+      ;;
     ppc-*|ppc64abi32-*)
       container_hosts=x86_64
       container_image=debian-powerpc-test-cross
diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
new file mode 100644
index 0000000000..b38e2352b7
--- /dev/null
+++ b/tests/tcg/nios2/Makefile.target
@@ -0,0 +1,11 @@
+# nios2 specific test tweaks
+
+# Currently nios2 signal handling is broken
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN")
+run-linux-test: linux-test
+	$(call skip-test, $<, "BROKEN")
+run-plugin-linux-test-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


