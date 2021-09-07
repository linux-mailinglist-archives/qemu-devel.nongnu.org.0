Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A8A402C88
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:04:58 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdaj-0004l8-25
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSr-00010W-Hi
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:49 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSp-00069F-BU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:49 -0400
Received: by mail-ed1-x532.google.com with SMTP id dm15so14591837edb.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCZOq5tuFTyI/MBkuScLf83bwgoXqfElaaOzEZnF48c=;
 b=ZhVHn+CpXxacS/r0P1rOSGvfG7XqlU6iTdX+bCjNIYtiVSM/b11MQQpAVDMSoulQfr
 YL/PEkxvBLKdc1LYNrBfRHMHWjrm5A9BiueD2TL+ytA6AzEAdLpZHiAjlW5wy7myzG28
 /RSMN5t65UKWmivfXDwoo475pG4WidRRwcRIE1hodmQTIzdvNMd1HFlk/stlkwgkww0n
 mI8e+Y7zUHaTVKIGIWVuLqm/JxVw2vMUKl5NiPqsKnf61ua8ADRVmruiRc3NAnYdOtdl
 CYYQDWUs3p2UonYvI1i2VZCYAMH74y5/wo28tr6IFHXMcS0FYiujTxr4Db97Krxd/EQ8
 6hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oCZOq5tuFTyI/MBkuScLf83bwgoXqfElaaOzEZnF48c=;
 b=SvXCSa+n5hxiTZZE7YJmHoxYCb/1gmE8zP5/k0I2mW/3WLR651m8YKLSLBbbMMOOYP
 Q2rr0/pgQmYH8qLM9+coxKaTdcexcr6pnyAToyeBnT6kaQItkDW0040Uv6838ZLqTibh
 PIdPft+wAhAcEHc0fHU4v1eybf+PiN2zcfCkSJb7Idal0ysDOV90ibDwDWdtCmkjkX9u
 FeqUmwDjCDS3GUS5srOV1ZsqCuhWh83HZLIK0jihcFYwEI3NpjI4V1hAozOuaEWaGbCV
 QNgsETaiQC1ym1LkIfeusr+mS8qVy86KWB7X78Pc3axqKx/0xFNapPoFq4HIVeA6eFZK
 Ha7A==
X-Gm-Message-State: AOAM531OPoq9zx7Bb7TTmEh/lsBXSszQ7ABd88t53kveR6rljLdXdi+3
 R7G6UMMqUKhb/U3Ze/osWj/+q0pZ+Fg=
X-Google-Smtp-Source: ABdhPJxB0+UQj4cTJcbnh6J4wkm40/wQHEFa3rbyzDMZAotu0RXtKb9d9YdyHSoXXRnJi8mocB5b3A==
X-Received: by 2002:a05:6402:4cd:: with SMTP id
 n13mr127618edw.215.1631030205963; 
 Tue, 07 Sep 2021 08:56:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h30sm6869669edz.40.2021.09.07.08.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 08:56:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] docs/system: move SGX documentation within the system docs
Date: Tue,  7 Sep 2021 17:56:41 +0200
Message-Id: <20210907155641.197844-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907155641.197844-1-pbonzini@redhat.com>
References: <20210907155641.197844-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to reStructuredText, and adopt the standard === --- ~~~ headings
suggested for example by Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/{intel-sgx.txt => system/i386/sgx.rst} | 70 ++++++++++-----------
 docs/system/target-i386.rst                 |  1 +
 2 files changed, 35 insertions(+), 36 deletions(-)
 rename docs/{intel-sgx.txt => system/i386/sgx.rst} (83%)

diff --git a/docs/intel-sgx.txt b/docs/system/i386/sgx.rst
similarity index 83%
rename from docs/intel-sgx.txt
rename to docs/system/i386/sgx.rst
index f934d92f37..f103ae2a2f 100644
--- a/docs/intel-sgx.txt
+++ b/docs/system/i386/sgx.rst
@@ -1,9 +1,8 @@
-===============================
 Software Guard eXtensions (SGX)
 ===============================
 
 Overview
-========
+--------
 
 Intel Software Guard eXtensions (SGX) is a set of instructions and mechanisms
 for memory accesses in order to provide security accesses for sensitive
@@ -14,7 +13,7 @@ enclave memory area from any software not resident in the enclave are prevented,
 including those from privileged software.
 
 Virtual SGX
-===========
+-----------
 
 SGX feature is exposed to guest via SGX CPUID. Looking at SGX CPUID, we can
 report the same CPUID info to guest as on host for most of SGX CPUID. With
@@ -25,7 +24,7 @@ The guest's EPC base and size are determined by Qemu, and KVM needs Qemu to
 notify such info to it before it can initialize SGX for guest.
 
 Virtual EPC
------------
+~~~~~~~~~~~
 
 By default, Qemu does not assign EPC to a VM, i.e. fully enabling SGX in a VM
 requires explicit allocation of EPC to the VM. Similar to other specialized
