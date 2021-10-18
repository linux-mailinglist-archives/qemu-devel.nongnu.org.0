Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE843137D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:29:16 +0200 (CEST)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOxH-00060R-CC
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOsL-0000Vs-QS
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOsK-0002Ar-3z
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEzs5yuk7z6Czqe1zxqHN8b/ECZQ5elcsj5gvpYub1A=;
 b=Tj7b8Limnm/ghUzhHMK3tr2qdUxSAcoeObZYe9bvIAlIEHvfSufu3W4Q/8Kj5kx+/acroK
 F4cJlqLTfEsRZOfYS1bxYiKSqoqvQ9xZXx20S89oo4F5mQBWV2n7X/fwNDp6+3iRBEk2Wa
 8OJmNlhEbx/FuVRJqmXBeN6+P4iGaLY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-p6QnvASWPNqcQNtRKTjvtQ-1; Mon, 18 Oct 2021 05:24:06 -0400
X-MC-Unique: p6QnvASWPNqcQNtRKTjvtQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so2665802wmg.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YEzs5yuk7z6Czqe1zxqHN8b/ECZQ5elcsj5gvpYub1A=;
 b=E4IK6MR6nIvAV/nopDIWVGGA2ny0bqkHF8FJzQOlfC27AGIYggAbxw8RzOsXkHta8a
 lwA6MOfjiuVVfuMVlpk8Bn59etNNjdnj5Sx2QPPdQ64SNVkRpu3Wy6bbhOIxrXB/loZP
 vigiV0frt6kGVGy4zn4RI+bJ+qSHfaXKOlYVK+PlvFlCV1fg28WmNITvkQu/ccFr5wwK
 7SewMIc7XqjujikjTtdRp/Cii62EUNN8QpsPRV2IrRkfUQIzfc+sJxHHCCe4bEU9EIRn
 CpySoC1PKioXCStTW24sN8oNS5sALaqH11McLG4dv8PWVYLUUnmTwGJNfiFudP7lCLs1
 C+Tw==
X-Gm-Message-State: AOAM533aFW+nVf3dw5qrYlNkzmtfXWVPfxGgy0/aPfLLgUVsKgouAtJg
 yIHC8nVei8B61Y+tQaAyPCdFUPfOA3jeUvq8oomu+d4mLNtPea5FJofM3WEWgA8RNlKTdzvW6II
 ZTJT5vImzDzoVq+OSh387DIqodVDiYRexdIrNNxAYM+/lephcy1LRf2JuJ0ltC74T
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr20889602wrs.46.1634549044652; 
 Mon, 18 Oct 2021 02:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzORBet1gPv5KznTQ5Z3PwNe20sjcq+q91yVF/dhWF8ZNMQnR6uTK6tHVmRWJD3BIwM+D9/sw==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr20889571wrs.46.1634549044374; 
 Mon, 18 Oct 2021 02:24:04 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k13sm7832252wrp.86.2021.10.18.02.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:24:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] roms/edk2: Only initialize required submodules
Date: Mon, 18 Oct 2021 11:23:54 +0200
Message-Id: <20211018092354.2637731-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018092354.2637731-1-philmd@redhat.com>
References: <20211018092354.2637731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
 .gitlab-ci.d/edk2.yml | 4 ++++
 roms/Makefile.edk2    | 7 ++++++-
 scripts/make-release  | 7 ++++++-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 62497ba47fb..2f12939d744 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -51,6 +51,10 @@ build-edk2:
  script: # Clone the required submodules and build EDK2
  - git submodule update --init roms/edk2
  - git -C roms/edk2 submodule update --init
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
index a2a8cda33c0..a9ff933a4ca 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -27,7 +27,12 @@ git submodule update --init
 # don't necessarily have much control over how a submodule handles its
 # submodule dependencies, so we continue to handle these on a case-by-case
 # basis for now.
-(cd roms/edk2 && git submodule update --init)
+(cd roms/edk2 && \
+    git submodule update --init \
+        ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
+        BaseTools/Source/C/BrotliCompress/brotli \
+        CryptoPkg/Library/OpensslLib/openssl \
+        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
 popd
 tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.31.1


