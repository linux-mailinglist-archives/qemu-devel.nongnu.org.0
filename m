Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC25B8C82
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYUx9-0004u9-8l
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUns-0006Rf-99
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:56 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnq-0002mB-ES
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k9so26487556wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GkqXdvguCssbIQXu4uUN+R8nK9yQpERJYK56Jfq2cFU=;
 b=fQ0qtgagD7f/djOKM7npRrAxkRTJ/XIAwNO6RUaGHpoxiBzUb77UlAqtO/BJgt5JBo
 /USJUWXv4EG+VFYuFkQM7mEwUdSuSD/CVDZmOxjbMlZ/uA/d1pAJzaK9CDZf4LnSma0Q
 W7o3RQCBa3nwL8O4mazhvdrwAD3FP87TMgX41dP76ysh5Rc7uyWOBVNj3jNPsGtpwYF4
 +wl3sxi1lqsRdF4MH/a8DYhZtMEvDfHhtzO8StPdvLdSjmWWwUy6GUSdv/yDvvVFw80k
 2f5am/qFtNs8JJh3XYpnMXtTVgCNKCoXlLbOEoJNil0lpisbbYYvEAPDXuKoZerL/KIv
 VPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GkqXdvguCssbIQXu4uUN+R8nK9yQpERJYK56Jfq2cFU=;
 b=2lOollodTalumLu20ZElMROl7nu6gU7fkc1LArYv5IKDGLsIbckxudSGn/wm1uQZ4v
 aYDYhdXeMWSEzDfOnVtxnyr2xYdmtOXU5/ckaBaTve+yCSBiPzOES47IPBr0VCVOJxPt
 d4h4TczPMgqfvdpCHFkBAe/As/cN7vd2n6jVJMPnEg7uXAgDBAEVIYetDBILWLNnamXx
 y8jXD6WdLnLalGPGd6HnDFZ095SIgF+QTg59O2p1hwDFo2dG+FzE6w3/urCQT5fiYoRA
 11wDNuOlG083HCHfA+d1BN7vRNEoIchVnfhOo97R/6ooT1Vta6QQSoGFjyglCNtmLepV
 QMSA==
X-Gm-Message-State: ACgBeo28xOo5baPh2jSDLhYxsu6Z0+Y4/Ogz2bk6QUUKPI3ygEVPINRr
 6mEt+0WZSrLW8fEKwJS56WoSbw==
X-Google-Smtp-Source: AA6agR73uCv+VJdzRd188eEIB7cx/B1MB1JuSFl9J4nkGhwqn8SC340HW6rV2/vF4jHIeNeV9+Qqbg==
X-Received: by 2002:a5d:698f:0:b0:22a:bdfb:b00b with SMTP id
 g15-20020a5d698f000000b0022abdfbb00bmr6030689wru.355.1663171192632; 
 Wed, 14 Sep 2022 08:59:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003b492fc1d86sm9171633wmo.41.2022.09.14.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DCF91FFBA;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 02/30] tests/avocado/boot_linux_console: Fix the
 test_aarch64_xlnx_versal_virt test
Date: Wed, 14 Sep 2022 16:59:22 +0100
Message-Id: <20220914155950.804707-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Thomas Huth <thuth@redhat.com>

The assets that this test tries to download have been removed from the
server. Update to a newer version to get it working again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220829080940.110831-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux_console.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6b1533c17c..f26e036ab5 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -335,13 +335,13 @@ def test_aarch64_xlnx_versal_virt(self):
         """
         images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
                       'bionic-updates/main/installer-arm64/'
-                      '20101020ubuntu543.15/images/')
+                      '20101020ubuntu543.19/images/')
         kernel_url = images_url + 'netboot/ubuntu-installer/arm64/linux'
-        kernel_hash = '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
+        kernel_hash = 'e167757620640eb26de0972f578741924abb3a82'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         initrd_url = images_url + 'netboot/ubuntu-installer/arm64/initrd.gz'
-        initrd_hash = 'd385d3e88d53e2004c5d43cbe668b458a094f772'
+        initrd_hash = 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
         initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
 
         self.vm.set_console()
-- 
2.34.1


