Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E66C4366AF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:44:08 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaEh-0000dh-40
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx2-00005I-I2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:52 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZwy-0002LW-1q
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:52 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so800057pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mt5a7D+1CVHAxOqseVTcbDnwKe/J2TFbRKsmpUgULEQ=;
 b=dFPK/2vdLzATItyeIfFqrv3zJOcG0viMblzvs6AXMj/etJYy1bAg7pzJvR0uXemS/u
 /ILyuqW2+kpxizqAE0TxPDxWxpx2AfTocvXBDdJsA5f7wZWo3pbEL/uf15u4TankElde
 Wxrs3UzPpIv8kkpBfIHVwATf/TavA5WRsolzxSN3YqyxuwYnmCfKStacfkWnfeUJgy7P
 kIX24r54+p7EtCed99q4yapGrdCP9oiAosvjowJLKGsH7njH5JDDmht1IbjKROcg+Ieg
 jkIaoh+BBjxT0q+BW3H1s9cNblqq8fMh+eoC5ENOhWb8Zhpe+Lvx8mnZRM+6ltJIUYsH
 7p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mt5a7D+1CVHAxOqseVTcbDnwKe/J2TFbRKsmpUgULEQ=;
 b=mAYQsL8+9ydkgCVkc2ELwhP/SEMsRcEElVT++y0lRQS+6kBUFkhxhPdq6B3wyCbZpV
 IZffrCgkt25BlyPT9uQi+FXT952KMAsGzLOCASNYsVTU3Cffslqrj+JDhEtPngV3LUA5
 w+vVbSwZlJQlTXpTkVmSQYezy4FXWW1k1CGmaGJ3cIcdEbSLug2V/KtSwRYCx3x6NE4I
 jJ1kV5BIUoDWwEqEdSWH+7M5TRNWA8efBoaCgcTne0FV0rxUSc4REBNr+TI55YkmBAnb
 toORR40rZm1Z8LhcjrqaC+xiuvnzMsLurDpZbYKhPRNTnprcX6/+UI63hE+iZqrMSVBj
 cXVQ==
X-Gm-Message-State: AOAM53028MrqqF2bQ2Zhv2KTqXm8/6zBVXWXbSCEgKD+99/QXboVShGj
 ez0CGvpP7rzlOXcEb/wT+dxWiunaVRHbqw==
X-Google-Smtp-Source: ABdhPJxZh5++k+Fm3d/sgjSkHeX1nP4J8rErxot+M3oulUjOM8eRPVFofxYwql8Q2AoqhIlxS2xYPA==
X-Received: by 2002:a17:902:70c5:b0:13f:f941:9ad6 with SMTP id
 l5-20020a17090270c500b0013ff9419ad6mr4143486plt.28.1634829946558; 
 Thu, 21 Oct 2021 08:25:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] roms/edk2: Only initialize required submodules
Date: Thu, 21 Oct 2021 08:25:28 -0700
Message-Id: <20211021152541.781175-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The EDK2 firmware images built to test QEMU do not require
the following submodules:

 - MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
 - UnitTestFrameworkPkg/Library/CmockaLib/cmocka

The only submodules required are:

 - ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
 - BaseTools/Source/C/BrotliCompress/brotli
 - CryptoPkg/Library/OpensslLib/openssl
 - MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

Adapt the buildsys machinery to only initialize the required
submodules.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211018105816.2663195-3-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/edk2.yml | 6 +++++-
 roms/Makefile.edk2    | 7 ++++++-
 scripts/make-release  | 7 ++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 62497ba47f..13d0f8b019 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -50,7 +50,11 @@ build-edk2:
    GIT_DEPTH: 3
  script: # Clone the required submodules and build EDK2
  - git submodule update --init roms/edk2
- - git -C roms/edk2 submodule update --init
+ - git -C roms/edk2 submodule update --init --
+     ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
+     BaseTools/Source/C/BrotliCompress/brotli
+     CryptoPkg/Library/OpensslLib/openssl
+     MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
  - echo "=== Using ${JOBS} simultaneous jobs ==="
  - make -j${JOBS} -C roms efi 2>&1 1>edk2-stdout.log | tee -a edk2-stderr.log >&2
diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index a8ed325575..fdae0b511f 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -51,7 +51,12 @@ all: $(foreach flashdev,$(flashdevs),../pc-bios/edk2-$(flashdev).fd.bz2) \
 # make-release/tarball scripts.
 submodules:
 	if test -d edk2/.git; then \
-		cd edk2 && git submodule update --init --force; \
+		cd edk2 && git submodule update --init --force -- \
+			ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
+			BaseTools/Source/C/BrotliCompress/brotli \
+			CryptoPkg/Library/OpensslLib/openssl \
+			MdeModulePkg/Library/BrotliCustomDecompressLib/brotli \
+		; \
 	fi
 
 # See notes on the ".NOTPARALLEL" target and the "+" indicator in
diff --git a/scripts/make-release b/scripts/make-release
index a2a8cda33c..05b14ecc95 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -27,7 +27,12 @@ git submodule update --init
 # don't necessarily have much control over how a submodule handles its
 # submodule dependencies, so we continue to handle these on a case-by-case
 # basis for now.
-(cd roms/edk2 && git submodule update --init)
+(cd roms/edk2 && \
+    git submodule update --init -- \
+        ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
+        BaseTools/Source/C/BrotliCompress/brotli \
+        CryptoPkg/Library/OpensslLib/openssl \
+        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
 popd
 tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.25.1


