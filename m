Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DDE3AA5CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:59:28 +0200 (CEST)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcdD-00005J-F9
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcQB-0004Vy-M8
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcQ2-0001dz-2m
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxnpTnfrSc/SaJ3Gl4Vf5kVk0k2nHRHvjFPx1fnte0M=;
 b=KO2Kat1jYziCuBKtHyoA7OJvL4ZooXn3BGyw0vw53vuLtWFH0KlP9tRN1i+4Lc3FnL0IUw
 piGcEjSt/sT+4JqsWNF5MxGsOLXaL6Q7z3d5jX/wiLdzJHbXrHD1ko9m0Fv3BlvOaRg907
 +uvJ5R/S+2v6hO0t0AuPoFeIh+rFg5A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-rfCeoRoPOYe0WweEl8eM1w-1; Wed, 16 Jun 2021 16:45:44 -0400
X-MC-Unique: rfCeoRoPOYe0WweEl8eM1w-1
Received: by mail-wr1-f69.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so1850498wrq.18
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JxnpTnfrSc/SaJ3Gl4Vf5kVk0k2nHRHvjFPx1fnte0M=;
 b=U+LftBMgJq8EvVspX3dKIxo41CW8bjMimQk7cGpNB/PG0rx0SM92hben+mUphKM/wp
 cH3KTNDSPKMNx1CojvtAat2dbQQ1mp/0Gv0K5CUmAgCZfU3wLhHeEBNhmnSHvPEIJxFB
 qNkyCCdHxBR2HEDIXNWy4ARcUKdJD11Bg18HWQQNnbwGLjo1bLpiH+xAoeyk6PY4FrXI
 pazw9RDyxJpjLKLwkj449p+u/9+dF2ejvGgDosix7SP18LBY0NtOkZ0VjXMY+Niik5uo
 drkhAV/jiyaV3StlpY9q3rUOMoUZ7CKQga2BLBCoWy0cC68OltHUv84ZRA8hZgCWJ6Uw
 dxOg==
X-Gm-Message-State: AOAM530ZIdb7QKF+F0silvVigvzRcxyDFqtZpE62jdcwH5gPz/OOJXpF
 0FGuq7qkwEjtIpkePvyZgpUy83QJboCGrFp/DRnfAeB6ZyRffCti8mQilt7Vjy4Tf6EEZGXfHfS
 Qv9rvj8F65xGFD5zFgehxD7nNB/c1Ibwq2lHoTM7L6Y/WVLjcip1WA8QGHC3/XgT1
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr1163859wrf.130.1623876342591; 
 Wed, 16 Jun 2021 13:45:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7ZlLysA9BUyUaj6h2bKARsKuRIsHcW93WghXSpgDPLrAaeDj8hIuS+tgJVgZ1ECYDES/dXQ==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr1163827wrf.130.1623876342432; 
 Wed, 16 Jun 2021 13:45:42 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j12sm3231199wrt.69.2021.06.16.13.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] hw/i386/Kconfig: Add missing Kconfig dependency
 (runtime error)
Date: Wed, 16 Jun 2021 22:43:28 +0200
Message-Id: <20210616204328.2611406-24-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
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
---
 hw/i386/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 722f70eaeb8..e723962be56 100644
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