@@ -42,7 +41,7 @@ that some kernels may not recognize all EPC sections, e.g. the Linux SGX driver
 is hardwired to support only 8 EPC sections.
 
 The following Qemu snippet creates two EPC sections, with 64M pre-allocated
-to the VM and an additional 28M mapped but not allocated:
+to the VM and an additional 28M mapped but not allocated::
 
  -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
  -object memory-backend-epc,id=mem2,size=28M \
@@ -61,7 +60,7 @@ To simplify the implementation, EPC is always located above 4g in the guest
 physical address space.
 
 Migration
----------
+~~~~~~~~~
 
 Qemu/KVM doesn't prevent live migrating SGX VMs, although from hardware's
 perspective, SGX doesn't support live migration, since both EPC and the SGX
@@ -74,7 +73,7 @@ and when enclave fails to unseal sensitive information from outside, it can
 detect such error and sensitive information can be provisioned to it again.
 
 CPUID
------
+~~~~~
 
 Due to its myriad dependencies, SGX is currently not listed as supported
 in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
@@ -86,9 +85,9 @@ All SGX sub-features enumerated through CPUID, e.g. SGX2, MISCSELECT,
 ATTRIBUTES, etc... can be restricted via CPUID flags. Be aware that enforcing
 restriction of MISCSELECT, ATTRIBUTES and XFRM requires intercepting ECREATE,
 i.e. may marginally reduce SGX performance in the guest. All SGX sub-features
-controlled via -cpu are prefixed with "sgx", e.g.:
+controlled via -cpu are prefixed with "sgx", e.g.::
 
-$ qemu-system-x86_64 -cpu help | xargs printf "%s\n" | grep sgx
+  $ qemu-system-x86_64 -cpu help | xargs printf "%s\n" | grep sgx
   sgx
   sgx-debug
   sgx-encls-c
@@ -102,18 +101,16 @@ $ qemu-system-x86_64 -cpu help | xargs printf "%s\n" | grep sgx
   sgx2
   sgxlc
 
-The following Qemu snippet passes through the host CPU (and host physical
-address width) but restricts access to the provision and EINIT token keys:
+The following Qemu snippet passes through the host CPU but restricts access to
+the provision and EINIT token keys::
 
- -cpu host,host-phys-bits,-sgx-provisionkey,-sgx-tokenkey
-
-Note:
+ -cpu host,-sgx-provisionkey,-sgx-tokenkey
 
 SGX sub-features cannot be emulated, i.e. sub-features that are not present
 in hardware cannot be forced on via '-cpu'.
 
 Virtualize SGX Launch Control
------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Qemu SGX support for Launch Control (LC) is passive, in the sense that it
 does not actively change the LC configuration.  Qemu SGX provides the user
@@ -127,41 +124,42 @@ for SGX guest by our design. If host is in locked mode, we can still allow
 creating VM with SGX.
 
 Feature Control
----------------
+~~~~~~~~~~~~~~~
 
 Qemu SGX updates the `etc/msr_feature_control` fw_cfg entry to set the SGX
 (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
 i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
 assuming said firmware supports fw_cfg.msr_feature_control.
 
-Launch a guest
-==============
+Launching a guest
+-----------------
 
-To launch a SGX guest
-${QEMU} \
-   -cpu host,+sgx-provisionkey \
-   -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
-   -object memory-backend-epc,id=mem2,size=28M \
+To launch a SGX guest:
+
+.. parsed-literal::
+
+  |qemu_system_x86| \\
+   -cpu host,+sgx-provisionkey \\
+   -object memory-backend-epc,id=mem1,size=64M,prealloc=on \\
+   -object memory-backend-epc,id=mem2,size=28M \\
    -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
 
 Utilizing SGX in the guest requires a kernel/OS with SGX support.
+The support can be determined in guest by::
 
-The support can be determined in guest by:
-$ grep sgx /proc/cpuinfo
+  $ grep sgx /proc/cpuinfo
 
-Check the SGX epc info in the Guest:
-$ dmesg | grep sgx
-[    1.242142] sgx: EPC section 0x180000000-0x181bfffff
-[    1.242319] sgx: EPC section 0x181c00000-0x1837fffff
+and SGX epc info by::
+
+  $ dmesg | grep sgx
+  [    1.242142] sgx: EPC section 0x180000000-0x181bfffff
+  [    1.242319] sgx: EPC section 0x181c00000-0x1837fffff
 
 References
-==========
+----------
 
-SGX Homepage:
-https://software.intel.com/sgx
+- `SGX Homepage <https://software.intel.com/sgx>`__
 
-SGX SDK:
-https://github.com/intel/linux-sgx.git
+- `SGX SDK <https://github.com/intel/linux-sgx.git>`__
 
-SGX SPEC:
-Intel SDM Volume 3
+- SGX specification: Intel SDM Volume 3
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index c9720a8cd1..6a86d63863 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -26,6 +26,7 @@ Architectural features
    :maxdepth: 1
 
    i386/cpu
+   i386/sgx
 
 .. _pcsys_005freq:
 
-- 
2.31.1


