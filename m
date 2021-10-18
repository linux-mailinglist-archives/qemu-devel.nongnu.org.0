Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6604316D5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:06:46 +0200 (CEST)
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQTe-00038V-1L
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcQLg-00057e-4P
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcQLe-0002SZ-Bs
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634554709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xx3f/mYVwEOTtmXB5LHuSDZ24Zf6Va4xyRPf3h7Vlpw=;
 b=gEui8H2V2AnIS7xfsCldct51OPw2nlfT4JonhMEDhwedbQhzehR5Nyex3ZHNCTRQqQDO0H
 Gcvl4bDpotWiUtK8hI8NiAXaHcIpYJXnSWDgqix3Jowd7f7YQU7vGDSxLWTC9ba/lpg0uR
 xDhSoo/7E7nzgtbz4Ki6FbTtnoHg4nk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-8BllQrv9MCWJBXhsxsXbIw-1; Mon, 18 Oct 2021 06:58:28 -0400
X-MC-Unique: 8BllQrv9MCWJBXhsxsXbIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso1982138wmc.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xx3f/mYVwEOTtmXB5LHuSDZ24Zf6Va4xyRPf3h7Vlpw=;
 b=bA7d19XCy7g5AA8yrDUaeBWkMRck2rs5ZiSBWMOoA3TcQganAkDt9abRgcruZD9jA9
 JP7sIbZbRYMezqDD/kIQB5umBfvWhpiIkMUc/CWxwX2fXyi2cidoC8foZZpa+9ynSSN0
 /FXkMEtXMY+SylsQ4Qb3+Ky369BR/G4KLhYQCKw73ia/hbKvNSIxZgexfNEUiAns/GbH
 wqCkgb8PLEmng8TpPyi9byCCub6Q0+jNq0hCptO+6NTraXYe1+Qok+mftI28XJZjtRNY
 AyIR6UfCEOG3rxAskF81m3ZGjdBlXxgzAXdzX5geVm27SHjcYPlwhPbBoFH63DhGM5gs
 5pPg==
X-Gm-Message-State: AOAM532bc9r61g31tCBcTrKknAKMIGPnjPGgYl3e1AFEui2lLXwnYYYO
 bUJsYJB2MMhT9itEQJlxFgfuRhhvwXuFQQt5sNQBls3Rshi1IOCxt2Eks+LKZi5aiKhoQmkqFDJ
 gq9AvBGJ/jjx/NtHnZcA9qcuO9o2JFlTKqgZvUnmIhsQX4Jd4MON3wnxQaP3EvbMF
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr33606994wri.64.1634554707202; 
 Mon, 18 Oct 2021 03:58:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWNIIbvRjf/CKzuMzzl/lRwTXkfxm/CKlR8Ix6FzqDmuCS2R+bKw75xxqH9ZzaJnWnY03xAQ==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr33606956wri.64.1634554706954; 
 Mon, 18 Oct 2021 03:58:26 -0700 (PDT)
Received: from x1w.redhat.com (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k6sm12597727wri.83.2021.10.18.03.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:58:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] roms/edk2: Only initialize required submodules
Date: Mon, 18 Oct 2021 12:58:16 +0200
Message-Id: <20211018105816.2663195-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018105816.2663195-1-philmd@redhat.com>
References: <20211018105816.2663195-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
Cc: Michael Roth <michael.roth@amd.com>
---
 .gitlab-ci.d/edk2.yml | 6 +++++-
 roms/Makefile.edk2    | 7 ++++++-
 scripts/make-release  | 7 ++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 62497ba47fb..13d0f8b019f 100644
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
index a8ed3255757..fdae0b511f5 100644
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
index a2a8cda33c0..05b14ecc95e 100755
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
2.31.1


