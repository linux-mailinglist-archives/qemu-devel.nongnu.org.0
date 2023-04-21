Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFC6EAF52
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:38:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptlV-0001Zt-D0; Fri, 21 Apr 2023 12:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pptlT-0001Ze-Qq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:37:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pptlR-0002DF-S3
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:37:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so1894289f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682095056; x=1684687056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SfL+zqzps/TSfzgpYOpUnCm2OkZkqdtavGtXOWmQH4I=;
 b=ZkYA55OGo/cBtJTb+TgsxQH1KZwqJjLmDdu98CfmKiDI1d2rNOAUcsYiob1ljozSos
 FQ7gLyDWD+YphBHez4ODi4ATUFhyEtP93qNz9YKeu4g8v/Tzdm4SLGoQfid5IonWABcC
 kMtmouu5zoH1l2R4Js/nMfH3MmXwQMy0f9XwbrWpLzgN8PD61oe0iRr36BEibEyuxvAh
 M2sMKzxZMJ0NyKikcO+9rPIDsKenpjodvjqnCjk0tyzdEwQ1hb82ZHmiic/PjwvKm4C8
 dP/HnxkvkyiPnjmvfmZK/Gua2DiXBY9zj0rYDn5nIftCXRVeOHjgtt9BsOdI6q+iZ5oo
 rtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095056; x=1684687056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SfL+zqzps/TSfzgpYOpUnCm2OkZkqdtavGtXOWmQH4I=;
 b=iKmCxzZI49KNYP6/JJpe3UIal8iV2AVuSPpyObYdZrtrcazL7CZ6fftxU1Yx77AsqR
 8bKiX3qV3sHVzbQXe4m4QjuEhUzaere6ayDqB/cjjPjEta1KujKGIhdS1vrkZsESKLUn
 IXOAnT1N0hqWaVLbi1y5cNZqKphg9ifXqkbxRsVx20HKdQNiBVbXEC5CECj5G51HjajB
 g/xWA+8lGMF7BmnDYLF8ZqluQMqASmjvyIvTMWO9TuuVeaYTHgtUzpqDOwtX7Vw4kzpb
 mZ13mvIcpmcxuB/rx7CZWGyYXuxPVzQM0l+lZ2o899eLuBegyb1EP141azGNzFlfezxa
 uKLA==
X-Gm-Message-State: AAQBX9cJhp/cq7eYjZz6Pyfeb9WFzK2UiYOrB5VY61yeMOeB27XACLwd
 KvDE8TTk6veA2oLS5UElpvfAKoZsM/Md0yWyCMM=
X-Google-Smtp-Source: AKy350Z61IH+0SU1fjc3JztNAWKLngZq2CSPBGuk6lT9cMKl5otwLoqECaRTBHFOgZXmd6aTWczL3g==
X-Received: by 2002:adf:eacc:0:b0:2fa:aeeb:303e with SMTP id
 o12-20020adfeacc000000b002faaeeb303emr4927996wrn.12.1682095056046; 
 Fri, 21 Apr 2023 09:37:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b002f3e1122c1asm4785164wrm.15.2023.04.21.09.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:37:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] docs: Convert u2f.txt to rST
Date: Fri, 21 Apr 2023 17:37:34 +0100
Message-Id: <20230421163734.1152076-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the u2f.txt file to rST, and place it in the right place
in our manual layout. The old text didn't fit very well into our
manual style, so the new version ends up looking like a rewrite,
although some of the original text is preserved:

 * the 'building' section of the old file is removed, since we
   generally assume that users have already built QEMU
 * some rather verbose text has been cut back
 * document the passthrough device first, on the assumption
   that's most likely to be of interest to users
 * cut back on the duplication of text between sections
 * format example command lines etc with rST

