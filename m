Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616F2DFD11
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:53:33 +0100 (CET)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMZ2-0005R3-0d
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQw-0004nw-Mq
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQs-0007iy-5J
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id g185so11155496wmf.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FRiRMprxEbTuanPFa+vfiS+7oQCln0jPyNHRYMzrFlA=;
 b=diKeSQEALEaN+HtY4XFypF+GoTZH6GL9qAQGHnbQccOkGWqGLuMlx8isBeU5lVKHju
 i68yN0RPKY/11djScWIkQiqctHRGXjCKLDxWCpQvGqTBUzO209vnkQV+PJ/x5M+UIj40
 EvMnvmPlzW/17YQEsjb2SJHzmWLvGR+d1eSiW002A2r6gXRWhBspxHf12kQpf35B3vDO
 mKluWJJ3n06wtq9iHGaquCt4ocejlXhuY7KSN5JSgxQj3C4xRmIVh0U/Azw+HqUjS7QB
 nT4wMaiVnPp2jvk/i90WYn94jmvfdcEtMSPPlvpeZ0V8zEoDgGlixVOricjd67AOUWrW
 x1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FRiRMprxEbTuanPFa+vfiS+7oQCln0jPyNHRYMzrFlA=;
 b=c2mJj23XoYUDLEyfYbHKRwwosrjBYOevaDWGDxOumzFDdB41Dg9I4X2AEOKgY1JPkH
 uXJ4VA3Kgy9GCUFSgj8QzFKNm2/PKiP7lEBeYMmDMTz/l2oRLmu9P2IQqNRW9hnlk4H7
 xDA1SEPJ7YBEyelMLuh2eGwwmbxdiP/rA4dTC+b/wj+ciZE2LS65CGTM4hBjIM2hfGBy
 nID7qtWwhJmQjgk3PVU+vDKvn+w/TV18DYRcmE8ZLNuigOTyqqyw6Lk+4J88uCu7A3Kx
 rCmfhlOTaFOa29bZBZ93kKdfEiadNqhMDtDECqFzlJHoS6E2TQexUb5KEI30bhYnOydv
 vXSw==
X-Gm-Message-State: AOAM533e1zhrBlcIOFRVSxLebkLJiaABUl6bsh+tDBiq1wT6yHpFpu9W
 QS+Mz7Qjjw9r0XiaB+86AuAbN1g72TE=
X-Google-Smtp-Source: ABdhPJxLx9Ogjp9ATyLPrIIWKP7NRAf8AhRqxdsTVAgf3vmtpfVbHsHxuwB/4xjCX7mTWrzvA/BLvA==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr17290912wmg.152.1608561903632; 
 Mon, 21 Dec 2020 06:45:03 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/55] configure,meson: add option to enable LTO
Date: Mon, 21 Dec 2020 15:44:08 +0100
Message-Id: <20201221144447.26161-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

This patch allows to compile QEMU with link-time optimization (LTO).
Compilation with LTO is handled directly by meson. This patch only
adds the option in configure and forwards the request to meson

Tested with all major versions of clang from 6 to 12

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201204230615.2392-2-dbuono@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 7 +++++++
 meson.build | 1 +
 2 files changed, 8 insertions(+)

diff --git a/configure b/configure
index 7ec4a11d1f..55e77bf289 100755
--- a/configure
+++ b/configure
@@ -242,6 +242,7 @@ host_cc="cc"
 audio_win_int=""
 libs_qga=""
 debug_info="yes"
+lto="false"
 stack_protector=""
 safe_stack=""
 use_containers="yes"
@@ -1182,6 +1183,10 @@ for opt do
   ;;
   --disable-werror) werror="no"
   ;;
+  --enable-lto) lto="true"
+  ;;
+  --disable-lto) lto="false"
+  ;;
   --enable-stack-protector) stack_protector="yes"
   ;;
   --disable-stack-protector) stack_protector="no"
@@ -1779,6 +1784,7 @@ disabled with --disable-FEATURE, default is enabled if available
   module-upgrades try to load modules from alternate paths for upgrades
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
+  lto             Enable Link-Time Optimization.
   sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
@@ -6964,6 +6970,7 @@ NINJA=$ninja $meson setup \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
+        -Db_lto=$lto \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
diff --git a/meson.build b/meson.build
index 372576f82c..d05d880114 100644
--- a/meson.build
+++ b/meson.build
@@ -2080,6 +2080,7 @@ summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
 summary_info += {'sparse enabled':    sparse.found()}
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
+summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 if targetos == 'darwin'
   summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
-- 
2.29.2



