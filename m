Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA454254B99
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 19:08:43 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBLOE-0002bx-Rh
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 13:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kBLGD-000695-U9
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 13:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kBLGA-0005Qh-TD
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 13:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598547622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AimggI63mz5uiW4qcXKMmenPxfcEt+6Z3zILbLl4Zv0=;
 b=Pc0Vh8RPaKxrqpCc/4/BDxjOLVCLVMeNKV2D4tsL1PkuzN2gorqZLJAoqPsT9n9WoKRYCx
 fBDJbNvqQB4042BJptdPud3mK/NhNlJsMO2XXRUiE2ys16SRFkpKjCP+fKZOvhZlZuj4yJ
 zPxpTs8hrUHiqPQ98M0fncDd0UTxxzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-tr3jK5aMMYSEOhKEF5eLkg-1; Thu, 27 Aug 2020 13:00:18 -0400
X-MC-Unique: tr3jK5aMMYSEOhKEF5eLkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B68189E618;
 Thu, 27 Aug 2020 17:00:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5185150B3F;
 Thu, 27 Aug 2020 17:00:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] meson: Fix meson build with --enable-libdaxctl
Date: Thu, 27 Aug 2020 12:59:44 -0400
Message-Id: <20200827165956.12925-6-pbonzini@redhat.com>
In-Reply-To: <20200827165956.12925-1-pbonzini@redhat.com>
References: <20200827165956.12925-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruce Rogers <brogers@suse.com>

The daxctl library needs to be linked against when daxctl is asked for
in configure.

Signed-off-by: Bruce Rogers <brogers@suse.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 1 +
 meson.build | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index b1e11397a8..a3f95f2b22 100755
--- a/configure
+++ b/configure
@@ -7467,6 +7467,7 @@ fi
 
 if test "$libdaxctl" = "yes" ; then
   echo "CONFIG_LIBDAXCTL=y" >> $config_host_mak
+  echo "LIBDAXCTL_LIBS=$libdaxctl_libs" >> $config_host_mak
 fi
 
 if test "$bochs" = "yes" ; then
diff --git a/meson.build b/meson.build
index 38d0abc0ea..b44901dfe1 100644
--- a/meson.build
+++ b/meson.build
@@ -380,6 +380,10 @@ if 'CONFIG_LIBPMEM' in config_host
   libpmem = declare_dependency(compile_args: config_host['LIBPMEM_CFLAGS'].split(),
                                link_args: config_host['LIBPMEM_LIBS'].split())
 endif
+libdaxctl = not_found
+if 'CONFIG_LIBDAXCTL' in config_host
+  libdaxctl = declare_dependency(link_args: config_host['LIBDAXCTL_LIBS'].split())
+endif
 
 # Create config-host.h
 
@@ -787,7 +791,7 @@ common_ss.add(files('cpus-common.c'))
 
 subdir('softmmu')
 
-specific_ss.add(files('disas.c', 'exec.c', 'gdbstub.c'), capstone, libpmem)
+specific_ss.add(files('disas.c', 'exec.c', 'gdbstub.c'), capstone, libpmem, libdaxctl)
 specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
-- 
2.26.2



