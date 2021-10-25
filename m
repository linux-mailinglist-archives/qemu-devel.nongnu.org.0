Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EFF439113
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 10:22:29 +0200 (CEST)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mevFU-00035K-ML
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 04:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mevDB-0001nv-Ht
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:20:05 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mevD9-0007YR-UO
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:20:05 -0400
Received: by mail-ed1-x529.google.com with SMTP id z20so16391882edc.13
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8/1Ppv857WMqvPwEi5Vc7YHi1fTidytNy9aueIKBV4=;
 b=MAsKamIt8zszeWCuhdvE7tCSRv8QuaPtvj/X3Uc/16SSv+etlJY22/Ko5sGLAtBVjS
 arBczZq4Dknmvspz7FCvQuud31hWvZZTV/cev2LhdhQ1GBL8lU4ejsNN+H5QsEgZ7k2+
 +E5hmCRjYr2GhpZ03CdI22EeD/sWMKgUQpG00CTk4dvH+XR5jHvgcDk1YG3WlAPNT6iZ
 s621VWMsCyhc61VCV2/jUZDU7b7PoTAkRo0vfQ9DDUHcjm0LGBhih70hEfJujXxVRXxW
 BrwyisbB8bwryGOmoqjGNhr7GbLgakN7xuFneprmi8RVmDPLTCWUZO+p2awnJCRJcfse
 gd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=F8/1Ppv857WMqvPwEi5Vc7YHi1fTidytNy9aueIKBV4=;
 b=PglXSgaAjqYsMxo/9V1tfe0so98Gmq3deZgmbPTVhfKDded1z419StEGx38pI6TiHn
 k/21aQhx+YnSO+w5wn+fprI1kzec2BjzytH3M3V7v0XOy7fu8pUaU8lihgEwoUcCAwMl
 9jF8ilWefF2lXASrMFU3XUYaHHreFBnOH3AEauwpaKGiHU8PTHuNTWtGUIzl8gGj7LRv
 OUyL87m2MHdMl8yh6ZX0PGaoAqy40KN6PKX+Y/TZPSj2o3nNsv++oTzdktdxJeGQQn7o
 zNfdX8n14rTPPZqJyxokQMRhEdh6mDRplFoCyNparwRylY5mZAI5oJyCSVMBOGyRKKb6
 ixjA==
X-Gm-Message-State: AOAM532C6r59WWLP27+PtXBL0BME+uawREuYExkWHZR6ohL0N7/AUn+F
 GkoOmoTwPh/vTvdeLHup8J+7U4WoI0o=
X-Google-Smtp-Source: ABdhPJxo0ipVitx9u/1ISMHMG03Z6FAqV9otDn4EUpl0zxCz+eMPWsdEnvCWLrJF9klcBzsHi0gR6A==
X-Received: by 2002:a17:907:7f11:: with SMTP id
 qf17mr10083127ejc.437.1635150002110; 
 Mon, 25 Oct 2021 01:20:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id p26sm8352249edu.57.2021.10.25.01.20.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:20:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: do not duplicate CPU_CFLAGS into QEMU_LDFLAGS
Date: Mon, 25 Oct 2021 10:20:00 +0200
Message-Id: <20211025082000.629088-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPU_CFLAGS is included in the link commands both during configure
and (via config-meson.cross) during meson.  It need not be added
separately to QEMU_LDFLAGS.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 53 ++++++++++++++---------------------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/configure b/configure
index d175fadd74..f26725e657 100755
--- a/configure
+++ b/configure
@@ -1261,45 +1261,20 @@ firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"
 
 case "$cpu" in
-    ppc)
-           CPU_CFLAGS="-m32"
-           QEMU_LDFLAGS="-m32 $QEMU_LDFLAGS"
-           ;;
-    ppc64)
-           CPU_CFLAGS="-m64"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    sparc)
-           CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc"
-           QEMU_LDFLAGS="-m32 -mv8plus $QEMU_LDFLAGS"
-           ;;
-    sparc64)
-           CPU_CFLAGS="-m64 -mcpu=ultrasparc"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    s390)
-           CPU_CFLAGS="-m31"
-           QEMU_LDFLAGS="-m31 $QEMU_LDFLAGS"
-           ;;
-    s390x)
-           CPU_CFLAGS="-m64"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    i386)
-           CPU_CFLAGS="-m32"
-           QEMU_LDFLAGS="-m32 $QEMU_LDFLAGS"
-           ;;
-    x86_64)
-           # ??? Only extremely old AMD cpus do not have cmpxchg16b.
-           # If we truly care, we should simply detect this case at
-           # runtime and generate the fallback to serial emulation.
-           CPU_CFLAGS="-m64 -mcx16"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    x32)
-           CPU_CFLAGS="-mx32"
-           QEMU_LDFLAGS="-mx32 $QEMU_LDFLAGS"
-           ;;
+    ppc) CPU_CFLAGS="-m32" ;;
+    ppc64) CPU_CFLAGS="-m64" ;;
+    sparc) CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
+    sparc64) CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
+    s390) CPU_CFLAGS="-m31" ;;
+    s390x) CPU_CFLAGS="-m64" ;;
+    i386) CPU_CFLAGS="-m32" ;;
+    x32) CPU_CFLAGS="-mx32" ;;
+
+    # ??? Only extremely old AMD cpus do not have cmpxchg16b.
+    # If we truly care, we should simply detect this case at
+    # runtime and generate the fallback to serial emulation.
+    x86_64) CPU_CFLAGS="-m64 -mcx16" ;;
+
     # No special flags required for other host CPUs
 esac
 
-- 
2.31.1


