Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596DF5EF6CA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:41:59 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtna-0006rd-5f
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3J-0000NV-2U
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3B-0002O4-Vq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:01 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so596499wms.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bDsi1hD1+ihs67mXhxzoSRQtyb3yN1ThtBgdcOSD36c=;
 b=pKD8eQXF49dNFMfhSCUfvN2ESHSotI5Jk5EEjIZuAur/sBUmbgDsbwtGoUFNqc3Muw
 /KEORLv2pAkS/FUawfakmP9HUhE/Sax8/G4WMtRfhQrJKMtabW9Jz6HWYKOBYbUoxLO1
 vWFvIDpM+fbIQ1bW08ixO9973jLv5sZ0nXh7Lylz5hUmDUMUZtToqJ9MOZFRGfKznVZe
 I+Iumn+790KZOwA6JhXd31AlsBZJP1JzGcZa39Ko2cPi+SPWPQoULOEd47JSrNYrWXAI
 +Plpa9npxcIX7kNAdQc4BjtLnitX6htT0DMDoWIiGcWleqya9zqlX7GtKZktLXKhZkXV
 uhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bDsi1hD1+ihs67mXhxzoSRQtyb3yN1ThtBgdcOSD36c=;
 b=AnGqHPyBoBnpjuOGeBZsQ+fpBH4D3dG2Udh6EWcrbFUgDNtn7Ep+kluezaRQmiYiP9
 pU2gjWz25o280C/o2Dk4a6HUfeykGpXDMyFnZQ7Awygi7mjcNhYwjY9k8scBWEqmVy1L
 dW+ZMgYY9E+L9Z73OBA8EaF8XiKQTjWGbHf+X+RqjFvPEQETZVzNREvzzbG4kynrC1T7
 Rc4KWfiCIv2Z9EXwBU+FPOTcve45tJ/SBUF/5zFE6SAJp7ji1NA8vPlek7RIpVDtPdjy
 j18fAw8lmHJcu8hB7klUpoOea6M16rfhV9t7XWqw2tO+m5Ui9e/I8yRSrXjD2oH9zaYM
 8TYw==
X-Gm-Message-State: ACrzQf1B8SS3fnuKm0zY7xRXj35pEUsAra5Ew1Y6K+kqV87W13+37RP0
 34bnmNpJZqaTFRGFNLqYgrYuqA==
X-Google-Smtp-Source: AMsMyM5JH0TRKyYi+eF3fMbCNtnRskPC0XYJcywlIOTbe0OYQR4IECGJJ9yvhr7P3RuDI71/zcxnsQ==
X-Received: by 2002:a05:600c:35d2:b0:3b4:a897:d48 with SMTP id
 r18-20020a05600c35d200b003b4a8970d48mr10573298wmq.48.1664452195739; 
 Thu, 29 Sep 2022 04:49:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a05600c4f4b00b003b31c560a0csm4369306wmq.12.2022.09.29.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31C011FFC8;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 17/51] configure: return status code from
 probe_target_compiler
Date: Thu, 29 Sep 2022 12:41:57 +0100
Message-Id: <20220929114231.583801-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

For now, return 1 for container-based compilers.  This will change as
soon as ROMs will be buildable with them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index aaa09fb957..f3984bb193 100755
--- a/configure
+++ b/configure
@@ -2147,6 +2147,7 @@ probe_target_compiler() {
     target_ranlib=
     target_strip=
   fi
+  test -n "$target_cc"
 }
 
 write_target_makefile() {
@@ -2294,10 +2295,9 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-probe_target_compiler i386-softmmu
-if test -n "$target_cc" &&
-        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
-        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
+if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+        test "$targetos" != "haiku" && test "$softmmu" = yes && \
+        probe_target_compiler i386-softmmu; then
     roms="pc-bios/optionrom"
     config_mak=pc-bios/optionrom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2305,8 +2305,7 @@ if test -n "$target_cc" &&
     write_target_makefile >> $config_mak
 fi
 
-probe_target_compiler ppc-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
+if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
     roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2316,8 +2315,7 @@ fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
-probe_target_compiler s390x-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
+if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
   write_c_skeleton
   do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
   has_z900=$?
-- 
2.34.1


