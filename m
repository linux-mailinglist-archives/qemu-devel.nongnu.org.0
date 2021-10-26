Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5299043A949
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 02:33:29 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfAPA-00043K-Dr
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 20:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAG7-0002c4-6j
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:24:07 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:45800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAG0-0008Pr-Rc
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:24:06 -0400
Received: by mail-oi1-x22f.google.com with SMTP id z126so17976037oiz.12
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JsOy8CcCoZNFgBiCYFmkzD6EOEwVKEK5bfEl0/UbZ4=;
 b=O0ABBSBn35P+Agb8mCYMhRFQGzOPPP9Mi3aUCqMr6+i/ovidWAaSQ91mIAXE5qyUzc
 Q9e4mZSdtnl5IQyZDs0IE/lYDUfMMnfn00LrTlubksDzxBxJcWsCxOBChH915aOim/Pi
 PNwGfuGM3/9U1rMn/DViSpErl8UXdFsYmIRnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JsOy8CcCoZNFgBiCYFmkzD6EOEwVKEK5bfEl0/UbZ4=;
 b=HQvBNE2Q+sU2OsUpazeYwRMuXdh7YaAj1eiN/dsao2x4I5m3zJBTaE+4TCBFye2/sf
 nDCDYBzfPYztA7ZxxGMqCP8DQly+ASv+Bi5rnroMnGtq3IGquXMLhrVNYgjupIuYM16s
 NwMRrLbp4GcidEdm6qSBQii5x0OWpxdnaddwa+6x9kybbh8miUI4lRxhAkpkRx3ZjRBD
 X1TICq6PiUkfmEl3IkxFDFaHyBLH37SnABNmPnagCMmjLahz52AuX+qQ9rJuoYUZ5BGk
 6FPtaDUzh4wY6cgFdEB0lQSTHXQJoSXAKvhvF537LjJxeAex7XCOfR6s61DgLWSPcXEb
 3qWw==
X-Gm-Message-State: AOAM531Ii8xbU4DMF+RLZ+dRwgEhtlPvtyM1TZc/VRDrovzxKpQWj6FE
 OX5jr5y0qLCWrKZ2krkg+GL+tg==
X-Google-Smtp-Source: ABdhPJw0gEy5mnUcLtYBkb8wqbuy9yAx1FyrbQ07E6z9UH6Bwm6pPYVkYzzX3ZAPkx+FBhG8Lrbh6Q==
X-Received: by 2002:aca:c156:: with SMTP id r83mr25194978oif.78.1635207839120; 
 Mon, 25 Oct 2021 17:23:59 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id v24sm3331926oou.45.2021.10.25.17.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:23:58 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Date: Mon, 25 Oct 2021 18:23:24 -0600
Message-Id: <20211026002344.405160-7-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026002344.405160-1-sjg@chromium.org>
References: <20211026002344.405160-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=sjg@chromium.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add this file, generated from qemu, so there is a reference devicetree
in the U-Boot tree.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 arch/arm/dts/Makefile        |   2 +-
 arch/arm/dts/qemu-arm64.dts  | 381 +++++++++++++++++++++++++++++++++++
 configs/qemu_arm64_defconfig |   1 +
 3 files changed, 383 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/qemu-arm64.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 7ab8b145f3f..e70293bb849 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1153,7 +1153,7 @@ dtb-$(CONFIG_TARGET_IMX8MM_CL_IOT_GATE_OPTEE) += imx8mm-cl-iot-gate-optee.dtb
 
 dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
 
-dtb-$(CONFIG_ARCH_QEMU) += qemu-arm.dtb
+dtb-$(CONFIG_ARCH_QEMU) += qemu-arm.dtb qemu-arm64.dtb
 
 targets += $(dtb-y)
 
