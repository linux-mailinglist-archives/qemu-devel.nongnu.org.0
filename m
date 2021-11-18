Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FCC455E40
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:35:51 +0100 (CET)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniVy-0003A9-5M
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniUP-0002Ke-CC
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniUL-0004WK-JI
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637246048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MdMHWjmoUrPw1X1G3ORsVG7BaIFhkZmGbgTYn5gVPQ0=;
 b=Z4/g+qjoV5PHfq+8iXNZWcyp7ZpfT+t5WWpuZog81foqRbkrTVUILYLChCDNWwY5b/3WGS
 Ac17DCnMwm/4K8BrTQ72aA14JnuqGJ3N2N0BZD+BgFYhvFFS+XPFyOipLAJhxcsz3R9dz6
 svn91sue+2hTSwe0kYth30wskjLw0+g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-129-z_Fm2QJbPY2L91304mgROg-1; Thu, 18 Nov 2021 09:34:04 -0500
X-MC-Unique: z_Fm2QJbPY2L91304mgROg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so1126818wrb.2
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MdMHWjmoUrPw1X1G3ORsVG7BaIFhkZmGbgTYn5gVPQ0=;
 b=HrSrrpvubrRMe2PtXkvWSLGbj8WynYYSnbv9PdAEq5bsJWyHQJ081YnqlVc70Mznwh
 8FAs+Ojc6MJ5qCyIxph9Wh5AAmhQ67MCk4n2y/Ih7Shz6t+FMkpKWaAKptV/H9mx4Zex
 Hbcmv3Cq9AwN0kchvCID96OQrzmK25P7Pe+P9DB+K4OZV816PRvS5AthzskYZGXCokq0
 SKIRVglwq24XAIM9YFQk3b0EzS+BIVANZ4fvGHYGCCeONtZVx3S9fEs7z8+DGGFgW50U
 4QAP91OxJTYS5Tag/swKaru8viTycoB2jKXAFZIWk5iNjkXS40jMhFwlkKgGv/xf+x47
 bC7g==
X-Gm-Message-State: AOAM532Up4bcjmcHIscYuce23XW7QizaBB/I0b3gxN85Xez4CN7p+pqB
 AI4x5aG4xBN/SzwSQoghiBoQzy56ZFyWcJ2LDzcAsOXFCiZl0B1zecI7a03Jv86GnwibiU5nP8e
 zgigabkIivy/GWUrBAwQaGuWvbqzjz8MmQFZ/+6S3VDigy8xZ4rfSglZzKHr6iEuy
X-Received: by 2002:adf:f88c:: with SMTP id u12mr32497510wrp.29.1637246043154; 
 Thu, 18 Nov 2021 06:34:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKFXJaIHumkE6FlhjWyA1ETrJoBmQPdwZfr+YFqNtl64AyOiUe+dQsX4Tgr7I+7P0Py/RxUg==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr32497419wrp.29.1637246042619; 
 Thu, 18 Nov 2021 06:34:02 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b10sm21701wrt.36.2021.11.18.06.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:34:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2?] docs: Spell QEMU all caps
Date: Thu, 18 Nov 2021 15:34:01 +0100
Message-Id: <20211118143401.4101497-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace Qemu -> QEMU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/modules.rst                |  2 +-
 docs/devel/multi-thread-tcg.rst       |  2 +-
 docs/devel/style.rst                  |  2 +-
 docs/devel/ui.rst                     |  4 ++--
 docs/interop/nbd.txt                  |  6 +++---
 docs/interop/qcow2.txt                |  8 ++++----
 docs/multiseat.txt                    |  2 +-
 docs/system/device-url-syntax.rst.inc |  2 +-
 docs/system/i386/sgx.rst              | 26 +++++++++++++-------------
 docs/u2f.txt                          |  2 +-
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/docs/devel/modules.rst b/docs/devel/modules.rst
index 066f347b89b..8e999c4fa48 100644
--- a/docs/devel/modules.rst
+++ b/docs/devel/modules.rst
@@ -1,5 +1,5 @@
 ============
-Qemu modules
+QEMU modules
 ============
 
 .. kernel-doc:: include/qemu/module.h
diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 5b446ee08b6..c9541a7b20a 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -228,7 +228,7 @@ Emulated hardware state
 
 Currently thanks to KVM work any access to IO memory is automatically
 protected by the global iothread mutex, also known as the BQL (Big
-Qemu Lock). Any IO region that doesn't use global mutex is expected to
+QEMU Lock). Any IO region that doesn't use global mutex is expected to
 do its own locking.
 
 However IO memory isn't the only way emulated hardware state can be
diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 260e3263fa0..e00af62e763 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -686,7 +686,7 @@ Rationale: hex numbers are hard to read in logs when there is no 0x prefix,
 especially when (occasionally) the representation doesn't contain any letters
 and especially in one line with other decimal numbers. Number groups are allowed
 to not use '0x' because for some things notations like %x.%x.%x are used not
