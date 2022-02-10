Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AA4B1264
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:11:18 +0100 (CET)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIC2P-0005Ka-Sm
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9XD-0003Cf-D4
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:57 -0500
Received: from [2607:f8b0:4864:20::f36] (port=46011
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9X7-0004YS-Nw
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:51 -0500
Received: by mail-qv1-xf36.google.com with SMTP id c14so4901260qvl.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/ht+vQw4r9PuGH4bqUrq8V2DDgtDKVJ6nbbLtrH+54=;
 b=Yt+JKH02/EbhJuwi0YXLF0nucviyrkDrmueIztf8/ymzA106iim9WM4h6Tt+TKai1T
 XgSl/dhmdCLlsXcLHQ0AocHaNNT+Lz5X7Zj/UQ4iAOlLX9VwuAvL8c+gmtL8ry9rQr2/
 AkKugZBgTrgU7gfvXlbwVOHyiIsQ0dFAV7SACQcbjcNP389rmvWydc01YFvugs3nCb49
 q/wt0Ray6PvH+6j/R2wXY41+ROIJEcIbCoiNR3juktXeVVq+XPvaWpS5D4iutvzFSPHv
 nWTql/f0ZWZVdiGBYD9B2x0znLbz1MJ9SGJyolKL+89FCkXCLTPa4b8bXFdMQqG9tJKe
 aDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/ht+vQw4r9PuGH4bqUrq8V2DDgtDKVJ6nbbLtrH+54=;
 b=FuAKjWo3lUBJaT9K+uAmtgDgANQ9obfhYoNZwur1prV/nk4sLmx2QpEh4/tUkUegMu
 8Q5fXM+jSrJmrdHiiV0LektKiz9CqLOKnppsqPLRY8bDi0w4r1EepPAD77R8GYNDm3pg
 5sPIEbscrkLC13QwG7Zb00OCvCT06D94RYtdjRu8fZpGj9o6y82OqTFW4LAxR7bOzKvx
 nROC0ISGJMhUePFNt8d9BzjylHnhmMMbPi1yL2WRQsbYrEUdSqclJmEAC+9o18zqiVH3
 aNrX1pu/XonglgGH2dveRaJcYgGB41Sn34Quqrx4TJVHsUSNCe/ONNlNhYpIp13TbutJ
 bCgQ==
X-Gm-Message-State: AOAM533Lt4ULA7BCi97no0Ff1ZjgqaFPR3xFyt0TpWvRjicopjAqG8Vh
 ivW8XkzFPjld9YikJyZP8imyN8Fnj5svdw==
X-Google-Smtp-Source: ABdhPJzgNuj3omw0IAa9JQ5I4jVK3XqfgoJJ1F49ZjIw8uq2Q/V7J/FPrIa6ViTiKTB0XC3RE6AxbQ==
X-Received: by 2002:ad4:5ae8:: with SMTP id c8mr4947846qvh.83.1644499825060;
 Thu, 10 Feb 2022 05:30:25 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:23 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Thu, 10 Feb 2022 08:29:46 -0500
Message-Id: <20220210132946.2303-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
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
index 5f43355071..3892079ae9 100644
--- a/meson.build
+++ b/meson.build
@@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
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
2.34.1


