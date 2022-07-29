Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE10584E1D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:36:13 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMPk-0005a7-9D
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMFE-0005Vz-1T
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:25:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMFB-0006hP-BZ
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:25:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id l22so5278318wrz.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hwvFbZR4/H0xiyraePhgzCmgfa2kY4WJ3yx1/sETcUM=;
 b=uAiWvsLW9GsXLYfPlzsVX3X09rgfo2JFXxbgzJcLUSZkXHyh1y9sEC1WYd/l0YGxqf
 1rtmKgohtz34jEYRLHKicUcmy4FHp09GLDcEoZMxNI0hjT2aPbtoTKgkZ2bTAlh11ir2
 eomJKbsEzjmUsKQ9cElZz4uWrnDFCqWM/sfrPA7PiVvaFr2cPfoHOueDLiLYSwr0keZ2
 Tdbm6QFvCHQaHUmXbgDhb6PzdDFy7mcLpB1xajfYw6Z+R9Nt+lxwrw3U+A/w3iRtuMRW
 FGbQffMUtJZyWNj1NpydcueWM+NY51rZeLloGpBP9KTnXaaFmy0VXe1KQUHf2DnPuf6K
 iLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hwvFbZR4/H0xiyraePhgzCmgfa2kY4WJ3yx1/sETcUM=;
 b=wq39VAiqpLLUMVyN5px5gXVBFaoqXdY7s/06T1dDod/B1Rlzs2zIvbQ+Y7ZTP5gsVL
 aCOnkm5kfSkyERQi74dcDPwjjQFTabhz7aKB9sdI9fMfYs8MYwY+0vHJ4KMRNixkMOK+
 MBgRZj3HMyyuZfOXnSGmLXar2tHRYQW9BiosfK1GgADbmcqns80Y5i1V7B0ko2agmLYE
 xVEM7bA5Wz0bLz/Qbbi7/XfhB9Wh4hKRp6VLN7ktb+JRBrR+y0tnmnA9wUbtIQis7Qu8
 uWGysBTXTsJ1/j2CtNqUH97hzIThLItUrB/wTt6RjsM6BVM+AeyOEE1qdUfmtCYo+RnR
 cVEQ==
X-Gm-Message-State: ACgBeo1vDzyYcBk+74DKAlcb5lrmm3UL0N2mQYfm51uoKIDgCYDRGbgW
 2mIKPVGuUeUdLMnGhJcCbK8VQQ==
X-Google-Smtp-Source: AA6agR5nFcjWkr3evcLZ/w7UsaQRAqLhjke6njy8fKiFzBdx7SORuOJHH1v2VJMit7t26KS0dJLe5Q==
X-Received: by 2002:a5d:6d46:0:b0:21f:8b7:4c1d with SMTP id
 k6-20020a5d6d46000000b0021f08b74c1dmr1758009wri.455.1659086715650; 
 Fri, 29 Jul 2022 02:25:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bk9-20020a0560001d8900b0021d76a1b0e3sm3137983wrb.6.2022.07.29.02.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:25:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED72D1FFC5;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/13] qemu-options: bring the kernel and image options together
Date: Fri, 29 Jul 2022 10:19:43 +0100
Message-Id: <20220729091943.2152410-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Message-Id: <20220725140520.515340-14-alex.bennee@linaro.org>

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


