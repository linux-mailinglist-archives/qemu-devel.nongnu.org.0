Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501ED485867
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:33:34 +0100 (CET)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5B6L-0007Ag-Dn
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:33:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1n5B4g-0004xa-Bj
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:31:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1n5B4Y-0001xg-DI
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:31:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B0A0618A3;
 Wed,  5 Jan 2022 18:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1A9C36AE3;
 Wed,  5 Jan 2022 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641407496;
 bh=zE+7ffio+O9uJrwxJfyDIOj3L0z6ifW32qNmwf1FA3U=;
 h=From:To:Cc:Subject:Date:From;
 b=eeydPoE84v4MKL6GSE8oBVVlpoXS/9hT0UqM8e+bjRkHeoK8duRTH2+ixq8gepOdd
 fd324jb4J9onsTE9ZSJGbM655PSF+Ni0odw0MlebHnzdvj7ugY+ov2LN4ce2UfSCWk
 kGcGOCAbM3fAXiwSL5ekNoVexRit9n770PaTxCXo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] qemu_fw_cfg: use default_groups in kobj_type
Date: Wed,  5 Jan 2022 19:31:33 +0100
Message-Id: <20220105183133.2812848-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; h=from:subject;
 bh=zE+7ffio+O9uJrwxJfyDIOj3L0z6ifW32qNmwf1FA3U=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIlXn7Bed3q+1jA1e/uq2UVeKU9ZnnNHeyp92FnB5DNh3XS2
 qkvzO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiVfcZ5oqZLX4ttOKekBxfXfXaCM
 evtecXCjEs2HDaSdxTj+m9l0/7wdqlH7fsYmAPAQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=gregkh@linuxfoundation.org; helo=dfw.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gabriel Somlo <somlo@cmu.edu>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the firmware qemu_fw_cfg sysfs code to use default_groups
field which has been the preferred way since aa30f47cf666 ("kobject: Add
support for default attribute groups to kobj_type") so that we can soon
get rid of the obsolete default_attrs field.

Cc: Gabriel Somlo <somlo@cmu.edu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/firmware/qemu_fw_cfg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 172c751a4f6c..c62f05420d32 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -395,7 +395,7 @@ static void fw_cfg_sysfs_cache_cleanup(void)
 	}
 }
 
-/* default_attrs: per-entry attributes and show methods */
+/* per-entry attributes and show methods */
 
 #define FW_CFG_SYSFS_ATTR(_attr) \
 struct fw_cfg_sysfs_attribute fw_cfg_sysfs_attr_##_attr = { \
@@ -428,6 +428,7 @@ static struct attribute *fw_cfg_sysfs_entry_attrs[] = {
 	&fw_cfg_sysfs_attr_name.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(fw_cfg_sysfs_entry);
 
 /* sysfs_ops: find fw_cfg_[entry, attribute] and call appropriate show method */
 static ssize_t fw_cfg_sysfs_attr_show(struct kobject *kobj, struct attribute *a,
@@ -454,7 +455,7 @@ static void fw_cfg_sysfs_release_entry(struct kobject *kobj)
 
 /* kobj_type: ties together all properties required to register an entry */
 static struct kobj_type fw_cfg_sysfs_entry_ktype = {
-	.default_attrs = fw_cfg_sysfs_entry_attrs,
+	.default_groups = fw_cfg_sysfs_entry_groups,
 	.sysfs_ops = &fw_cfg_sysfs_attr_ops,
 	.release = fw_cfg_sysfs_release_entry,
 };
-- 
2.34.1


