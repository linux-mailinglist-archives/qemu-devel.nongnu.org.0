Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D042E464
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:47:19 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9VO-0005lD-7n
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sy-00030T-Oh
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:48 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sx-0004PZ-5Z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:48 -0400
Received: by mail-pg1-x534.google.com with SMTP id e7so6864166pgk.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fmi/MhIU/mKYGgADyySzLFn+PtliyfqTfVKWwQaBux0=;
 b=sQRWCx94+gGtAWaoFYpuH8hV+iDYCHHpDgbD9yDn9AWr0cqOsZDiBxOOy1ywTfDAUY
 SDxwd6bnLamYdEMRovfV0MnbbLiWYNUHvQQpnx7uQbMple4KOuuCTkip6Rk7pDNoEXkD
 aJwvLEJ7E98lHwZxe9+Y57hgQG+CITEcbG3bxyXyErz2nX052xFmD2hQeVMgULOpuAa4
 SEhmBzHVhPeCbaPWQF3n2i9IYOgj4K50AwwLrPPjqVR6x2vBSobJV1JAGtcvVmzevLrb
 cvYpifK/IobDP3XgSNf6AOY8nP0xSGCbUq7//1nbaAqNRVU+7yu1m+XwCisuQyrfrcA2
 FSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fmi/MhIU/mKYGgADyySzLFn+PtliyfqTfVKWwQaBux0=;
 b=uSJ4TISLpe+n3aHN51eSBE3gs07Xw2o3+Ryem3g/3FrX02T9cE6AZpfLV1beJ8I0NX
 0KbxPSetUdhPvnrFsLj0mrz/8MhrpHmxmcjzH71cXKiGb2LtfpayS8WOSdTQA93q01Gc
 qx0znH3l1nhD/UxFSc6QdvkDSyDOEkjnjph4nxM/gms0P2xAeDnq6imvofPOOh0688+i
 mso1rhE+CYDVtJIWw59XNXZHoH546KRu1ExqHqU9rKEBn36fXvkRKExuanqkLvZMSZ+z
 EF5NfLlmTLLGAhHQ0m8b2lc9Ra86IVAV4FdlqkU6z/Pq9Ns9XcxQ9YA0qMhFgScPw8zY
 V40g==
X-Gm-Message-State: AOAM532epLMhsgd+VQrs8hCssbyCheRENj8HglxLZvgSgvWSUynzfpI3
 tOll46a7mXHGVO/MQza7Ijk7f99/pPv7Uw==
X-Google-Smtp-Source: ABdhPJz6vmF1aOTOxnY7JyrsEyC7dbRjxmFtpWyXwfnJ2PG1anvYm8K9mTZftLj8Ub/FwWPVBKcY5Q==
X-Received: by 2002:a62:3893:0:b0:44b:9369:5de5 with SMTP id
 f141-20020a623893000000b0044b93695de5mr8090129pfa.40.1634251485823; 
 Thu, 14 Oct 2021 15:44:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tests/tcg: Enable container_cross_cc for microblaze
Date: Thu, 14 Oct 2021 15:44:35 -0700
Message-Id: <20211014224435.2539547-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/configure.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 1f985ccfc0..149eeb15ff 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -55,6 +55,7 @@ fi
 : ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
+: $(cross_cc_microblaze="microblaze-linux-musl-gcc")
 : $(cross_cc_mips64el="mips64el-linux-gnuabi64-gcc")
 : $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
 : $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
@@ -133,6 +134,11 @@ for target in $target_list; do
       container_image=debian-m68k-cross
       container_cross_cc=m68k-linux-gnu-gcc
       ;;
+    microblaze-*)
+      container_hosts=x86_64
+      container_image=debian-microblaze-cross
+      container_cross_cc=microblaze-linux-musl-gcc
+      ;;
     mips64el-*)
       container_hosts=x86_64
       container_image=debian-mips64el-cross
-- 
2.25.1


