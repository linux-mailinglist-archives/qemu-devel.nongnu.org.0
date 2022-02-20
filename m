Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D34BD01F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:12:39 +0100 (CET)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLplG-0004eq-UX
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:12:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQp-00083b-4u
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:31 -0500
Received: from [2607:f8b0:4864:20::f36] (port=41545
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQn-0000GC-Gl
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:30 -0500
Received: by mail-qv1-xf36.google.com with SMTP id x3so26032966qvd.8
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lSNKYTys5WwwDCa2B5w8TNgxukwfhzsKmBg6dB6bbw=;
 b=lujAglyYZiiyZMlkQl4+ja5/Qn43Eou3nshJcbSEdGTLRInLWWiZb33Gho2lJCSrOM
 vh/h8Tg2RiqKI6XzNZUOJI+MekxFVkRXR7obSb03XutagXHNG6NimMRQMuPrschR5UYN
 B8lNzUJ1lnmUpdeBfJpB1Z2NBr9jJvRkkiw1eeyrrpun+KJuvLUhBdzEZ0Q97OuH4bg2
 iXnlQnNTLQsUAtX0Q1M/yN4XsYR58vIy2YUtEEztOCA/0bs/pki3EhSkqgZ4ySlMVhSf
 Wva5OS3X2Oe/W3hsK3uCYwF2gGa9eOLxnKh+kynJL4uUpgi2cq3Kvh0nKh2NfvBc+yhj
 7JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lSNKYTys5WwwDCa2B5w8TNgxukwfhzsKmBg6dB6bbw=;
 b=CaMINqQl5+Z4m4qAZrehjVAdlfuZuVUorE2v33Pt4MIFRrVABPY16ukucjfzbgXvp0
 QMFOtGoJHReI+NrpgFtDFZA10O2fADGXXs6Psoe0JzSYBL6KwY0UMh1k540TUwy8sJtI
 qMQrCJt+p2xFuWA5FZOVjqkXfEZaU8tcHMSdp7wG9fKuiB78Eerf293+Ys2moWHSP9PA
 yVVUIq2rnIw+KlofuS3L1MMnNWR0kGfYHGv7wFES/DOGfOVGTIfPZwD97E8CfkDyOOyu
 wHx/2o2qXY1v0aws5bNQ/Iid+/cAOewKAOTaar+e8ktcQAKwWs1D82GYQsVL93piTxCz
 0tkA==
X-Gm-Message-State: AOAM5333PII4IYHNP2AP8vtEsO4Jrp8k23erJH0eDKQsh5pbF2VdPFr7
 2g8DYOx4OnaGK+6S/jAIQuxKRnTNbz0/ag==
X-Google-Smtp-Source: ABdhPJyHAf5WED5WpSRSO9K1HWaMs8sXqQZsfQd9uxWEGacaQDwSpDy22XPrUqtuRCRCDPZFl0Z9jg==
X-Received: by 2002:ad4:5d69:0:b0:42d:dc3e:951d with SMTP id
 fn9-20020ad45d69000000b0042ddc3e951dmr12854653qvb.2.1645375888330; 
 Sun, 20 Feb 2022 08:51:28 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:27 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Sun, 20 Feb 2022 11:50:56 -0500
Message-Id: <20220220165056.72289-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

To allow VirtFS on darwin, we need to check that pthread_fchdir_np is
available, which has only been available since macOS 10.12.

Additionally, virtfs_proxy_helper is disabled on Darwin. This patch
series does not currently provide an implementation of the proxy-helper,
but this functionality could be implemented later on.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Rebase to master]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
[Will Cohen: - Add check for pthread_fchdir_np to virtfs
             - Add comments to patch commit
             - Note that virtfs_proxy_helper does not work
               on macOS
             - Fully adjust meson virtfs error note to specify
               macOS]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 fsdev/meson.build |  1 +
 meson.build       | 14 ++++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fsdev/meson.build b/fsdev/meson.build
index adf57cc43e..b632b66348 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
   'qemu-fsdev.c',
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/meson.build b/meson.build
index 6fdc0281ad..b6f5c57487 100644
--- a/meson.build
+++ b/meson.build
@@ -1416,17 +1416,23 @@ if not get_option('dbus_display').disabled()
   endif
 endif
 
-have_virtfs = (targetos == 'linux' and
+if targetos == 'darwin' and cc.has_function('pthread_fchdir_np')
+  have_virtfs = have_system
+else
+  have_virtfs = (targetos == 'linux' and
     have_system and
     libattr.found() and
     libcap_ng.found())
+endif
 
-have_virtfs_proxy_helper = have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
 
 if get_option('virtfs').enabled()
   if not have_virtfs
-    if targetos != 'linux'
-      error('virtio-9p (virtfs) requires Linux')
+    if targetos != 'linux' and targetos != 'darwin'
+      error('virtio-9p (virtfs) requires Linux or macOS')
+    elif targetos == 'darwin' and not cc.has_function('pthread_fchdir_np')
+      error('virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np')
     elif not libcap_ng.found() or not libattr.found()
       error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
     elif not have_system
-- 
2.35.1


