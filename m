Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CB33CF93C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:55:59 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oLu-0000jA-7L
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7U-0005Qi-Ip
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7S-0008EL-WB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id u1so25702923wrs.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQYO1Y0AJh/tmas1GISkGsXZ+3UIAJXf/zORob+fY34=;
 b=AHQ/8PKXqUMRCH1FXdZvEst+XNYqD52/72NCSX9ijIn3BiAHDkGdQT09jVR5YTy1YW
 xTeWa413A6qILkbzZNiCi9oT9Hrcrj5MXDfPpP1OekOW22JhhmW5/fuNN82wJ5NfgYF2
 eK1cHuDam6Ct+KRbOiBrhns+h2s9rwrDbpbuUSe0die/xEPUIlZWfaJ8NjTHxGSCclk+
 aO9TXK5Afw+XG5lWxlCWOGCfiQri/oLq8fCLKYVmrcUXoxP7ZoUfVhpMaHM7NszZ/cwT
 ABIFiX1bv5dT/ol8kbXzM/qmLwkcq7G22xe1hR23mXjBMwx0njHSeMn1bd4ZvhxXsBfP
 rpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQYO1Y0AJh/tmas1GISkGsXZ+3UIAJXf/zORob+fY34=;
 b=Glt0ekxMr6l0adCSAuPwYE4VCuIco8ROHjcigwfX6Rg00Yrt7yY+b6z4uGpdYPSiAG
 fEXplnMiSv2druyukoSwNwSv0d6bf5Kve4mBSeYIuC4LgKWImBy8Sb3ARoe0NxXBEfLy
 qrv/8KrkSr6gV5hdPtrxhiQowH5+rC81D+5bw/qB+tVqouHMVDxJWKinmOX29XyWFryk
 9/8beFm2oOtxFROzqZKX/JIydlRWIu7XjeDXxJRKVlwv0zz8246tMo851tPUEGziD6Kn
 3vHPK3KmldbbXgANc6SisAmzXfj1uc1sNcw+fdFDc/5zXhK98fRaE51FD5qFNyym4ySN
 e9Jg==
X-Gm-Message-State: AOAM532xsPVDBIaFyQRDb3mHZaZY92MyOo402XJcUXYjE85iIr+w5bG0
 wLAqPUjfFxHUm3VXrXuMkz0e7g==
X-Google-Smtp-Source: ABdhPJxifV5/B2Qu2WbvNjo94YQSRXlpiezPlBwKi4LPuN1qRp7IiyXXaz4+GZGnNZkuDVmUyAgbuA==
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr35729051wru.325.1626781261434; 
 Tue, 20 Jul 2021 04:41:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm16699189wrp.80.2021.07.20.04.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 04:40:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9404E1FF8C;
 Tue, 20 Jul 2021 12:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] tests/tcg/configure.sh: add handling for assembler
 only builds
Date: Tue, 20 Jul 2021 12:40:56 +0100
Message-Id: <20210720114057.32053-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720114057.32053-1-alex.bennee@linaro.org>
References: <20210720114057.32053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up until this point we only handled local compilers or assumed we had
everything in the container. This falls down when we are building QEMU
inside the container.

This special handling only affects tricore for now but I put it in a
case just in case we add any other "special" targets. Setting
CROSS_CC_GUEST is a bit of a hack just to ensure the test runs as we
gate on a detected compiler even though the Makefile won't actually
use it. It also means we display something sane in the configure
output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index aa7c24328a..1f985ccfc0 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -72,6 +72,10 @@ fi
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
+# tricore is special as it doesn't have a compiler
+: ${cross_as_tricore="tricore-as"}
+: ${cross_ld_tricore="tricore-ld"}
+
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -247,6 +251,20 @@ for target in $target_list; do
               fi
           fi
       fi
+
+      # Special handling for assembler only tests
+      eval "target_as=\"\${cross_as_$arch}\""
+      eval "target_ld=\"\${cross_ld_$arch}\""
+      if has $target_as && has $target_ld; then
+          case $target in
+              tricore-softmmu)
+                  echo "CROSS_CC_GUEST=$target_as" >> $config_target_mak
+                  echo "CROSS_AS_GUEST=$target_as" >> $config_target_mak
+                  echo "CROSS_LD_GUEST=$target_ld" >> $config_target_mak
+                  got_cross_cc=yes
+                  ;;
+          esac
+      fi
   fi
 
   if test $got_cross_cc = yes; then
-- 
2.32.0.264.g75ae10bc75


