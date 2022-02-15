Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B684B748E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:07:45 +0100 (CET)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3Au-0003xz-T3
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38I-0001BR-RQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:05:02 -0500
Received: from [2607:f8b0:4864:20::82e] (port=45666
 helo=mail-qt1-x82e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38G-0002mF-8I
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:05:01 -0500
Received: by mail-qt1-x82e.google.com with SMTP id o3so19521580qtm.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbF/C9JMkxQTOgzoTFWfI/WAJzjiOKPl6EnvR0wzVl4=;
 b=LczEbLetGohAjLD3KzWkQjFMVWilpSPa2oyEF9gMDxzJf8rdkByHwdf07y4UroAST8
 7xUnowM/+FEeOyqY9I92fyOYFNEAW0cYGzrWobdqfIggJle5NyPospJ7jj+217V0UkIV
 P+1vwQPDobT221Zzhy5iUM0TbDmDG7Te7JOeiiy+YKZ9JwLeubPNbaBhyOHP+K/69VsX
 6x+tuZvMfUJGOfbf1TPVqPpwrP/2ZApYOiv93xAOu8sIR3SN4wW01t5MQZIViPTiTb9x
 yUovm2BAvKKEdAwcGlNduMgHmU7RyLv8yrv6Ditlxu05kFr+SW9RQc4urDsY9EaP8vDv
 uY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbF/C9JMkxQTOgzoTFWfI/WAJzjiOKPl6EnvR0wzVl4=;
 b=E4kZsST9uKzAvt5MYm+ggvqozi8nMmH2q/lGoOHEfW7bUHFSTjt/G0eulL+Yj88iQD
 wEvmD5Jf1RwO1dc8wPl8wzJZj56AogaeEUTEOOB8/lrrTmJ8E2DwcsvDUc/2g0wkF3Qa
 2qEcOspdtuIQuJkWPJQAQ7sNqeqz4FpTgwmYRpnq32YwQkhZ9qirxFLo8iO7KaR3DEwQ
 g7HTJRjG9Xcox1VhkOedu8sVgXv3zXIiFl5B/7rbS+sscAjzAeaCIaAEvIoq4Ba9O+m7
 LlNNYWIKV4Eeu1gELZuOOkFN3y/EWJzClnezphiy/mUKbs2MTL1v0xGohpUj/FhocrMC
 yhuw==
X-Gm-Message-State: AOAM531sR1cClHc4F5RNXwYbizmdMrJkox4nIa4nqu6yM+BU1OWJ986+
 cW3veuC38eWAfa/A8b7WOATSJWeMi5KGTQ==
X-Google-Smtp-Source: ABdhPJyNX/4ZM5qv2r5Pc3UbBF39TbhJH+ck322e+kHkwxVuRj/CVVs7izhcj3mDnZk+vsG23+usqw==
X-Received: by 2002:ac8:7dc8:: with SMTP id c8mr416846qte.672.1644951898759;
 Tue, 15 Feb 2022 11:04:58 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:58 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Tue, 15 Feb 2022 14:04:26 -0500
Message-Id: <20220215190426.56130-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
2.34.1


