Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A2423ABB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:41:51 +0200 (CEST)
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3Qs-0007Fn-B4
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3Nv-00055m-P7
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:38:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3Nt-0005Bg-Qk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:38:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id r18so7380179edv.12
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7QEPCzWRtQYREGIYAMc81UyLcRnyLVuZDBU33rWvAGs=;
 b=HGWcNX8/wOcFAdR1Hb+Iat/YHsuQ+tiwCWp+A/nvUz7Vdf/Tk+BR2jVzzN4GTqFXaO
 b7RhbIfa1M5RDGnFUTFNz6uGgsBWSC+XXxP9dW9jvWzsG6926kr/mBPEsSr98GYUjuVr
 UUU9RKJAhdsAtqjuki2DivZdpCnJy7e+fkUlCnGkvQIhtNMubDgMnwOPQoL6Gc4cv+au
 hZOMUoJlAfStV0i//JvsakvXMwQXuwiRQgG1k/BWKpxPZuEnmnrRhbE03TVzLoO4Nzu5
 7ZqrBlvIA7lRGZHTsBUGcXzgWPQdrxBgxpF5JmF7E+/V+WyTKWjlZxbdPegH7+dRit2W
 DOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7QEPCzWRtQYREGIYAMc81UyLcRnyLVuZDBU33rWvAGs=;
 b=6dOXnzhgxH/K7xxCBxbM4td6j6bB0nueq7hS67EvfbxgNuz4SSy6XKCOVuC21Ub9aI
 6XO48cj9VCEC+lXYanii14Wm7dgyDocjawPnqUXu8vr4m8poNg065+cn03CH8/ky8Zwy
 zOgRSVYFbNwWK6SDSI5t62q6oM2n8NR00G7G/vz8aESaQKNmbFSpkq9g3YBOmCTPsJIz
 C3uYZ18cJy28bRy94zdL0HYTPoR4yhIi90SCFo92DsyDkqSjQJio5bXWOsy2rm3CgYpk
 5oPVS0qwheATDQHIe/wx4uFFTz0BX+W6Gxa21NGa6ayu6/+nq7HwnCbdPZ3/3WB9bZtP
 F09Q==
X-Gm-Message-State: AOAM533elkCqjoXcjoFFOnYRfpzTCNVvyp/wAxdFFAW3w98/lALthst1
 Qx9NGCYC9/nYPh0yJSGXLXv62SZ7pcI=
X-Google-Smtp-Source: ABdhPJw0uKoesw1u6a5HFjjBHtmkU654YhY6TMPZg9Ltps3H4W8Ux6d4BX5kNUcie76lmpzsBo+YUw==
X-Received: by 2002:a50:d98a:: with SMTP id w10mr32153024edj.120.1633513124589; 
 Wed, 06 Oct 2021 02:38:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w5sm8907838ejz.25.2021.10.06.02.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 02:38:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] build: fix "make check" without earlier "make"
Date: Wed,  6 Oct 2021 11:38:42 +0200
Message-Id: <20211006093842.453750-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006093804.453503-1-pbonzini@redhat.com>
References: <20211006093804.453503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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


