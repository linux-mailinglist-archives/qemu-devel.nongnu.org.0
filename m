Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048523CFE2C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:50:52 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s1C-0006tG-W8
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rso-0007hh-Ad
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsl-0004qr-Ny
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FepJ2pJ0sSLlbKcPEXZPja0GO2DDIgofuJM+Bwm87F4=;
 b=J5HxWjfaF/k/PLachd9s95/hS4kVRR6H8REL9yYdqajybTlhpFqBigh9gwgmCeRtywWv/D
 sChWUhff17tjSH5J/2dI0hr8Pi3YqqQL1TviwYBSKjDb5xSFslSL4Q8YyJPVJSxKPpUBXU
 mmHTjCiGK34tEQ0DZ7XReTvludGPUVU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-oCfFV5qoN9m7sa4c1YKtuA-1; Tue, 20 Jul 2021 11:42:06 -0400
X-MC-Unique: oCfFV5qoN9m7sa4c1YKtuA-1
Received: by mail-wr1-f69.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so10452763wrz.23
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FepJ2pJ0sSLlbKcPEXZPja0GO2DDIgofuJM+Bwm87F4=;
 b=O5y1rZvnfqPbRRZgTaP05jLPA7PUz/dW3VFKJinsWXw7qpfHqy6l1bKEZYAE2Sa6jC
 2raN51e1I2W9AZ0RtdrhOrvhy1su7Z4i5MIiViCZPTbh29ovw7UwlMjPeLPpprXIHsgA
 vI3H+868zXlCnsYlfLgYiTBBlP3oeFtWOOJ5z5ttfy3wSz8I6+0jfknYLvu0rVx1S2Kb
 lB5CebEc69IQ3+7HoLy7UJepO2gPvVinfCBNMOGcc62z6mCAUDsHMXU9kM/BM5kzZmbD
 PYhaD8wQnTtcRN0xQzS94NSLJj7V0YlvL5f2TV32/vUo4+gGagDH3aUotIbBe1BrWzN7
 SOKw==
X-Gm-Message-State: AOAM530ISaxbd9uXMavbmVXLnc54BRDhoSZxTaKjUIt+hpMz/91Bm/3T
 lNyLBr9y++JifnRzH0W/s85MU7mM69kEErK0PYYnTUvKdsvK7+QGOlyU8hoIb0s6zNezdmvtHWt
 B0P2VwwRByd5y7XNpffeqFI5nzqe4eBWAIDTO1rtmU/+lU0hKkTw/3qtr9CSS6/m4
X-Received: by 2002:adf:f949:: with SMTP id q9mr35490339wrr.178.1626795724852; 
 Tue, 20 Jul 2021 08:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAixotQRyJ7rsjEFh72SsGY61nGjEd2b+aAXgT4JCSpXPCA9QV0gawbFOpCHVP2562pxy7vw==
X-Received: by 2002:adf:f949:: with SMTP id q9mr35490318wrr.178.1626795724635; 
 Tue, 20 Jul 2021 08:42:04 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 b16sm24247794wrw.46.2021.07.20.08.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] hw/i386/Kconfig: Add missing Kconfig dependency (runtime
 error)
Date: Tue, 20 Jul 2021 17:41:29 +0200
Message-Id: <20210720154141.3919817-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building the 'microvm' machine stand-alone we get:

  $ qemu-system-x86_64 -M microvm
  **
  ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
  Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
  Aborted (core dumped)

Looking at the backtrace:

  (gdb) bt
  #3  0x00007ff2330492ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
  #4  0x000055a878c18341 in object_new_with_type (type=<optimized out>) at qom/object.c:714
  #5  0x000055a878c18399 in object_new (typename=typename@entry=0x55a878dec36a "isa-pit") at qom/object.c:747
  #6  0x000055a878cc8146 in qdev_new (name=name@entry=0x55a878dec36a "isa-pit") at hw/core/qdev.c:153
  #7  0x000055a878a8b439 in isa_new (name=name@entry=0x55a878dec36a "isa-pit") at hw/isa/isa-bus.c:160
  #8  0x000055a878adb782 in i8254_pit_init (base=64, isa_irq=0, alt_irq=0x0, bus=0x55a87ab38760) at include/hw/timer/i8254.h:54
  #9  microvm_devices_init (mms=0x55a87ac36800) at hw/i386/microvm.c:263
  #10 microvm_machine_state_init (machine=<optimized out>) at hw/i386/microvm.c:471
  #11 0x000055a878a944ab in machine_run_board_init (machine=machine@entry=0x55a87ac36800) at hw/core/machine.c:1239

The "isa-pit" type (TYPE_I8254) is missing. Add it.

Fixes: 0ebf007ddac ("hw/i386: Introduce the microvm machine type")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210616204328.2611406-24-philmd@redhat.com>
---
 hw/i386/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index bad6cf5b4e6..ddedcef0b27 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -111,6 +111,7 @@ config MICROVM
     select ACPI_HW_REDUCED
     select PCI_EXPRESS_GENERIC_BRIDGE
     select USB_XHCI_SYSBUS
+    select I8254
 
 config X86_IOMMU
     bool
-- 
2.31.1


