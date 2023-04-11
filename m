Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014716DDA24
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:57:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCc3-0000PI-Ew; Tue, 11 Apr 2023 07:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pmCc0-0000Om-LX
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:56:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pmCby-0001VN-Kh
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:56:36 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id BD54240107;
 Tue, 11 Apr 2023 14:56:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D886886;
 Tue, 11 Apr 2023 14:56:30 +0300 (MSK)
Message-ID: <7739b40d-d8ba-ccde-cc6c-5d9f2c93a663@msgid.tls.msk.ru>
Date: Tue, 11 Apr 2023 14:56:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: xen bits broke x32 build
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
To: Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, David Woodhouse <dwmw@amazon.co.uk>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
In-Reply-To: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -90
X-Spam_score: -9.1
X-Spam_bar: ---------
X-Spam_report: (-9.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

01.04.2023 11:40, Michael Tokarev wrote:
> After bringing in xen guest support, qemu fails to build on x32:
> 
> target/i386/kvm/xen-emu.c:876:5: note: in expansion of macro ‘qemu_build_assert’
>    876 |     qemu_build_assert(sizeof(struct vcpu_info) == 64);
>        |     ^~~~~~~~~~~~~~~~~
> 
> This one should be easy to fix, but I wonder if there are other issues
> with x32 exists..

Ok, I took a look at how to disable this new XEN stuff on x32.

It is the commit 820c1aba519bd072ac71c754733f6c86d8b4309 "xen: add
CONFIG_XEN_BUS and CONFIG_XEN_EMU options for Xen emulation" adding
this construct to hw/i386/Kconfig:

config XEN_EMU
     bool
     default y
     depends on KVM && (I386 || X86_64)

Since meson does not know about x32, and while ./conifgure does, it
is not propagated to meson, and sure not propagated to Kconfig too,
there's some more work needed to disable XEN_EMU on x32.

Something like this?

diff --git a/target/i386/Kconfig b/target/i386/Kconfig
index ce6968906e..75a91f497a 100644
--- a/target/i386/Kconfig
+++ b/target/i386/Kconfig
@@ -3,3 +3,6 @@ config I386

  config X86_64
      bool
+
+config X32
+    bool

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d40802d83f..3ad6b44984 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -140,4 +140,4 @@ config VMMOUSE
  config XEN_EMU
      bool
      default y
-    depends on KVM && (I386 || X86_64)
+    depends on KVM && (I386 || X86_64) && !X32


diff --git a/meson.build b/meson.build
index c44d05a13f..9e7c83fc6a 100644
--- a/meson.build
+++ b/meson.build
@@ -70,6 +70,11 @@ if cpu in ['riscv32', 'riscv64']
    cpu = 'riscv'
  endif

+x32 = false
+if cpu == 'x86_64'
+  x32 = cc.sizeof('long') == 4
+endif
+
  target_dirs = config_host['TARGET_DIRS'].split()
  have_linux_user = false
  have_bsd_user = false
@@ -2554,7 +2559,8 @@ host_kconfig = \
    ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
    (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
    (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
-  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
+  (x32 ? ['CONFIG_X32=y'] : [])

  ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]