-only in Qemu. Also dumping raw data bytes with '0x' is less readable.
+only in QEMU. Also dumping raw data bytes with '0x' is less readable.
 
 '#' printf flag
 ---------------
diff --git a/docs/devel/ui.rst b/docs/devel/ui.rst
index 06c7d622ce7..17fb667dec4 100644
--- a/docs/devel/ui.rst
+++ b/docs/devel/ui.rst
@@ -1,8 +1,8 @@
 =================
-Qemu UI subsystem
+QEMU UI subsystem
 =================
 
-Qemu Clipboard
+QEMU Clipboard
 --------------
 
 .. kernel-doc:: include/ui/clipboard.h
diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index 10ce098a29b..bdb0f2a41ac 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -1,4 +1,4 @@
-Qemu supports the NBD protocol, and has an internal NBD client (see
+QEMU supports the NBD protocol, and has an internal NBD client (see
 block/nbd.c), an internal NBD server (see blockdev-nbd.c), and an
 external NBD server tool (see qemu-nbd.c). The common code is placed
 in nbd/*.
@@ -7,11 +7,11 @@ The NBD protocol is specified here:
 https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md
 
 The following paragraphs describe some specific properties of NBD
-protocol realization in Qemu.
+protocol realization in QEMU.
 
 = Metadata namespaces =
 
-Qemu supports the "base:allocation" metadata context as defined in the
+QEMU supports the "base:allocation" metadata context as defined in the
 NBD protocol specification, and also defines an additional metadata
 namespace "qemu".
 
diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 0463f761efb..f7dc304ff69 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -313,7 +313,7 @@ The fields of the bitmaps extension are:
                    The number of bitmaps contained in the image. Must be
                    greater than or equal to 1.
 
-                   Note: Qemu currently only supports up to 65535 bitmaps per
+                   Note: QEMU currently only supports up to 65535 bitmaps per
                    image.
 
           4 -  7:  Reserved, must be zero.
@@ -775,7 +775,7 @@ Structure of a bitmap directory entry:
                       2: extra_data_compatible
                          This flags is meaningful when the extra data is
                          unknown to the software (currently any extra data is
-                         unknown to Qemu).
+                         unknown to QEMU).
                          If it is set, the bitmap may be used as expected, extra
                          data must be left as is.
                          If it is not set, the bitmap must not be used, but
@@ -793,7 +793,7 @@ Structure of a bitmap directory entry:
              17:    granularity_bits
                     Granularity bits. Valid values: 0 - 63.
 
-                    Note: Qemu currently supports only values 9 - 31.
+                    Note: QEMU currently supports only values 9 - 31.
 
                     Granularity is calculated as
                         granularity = 1 << granularity_bits
@@ -804,7 +804,7 @@ Structure of a bitmap directory entry:
         18 - 19:    name_size
                     Size of the bitmap name. Must be non-zero.
 
-                    Note: Qemu currently doesn't support values greater than
+                    Note: QEMU currently doesn't support values greater than
                     1023.
 
         20 - 23:    extra_data_size
diff --git a/docs/multiseat.txt b/docs/multiseat.txt
index 11850c96ff8..2b297e979d6 100644
--- a/docs/multiseat.txt
+++ b/docs/multiseat.txt
@@ -123,7 +123,7 @@ Background info is here:
 guest side with pci-bridge-seat
 -------------------------------
 
-Qemu version 2.4 and newer has a new pci-bridge-seat device which
+QEMU version 2.4 and newer has a new pci-bridge-seat device which
 can be used instead of pci-bridge.  Just swap the device name in the
 qemu command line above.  The only difference between the two devices
 is the pci id.  We can match the pci id instead of the device path
diff --git a/docs/system/device-url-syntax.rst.inc b/docs/system/device-url-syntax.rst.inc
index d15a0215087..7dbc525fa80 100644
--- a/docs/system/device-url-syntax.rst.inc
+++ b/docs/system/device-url-syntax.rst.inc
@@ -15,7 +15,7 @@ These are specified using a special URL syntax.
    'iqn.2008-11.org.linux-kvm[:<name>]' but this can also be set from
    the command line or a configuration file.
 
-   Since version Qemu 2.4 it is possible to specify a iSCSI request
+   Since version QEMU 2.4 it is possible to specify a iSCSI request
    timeout to detect stalled requests and force a reestablishment of the
    session. The timeout is specified in seconds. The default is 0 which
    means no timeout. Libiscsi 1.15.0 or greater is required for this
diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index 9aa161af1a1..f8fade5ac2d 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -20,13 +20,13 @@ report the same CPUID info to guest as on host for most of SGX CPUID. With
 reporting the same CPUID guest is able to use full capacity of SGX, and KVM
 doesn't need to emulate those info.
 
-The guest's EPC base and size are determined by Qemu, and KVM needs Qemu to
+The guest's EPC base and size are determined by QEMU, and KVM needs QEMU to
 notify such info to it before it can initialize SGX for guest.
 
 Virtual EPC
 ~~~~~~~~~~~
 
-By default, Qemu does not assign EPC to a VM, i.e. fully enabling SGX in a VM
+By default, QEMU does not assign EPC to a VM, i.e. fully enabling SGX in a VM
 requires explicit allocation of EPC to the VM. Similar to other specialized
 memory types, e.g. hugetlbfs, EPC is exposed as a memory backend.
 
@@ -35,12 +35,12 @@ prior to realizing the vCPUs themselves, which occurs long before generic
 devices are parsed and realized.  This limitation means that EPC does not
 require -maxmem as EPC is not treated as {cold,hot}plugged memory.
 
-Qemu does not artificially restrict the number of EPC sections exposed to a
-guest, e.g. Qemu will happily allow you to create 64 1M EPC sections. Be aware
+QEMU does not artificially restrict the number of EPC sections exposed to a
+guest, e.g. QEMU will happily allow you to create 64 1M EPC sections. Be aware
 that some kernels may not recognize all EPC sections, e.g. the Linux SGX driver
 is hardwired to support only 8 EPC sections.
 
-The following Qemu snippet creates two EPC sections, with 64M pre-allocated
+The following QEMU snippet creates two EPC sections, with 64M pre-allocated
 to the VM and an additional 28M mapped but not allocated::
 
  -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
@@ -54,7 +54,7 @@ to physical EPC. Because physical EPC is protected via range registers,
 the size of the physical EPC must be a power of two (though software sees
 a subset of the full EPC, e.g. 92M or 128M) and the EPC must be naturally
 aligned.  KVM SGX's virtual EPC is purely a software construct and only
-requires the size and location to be page aligned. Qemu enforces the EPC
+requires the size and location to be page aligned. QEMU enforces the EPC
 size is a multiple of 4k and will ensure the base of the EPC is 4k aligned.
 To simplify the implementation, EPC is always located above 4g in the guest
 physical address space.
@@ -62,7 +62,7 @@ physical address space.
 Migration
 ~~~~~~~~~
 
-Qemu/KVM doesn't prevent live migrating SGX VMs, although from hardware's
+QEMU/KVM doesn't prevent live migrating SGX VMs, although from hardware's
 perspective, SGX doesn't support live migration, since both EPC and the SGX
 key hierarchy are bound to the physical platform. However live migration
 can be supported in the sense if guest software stack can support recreating
@@ -76,7 +76,7 @@ CPUID
 ~~~~~
 
 Due to its myriad dependencies, SGX is currently not listed as supported
-in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
+in any of QEMU's built-in CPU configuration. To expose SGX (and SGX Launch
 Control) to a guest, you must either use ``-cpu host`` to pass-through the
 host CPU model, or explicitly enable SGX when using a built-in CPU model,
 e.g. via ``-cpu <model>,+sgx`` or ``-cpu <model>,+sgx,+sgxlc``.
@@ -101,7 +101,7 @@ controlled via -cpu are prefixed with "sgx", e.g.::
   sgx2
   sgxlc
 
-The following Qemu snippet passes through the host CPU but restricts access to
+The following QEMU snippet passes through the host CPU but restricts access to
 the provision and EINIT token keys::
 
  -cpu host,-sgx-provisionkey,-sgx-tokenkey
@@ -112,11 +112,11 @@ in hardware cannot be forced on via '-cpu'.
 Virtualize SGX Launch Control
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Qemu SGX support for Launch Control (LC) is passive, in the sense that it
-does not actively change the LC configuration.  Qemu SGX provides the user
+QEMU SGX support for Launch Control (LC) is passive, in the sense that it
+does not actively change the LC configuration.  QEMU SGX provides the user
 the ability to set/clear the CPUID flag (and by extension the associated
 IA32_FEATURE_CONTROL MSR bit in fw_cfg) and saves/restores the LE Hash MSRs
-when getting/putting guest state, but Qemu does not add new controls to
+when getting/putting guest state, but QEMU does not add new controls to
 directly modify the LC configuration.  Similar to hardware behavior, locking
 the LC configuration to a non-Intel value is left to guest firmware.  Unlike
 host bios setting for SGX launch control(LC), there is no special bios setting
@@ -126,7 +126,7 @@ creating VM with SGX.
 Feature Control
 ~~~~~~~~~~~~~~~
 
-Qemu SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
+QEMU SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
 (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
 i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
 assuming said firmware supports fw_cfg.msr_feature_control.
diff --git a/docs/u2f.txt b/docs/u2f.txt
index 8f44994818a..7f5813a0b72 100644
--- a/docs/u2f.txt
+++ b/docs/u2f.txt
@@ -21,7 +21,7 @@ The second factor is materialized by a device implementing the U2F
 protocol. In case of a USB U2F security key, it is a USB HID device
 that implements the U2F protocol.
 
-In Qemu, the USB U2F key device offers a dedicated support of U2F, allowing
+In QEMU, the USB U2F key device offers a dedicated support of U2F, allowing
 guest USB FIDO/U2F security keys operating in two possible modes:
 pass-through and emulated.
 
-- 
2.31.1


