Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5A67409E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZOS-0005wI-1P; Thu, 19 Jan 2023 13:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZON-0005uv-3B
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:03 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOK-0004Ir-50
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:02 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso1884484wmq.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4xI8bo14KeFRnLcZP2zQAO50blmIYYQdO0Kt1h2R3I=;
 b=w8i9hhZdEUy25DjQN2Fc1rEUCK9QpDbGDCEIo5o3+N/PO8wGGB/pG+V53OBc7en9CK
 aKxasMohpTf3X6EwZyfWi4n8hjEmbu48ewrAKELf/mNekAa1e28RARnILVMLgMKckB7C
 j8xm8hkM9NW6mELNJojpDk3LKnzEwPG2NQtczfm3qhPrmhBaFkytMkIpPDkrqOtjq5qB
 tFv5g31uSWLwukDYuT397zxvIR79XS1iUTjBeqcFCwKWgqx4t143Q6ATmJobxUv2a5rH
 xl6iFOwSkvowqkcA1exHSeAlxGF+b7/nsGVxAimja+e86JP44+gt9tTUPX2Q3wmTinay
 1jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4xI8bo14KeFRnLcZP2zQAO50blmIYYQdO0Kt1h2R3I=;
 b=mA6trmEDSLAp3vB0dKKLg9hsQMWv5WSNpWDXhWQnyu0s83PVNmCRe4dgjc1A2bPuVo
 J3Am9vSNdCj8cBDrIy11WDkkCku6GT8xvAI4f8vUeOtkWBaa+T7o0wy7qmUxsjk7qM+c
 wpQ0+cDovzqrl09vOBLekrPviS4J6NIadVTrMjTrpUlpqRZFggj17E98Cl9OpKrVYwF/
 9UCcVmb5wFCqgHcwXii4b0ej/Bl3kmyg9vmdW/WIo55hLGgzrlf5xkt9thLYZJZ92ZM4
 Gg8z3BiiwWjvNIkPTZMhVjwu11hIkZZRxpeDDOKfqYFAcYmYy9rhRiIe+bhmokYf8OIk
 nLng==
X-Gm-Message-State: AFqh2kpWhTS/y9yYhd0FZraN6SjfcrHbe2ugVHWKoz5/IPbWFDfpY5ih
 /3WR03UT6fGictJPfbBuUn+2sg==
X-Google-Smtp-Source: AMrXdXukFlfIZwRqgffOl8Uofd5tuuidQj9yYJb7rR2mq/PMGFdxSLWw/R3fI0klwb3t+fS37gnrHQ==
X-Received: by 2002:a05:600c:4b9a:b0:3da:fcdc:cafd with SMTP id
 e26-20020a05600c4b9a00b003dafcdccafdmr11093021wmp.13.1674151917706; 
 Thu, 19 Jan 2023 10:11:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b003d990372dd5sm5786808wmq.20.2023.01.19.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B09B11FFC7;
 Thu, 19 Jan 2023 18:04:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 18/18] MAINTAINERS: Fix the entry for tests/tcg/nios2
Date: Thu, 19 Jan 2023 18:04:19 +0000
Message-Id: <20230119180419.30304-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

tests/tcg/nios2/Makefile.target has accidentally been added
to the Microblaze section. Move it into the correct nios2
section instead - and while we're at it, it should also cover
the whole folder, and not only the Makefile.

Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test building")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230119130326.2030297-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ad1e5341..e73b04194a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,7 +240,6 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
-F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -262,6 +261,7 @@ F: hw/nios2/
 F: disas/nios2.c
 F: configs/devices/nios2-softmmu/default.mak
 F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
-- 
2.34.1


