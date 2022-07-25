Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD65800A4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:21:18 +0200 (CEST)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyxR-0003Q7-Bq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiL-000124-PA
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiJ-0000HS-TZ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d8so16056038wrp.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQHi3qi6aG35eG8P049O7wbJjnFPGC8qjPo4fmEPSBw=;
 b=lh7VA0t080BZXYIl28Jh85hl/sV7R1qNkaSKrhx9l0X6ZFal2zlS0xPQJTMLIPGOKW
 tkNYwzd8IyEjnTBaQt2JQdDgZgo0uZR/oqWd3AJxTveGUlPnyIoXZdRj6ZFy+EHqd6xI
 rouyCNvQYP6OVxP5WYlrtKkobGqq/UOaOfDqWmSrZ8DHFbXqBW3k7erzcvr5sGA2mk+A
 K3iDgqVu4mRHRqQswzbBZQOVmWQp21HfXSwn3hYYaJKWMXmX0/5Nj1WYp1n9RFkdyPqz
 sSda42lgswN8HQZd4qXQB2xWaAeyKvqkBB9XdMqeLjgIJt49Wlvj8u6c7M3zGFgp07cR
 kQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQHi3qi6aG35eG8P049O7wbJjnFPGC8qjPo4fmEPSBw=;
 b=6CLdeqryYaWaIMxvip09SvgAjy6Xb7OKZyspiCPfvVvl2PFmFdNOHnB80O7aMUhI37
 2oWeyORR9SW9ISQ5h5zSBWg62ENn/8Gm5bAcWpLdbyzZkOWRcaYW8EH8Uv0VKyXaozpj
 F6kXcuRIflX+coan3lTDezw78100E394JhYYLJ/LseymwVY2PfSbcaQN80WD99h2X/VH
 suhGW89fLEOXt8LeBikjIVicX8CGYFgRWZVpcqEApDnmSVsBHDTvqirP2XEGxcw5lO+h
 ovSgXB4j/3ewidAZ8bPW/J3IVNQ6HYDUZ/arPQMYRcLlVmXTIR9QSZjwJapdr/YjEbT1
 jpCg==
X-Gm-Message-State: AJIora+0Gl8tK8C+zbUYCUIypWI4X5O1Y6mVqRNm7/iNKetx/vDJtkD5
 kYe4ieBY5GhbW16ovHpFBqN4Hg==
X-Google-Smtp-Source: AGRyM1sbWNSe+hNa7OrGmGsWlJaY/7Tgv6DMLghK/3qJ7uidHIXAWOHdzzjw6XVhU0DGFPJpsbQz9Q==
X-Received: by 2002:a5d:5451:0:b0:21d:2295:6a05 with SMTP id
 w17-20020a5d5451000000b0021d22956a05mr7731918wrv.302.1658757938444; 
 Mon, 25 Jul 2022 07:05:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc859000000b003a0375c4f73sm14366662wml.44.2022.07.25.07.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD87E1FFC5;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v1 13/13] qemu-options: bring the kernel and image options
 together
Date: Mon, 25 Jul 2022 15:05:20 +0100
Message-Id: <20220725140520.515340-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

How to control the booting of QEMU is often a source of confusion for
users. Bring the options that control this together in the manual
pages and add some verbiage to describe when each option is
appropriate. This attempts to codify some of the knowledge expressed
in:

  https://stackoverflow.com/questions/58420670/qemu-bios-vs-kernel-vs-device-loader-file/58434837#58434837

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220707151037.397324-1-alex.bennee@linaro.org>
---
 qemu-options.hx | 96 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 78 insertions(+), 18 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8e17c5064a..3f23a42fa8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1585,13 +1585,6 @@ SRST
     Use file as SecureDigital card image.
 ERST
 
-DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
-    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
-SRST
-``-pflash file``
-    Use file as a parallel flash image.
-ERST
-
 DEF("snapshot", 0, QEMU_OPTION_snapshot,
     "-snapshot       write to temporary files instead of disk image files\n",
     QEMU_ARCH_ALL)
@@ -3684,12 +3677,67 @@ DEFHEADING()
 
 #endif
 
-DEFHEADING(Linux/Multiboot boot specific:)
+DEFHEADING(Boot Image or Kernel specific:)
+SRST
+There are broadly 4 ways you can boot a system with QEMU.
+
+ - specify a firmware and let it control finding a kernel
+ - specify a firmware and pass a hint to the kernel to boot
+ - direct kernel image boot
+ - manually load files into the guest's address space
+
+The third method is useful for quickly testing kernels but as there is
+no firmware to pass configuration information to the kernel the
+hardware must either be probeable, the kernel built for the exact
+configuration or passed some configuration data (e.g. a DTB blob)
+which tells the kernel what drivers it needs. This exact details are
+often hardware specific.
+
+The final method is the most generic way of loading images into the
+guest address space and used mostly for ``bare metal`` type
+development where the reset vectors of the processor are taken into
+account.
+
+ERST
+
 SRST
-When using these options, you can use a given Linux or Multiboot kernel
-without installing it in the disk image. It can be useful for easier
-testing of various kernels.
 
+For x86 machines and some other architectures ``-bios`` will generally
+do the right thing with whatever it is given. For other machines the
+more strict ``-pflash`` option needs an image that is sized for the
+flash device for the given machine type.
+
+Please see the :ref:`system-targets-ref` section of the manual for
+more detailed documentation.
+
+ERST
+
+DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
+    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
+SRST
+``-bios file``
+    Set the filename for the BIOS.
+ERST
+
+DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
+    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
+SRST
+``-pflash file``
+    Use file as a parallel flash image.
+ERST
+
+SRST
+
+The kernel options were designed to work with Linux kernels although
+other things (like hypervisors) can be packaged up as a kernel
+executable image. The exact format of a executable image is usually
+architecture specific.
+
+The way in which the kernel is started (what address it is loaded at,
+what if any information is passed to it via CPU registers, the state
+of the hardware when it is started, and so on) is also architecture
+specific. Typically it follows the specification laid down by the
+Linux kernel for how kernels for that architecture must be started.
 
 ERST
 
@@ -3729,6 +3777,25 @@ SRST
     kernel on boot.
 ERST
 
+SRST
+
+Finally you can also manually load images directly into the address
+space of the guest. This is most useful for developers who already
+know the layout of their guest and take care to ensure something sane
+will happen when the reset vector executes.
+
+The generic loader can be invoked by using the loader device:
+
+``-device loader,addr=<addr>,data=<data>,data-len=<data-len>[,data-be=<data-be>][,cpu-num=<cpu-num>]``
+
+there is also the guest loader which operates in a similar way but
+tweaks the DTB so a hypervisor loaded via ``-kernel`` can find where
+the guest image is:
+
+``-device guest-loader,addr=<addr>[,kernel=<path>,[bootargs=<arguments>]][,initrd=<path>]``
+
+ERST
+
 DEFHEADING()
 
 DEFHEADING(Debug/Expert options:)
@@ -4179,13 +4246,6 @@ SRST
     To list all the data directories, use ``-L help``.
 ERST
 
-DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
-    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
-SRST
-``-bios file``
-    Set the filename for the BIOS.
-ERST
-
 DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
     "-enable-kvm     enable KVM full virtualization support\n",
     QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |
-- 
2.30.2