diff --git a/arch/arm/dts/qemu-arm64.dts b/arch/arm/dts/qemu-arm64.dts
new file mode 100644
index 00000000000..7590e49cc84
--- /dev/null
+++ b/arch/arm/dts/qemu-arm64.dts
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Sample device tree for qemu_arm64
+
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+
+/ {
+	interrupt-parent = <0x8001>;
+	#size-cells = <0x02>;
+	#address-cells = <0x02>;
+	compatible = "linux,dummy-virt";
+
+	psci {
+		migrate = <0xc4000005>;
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+		cpu_suspend = <0xc4000001>;
+		method = "hvc";
+		compatible = "arm,psci-0.2\0arm,psci";
+	};
+
+	memory@40000000 {
+		reg = <0x00 0x40000000 0x00 0x8000000>;
+		device_type = "memory";
+	};
+
+	platform@c000000 {
+		interrupt-parent = <0x8001>;
+		ranges = <0x00 0x00 0xc000000 0x2000000>;
+		#address-cells = <0x01>;
+		#size-cells = <0x01>;
+		compatible = "qemu,platform\0simple-bus";
+	};
+
+	fw-cfg@9020000 {
+		dma-coherent;
+		reg = <0x00 0x9020000 0x00 0x18>;
+		compatible = "qemu,fw-cfg-mmio";
+	};
+
+	virtio_mmio@a000000 {
+		dma-coherent;
+		interrupts = <0x00 0x10 0x01>;
+		reg = <0x00 0xa000000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000200 {
+		dma-coherent;
+		interrupts = <0x00 0x11 0x01>;
+		reg = <0x00 0xa000200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000400 {
+		dma-coherent;
+		interrupts = <0x00 0x12 0x01>;
+		reg = <0x00 0xa000400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000600 {
+		dma-coherent;
+		interrupts = <0x00 0x13 0x01>;
+		reg = <0x00 0xa000600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000800 {
+		dma-coherent;
+		interrupts = <0x00 0x14 0x01>;
+		reg = <0x00 0xa000800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000a00 {
+		dma-coherent;
+		interrupts = <0x00 0x15 0x01>;
+		reg = <0x00 0xa000a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000c00 {
+		dma-coherent;
+		interrupts = <0x00 0x16 0x01>;
+		reg = <0x00 0xa000c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000e00 {
+		dma-coherent;
+		interrupts = <0x00 0x17 0x01>;
+		reg = <0x00 0xa000e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001000 {
+		dma-coherent;
+		interrupts = <0x00 0x18 0x01>;
+		reg = <0x00 0xa001000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001200 {
+		dma-coherent;
+		interrupts = <0x00 0x19 0x01>;
+		reg = <0x00 0xa001200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001400 {
+		dma-coherent;
+		interrupts = <0x00 0x1a 0x01>;
+		reg = <0x00 0xa001400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001600 {
+		dma-coherent;
+		interrupts = <0x00 0x1b 0x01>;
+		reg = <0x00 0xa001600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001800 {
+		dma-coherent;
+		interrupts = <0x00 0x1c 0x01>;
+		reg = <0x00 0xa001800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001a00 {
+		dma-coherent;
+		interrupts = <0x00 0x1d 0x01>;
+		reg = <0x00 0xa001a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001c00 {
+		dma-coherent;
+		interrupts = <0x00 0x1e 0x01>;
+		reg = <0x00 0xa001c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001e00 {
+		dma-coherent;
+		interrupts = <0x00 0x1f 0x01>;
+		reg = <0x00 0xa001e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002000 {
+		dma-coherent;
+		interrupts = <0x00 0x20 0x01>;
+		reg = <0x00 0xa002000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002200 {
+		dma-coherent;
+		interrupts = <0x00 0x21 0x01>;
+		reg = <0x00 0xa002200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002400 {
+		dma-coherent;
+		interrupts = <0x00 0x22 0x01>;
+		reg = <0x00 0xa002400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002600 {
+		dma-coherent;
+		interrupts = <0x00 0x23 0x01>;
+		reg = <0x00 0xa002600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002800 {
+		dma-coherent;
+		interrupts = <0x00 0x24 0x01>;
+		reg = <0x00 0xa002800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002a00 {
+		dma-coherent;
+		interrupts = <0x00 0x25 0x01>;
+		reg = <0x00 0xa002a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002c00 {
+		dma-coherent;
+		interrupts = <0x00 0x26 0x01>;
+		reg = <0x00 0xa002c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002e00 {
+		dma-coherent;
+		interrupts = <0x00 0x27 0x01>;
+		reg = <0x00 0xa002e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003000 {
+		dma-coherent;
+		interrupts = <0x00 0x28 0x01>;
+		reg = <0x00 0xa003000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003200 {
+		dma-coherent;
+		interrupts = <0x00 0x29 0x01>;
+		reg = <0x00 0xa003200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003400 {
+		dma-coherent;
+		interrupts = <0x00 0x2a 0x01>;
+		reg = <0x00 0xa003400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003600 {
+		dma-coherent;
+		interrupts = <0x00 0x2b 0x01>;
+		reg = <0x00 0xa003600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003800 {
+		dma-coherent;
+		interrupts = <0x00 0x2c 0x01>;
+		reg = <0x00 0xa003800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003a00 {
+		dma-coherent;
+		interrupts = <0x00 0x2d 0x01>;
+		reg = <0x00 0xa003a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003c00 {
+		dma-coherent;
+		interrupts = <0x00 0x2e 0x01>;
+		reg = <0x00 0xa003c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003e00 {
+		dma-coherent;
+		interrupts = <0x00 0x2f 0x01>;
+		reg = <0x00 0xa003e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	pcie@10000000 {
+		interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
+		interrupt-map = <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
+			0x03 0x04 0x00 0x00 0x00 0x02 0x8001 0x00
+			0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03
+			0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00
+			0x00 0x04 0x8001 0x00 0x00 0x00 0x06 0x04
+			0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
+			0x04 0x04 0x800 0x00 0x00 0x02 0x8001 0x00
+			0x00 0x00 0x05 0x04 0x800 0x00 0x00 0x03
+			0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00
+			0x00 0x04 0x8001 0x00 0x00 0x00 0x03 0x04
+			0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
+			0x05 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00
+			0x00 0x00 0x06 0x04 0x1000 0x00 0x00 0x03
+			0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00
+			0x00 0x04 0x8001 0x00 0x00 0x00 0x04 0x04
+			0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
+			0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00
+			0x00 0x00 0x03 0x04 0x1800 0x00 0x00 0x03
+			0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00
+			0x00 0x04 0x8001 0x00 0x00 0x00 0x05 0x04>;
+		#interrupt-cells = <0x01>;
+		ranges = <0x1000000 0x00 0x00 0x00
+			0x3eff0000 0x00 0x10000 0x2000000
+			0x00 0x10000000 0x00 0x10000000
+			0x00 0x2eff0000 0x3000000 0x80
+			0x00 0x80 0x00 0x80
+			0x00>;
+		reg = <0x40 0x10000000 0x00 0x10000000>;
+		msi-parent = <0x8002>;
+		dma-coherent;
+		bus-range = <0x00 0xff>;
+		linux,pci-domain = <0x00>;
+		#size-cells = <0x02>;
+		#address-cells = <0x03>;
+		device_type = "pci";
+		compatible = "pci-host-ecam-generic";
+	};
+
+	pl031@9010000 {
+		clock-names = "apb_pclk";
+		clocks = <0x8000>;
+		interrupts = <0x00 0x02 0x04>;
+		reg = <0x00 0x9010000 0x00 0x1000>;
+		compatible = "arm,pl031\0arm,primecell";
+	};
+
+	pl011@9000000 {
+		clock-names = "uartclk\0apb_pclk";
+		clocks = <0x8000 0x8000>;
+		interrupts = <0x00 0x01 0x04>;
+		reg = <0x00 0x9000000 0x00 0x1000>;
+		compatible = "arm,pl011\0arm,primecell";
+	};
+
+	pmu {
+		interrupts = <0x01 0x07 0x104>;
+		compatible = "arm,armv8-pmuv3";
+	};
+
+	intc@8000000 {
+		phandle = <0x8001>;
+		reg = <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00 0x10000>;
+		compatible = "arm,cortex-a15-gic";
+		ranges;
+		#size-cells = <0x02>;
+		#address-cells = <0x02>;
+		interrupt-controller;
+		#interrupt-cells = <0x03>;
+
+		v2m@8020000 {
+			phandle = <0x8002>;
+			reg = <0x00 0x8020000 0x00 0x1000>;
+			msi-controller;
+			compatible = "arm,gic-v2m-frame";
+		};
+	};
+
+	flash@0 {
+		bank-width = <0x04>;
+		reg = <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00 0x4000000>;
+		compatible = "cfi-flash";
+	};
+
+	cpus {
+		#size-cells = <0x00>;
+		#address-cells = <0x01>;
+
+		cpu@0 {
+			reg = <0x00>;
+			compatible = "arm,cortex-a57";
+			device_type = "cpu";
+		};
+	};
+
+	timer {
+		interrupts = <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b 0x104 0x01 0x0a 0x104>;
+		always-on;
+		compatible = "arm,armv8-timer\0arm,armv7-timer";
+	};
+
+	apb-pclk {
+		phandle = <0x8000>;
+		clock-output-names = "clk24mhz";
+		clock-frequency = <0x16e3600>;
+		#clock-cells = <0x00>;
+		compatible = "fixed-clock";
+	};
+
+	chosen {
+		stdout-path = "/pl011@9000000";
+	};
+};
diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
index cf5a03e8a2f..e51ce5c799f 100644
--- a/configs/qemu_arm64_defconfig
+++ b/configs/qemu_arm64_defconfig
@@ -5,6 +5,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x40000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SYS_MALLOC_LEN=0x1000000
+CONFIG_DEFAULT_DEVICE_TREE="qemu-arm64"
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_LOAD_ADDR=0x40200000
-- 
2.33.0.1079.g6e70778dc9-goog


