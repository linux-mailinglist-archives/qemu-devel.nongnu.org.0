Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB8255059
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 23:10:34 +0200 (CEST)
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBPAH-0007Sb-RU
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 17:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kBP9E-0006tX-PN
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 17:09:28 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:35014
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kBP9C-0005Rl-H9
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 17:09:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 9CB15DB46DF;
 Thu, 27 Aug 2020 23:09:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id NobGgB6EgGdV; Thu, 27 Aug 2020 23:09:23 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id B1111DB46DD;
 Thu, 27 Aug 2020 23:09:23 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id A6BD0460015; Thu, 27 Aug 2020 23:09:23 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PATCH] libvhost-user: Add GCC_FMT_ATTR and fix format string
Date: Thu, 27 Aug 2020 23:09:20 +0200
Message-Id: <20200827210920.111611-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 17:09:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 contrib/libvhost-user/libvhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 53f16bdf08..ff7ac876f4 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -151,7 +151,7 @@ vu_request_to_string(unsigned int req)
     }
 }
 
-static void
+static void GCC_FMT_ATTR(2, 3)
 vu_panic(VuDev *dev, const char *msg, ...)
 {
     char *buf = NULL;
@@ -643,7 +643,7 @@ generate_faults(VuDev *dev) {
 
         if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
             vu_panic(dev, "%s: Failed to userfault region %d "
-                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
+                          "@%016"PRIx64" + size:%zx offset: %zx: (ufd=%d)%s\n",
                      __func__, i,
                      dev_region->mmap_addr,
                      dev_region->size, dev_region->mmap_offset,
-- 
2.28.0


