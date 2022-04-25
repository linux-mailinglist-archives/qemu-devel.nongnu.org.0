Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24CF50E370
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:39:44 +0200 (CEST)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizsN-0003kT-Td
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgp-0006bs-FN
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:48 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgn-0004p0-RT
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so48508pje.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVhmwJN1yacivhyyGJyPocmRV53ZU/rr69UEm8cytaM=;
 b=Wt/Xj3bef2u9D8YwqQTNKLY0reHLK+6gFJOcQ0DvCU994XBoZo4yAoCNnrh10VrJFO
 TlbKJf/h/eYGAYoz2ppf8sJZUZ6AbkwlFWHGHh6aXpJBdCSeRRf2ZXkSOxae0CeREujV
 vsep1Yqq+lLw6O4i6hynGY7Rgh7d+ENmhMcTFg7qCjDn0cemDPy3OEExNLtqYNQ9RPRm
 /GaAMF6NTkGYcyKN3LaYXYr0e0r27eAM3kexIQM40ZzfD6tz5W/Lauw75p9HoiJFhC49
 rcYMQghGPs5Puup86xDHxW/0KOxER7ydvU/VJ1+7fbRFbhg2FvHpx17kcfpSkY52e3Md
 dG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVhmwJN1yacivhyyGJyPocmRV53ZU/rr69UEm8cytaM=;
 b=bcvV3tUD3Esjs9eSS6EMSSw8bevQdwwCEzSXBmtkN67bXTjRbgwu0Lh0y1WkWATmwG
 ITJtYFFMJyO1Vxg29yLSnQPBenXrFCze7+d/TgIVlU0XPCxxfy7MoGlsLZWApyT/ZwN1
 bpqL7n/QOqpOXBq75vrPd2LP6Z3PU9N3BwtlWHhYObBG3+09LITcDJiy4IbpSK5ZbeB2
 N3LXRHXegVuDfbu2QsSZSJyyYsqPwm2lkEA0DOfrk60rGmm5fcB0IpmZLp6nV0u8YZps
 OH1aD0jvKc4ICh2sWOduwiLQ07KCR4yM6tkY0LrDlADBquD37w50wxaEQHN3WFxFxBUz
 /7Bw==
X-Gm-Message-State: AOAM533IHMb85zyJsxBKyXzx9MkQTxvnJba19F7QNdpRl6b62k9JlrhA
 /Lr4PdIaYWjUdYWb4A5yBeU=
X-Google-Smtp-Source: ABdhPJzLJz/pFNwiwTGJygq4t6Q3EyYcZgZYpSyWM7Xeqf26zXnSzQW7uGKv5M7TcLMLfpQupl1lJw==
X-Received: by 2002:a17:90b:3c84:b0:1d9:2a4c:5ee9 with SMTP id
 pv4-20020a17090b3c8400b001d92a4c5ee9mr13879208pjb.121.1650896862638; 
 Mon, 25 Apr 2022 07:27:42 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 8/9] meson.build: Turn on virtfs for Windows host
Date: Mon, 25 Apr 2022 22:27:04 +0800
Message-Id: <20220425142705.2099270-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Enable virtfs configuration option for Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 meson.build         | 10 +++++-----
 hw/9pfs/meson.build |  2 ++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index d083c6b7bf..46f61b2a9d 100644
--- a/meson.build
+++ b/meson.build
@@ -1465,16 +1465,16 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(targetos == 'linux' or targetos == 'darwin',
-             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
-    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
+    .require(targetos == 'linux' or targetos == 'darwin' or targetos == 'windows',
+             error_message: 'virtio-9p (virtfs) requires Linux or macOS or Windows') \
+    .require(targetos == 'linux' or targetos == 'windows' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
+    .require(targetos == 'darwin' or targetos == 'windows' or (libattr.found() and libcap_ng.found()),
              error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and targetos != 'windows' and have_virtfs and have_tools
 
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index b4a8ff0913..50401848d9 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -17,6 +17,8 @@ fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-local.c',
 fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-local.c',
                                                 '9p-proxy.c',
                                                 '9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_WIN32', if_true: files('9p-local-win32.c',
+                                               '9p-util-win32.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.25.1


