Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B46B67A0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:04:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcZ-0001hL-Lu; Tue, 24 Jan 2023 13:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNcH-0001cb-MT
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:57 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc2-00066O-W2
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id h12so10711411wrv.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSQcDSapYXetnUDMlzX78Huym5JE9tWuPhm961Si1Hk=;
 b=JIPx7VGCHnASxWFHJLRGgWzvKNiZahhhGhs8Pm66WfszuD5KxEN2J1F5hphVVE/1Gj
 ysfbxdIwCOPy/uYDxFU6I012VyO2QIqzf0q8fHAaWaT35Qzjf/alsbdywm5sFlEE4wED
 VX1yBz3F9B2AfxXRPLOM5C97nCdVOTjcoISJKaxLhlyepg6wRaxT708xs770Sr4xj/BR
 2F4oIXxo8UDWTyBPRRTktsRDGXOuupyNO1FEnu0XPje62eXBTF1cHTF+nEA/EIvAPENh
 2wr+R752Oj3QAsK75LYaMQUcjb7gaE+WX0GYyhnPd1MdVCceAgW4hxV/MsOPNVBMiKWP
 hQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jSQcDSapYXetnUDMlzX78Huym5JE9tWuPhm961Si1Hk=;
 b=0NnNWOkKs+3U46/5ib8vWhGTjmP8IudCy9Cw0hpYi1MO2bdKJor/VrcGHcHIhRLBbA
 h3ntpfwdqsjtBKphDkIRas/giWuozE0n9ypckg9iXqaqDsP2sRWD+WEQTT9kuLsG+yl2
 KVqOxET+2p6WIHkbIpPInzyKrfW24JvoCsAlEsgDpm0Ld/ol/rv+D5Jzw36K9g+F+LMp
 i0ru/aRedGxSHEsSc8uapKb7Hchs2q7Sjhdr1wp5D6Ck2G2x33DuM4cLJQd18w4jRPiG
 R459swOhMetTxjD/BOzg0rXVOOQade7VA9tN8NuZPvTaDtyxfy8UircUJGxCJvX7WbBK
 +rYg==
X-Gm-Message-State: AFqh2ko0hUhLtSJ/BOMGtMobAUrXORs5/NEutpIGboNoW5mhyIIsSL2b
 H0kJ7C+ifLEmDFsypJMBIi3zCQ==
X-Google-Smtp-Source: AMrXdXs6n6j0pqk8qzACeDm6nj/CsOXI2PdmYKnMEKqPKzO62ljdyCJQRb0WSYGUE+7GjmRweJy36g==
X-Received: by 2002:a05:6000:1f14:b0:2bb:5adc:9f92 with SMTP id
 bv20-20020a0560001f1400b002bb5adc9f92mr25504624wrb.50.1674583295913; 
 Tue, 24 Jan 2023 10:01:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o10-20020adfeaca000000b002b57bae7174sm2552376wrn.5.2023.01.24.10.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 768491FFC4;
 Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 14/35] tests/docker: drop debian-tricore-cross's partial
 status
Date: Tue, 24 Jan 2023 18:01:06 +0000
Message-Id: <20230124180127.1881110-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

This image is perfectly capable of building QEMU, and indeed we do
that on gitlab. Drop the DOCKER_PARTIAL_IMAGES setting so we can also
test the gitlab build locally.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 665ddde518..bfb0dcac21 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -128,7 +128,6 @@ DOCKER_PARTIAL_IMAGES += debian-mips-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
-DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
-- 
2.34.1


