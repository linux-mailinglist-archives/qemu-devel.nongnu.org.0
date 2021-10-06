Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348E423AB6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:40:53 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3Pw-0005yi-BS
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3NL-0004dm-LF
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:38:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3NH-0004fc-EV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:38:11 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p13so7716651edw.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpOqz2hG/b+4G5/KpVZXfc5YTGhijOsW3LdDu3d5ceY=;
 b=UyNYp6iMN1azz/Ty4aJGTpWXhlhUR3cqlynZ+LQcSsGanJn1iNwhxkXWAi4GG5Vub6
 l+YZNjiF2HLcXDwmUQjQq0/G+CH1gnyUH9a5oSJ6RmOo81RUB8jZVqIWk+WyKZK2gYoL
 xP1gcxd/8OA24lZcy/phM7hf1u25jwToyOAJFKhbH9N09vUmppitcEs6isb2WAyRkCwV
 RPAPuFHo/ZBFakTfEqB88blPKzNfshpS6rGg4r+iXKwt1/U5FK991/hl2pLnfOzlwXWk
 IOUeax7cwAt+JffLGEWCm6EMWdPlL4V7/mkm4dgcJMQ27XQaDW4/NXKzsldLLGRjc6e4
 EwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RpOqz2hG/b+4G5/KpVZXfc5YTGhijOsW3LdDu3d5ceY=;
 b=yw+rMj7fQywqrU1hbVQS05LO98N36o3DWN+5HM/xJjH1lNE2axxqYUDEq1Cc+O2N3r
 Gah/oItcgrWVMzzMSaG/Abfvodl34xYQpUJw4HMDkj3QTYgqp1N0P7zV9VQLy4nqu2uR
 if+xdqpyIv8WDa0t0FNj44X4t0+PUoOzA+fdogNuYYNrHmHqlOMftyUaF3uIFF03M5L2
 YDeePrnckYJwN/47pc8YTvOk8NtmzlOTP4C/zFkFqfoW4mBkmBt/a+VTemHgqh2Yq9Ua
 ym7KE3XPNqM7mmIGZRHNy+e10ZjP/QYkwrsXbNOSMrdErlBMlt2CCNDlYJ4dWbIVAJ9O
 wJtA==
X-Gm-Message-State: AOAM532zr2jWNwmd/NlcUvhl+KGa1je6MQy/jkoqHTpY9pEaoYVcMq4m
 kp+vosY53fwyVpMkH4+/S1Flu2mZDTA=
X-Google-Smtp-Source: ABdhPJyiiPIA5555eEB2V1w4XdIv2e/Tc+5uZKGQsx68UPhdOLiIwKjQgMKxibpC8phMN4+e1D14Eg==
X-Received: by 2002:a17:907:2bdf:: with SMTP id
 gv31mr21642779ejc.521.1633513085844; 
 Wed, 06 Oct 2021 02:38:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id o3sm8693360eju.123.2021.10.06.02.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 02:38:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] build: fix "make check" without earlier "make"
Date: Wed,  6 Oct 2021 11:38:04 +0200
Message-Id: <20211006093804.453503-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"make check" without a previous "make" will not build the tools
needed by qemu-iotests.  This happens because "make check-block"
does not do the Makefile magic that causes ninja to build the
test dependencies.

This could be fixed by making qemu-iotests a Meson test, which is
coming indeed; but in the meanwhile copy the mechanism used by
Makefile.mtest, just adapted to check-block's dependencies.

Paolo

Paolo Bonzini (2):
  tests: add missing dependency for check-block
  build: fix "make check" without earlier "make"

 tests/Makefile.include | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.31.1

From 8e37969c681d61d4581e5985eb9c76e509e79089 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Oct 2021 04:33:15 -0400
Subject: [PATCH 1/2] tests: add missing dependency for check-block

qemu-iotests run qemu-storage-daemon, make sure it is up to date.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7426522bbe..b42fd06462 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -152,6 +152,7 @@ QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXE
 check: check-block
 export PYTHON
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
+		storage-daemon/qemu-storage-daemon$(EXESUF) \
 		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
 		$(filter qemu-system-%, $(ninja-targets))
 	@$<
-- 
2.31.1


From a54fdbd52f33ad82ea96bbe8be8c5ec0c3e415b2 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Oct 2021 04:18:27 -0400
Subject: [PATCH 2/2] build: fix "make check" without earlier "make"

"make check", if not preceded by "make", will not build the tools
needed by qemu-iotests.  This happens because qemu-iotests, aka
"make check-block", is not yet part of meson.build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index b42fd06462..38af790e5c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -151,14 +151,22 @@ ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
 QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
 check: check-block
 export PYTHON
-check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
-		storage-daemon/qemu-storage-daemon$(EXESUF) \
-		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
-		$(filter qemu-system-%, $(ninja-targets))
+
+ifneq ($(filter check check-block check-build, $(MAKECMDGOALS)),)
+ninja-cmd-goals += \
+	qemu-img$(EXESUF) \
+	qemu-io$(EXESUF) \
+	qemu-nbd$(EXESUF) \
+	storage-daemon/qemu-storage-daemon$(EXESUF) \
+	$(QEMU_IOTESTS_HELPERS-y) \
+	$(filter qemu-system-%, $(ninja-targets))
+endif
+
+check-block: $(SRC_PATH)/tests/check-block.sh run-ninja
 	@$<
 endif
 
-check-build: $(QEMU_IOTESTS_HELPERS-y)
+check-build: run-ninja
 
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
-- 
2.31.1


