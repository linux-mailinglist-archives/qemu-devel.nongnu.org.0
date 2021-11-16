Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A882F453780
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:30:52 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1MB-0003j4-Q5
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gu-0004Zl-6W
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:24 -0500
Received: from [2a00:1450:4864:20::336] (port=37724
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gs-0004CJ-H2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso2466195wms.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hp+3+9AUZf48hagv9aooEUSQ5CMyks7M2uw5VJWYugU=;
 b=gWtyV0vDYq0MArlCyWINj5Fvf5hBiw9DdW/uHF7PCyhhz3DbRVKX5kbR9yK3VU1Pwl
 DNN4nEI9CscKYVg0/+K45wxEGeOPhvzMma6Nm2dbv/MCRBRl0iw+7PR96Qyi3IT1ezYm
 83phF0V7A270RLemr7y0VmK9z4P3Fr+qh6Eij4M+doiBMxzp3nR5lP3BuG1LfvhiblI2
 SH9KLm/PZWzAcuXPztiT2+SmTpGeA7Pk0/M+wunl6oSjkA+ufWJbBU+amrChT5w7rywD
 EZ7Dw1OoaZw+gPb3Zi1KixtXQh/x2Or1hUt+vPk/f/Qw09T3bI/dmaHZmiHwkwQ2Gr08
 XHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hp+3+9AUZf48hagv9aooEUSQ5CMyks7M2uw5VJWYugU=;
 b=JSjTJcJO7dyphpcUbVYyeQGEWXGn8zrGeT67x3Hw/a/HtO4htfYPvn9/nMBjpf7saJ
 lts9oKD0aldGOsqnKa5uffLx2+x+768FItOD2wwwx7EgmZw9qlpgJzZdnG7n6dU7hECE
 ioAihXNn6uqcgSxthNM/j0H4Y3sTfIt+CnYelnvIzb4cLZgYtBSW/D4BLuRPzLtsfSN6
 msGrZ2mXcPze0s8hLQ1UFyO6hU27bClyE/XfmFu5AC/EpZh51n/zUaScBQxohK7ORMAw
 0TyLeO2YG0tgfY1Yvx2E+0DkKnXNmi28wiTRrW3L5pU3DVspLz6f56OFMnKrJ7qmdhHn
 GDsg==
X-Gm-Message-State: AOAM531byoGxfEuCEk4s3cR5U9bPm9Fn6E5Za7upDBcC/SNbDxGUpv/l
 Jek8GwAvh15dnhbxEPCbzWdm7A==
X-Google-Smtp-Source: ABdhPJyrushXfPLZh8Nngqobb+u0xU2oUm8zENKr0Is1mwV/55by3o9lqzjW9ogZ+nSvf9Ei6Bxf3Q==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr71920016wmj.52.1637079920847; 
 Tue, 16 Nov 2021 08:25:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm5956224wrs.88.2021.11.16.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 987BB1FF9A;
 Tue, 16 Nov 2021 16:25:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 3/7] tests/vm: don't build using TCG by default
Date: Tue, 16 Nov 2021 16:25:11 +0000
Message-Id: <20211116162515.4100231-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it is useful to run these images using TCG their performance
will not be anything like the native guests. Don't do it by default.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/393
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211115142915.3797652-4-alex.bennee@linaro.org>

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index f8ca619cf2..ae91f5043e 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -2,14 +2,22 @@
 
 .PHONY: vm-build-all vm-clean-all
 
+HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
+
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
-IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
+X86_IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
 ifneq ($(GENISOIMAGE),)
-IMAGES += ubuntu.i386 centos
+X86_IMAGES += ubuntu.i386 centos
 ifneq ($(EFI_AARCH64),)
-IMAGES += ubuntu.aarch64 centos.aarch64
+ARM64_IMAGES += ubuntu.aarch64 centos.aarch64
+endif
 endif
+
+ifeq ($(HOST_ARCH),x86_64)
+IMAGES=$(X86_IMAGES) $(if $(USE_TCG),$(ARM64_IMAGES))
+else ifeq ($(HOST_ARCH),aarch64)
+IMAGES=$(ARM64_IMAGES) $(if $(USE_TCG),$(X86_IMAGES))
 endif
 
 IMAGES_DIR := $(HOME)/.cache/qemu-vm/images
@@ -43,7 +51,7 @@ else
 endif
 	@echo "  vm-build-haiku.x86_64           - Build QEMU in Haiku VM"
 	@echo ""
-	@echo "  vm-build-all                    - Build QEMU in all VMs"
+	@echo "  vm-build-all                    - Build QEMU in: $(IMAGES)"
 	@echo "  vm-clean-all                    - Clean up VM images"
 	@echo
 	@echo "For trouble-shooting:"
@@ -56,6 +64,7 @@ endif
 	@echo '    EXTRA_CONFIGURE_OPTS="..."   - Pass to configure step'
 	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
 	@echo "    LOG_CONSOLE=1        	 - Log console to file in: ~/.cache/qemu-vm "
+	@echo "    USE_TCG=1        	         - Use TCG for cross-arch images"
 	@echo "    QEMU=/path/to/qemu		 - Change path to QEMU binary"
 ifeq ($(HAVE_PYTHON_YAML),yes)
 	@echo "    QEMU_CONFIG=/path/conf.yml   - Change path to VM configuration .yml file."
-- 
2.30.2


