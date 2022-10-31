Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9923613811
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:30:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUrU-0003eE-Qk; Mon, 31 Oct 2022 09:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUrT-0003bc-1B
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:29:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUrR-0000qJ-Cf
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:29:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g12so15970468wrs.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wN4sgq5AZPoexBZZqiq11ALBDmUmR8A1dFt4GgZFE2I=;
 b=y6MU4GggfhszKUnpUl2sMB2GLX5BECNey1uSin+B2bccdDsmb7AJ479la7JdN8VA+3
 90N9jT7UN9f5OP7UUHA0IinRV3PUmRw6PeFAYct1DNbN+myyE6qs5PuyDsIrYdF3teab
 M6w+6Tdf/9TXvaL5DgNDxlq1/iEj9SEp/O1snd/2pXYoHM7c2wl7rysh7eRCJmCIR3gu
 CgR83fc9DpT1ENg4sYURmUYNFwVgAXOmWaWqY21KRbYYpSXx6Zy0NvQuK88tLehhOLfk
 2OgDk7Lxyj4u6I+mnLaNr2amO1p9943gCFmuLnlBqRDv/On00B1RybGdpfNI6SMRu/Qe
 qWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wN4sgq5AZPoexBZZqiq11ALBDmUmR8A1dFt4GgZFE2I=;
 b=Jx7BFWJpiPKDWANo2TukpqkY0xKtw4zM8H2ATxH36w24qi2CZSoAO0Po5KSI61VB5e
 EBtdYcuOcPLyGPp5PPL+g2Ck7bguLtJzfYhy4fE5pA+Js7L33vTLwhBOkqOjIuJ9sMnW
 L3EwuF7u0sAPKKt6Dxpcro/1H6H2zstTOPQ0zJLi3MNQui2oDOalnN+7ueSeaxUBzett
 A/Np88JZ1GiaR0ajRYfW+lWr/84X8WooHaCOT/9x2h0DX3aKLJTANgx3mr4SYgykc2bu
 2ZSEBfZrU1ROylEYCnd118ddbWxbGIxKaiIX65d6noF8JRGgniOX+xMuXoClPMxy9Qf1
 sf1A==
X-Gm-Message-State: ACrzQf1KND5WeV9jI8HaWNhXKqH9CbQ1G0E3Mwh3pB14jXGhA89Gmxz6
 aIj++uCf7Gsyis+pSK7MWkhOnQ==
X-Google-Smtp-Source: AMsMyM5hGHD8L/ivPG/v/RfdXWVIZJpS2DyRDBjR3kSiD46yLojcOJVsTX8G4r/OALu5vgKXcXNXfw==
X-Received: by 2002:a05:6000:18d:b0:236:8f9d:6d41 with SMTP id
 p13-20020a056000018d00b002368f9d6d41mr8511372wrx.658.1667222992023; 
 Mon, 31 Oct 2022 06:29:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c489100b003cf6c2f9513sm4615698wmp.2.2022.10.31.06.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:29:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 749771FFC6;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 16/31] MAINTAINERS: add entries for the key build bits
Date: Mon, 31 Oct 2022 13:09:55 +0000
Message-Id: <20221031131010.682984-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Changes to the build files are a bit special in that they usually go
through other maintainer trees. However considering the build system
is the root of everything a developer is likely to do we should at
least set it out in MAINTAINERS.

I'm going to nominate Paolo for meson stuff given the conversion was
his passion project. I'm happy to cast an eye over configure stuff
considering a lot of the cross compile logic is in there anyway.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221027183637.2772968-16-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 1706a08a79..ada84db23b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -548,12 +548,14 @@ F: */*win32*
 F: include/*/*win32*
 X: qga/*win32*
 F: qemu.nsi
+F: scripts/nsis.py
 
 Darwin (macOS, iOS)
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Odd Fixes
 F: .gitlab-ci.d/cirrus/macos-*
 F: */*.m
+F: scripts/entitlement.sh
 
 Alpha Machines
 --------------
@@ -3763,6 +3765,29 @@ F: docs/about/deprecated.rst
 
 Build System
 ------------
+Meson
+M: Paolo Bonzini <pbonzini@redhat.com>
+R: Marc-André Lureau <marcandre.lureau@redhat.com>
+R: Daniel P. Berrange <berrange@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
+S: Maintained
+F: meson.build
+F: meson_options.txt
+F: scripts/meson-buildoptions.*
+F: scripts/check_sparse.py
+F: scripts/symlink-install-tree.py
+
+Top Level Makefile and configure
+M: Paolo Bonzini <pbonzini@redhat.com>
+R: Alex Bennée <alex.bennee@linaro.org>
+R: Thomas Huth <thuth@redhat.com>
+S: Maintained
+F: Makefile
+F: configure
+F: scripts/mtest2make.py
+F: tests/Makefile.include
+
 GIT submodules
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-- 
2.34.1


