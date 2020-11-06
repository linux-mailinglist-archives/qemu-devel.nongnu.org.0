Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303362AA19E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Nov 2020 01:01:51 +0100 (CET)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbBfx-0006OK-LT
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 19:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1kbBZn-00029L-Lg
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 18:55:27 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:39692)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1kbBZl-000500-Oh
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 18:55:27 -0500
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 2EA8E44921;
 Sat,  7 Nov 2020 10:47:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1604706432;
 bh=X7tqLsPs9uZlHZgC5m25vMr/ME74Vg0G4E2S1VTpVlc=;
 h=From:To:Cc:Subject:Date:From;
 b=NZotzykiur64vIeuBfPqXpaY2p1jJhRl5iTDr49nARgaLrGJK6d003vE+0hDBYzsc
 HWWw229PhkNouSunk8A4QTOlCiY4nPsRGq50D+UyXIuCm/Qd8yoR5tqozDJT2RgEny
 roEz5FJponTLhKAQIjRq5eZJXchDReDFW7YRMxEE=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 0BC323A0604; Sat,  7 Nov 2020 10:47:11 +1100 (AEDT)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>,
	philmd@redhat.com
Subject: [PATCH] hw/core/qdev-properties-system: allow bus addresses > 0x1f
Date: Sat,  7 Nov 2020 10:45:11 +1100
Message-Id: <20201106234510.2101-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 18:47:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The commit bccb20c49df1bd683248a366021973901c11982f introduced an error
in the checking logic that validates the bus addresses for PCI device
addresses preventing usage of devices via vfio-pci that sit at a bus
address of 0x20 or higher. This patch resolves this by reverting the
checking logic to the original maximum value of 0xff

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 hw/core/qdev-properties-system.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b81a4e8d14..e62644bc69 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -882,7 +882,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     bus = val;
 
     p = (char *)e + 1;
-    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
+    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xff || e == p) {
         goto inval;
     }
     if (*e == ':') {
-- 
2.20.1


