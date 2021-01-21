Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDB2FE6E7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:58:50 +0100 (CET)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wjp-0004fA-DM
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiC-00030D-FE
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Wi8-0007rn-PC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LW2Kx/9H06kf4OWFEdjuF2232jMpxnHueaxVF+4wcs=;
 b=PeOMYlAE24lLP0jRlcO/9buBqRub5FkDAxvtP2mO3DfAI8tPa9EKzpbJ5iwwmaYMBlDpS8
 2uBj34brFz4rGtEQKRWCM6bqvcJNqr3x9fuyaSLUim11tKHPbvE6wkLQhUHxA8hGuew2gm
 9ZGLPe1Aw1VgBEtt0unZWpi7baQTGGs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-wmfIVmXXNjKSSwY7OCKKFQ-1; Thu, 21 Jan 2021 04:57:02 -0500
X-MC-Unique: wmfIVmXXNjKSSwY7OCKKFQ-1
Received: by mail-ej1-f72.google.com with SMTP id j14so536639eja.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LW2Kx/9H06kf4OWFEdjuF2232jMpxnHueaxVF+4wcs=;
 b=mnJHUJAmfKNzNjzoqV11S9y/35Mh8k7BJk1NjXccQmaVcAHD1JdqOgFG7k3VEKHytW
 vFBli/b7Fz4SxNy03dfvkyWcl0l67o0f+rUe7DJoQz9Np3RyNmly5xLqCGHhDV597C+B
 O5Pqxz6c1HeAj06Jw0nXYuJU4h5fWH58r10G/FkKXv2bol9Wj1NZIA1Pwcoi+vpFli08
 r7oay5Ifu195zaTJsaaK5BUvntlFkclZgX84O4jNKZ6RPSY6LrzB33b80RiGhK8NJcDX
 D5haAy2AD4e2cVeqVjRCA0V5p89HxdRuyAKtMW0JYYd+vWyhu7xCX2zGXncyvxtKkzdC
 Qnsg==
X-Gm-Message-State: AOAM533nqWj3HL1/Imr3fNYfo3AxU620QXsY5Ey7OKMCjd1BBoUj6NAa
 LYEuEbtNlBO0BkZe38TMELfXH/I9uJFMMxDRl2pcLMx5P88HE8/vLT+cXxQBnnrjdR65Di+l8PL
 3VcRx9HLVXUXAInIZJ8G3sKxqqIwcOhBjoieRVzLzRNLHDZF2YAijpPSkd61cr41o
X-Received: by 2002:a50:b5c5:: with SMTP id a63mr10478109ede.227.1611223021185; 
 Thu, 21 Jan 2021 01:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBRzttT7kC1yZ5t6KrcQ8gGr1cEItrMgHHFCKbZ2l/JY0cUsyBmAU/jNJNR11twZlXirghyg==
X-Received: by 2002:a50:b5c5:: with SMTP id a63mr10478087ede.227.1611223020972; 
 Thu, 21 Jan 2021 01:57:00 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lg21sm1604419ejb.91.2021.01.21.01.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:57:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] meson: Display accelerators and selected targets
 altogether
Date: Thu, 21 Jan 2021 10:56:13 +0100
Message-Id: <20210121095616.1471869-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Display accelerators and selected targets altogether,
avoid to display unuseful information when not relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
---
 meson.build | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index 194b8523f77..a0945749f94 100644
--- a/meson.build
+++ b/meson.build
@@ -2323,6 +2323,8 @@
 # Overall features
 summary_info = {}
 summary_info += {'Documentation':     build_docs}
+summary_info += {'system-mode emulation': have_system}
+summary_info += {'user-mode emulation': have_user}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
@@ -2402,8 +2404,30 @@
 summary_info += {'mingw32 support':   targetos == 'windows'}
 summary(summary_info, bool_yn: true, section: 'Compilation')
 
+# Targets and accelerators
 summary_info = {}
+if have_system
+  summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
+  summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
+  summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
+  summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+  summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
+  if config_host.has_key('CONFIG_XEN_BACKEND')
+    summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+  endif
+endif
+summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
+if config_all.has_key('CONFIG_TCG')
+  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
+  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
+endif
 summary_info += {'target list':       ' '.join(target_dirs)}
+if have_system
+  summary_info += {'default devices':   get_option('default_devices')}
+endif
+summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
+
+summary_info = {}
 summary_info += {'sparse enabled':    sparse.found()}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
@@ -2447,25 +2471,12 @@
   summary_info += {'VNC JPEG support':  jpeg.found()}
   summary_info += {'VNC PNG support':   png.found()}
 endif
-summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
-if config_host.has_key('CONFIG_XEN_BACKEND')
-  summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
-endif
 summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
 summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
-summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
-summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
-summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
-summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
-if config_all.has_key('CONFIG_TCG')
-  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
-endif
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
@@ -2527,7 +2538,6 @@
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
-- 
2.26.2


