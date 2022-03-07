Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635204CFE7A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:29:39 +0100 (CET)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCUc-0003J8-E4
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0fb1e19d78536e23b650ca72decdc29c98f2dcc1@lizzy.crudebyte.com>)
 id 1nRCFb-0008S2-AH
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:14:07 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0fb1e19d78536e23b650ca72decdc29c98f2dcc1@lizzy.crudebyte.com>)
 id 1nRCFZ-0007a4-Gv
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=InoFH/i7Y64UnxSHU/aQSNBQnxBKbIBG0d1DlNHVBsc=; b=Wve5b
 wwKIrY5pk3BXCdgohdKVOVZwixvN8E9S0Y5Dxk3rwfROYzoSxVDE1r/Nt3OMZvw5o34UoAVT37iRg
 kMM0AWmfylmsqydNPKoh8wJZU5P8tyLGkV//X96mDrD8K0obo6Wa1kLdzUDje3pK5C7Vs0TQJn/BC
 g39pddvu6pJ+Q48rO2NxgkTo34UxzQNgmS8rSF7vxQNC1ffvRmY0phbGK7kNFVPqfmU3JIIQsODY5
 yssB/MDD0u4eRxcSh5sJW5FLtjmNM0dZxjoYzpB3/aH3ULXfphNVkMJgM5KJJhg1CtWfX8QzjSebM
 Cay/qwu6Kmd4gAeP7hh6/ZMOvEy2g==;
Message-Id: <0fb1e19d78536e23b650ca72decdc29c98f2dcc1.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 11/19] 9p: darwin: meson: Allow VirtFS on Darwin
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0fb1e19d78536e23b650ca72decdc29c98f2dcc1@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220227223522.91937-12-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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
index 40598630e6..8a50ec191f 100644
--- a/meson.build
+++ b/meson.build
@@ -1462,14 +1462,16 @@ dbus_display = get_option('dbus_display') \
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
2.20.1


