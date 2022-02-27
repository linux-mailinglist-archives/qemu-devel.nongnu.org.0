Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1284C5F81
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:43:01 +0100 (CET)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSFo-0002Ma-5z
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS93-0006ge-R0
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:36:01 -0500
Received: from [2607:f8b0:4864:20::f32] (port=40694
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS92-00034Q-A9
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:36:01 -0500
Received: by mail-qv1-xf32.google.com with SMTP id fc19so11024115qvb.7
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9UzsPeW4T7EXhLiuNPioNvRXgwZFWkJYEU5xtJM/Jk=;
 b=ES/CvqZuQUL6OaAzUDcjWUhlg3XKdzabIXiSlZixudBPiwfGjK/usaMS0SoWfYExqV
 6R0K26rkz/7Ifg/Ve98zXmRjOwfzTLjU67MQM2nOMxK1a8HqhVFRWs0PBc5FP8kupyUJ
 mtsSxmSnK95lebOov8Tn7bksRil1H8v89XCOu6DINoFN8x6oIxZg1jExDTBxBS/pLepI
 i5rlUPSLofhbb/l1y/m2i2YI14zGtfT39CbkI6PwbqMr6cNsFXw5YNnXemi34D1OvaT4
 Qbk7va20FkxVvuJB7piyGebLR3a8LSXiB3y56pl2WxHfBYFGJkeBL6h8qofPSnMQTday
 PpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9UzsPeW4T7EXhLiuNPioNvRXgwZFWkJYEU5xtJM/Jk=;
 b=EGlK/yQYq0nk7CjNoHCJQlBhT1LSAHvAvXW84L9dNg7sgJF1rLmj2JobJZMCalkm65
 sztIi1Npe2BHvXzG/Xm99QY6FN0V0WdnzDCY5jSilx5kKKU0p+i+/rex3z6npa5IN8lW
 nS83zAMILgaEiZ5sZPw7542nnO2EXk7QC9549iKKhTBOTz6z8ELZh44F7drDnkPLSpf+
 URZUCNLvrjDwSa9zKy/OCfJlg/a3iIEKCOGCKKoQEsHw29DnV1M6cpUuPGRRc61k1DNN
 BXO3ESbwAwDmZCS1VgMulDRf/MD7kQDSyC1kyWt5qUei34Amg96O0ZvRiTfm0Kp4o0mg
 y3YQ==
X-Gm-Message-State: AOAM533Lk7JaWgPVAG5xqOcAy9Kk+5pFzcn2dJWpIdS6G6IfT6iKUGv9
 dAVUV3gUKMB3BoHEDUYRNZ4h1uBzvhVjTQ==
X-Google-Smtp-Source: ABdhPJzLdKwYUxtsKvOXQO080JK9GRH0G3CToneiORfIYpHCuV6HVcgPE4LwDCJgHMlX/RfvxoqlMw==
X-Received: by 2002:a0c:bec8:0:b0:42c:2e00:78b3 with SMTP id
 f8-20020a0cbec8000000b0042c2e0078b3mr12384016qvj.32.1646001359178; 
 Sun, 27 Feb 2022 14:35:59 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:58 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Sun, 27 Feb 2022 17:35:22 -0500
Message-Id: <20220227223522.91937-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf32.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
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
               macOS
             - Rebase to master]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 fsdev/meson.build |  1 +
 meson.build       | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

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
index 3f8dca2c7a..ba52ed9e9a 100644
--- a/meson.build
+++ b/meson.build
@@ -1450,14 +1450,16 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(targetos == 'linux',
-             error_message: 'virtio-9p (virtfs) requires Linux') \
-    .require(libattr.found() and libcap_ng.found(),
-             error_message: 'virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel') \
+    .require(targetos == 'linux' or targetos == 'darwin',
+             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
+    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
+             error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
+    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
+             error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
 
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
-- 
2.35.1