As it's a short document it seemed simplest to do this all
in one go rather than try to do a minimal syntactic conversion
and then clean up the wording and layout.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/usb-u2f.rst  |  93 ++++++++++++++++++++++++++
 docs/system/devices/usb.rst      |   2 +-
 docs/u2f.txt                     | 110 -------------------------------
 4 files changed, 95 insertions(+), 111 deletions(-)
 create mode 100644 docs/system/devices/usb-u2f.rst
 delete mode 100644 docs/u2f.txt

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index c1b1934e3d3..8d4a1821fa7 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -93,4 +93,5 @@ Emulated Devices
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
    devices/canokey.rst
+   devices/usb-u2f.rst
    devices/igb.rst
diff --git a/docs/system/devices/usb-u2f.rst b/docs/system/devices/usb-u2f.rst
new file mode 100644
index 00000000000..4f57d5c8c34
--- /dev/null
+++ b/docs/system/devices/usb-u2f.rst
@@ -0,0 +1,93 @@
+Universal Second Factor (U2F) USB Key Device
+============================================
+
+U2F is an open authentication standard that enables relying parties
+exposed to the internet to offer a strong second factor option for end
+user authentication.
+
+The second factor is provided by a device implementing the U2F
+protocol. In case of a USB U2F security key, it is a USB HID device
+that implements the U2F protocol.
+
+QEMU supports both pass-through of a host U2F key device to a VM,
+and software emulation of a U2F key.
+
+``u2f-passthru``
+----------------
+
+The ``u2f-passthru`` device allows you to connect a real hardware
+U2F key on your host to a guest VM. All requests made from the guest
+are passed through to the physical security key connected to the
+host machine and vice versa.
+
+In addition, the dedicated pass-through allows you to share a single
+U2F security key with several guest VMs, which is not possible with a
+simple host device assignment pass-through.
+
+You can specify the host U2F key to use with the ``hidraw``
+option, which takes the host path to a Linux ``/dev/hidrawN`` device:
+
+.. parsed-literal::
+   |qemu_system| -usb -device u2f-passthru,hidraw=/dev/hidraw0
+
+If you don't specify the device, the ``u2f-passthru`` device will
+autoscan to take the first U2F device it finds on the host (this
+requires a working libudev):
+
+.. parsed-literal::
+   |qemu_system| -usb -device u2f-passthru
+
+``u2f-emulated``
+----------------
+
+``u2f-emulated`` is a completely software emulated U2F device.
+It uses `libu2f-emu <https://github.com/MattGorko/libu2f-emu>`__
+for the U2F key emulation. libu2f-emu
+provides a complete implementation of the U2F protocol device part for
+all specified transports given by the FIDO Alliance.
+
+To work, an emulated U2F device must have four elements:
+
+ * ec x509 certificate
+ * ec private key
+ * counter (four bytes value)
+ * 48 bytes of entropy (random bits)
+
+To use this type of device, these have to be configured, and these
+four elements must be passed one way or another.
+
+Assuming that you have a working libu2f-emu installed on the host,
+there are three possible ways to configure the ``u2f-emulated`` device:
+
+ * ephemeral
+ * setup directory
+ * manual
+
+Ephemeral is the simplest way to configure; it lets the device generate
+all the elements it needs for a single use of the lifetime of the device.
+It is the default if you do not pass any other options to the device.
+
+.. parsed-literal::
+   |qemu_system| -usb -device u2f-emulated
+
+You can pass the device the path of a setup directory on the host
+using the ``dir`` option; the directory must contain these four files:
+
+ * ``certificate.pem``: ec x509 certificate
+ * ``private-key.pem``: ec private key
+ * ``counter``: counter value
+ * ``entropy``: 48 bytes of entropy
+
+.. parsed-literal::
+   |qemu_system| -usb -device u2f-emulated,dir=$dir
+
+You can also manually pass the device the paths to each of these files,
+if you don't want them all to be in the same directory, using the options
+
+ * ``cert``
+ * ``priv``
+ * ``counter``
+ * ``entropy``
+
+.. parsed-literal::
+   |qemu_system| -usb -device u2f-emulated,cert=$DIR1/$FILE1,priv=$DIR2/$FILE2,counter=$DIR3/$FILE3,entropy=$DIR4/$FILE4
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 74166810731..a6ca7b0c375 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -207,7 +207,7 @@ option or the ``device_add`` monitor command. Available devices are:
    USB audio device
 
 ``u2f-{emulated,passthru}``
