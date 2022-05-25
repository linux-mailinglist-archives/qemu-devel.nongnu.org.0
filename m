Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10504533ED4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:09:46 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrhp-0002bU-5v
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changpeng.liu@intel.com>)
 id 1ntqYR-0006DL-8m
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:56:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changpeng.liu@intel.com>)
 id 1ntqYK-0002f8-N6
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653483352; x=1685019352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jnial1OdoHHEmwIKrBMigJZ/nCpjItNtIGHTTg7Ue+Q=;
 b=cZskVAekkqjDPy9O87QILQPxaWjQp7Rja4wlgm5feuJ4+1S8tqlXzNLP
 PWz6HfWIRK2w/2hhTKFDbGUTX5+84n3y6wXm9Y1L3pqk/2pzwgIWpkNe+
 DKrG0yZjaKjYnO89gLZUxdJp3tbzM9Wpd6bleLtQTGVM+82uZwKU2HCOt
 n7ubI5/1g7Wo/ya5D6cFnO6wFuk/I9+oTTJU6Ea0rvvhtWdRo6zp4Mhjk
 MlQva10IkqRA45aOjwfzUxKcnTnF3lTrCa/Ze3rxS+Opp9wFGM/hsn/4/
 9GbfIXUZuVXq3/l5fFzR07RG4pKAaTibjZ68mKRWu5fY4TGY/kcgUIjbC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="360195204"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="360195204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 05:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="601892511"
Received: from waikikibeach52.sh.intel.com ([10.67.111.57])
 by orsmga008.jf.intel.com with ESMTP; 25 May 2022 05:55:46 -0700
From: Changpeng Liu <changpeng.liu@intel.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	changpeng.liu@intel.com
Subject: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized variable
Date: Wed, 25 May 2022 20:55:39 +0800
Message-Id: <20220525125540.50979-1-changpeng.liu@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=changpeng.liu@intel.com; helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 May 2022 10:02:04 -0400
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

Variable `vdev` in `struct vhost_dev` will not be ready
until start the device, so let's not use it for the error
output here.

Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")

Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
---
 hw/virtio/vhost-user.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b040c1ad2b..0594178224 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2031,18 +2031,16 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
         if (supports_f_config) {
             if (!virtio_has_feature(protocol_features,
                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
-                error_setg(errp, "vhost-user device %s expecting "
+                error_setg(errp, "vhost-user device expecting "
                            "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
-                           "not support it.", dev->vdev->name);
+                           "not support it.");
                 return -EPROTO;
             }
         } else {
             if (virtio_has_feature(protocol_features,
                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
                 warn_reportf_err(*errp, "vhost-user backend supports "
-                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
-                                 "device %s but QEMU does not.",
-                                 dev->vdev->name);
+                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
                 protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
             }
         }
-- 
2.21.3


