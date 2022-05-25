Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE1533EB9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:07:24 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrfX-0005on-GL
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changpeng.liu@intel.com>)
 id 1ntqYR-0006DO-9k
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:56:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changpeng.liu@intel.com>)
 id 1ntqYN-0002fD-16
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653483355; x=1685019355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RnqZooBIpCs91x1mqVDqgiHf9TjlVDp8RGbzwP+T4U=;
 b=fxJetUuDdY2T1NGwhn9TT2WPxoyaZfPZxDmBi4J3YNs4lj+gLWf5dUhM
 Zcx3z9HeZKkum9lUgfG7P7Zjin3OlzsgWYGH40EtZkqb7y7/0mIJrJcYj
 3t0cisF+ekDfi6hR834hDo+eP5eYqDAu1dNkvsfXitHWzHotBL1dg/8+E
 U+nvsu6ZcafxRhSq0IPCcZSLCpwXGjr8tM+Byrwpyuew9D3n3Sat39crQ
 /brmbznNgHeYMfqC407oi0cSxlv/uBG4Se9zYQhHc2I3jLj60Go0+Na8y
 /DLzYcdnu/smCof0soUmOf5tJgcQQXsY+PYVoajCjOTNb+fCAhOmfzfN0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="360195212"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="360195212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 05:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="601892520"
Received: from waikikibeach52.sh.intel.com ([10.67.111.57])
 by orsmga008.jf.intel.com with ESMTP; 25 May 2022 05:55:51 -0700
From: Changpeng Liu <changpeng.liu@intel.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	changpeng.liu@intel.com
Subject: [PATCH 2/2] hw/vhost-user-scsi|blk: set `supports_config` flag
 correctly
Date: Wed, 25 May 2022 20:55:40 +0800
Message-Id: <20220525125540.50979-2-changpeng.liu@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220525125540.50979-1-changpeng.liu@intel.com>
References: <20220525125540.50979-1-changpeng.liu@intel.com>
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

Currently vhost-user-scsi driver doesn't allow to change
the configuration space of virtio_scsi, while vhost-user-blk
support that, so here we set the flag in vhost-user-blk driver
and unset it in vhost-user-scsi.

Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
---
 hw/block/vhost-user-blk.c | 1 +
 hw/scsi/vhost-user-scsi.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 5dca4eab09..9117222456 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -337,6 +337,7 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
 
     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
 
+    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
                          errp);
     if (ret < 0) {
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 9be21d07ee..1b2f7eed98 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -121,7 +121,6 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     vsc->dev.backend_features = 0;
     vqs = vsc->dev.vqs;
 
-    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
-- 
2.21.3


