Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E122930A6AB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:37:24 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XWG-0005VR-0R
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOv-0007Ff-Qm
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:49 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOu-00005g-2g
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c4so13457896wru.9
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9rQaS8UMqNJGneEaOHvqNQyzFShTSgQ9o1efcMMfnw=;
 b=vN5Dbc8LEBoxXzt4TOZpKQUfFP4d0DUrmJzsY8jZ30ugvsjqLnSTGDuzM7H5Fyrk3f
 abS4D3Ay2zNaJBSGMTGCJOBMPB0RMUXJbL6yqIkQ/k8U3aKlUwIlyhW30wiOETsY+lUU
 VJdwwEkBARJ7eV715aeJDCjTlEzuJ7ft/zc1y32IFpIdtIEhNETmDDSyBCzd5/cL7xO9
 U50ggDjlwUQVizGN8vef1jmyXmIUVrOW/c4xcMiNqJGCJsnBZXQULkYBB67vLBH/7B24
 jEj/VTilekOmxsfiANyo+i9GfbpLzhVXb7nSmdL0Jut2lRCZzFBDzUvdQG9EI5wxHfm6
 AB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s9rQaS8UMqNJGneEaOHvqNQyzFShTSgQ9o1efcMMfnw=;
 b=tVoMaDw/LrmQ+IpcJA/BFXLqyXVIXPbfuZCbXnkZbq85zDPlFK+O26Ss90pTjWDo28
 bGGcPEhYxHJUpH9y1ARwiMlmqqDc9vmW8BNPFHgFHSqxKjM1IhyT2YC+0nakrWZcPPNw
 SC1ffpUvxALicCXH6DjhaxyPd5ntLU4r5hXU6Z0R7G3c+P+TJ0EsWxDazg8fbotVF46E
 2hyjumw0P9a3z/Xa8rLZWEfDY4eVP+9E3LXMC5oFM3f2xcN9mFozJVOYEbG254IGV+Gu
 /BToG7JGKqxl8JZeWL9HQaKHqPJHhEbSXmm2RG/VJtvZDYTYpKi4QCbhtU8MOL5rknBM
 K66A==
X-Gm-Message-State: AOAM530r8GG8x9OVOYVe+yaTn8zFcn85mZ/AGvAFHOFl02GT+moBkX3k
 jZPyDnHk3sxDCFSsYkUeG0s=
X-Google-Smtp-Source: ABdhPJzAYGwF+J2Ou4s+1HcJL36utLf3MJcMRSzDMAwMwQQaTKhKo5Am9QETvwv7os+GbvBC+C3N8g==
X-Received: by 2002:adf:bc4b:: with SMTP id a11mr18119220wrh.260.1612178986887; 
 Mon, 01 Feb 2021 03:29:46 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r124sm21261633wmr.16.2021.02.01.03.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] NOTFORMERGE hw/xen/Kconfig: Introduce XEN_PV config
Date: Mon,  1 Feb 2021 12:29:05 +0100
Message-Id: <20210201112905.545144-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xenpv machine requires USB, IDE_PIIX and PCI:

  /usr/bin/ld:
  libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
  hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
  hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
  hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Unfinished:

/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `ram_block_add':
softmmu/physmem.c:1873: undefined reference to `xen_ram_alloc'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_memory.c.o: in function
`cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

TODO another day: Paolo's suggestion:
"modify xen_hvm_modified_memory to become a virtual function in AccelClass."
---
 hw/Kconfig     | 1 +
 hw/xen/Kconfig | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..f2a95591d94 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -39,6 +39,7 @@ source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
 source watchdog/Kconfig
+source xen/Kconfig
 
 # arch Kconfig
 source arm/Kconfig
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 00000000000..0b8427d6bd1
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,7 @@
+config XEN_PV
+    bool
+    default y if XEN
+    depends on XEN
+    select PCI
+    select USB
+    select IDE_PIIX
-- 
2.26.2