-   Universal Second Factor device
+   :doc:`usb-u2f`
 
 ``canokey``
    An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
diff --git a/docs/u2f.txt b/docs/u2f.txt
deleted file mode 100644
index 7f5813a0b72..00000000000
--- a/docs/u2f.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-QEMU U2F Key Device Documentation.
-
-Contents
-1. USB U2F key device
-2. Building
-3. Using u2f-emulated
-4. Using u2f-passthru
-5. Libu2f-emu
-
-1. USB U2F key device
-
-U2F is an open authentication standard that enables relying parties
-exposed to the internet to offer a strong second factor option for end
-user authentication.
-
-The standard brings many advantages to both parties, client and server,
-allowing to reduce over-reliance on passwords, it increases authentication
-security and simplifies passwords.
-
-The second factor is materialized by a device implementing the U2F
-protocol. In case of a USB U2F security key, it is a USB HID device
-that implements the U2F protocol.
-
-In QEMU, the USB U2F key device offers a dedicated support of U2F, allowing
-guest USB FIDO/U2F security keys operating in two possible modes:
-pass-through and emulated.
-
-The pass-through mode consists of passing all requests made from the guest
-to the physical security key connected to the host machine and vice versa.
-In addition, the dedicated pass-through allows to have a U2F security key
-shared on several guests which is not possible with a simple host device
-assignment pass-through.
-
-The emulated mode consists of completely emulating the behavior of an
-U2F device through software part. Libu2f-emu is used for that.
-
-
-2. Building
-
-To ensure the build of the u2f-emulated device variant which depends
-on libu2f-emu: configuring and building:
-
-    ./configure --enable-u2f && make
-
-The pass-through mode is built by default on Linux. To take advantage
-of the autoscan option it provides, make sure you have a working libudev
-installed on the host.
-
-
-3. Using u2f-emulated
-
-To work, an emulated U2F device must have four elements:
- * ec x509 certificate
- * ec private key
- * counter (four bytes value)
- * 48 bytes of entropy (random bits)
-
-To use this type of device, this one has to be configured, and these
-four elements must be passed one way or another.
-
-Assuming that you have a working libu2f-emu installed on the host.
-There are three possible ways of configurations:
- * ephemeral
- * setup directory
- * manual
-
-Ephemeral is the simplest way to configure, it lets the device generate
-all the elements it needs for a single use of the lifetime of the device.
-
-    qemu -usb -device u2f-emulated
-
-Setup directory allows to configure the device from a directory containing
-four files:
- * certificate.pem: ec x509 certificate
- * private-key.pem: ec private key
- * counter: counter value
- * entropy: 48 bytes of entropy
-
-    qemu -usb -device u2f-emulated,dir=$dir
-
-Manual allows to configure the device more finely by specifying each
-of the elements necessary for the device:
- * cert
- * priv
- * counter
- * entropy
-
-    qemu -usb -device u2f-emulated,cert=$DIR1/$FILE1,priv=$DIR2/$FILE2,counter=$DIR3/$FILE3,entropy=$DIR4/$FILE4
-
-
-4. Using u2f-passthru
-
-On the host specify the u2f-passthru device with a suitable hidraw:
-
-    qemu -usb -device u2f-passthru,hidraw=/dev/hidraw0
-
-Alternately, the u2f-passthru device can autoscan to take the first
-U2F device it finds on the host (this requires a working libudev):
-
-    qemu -usb -device u2f-passthru
-
-
-5. Libu2f-emu
-
-The u2f-emulated device uses libu2f-emu for the U2F key emulation. Libu2f-emu
-implements completely the U2F protocol device part for all specified
-transport given by the FIDO Alliance.
-
-For more information about libu2f-emu see this page:
-https://github.com/MattGorko/libu2f-emu.
-- 
2.34.1


