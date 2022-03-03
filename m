Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE194CC205
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:56:39 +0100 (CET)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnok-0005eg-KH
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUQ-00033y-SD; Thu, 03 Mar 2022 10:35:39 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=47055
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUP-0000nO-3d; Thu, 03 Mar 2022 10:35:38 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso6140917oop.13; 
 Thu, 03 Mar 2022 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/PlsUpPiPx3M17Uiu+9ioo4XiGK9kEdrUrGKbMM4NY=;
 b=VV0amnLFMaQagpOE+v/7DSU4sFBeJOpZovPMOInk1AYQc44CYv1odPoWYdya954wlV
 3qpuiMsHOGQfbICupfXdpIcBRqrA/8C9EeuoRjaFlAzMrk+WYp4iYuV/rKX5uZ7FSrNy
 e0fa5fUcjlgC2ir1UhizgA7sq4q+lhOY2g02592U4OlwmBo7p4ktOsOLTg1+SUySh7Ud
 GAUqJhF5ghPGpS9izJXjSU/OJbaj3biNfVXUEfGoXUl5zHD9nfogHuMQzk61FsrmXjWg
 1JEdvLdVsXiZUjqf7bMOvmSNZKiaO9nI4y3PQW3Knmz87Km/sV4E5fbx0RWbPrWwEBxl
 2xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/PlsUpPiPx3M17Uiu+9ioo4XiGK9kEdrUrGKbMM4NY=;
 b=VfpTrA0PvYtoOBS7C86PjTuZ38sXL5Z4uOjetyNJ6u0GzFk4JmdZZXK7dxGyGsHtw3
 GzFtBCqUPETCP2KeuG121tfphzXJYaHMpxCpDbCRHKoMu6y9NlM7bqDJPoKBMeyz0GKc
 J6bmxrZVRSiCYZW9GVc9AP2ft33BTr3tgZduzwHtrsbfNM2ZY+QARRze93UIOAoZsV26
 cm2gfbfNSrW850k60eHfCb4VkTq53HyD7PjVROVeqMEGu2WDvgpCtTbYRqvBHZPSRb3W
 PT3M+KgTlYWbe+kO+l553SgJyNG7ONuxT8t92LHxl17ZgxvI4BlCrsqgINs8jMdqJ1Mz
 XWMg==
X-Gm-Message-State: AOAM531n9eQYMgujpisgKuOmf/+gabM++2EmSYxrEyT1RZ/+slu886bZ
 fgd5eK0PRYJjv/hkDfwprpBrrQMjY5I=
X-Google-Smtp-Source: ABdhPJxkEYm/D3jiG9Dkdg2l5WI61rgbEZiERM3OH3Bx4VsBrfNSNLdViIdbw5x68aM8yAdiCj2sZg==
X-Received: by 2002:a05:6870:128c:b0:ce:c0c9:5ba with SMTP id
 12-20020a056870128c00b000cec0c905bamr4469119oal.12.1646321735225; 
 Thu, 03 Mar 2022 07:35:35 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a056870770700b000d9aa7a6d63sm1178798oab.6.2022.03.03.07.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:35:35 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] avocado/boot_linux_console.py: check for tcg in
 test_ppc_powernv8/9
Date: Thu,  3 Mar 2022 12:35:15 -0300
Message-Id: <20220303153517.168943-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303153517.168943-1-danielhb413@gmail.com>
References: <20220303153517.168943-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerNV8/9 machines does not work with KVM acceleration, meaning
that boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8/9 tests
will always fail when QEMU is compiled with --disable-tcg:

ERROR 1-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8
-> VMLaunchFailure: ConnectError: Failed to establish session:
[Errno 104] Connection reset by peer
        Exit code: 1
        Command: ./qemu-system-ppc64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98-monitor.sock -mon chardev=mon,mode=control -machine powernv8 -chardev socket,id=console,path=/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98-console.sock,server=on,wait=off -serial chardev:console -kernel /home/danielhb/avocado/data/cache/by_location/4514304e2c4ee84c5f0b5c8bacedda783891df68/zImage.epapr -append console=tty0 console=hvc0 -device pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0 -device nvme,bus=pcie.2,addr=0x0,serial=1234 -device e1000e,bus=bridge1,addr=0x3 -device nec-usb-xhci,bus=bridge1,addr=0x2
        Output: qemu-system-ppc64: The powernv machine does not work with KVM acceleration

Let's add the TCG accel requirement in both tests to skip them if we
don't have TCG support available.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/boot_linux_console.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 9c618d4809..d7d9130329 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1170,6 +1170,7 @@ def test_ppc64_e500(self):
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
 
     def do_test_ppc64_powernv(self, proc):
+        self.require_accelerator("tcg")
         images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
 
         kernel_url = images_url + 'zImage.epapr'
@@ -1194,6 +1195,7 @@ def test_ppc_powernv8(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:powernv8
+        :avocado: tags=accel:tcg
         """
         self.do_test_ppc64_powernv('P8')
 
@@ -1201,6 +1203,7 @@ def test_ppc_powernv9(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:powernv9
+        :avocado: tags=accel:tcg
         """
         self.do_test_ppc64_powernv('P9')
 
-- 
2.35.1


