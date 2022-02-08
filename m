Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A84AE10A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:42:54 +0100 (CET)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVS0-0001ZF-KU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSts-0008P9-EX
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:31 -0500
Received: from [2a00:1450:4864:20::42d] (port=43854
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSto-0006D5-9U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i14so1954455wrc.10
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TeGZ3fztF9Kc3mfAQS9k9SzN001AUn+r3TkwGe9HSwM=;
 b=y5mBnwxtsdEc/etd5FFlV7OqB6PdtHZ2xkQgAEFIdA6mfDVUnQLQdIJiFSQEqDClJw
 9kYUlf9qj7FdbQL9NAQsx4k3Z0151D5GmyXwyHZ2fufz67lgWmFfVO6uYfxX0+1RKznu
 +Hx4NQjsqRb9EAfRPWIka5xZYvu3fzW/WoiasMq552FGXpIhv+8A+KgVNKRRkgSkeU6q
 kvawiMBwnVQdi+CeB3FoXhF+T07K8LYstOeV05MCrFzW/dGi21BTSfrFcLbhzHkyP4Vr
 FynouAHWFxYWstFyCtl03Pw/+i7XnqFLwBMStwNY8vQFYJEbPPj9pkxQS5V6srNzJeSl
 xXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TeGZ3fztF9Kc3mfAQS9k9SzN001AUn+r3TkwGe9HSwM=;
 b=RwDFg8PErCSDBpMD7r/TqUxCDP46BDrHnH65h08wSIPTFv5biP7IGqgrNNGTAyLyBS
 EpQl7KeUlZgtQfOB5zP4C0hlvS/wSPazLkIgXN4ZS+p0DXHzKD/eMTlGBOC2VP4Mr82L
 8HYu0LY9/zW6NahyBfMIqhn6lhOZCVea3AaQR5XJoYn6cYZV7RpJQmD8m4yMH+frGKaQ
 5YQ6Ykq+Kbc3eILIVWEuM2GsF09GBKT1pJDM/QVuqfzs4J41y/fQD56sl+Pw1YWtM/2B
 vwx1XzBAIyb7H8U6nC6xWHn41f1i/fhZZzBPCJ8GEKp6P3XU4pJ2/bs393A9U13p6XfG
 Ekaw==
X-Gm-Message-State: AOAM5318mIsOa6p8jAkKOwGqb21mg4L/IP8VfXqpcWBqusr3ZoTVxnyI
 a8260Xent5zxJq2Xfp3jAPzQHw==
X-Google-Smtp-Source: ABdhPJy5fqXg36LcDQ0ZS0ksPEE+SzkgoovaTgJOyUW97sJiHuaRcwejQEyncA9i57YVBHijX5OWIg==
X-Received: by 2002:a5d:4528:: with SMTP id j8mr4167273wra.544.1644335954279; 
 Tue, 08 Feb 2022 07:59:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f5sm14805125wry.64.2022.02.08.07.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:59:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] Kconfig: Add I2C_DEVICES device group
Date: Tue,  8 Feb 2022 15:59:10 +0000
Message-Id: <20220208155911.3408455-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208155911.3408455-1-peter.maydell@linaro.org>
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there is no way for a board model's Kconfig stanza to
say "I have an i2c bus which the user can plug an i2c device into,
build all the free-standing i2c devices". The Kconfig mechanism
for this is the "device group". Add an I2C_DEVICES group along
the same lines as the existing PCI_DEVICES. Simple free-standing
i2c devices which a user might plausibly want to be able to
plug in on the QEMU commandline should have
   default y if I2C_DEVICES
and board models which have an i2c bus that is user-accessible
should use
   imply I2C_DEVICES
to cause those pluggable devices to be built.

In this commit we mark only a fairly conservative set of i2c devices
as belonging to the I2C_DEVICES group: the simple sensors and RTCs
(not including PMBus devices or devices which need GPIO lines to be
connected).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Feel free to suggest other i2c devices that should be marked
as in the group; as I say, I erred on the side of not putting
devices in the group.
---
 docs/devel/kconfig.rst | 8 ++++++--
 hw/i2c/Kconfig         | 5 +++++
 hw/rtc/Kconfig         | 2 ++
 hw/sensor/Kconfig      | 5 +++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index a1cdbec7512..aa5042f1569 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -192,11 +192,15 @@ declares its dependencies in different ways:
   no directive and are not used in the Makefile either; they only appear
   as conditions for ``default y`` directives.
 
-  QEMU currently has two device groups, ``PCI_DEVICES`` and
-  ``TEST_DEVICES``.  PCI devices usually have a ``default y if
+  QEMU currently has three device groups, ``PCI_DEVICES``, ``I2C_DEVICES``,
+  and ``TEST_DEVICES``.  PCI devices usually have a ``default y if
   PCI_DEVICES`` directive rather than just ``default y``.  This lets
   some boards (notably s390) easily support a subset of PCI devices,
   for example only VFIO (passthrough) and virtio-pci devices.
+  ``I2C_DEVICES`` is similar to ``PCI_DEVICES``. It contains i2c devices
+  that users might reasonably want to plug in to an i2c bus on any
+  board (and not ones which are very board-specific or that need
+  to be wired up in a way that can't be done on the command line).
   ``TEST_DEVICES`` instead is used for devices that are rarely used on
   production virtual machines, but provide useful hooks to test QEMU
   or KVM.
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 8217cb50411..9bb8870517f 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -1,6 +1,11 @@
 config I2C
     bool
 
+config I2C_DEVICES
+    # Device group for i2c devices which can reasonably be user-plugged
+    # to any board's i2c bus
+    bool
+
 config SMBUS
     bool
     select I2C
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index f06e133b8a2..730c272bc54 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -1,10 +1,12 @@
 config DS1338
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config M41T80
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config M48T59
     bool
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index b317f91b7b4..215944decc7 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -1,18 +1,22 @@
 config TMP105
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config TMP421
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config DPS310
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config EMC141X
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config ADM1272
     bool
@@ -25,3 +29,4 @@ config MAX34451
 config LSM303DLHC_MAG
     bool
     depends on I2C
+    default y if I2C_DEVICES
-- 
2.25.1


