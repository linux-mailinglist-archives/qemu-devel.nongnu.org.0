Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC846A3A2E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 05:47:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWVO1-0008EH-OA; Sun, 26 Feb 2023 23:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linux@weissschuh.net>)
 id 1pWU3d-0006qY-BC
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 22:20:09 -0500
Received: from todd.t-8ch.de ([159.69.126.157])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linux@weissschuh.net>)
 id 1pWU3a-0007Vg-IO
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 22:20:09 -0500
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1677467998;
 bh=c3OID4OHGBiQHj/a18/Na81gQpWQRHYqRW26JTDxHKE=;
 h=From:Date:Subject:To:Cc:From;
 b=LRaNQJCE1bMq4h9CpQ0d3SHamcYhgLiw5ymuYKgB+NoPXTMxE4917X3J3XEQ80Fe5
 MOPFw4YGWznWX+jPlrXwOmWN07wnQGaJ5T83nRdF3uA7N6M/bwJThjIgcpsvk7FNjT
 h8lzTzV/J8zy3aG/aEv3s3PMvOj9b+bQRDGVZXFg=
Date: Mon, 27 Feb 2023 03:19:56 +0000
Subject: [PATCH] firmware: qemu_fw_cfg: make kobj_type structure constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230227-kobj_type-firmware-qemu-v1-1-fc0c8b44424f@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAFsh/GMC/x2N0QqCQBAAf0X2uYVrFQ/6lYi41TW39LS9LEP89
 44eZ2CYDZKYSoJTsYHJW5NOMcPxUEDTh3gT1DYzkKPSEXl8THy/vr6zYKc2foIJPmVc0Puq5ro
 k17KDXHNIgmwhNn3u4zIMWc4mna7/3fmy7z+XCpCnfgAAAA==
To: Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677467996; l=1176;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=c3OID4OHGBiQHj/a18/Na81gQpWQRHYqRW26JTDxHKE=;
 b=aqXLp2yOWQMQHYa/WBolEG8uvRfp5q+eCr+6T9EaXn4m0kkl2hArfTv92d+BwFP1JUF5nzDm9
 GQpw3rtLQC3AMcEjhhcnZBojWn9GSfxGIGE+C7ndUaFVGBYp1CyB7kd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 26 Feb 2023 23:45:09 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definition to prevent
modification at runtime.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/firmware/qemu_fw_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a69399a6b7c0..f41de793f41b 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -452,7 +452,7 @@ static void fw_cfg_sysfs_release_entry(struct kobject *kobj)
 }
 
 /* kobj_type: ties together all properties required to register an entry */
-static struct kobj_type fw_cfg_sysfs_entry_ktype = {
+static const struct kobj_type fw_cfg_sysfs_entry_ktype = {
 	.default_groups = fw_cfg_sysfs_entry_groups,
 	.sysfs_ops = &fw_cfg_sysfs_attr_ops,
 	.release = fw_cfg_sysfs_release_entry,

---
base-commit: 2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
change-id: 20230227-kobj_type-firmware-qemu-7746b6320db0

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


