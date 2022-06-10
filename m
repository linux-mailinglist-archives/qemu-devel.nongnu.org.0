Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D654640D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:44:35 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzc82-0005ai-DR
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapn-0008NY-MQ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapj-0001kK-HH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654852894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iypp4lhP0vK8zaOIYv4YGS15C6hr5eRaL+NEXu7qlj4=;
 b=DREkSv8cH0ScbQfIqF9XATpVU14lhBh5oirA68t5uWNEt2/88t6bGZNRPEEXSfFGuBk0XG
 rZFGwPgy9OOJleVDwv+oTVQuYrN6TcX5jQUyFo0d1HQ6GaAcGlDjIh+pScrdnTJHnk8Kkd
 y8nm2YeelMBWhSXqN0NhHHVbjj7NEKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-ie5LO4fzPN-Uj95gsVZ9kw-1; Fri, 10 Jun 2022 05:21:29 -0400
X-MC-Unique: ie5LO4fzPN-Uj95gsVZ9kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E493938149A2;
 Fri, 10 Jun 2022 09:21:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E551C53360;
 Fri, 10 Jun 2022 09:21:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A169F180062F; Fri, 10 Jun 2022 11:20:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/17] docs: Add CanoKey documentation
Date: Fri, 10 Jun 2022 11:20:34 +0200
Message-Id: <20220610092043.1874654-9-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY6ilQimrK+l5NN@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 168 +++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 3b729b920d7c..05060060563f 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -92,3 +92,4 @@ Emulated Devices
    devices/vhost-user.rst
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
+   devices/canokey.rst
diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
new file mode 100644
index 000000000000..169f99b8eb82
--- /dev/null
+++ b/docs/system/devices/canokey.rst
@@ -0,0 +1,168 @@
+.. _canokey:
+
+CanoKey QEMU
+------------
+
+CanoKey [1]_ is an open-source secure key with supports of
+
+* U2F / FIDO2 with Ed25519 and HMAC-secret
+* OpenPGP Card V3.4 with RSA4096, Ed25519 and more [2]_
+* PIV (NIST SP 800-73-4)
+* HOTP / TOTP
+* NDEF
+
+All these platform-independent features are in canokey-core [3]_.
+
+For different platforms, CanoKey has different implementations,
+including both hardware implementions and virtual cards:
+
+* CanoKey STM32 [4]_
+* CanoKey Pigeon [5]_
+* (virt-card) CanoKey USB/IP
+* (virt-card) CanoKey FunctionFS
+
+In QEMU, yet another CanoKey virt-card is implemented.
+CanoKey QEMU exposes itself as a USB device to the guest OS.
+
+With the same software configuration as a hardware key,
+the guest OS can use all the functionalities of a secure key as if
+there was actually an hardware key plugged in.
+
+CanoKey QEMU provides much convenience for debuging:
+
+* libcanokey-qemu supports debuging output thus developers can
+  inspect what happens inside a secure key
+* CanoKey QEMU supports trace event thus event
+* QEMU USB stack supports pcap thus USB packet between the guest
+  and key can be captured and analysed
+
+Then for developers:
+
+* For developers on software with secure key support (e.g. FIDO2, OpenPGP),
+  they can see what happens inside the secure key
+* For secure key developers, USB packets between guest OS and CanoKey
+  can be easily captured and analysed
+
+Also since this is a virtual card, it can be easily used in CI for testing
+on code coping with secure key.
+
+Building
+========
+
+libcanokey-qemu is required to use CanoKey QEMU.
+
+.. code-block:: shell
+
+    git clone https://github.com/canokeys/canokey-qemu
+    mkdir canokey-qemu/build
+    pushd canokey-qemu/build
+
+If you want to install libcanokey-qemu in a different place,
+add ``-DCMAKE_INSTALL_PREFIX=/path/to/your/place`` to cmake below.
+
+.. code-block:: shell
+
+    cmake ..
+    make
+    make install # may need sudo
+    popd
+
+Then configuring and building:
+
+.. code-block:: shell
+
+    # depending on your env, lib/pkgconfig can be lib64/pkgconfig
+    export PKG_CONFIG_PATH=/path/to/your/place/lib/pkgconfig:$PKG_CONFIG_PATH
+    ./configure --enable-canokey && make
+
+Using CanoKey QEMU
+==================
+
+CanoKey QEMU stores all its data on a file of the host specified by the argument
+when invoking qemu.
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file
+
+Note: you should keep this file carefully as it may contain your private key!
+
+The first time when the file is used, it is created and initialized by CanoKey,
+afterwards CanoKey QEMU would just read this file.
+
+After the guest OS boots, you can check that there is a USB device.
+
+For example, If the guest OS is an Linux machine. You may invoke lsusb
+and find CanoKey QEMU there:
+
+.. code-block:: shell
+
+    $ lsusb
+    Bus 001 Device 002: ID 20a0:42d4 Clay Logic CanoKey QEMU
+
+You may setup the key as guided in [6]_. The console for the key is at [7]_.
+
+Debuging
+========
+
+CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
+the latter of which resides in QEMU. The former provides core functionality
+of a secure key while the latter provides platform-dependent functions:
+USB packet handling.
+
+If you want to trace what happens inside the secure key, when compiling
+libcanokey-qemu, you should add ``-DQEMU_DEBUG_OUTPUT=ON`` in cmake command
+line:
+
+.. code-block:: shell
+
+    cmake .. -DQEMU_DEBUG_OUTPUT=ON
+
+If you want to trace events happened in canokey.c, use
+
+.. parsed-literal::
+
+    |qemu_system| --trace "canokey_*" \\
+        -usb -device canokey,file=$HOME/.canokey-file
+
+If you want to capture USB packets between the guest and the host, you can:
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file,pcap=key.pcap
+
+Limitations
+===========
+
+Currently libcanokey-qemu.so has dozens of global variables as it was originally
+designed for embedded systems. Thus one qemu instance can not have
+multiple CanoKey QEMU running, namely you can not
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file \\
+         -device canokey,file=$HOME/.canokey-file2
+
+Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
+can not read one canokey-file at the same time.
+
+Another limitation is that this device is not compatible with ``qemu-xhci``,
+in that this device would hang when there are FIDO2 packets (traffic on
+interrupt endpoints). If you do not use FIDO2 then it works as intended,
+but for full functionality you should use old uhci/ehci bus and attach canokey
+to it, for example
+
+.. parsed-literal::
+
+   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
+
+References
+==========
+
+.. [1] `<https://canokeys.org>`_
+.. [2] `<https://docs.canokeys.org/userguide/openpgp/#supported-algorithm>`_
+.. [3] `<https://github.com/canokeys/canokey-core>`_
+.. [4] `<https://github.com/canokeys/canokey-stm32>`_
+.. [5] `<https://github.com/canokeys/canokey-pigeon>`_
+.. [6] `<https://docs.canokeys.org/>`_
+.. [7] `<https://console.canokeys.org/>`_
-- 
2.36.1


