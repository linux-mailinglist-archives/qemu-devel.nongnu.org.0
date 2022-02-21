Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A464BD8A1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:45:00 +0100 (CET)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5FX-0005lo-BI
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:44:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zQ-000892-DM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:16 -0500
Received: from [2a00:1450:4864:20::42c] (port=45649
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zO-00011c-BG
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id p9so25860020wra.12
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jo4pFV4ykYDrN4qI9p9hUopFbfxsOOFztCVH63tiFRs=;
 b=rmuNkrdVr6wQjOw7bWvZ+cFleWJNDUM6k9M7lPB9C5DmlNofzKe0Pef8VJlPOZlJPc
 WtnRAPBlDEosdwfEH8ySD3WWtpVLYjXQGbKPaJZ2TwYCIMZzH4aW1aAgn/GQNfII94NA
 BNBfB1jsAK46ER0pNh7lgOOrcNuK/9oyM4PVr9rHtszsW9u1VZCaJh47wd52OmJKHXte
 ny2+r9oLy8AEPo/20WcPxb+4VCTPf49vRe0Qfo1MKx0ajuUb8FalsfEHKcbFqOQhtbP9
 jPH8hzkd1/kagex7dKVqfI36DYzkFTCXnwLTsgF7W6kPimAmlM0ejuh182G9rg83BDYZ
 ndkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jo4pFV4ykYDrN4qI9p9hUopFbfxsOOFztCVH63tiFRs=;
 b=CduBRT+bsNWAmYqdY+LTNwLubAW7l+ElgVUt3g8oVBzyD+NNHEszXvyxFcz1tzCmnq
 gYV/RmSYydaNoke+TnMppgx4VMPc32pk5PNIaoPByq04qGnBMfNZWf6YhKnQd3Sh2EMi
 M64wLwfJcRlQhpm8yrXOvLqrcE0qiss/rHTbDjh+9/Cp3Oblv+UTihTRypYsuRE++NLd
 FuIZBHj0+f9lQmDGUOaoKMDP6QUr/YQ9PusXSvh/4woJuMOhfaJk1LYpJZbI9HHb+xxE
 wKGBL4D73SzLIuVRYod8sbr3lXBBQicgJrHyfrY0GK5EahAl9WJm0jiAxPxtBiQMFIsQ
 xyzg==
X-Gm-Message-State: AOAM533UPsx4XFzxU871DG/RjHBa7vaj21oOijKew0ELPoLKpbC17ZnY
 k4X+v+iP/FEfnm+s1z3rNwSqrSs2HtiYjg==
X-Google-Smtp-Source: ABdhPJyQf9uA0Dxmci9v4hlgfXzLFfOWYMUSFeEv9zI4mENvXSiUq6H3+5m2RapSrNQOg54S7Ds4bA==
X-Received: by 2002:adf:e28f:0:b0:1e7:cf02:2d28 with SMTP id
 v15-20020adfe28f000000b001e7cf022d28mr15526958wri.232.1645435693085; 
 Mon, 21 Feb 2022 01:28:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] Kconfig: Add I2C_DEVICES device group
Date: Mon, 21 Feb 2022 09:27:47 +0000
Message-Id: <20220221092800.404870-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20220208155911.3408455-2-peter.maydell@linaro.org
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


