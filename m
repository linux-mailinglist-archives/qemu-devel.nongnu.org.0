Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7E559FB4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:42:46 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4nKP-000098-3S
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4nCH-0005Ky-6P
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:34:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4nCF-000296-Jd
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:34:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id go6so3471602pjb.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pv04gkshDxNH3B9RohTSkXVFQo/HTk4n+LV9OX7qnAM=;
 b=AugesnIAo7XBZbW4sZwzUNzNyIxG4KNUttJ6CU9mMtCBKGm90g3nor/1GN6OzewjKI
 LEoV1yABwl9HnG+I42jVIC/wQYknaqbGIKQZpb/peQpi3FainKm4Fh4Ik2QsTwKYZ3WC
 IUefF70ULSK9NamiXO8HqBGH964ONndj5eOQ07Ih9tJH2TFAgjdn7ZrMhmdb1/3yONN0
 OokF7CSgSCgAhOf0tI12+EMg269TgLCaxjBUoYkh8LuN82NCuxst56DZFBYgcjInjt08
 I/cLDgNUqTv5CgQhckXSr5qPBZV2p5qHhCjcH+QHuizujHHu/NR6L0Cr/u6oNxpqoNPM
 EZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pv04gkshDxNH3B9RohTSkXVFQo/HTk4n+LV9OX7qnAM=;
 b=JOd0pTdDnjyOGgTi1RrCvjNu6O36irYOpZIzdaAfxDIlfXA1pVfkd7+81lNBCQSqa3
 2vxh0en/27iACcmburtR3qTNGnPHIkmhsbxPIVWzNUeSu/Lf0z3VsV2ZVgWRGDwZUopB
 RVLHffW6I8AkyhLcCbI/vQeXJqcQDMZYVmjtHD9JxBcPga/XuW43Db5D38E6mRlrctZg
 EHHCMZiKQiOKzlRvRIJADAsm/kB1TCchbMnGiewiVW73FfyILLz1aVI/3gjDOlL49cfw
 KPM/S8WUq2pmo4ogcGxk3Nog7lixKPTAm+F550fhoiG0D3iVk+lxv/H0t+/oPb93BiAY
 B3sw==
X-Gm-Message-State: AJIora+0MTN1zTNRESGIW1y8E9UashDHiaaw++6dBcLRwAdIuT0pDcHM
 KX7SX57oL04ibHEbW/vjpMk=
X-Google-Smtp-Source: AGRyM1tfoSrHkITGxkRmX1xwqDYEKe+yvCmAA83Ej8RbMYgvsb46qry6w9t1fqMHVstbmH9l0tRzOQ==
X-Received: by 2002:a17:903:41d2:b0:16a:2cca:4869 with SMTP id
 u18-20020a17090341d200b0016a2cca4869mr161593ple.13.1656092058277; 
 Fri, 24 Jun 2022 10:34:18 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 mv24-20020a17090b199800b001d954837197sm4269406pjb.22.2022.06.24.10.34.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 10:34:17 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v9 1/4] tests/vm: do not specify -bios option
Date: Sat, 25 Jun 2022 02:34:02 +0900
Message-Id: <20220624173405.85131-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220624173405.85131-1-akihiko.odaki@gmail.com>
References: <20220624173405.85131-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When running from the build tree, the executable is able to find
the BIOS on its own; when running from the source tree, a firmware
blob should already be installed and there is no guarantee that
the one in the source tree works with the QEMU that is being used for
the installation.

Just remove the -bios option, since it is unnecessary and in fact
there are other x86 VM tests that do not bother specifying it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220616083025.116902-1-pbonzini@redhat.com>
---
 tests/vm/fedora  | 1 -
 tests/vm/freebsd | 1 -
 tests/vm/netbsd  | 1 -
 tests/vm/openbsd | 1 -
 4 files changed, 4 deletions(-)

diff --git a/tests/vm/fedora b/tests/vm/fedora
index 92b78d6e2c9..12eca919a08 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -79,7 +79,6 @@ class FedoraVM(basevm.BaseVM):
         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 805db759d67..cd1fabde523 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -95,7 +95,6 @@ class FreeBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 45aa9a7fda7..aa883ec23c9 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -86,7 +86,6 @@ class NetBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-cdrom", iso
         ])
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 13c82542140..6f1b6f5b98a 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -82,7 +82,6 @@ class OpenBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
-- 
2.32.1 (Apple Git-133)


